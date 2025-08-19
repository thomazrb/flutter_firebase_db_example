import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart'; // Importa as configurações geradas pelo FlutterFire

// Ponto de entrada principal da aplicação
void main() async {
  // Garante que os bindings do Flutter foram inicializados
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializa o Firebase usando as opções da plataforma atual (Windows, neste caso)
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Desktop com Firestore',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controllers para os campos de texto do diálogo
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();

  // Referência para a coleção 'usuarios' no Firestore
  final CollectionReference _usuarios = FirebaseFirestore.instance.collection(
    'usuarios',
  );

  // Função para exibir o diálogo de adicionar usuário
  Future<void> _mostrarDialogoAdicionar() async {
    // Limpa os controllers antes de abrir o diálogo
    _nomeController.clear();
    _cpfController.clear();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar Novo Usuário'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: _cpfController,
                decoration: const InputDecoration(labelText: 'CPF'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Adicionar'),
              onPressed: () {
                final String nome = _nomeController.text;
                final String cpf = _cpfController.text;
                if (nome.isNotEmpty && cpf.isNotEmpty) {
                  // Adiciona um novo documento à coleção 'usuarios'
                  _usuarios.add({"nome": nome, "cpf": cpf});

                  // Fecha o diálogo
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Usuários')),
      // StreamBuilder escuta as mudanças na coleção do Firestore em tempo real
      body: StreamBuilder(
        stream: _usuarios.snapshots(), // O stream que será ouvido
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            // Se houver dados, constrói uma ListView
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['nome']),
                    subtitle: Text(documentSnapshot['cpf']),
                  ),
                );
              },
            );
          }
          // Enquanto os dados estão carregando, mostra um indicador de progresso
          return const Center(child: CircularProgressIndicator());
        },
      ),
      // Botão flutuante para adicionar novos usuários
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mostrarDialogoAdicionar(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

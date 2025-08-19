# App Flutter com Firebase (Exemplo de Leitura e Escrita)

Este é um projeto de exemplo simples que demonstra como conectar uma aplicação desktop (Windows) feita com Flutter a um banco de dados **Cloud Firestore** do Firebase. O foco é mostrar a comunicação básica, implementando as funcionalidades de **leitura (Read)** e **escrita (Create)** de dados em tempo real.

O aplicativo consiste em uma lista de usuários (nome e CPF) que é atualizada em tempo real e um botão para adicionar novos usuários ao banco de dados.

Este código foi criado como material de apoio para o post do blog: [**Criando um App com Flutter e Firebase**](https://thomazrb.github.io/pt-br/posts/flutter-firebase-db/).

## ✨ Funcionalidades

* **Leitura em Tempo Real:** A lista de usuários é sincronizada com o Firestore e atualizada automaticamente quando os dados mudam.
* **Criação de Dados:** Um formulário em um diálogo permite adicionar novos usuários ao banco de dados.
* **Interface Simples:** Foco na lógica de integração com o Firebase, sem complexidade de UI.
* **Multiplataforma:** Embora o exemplo seja focado no Windows, o código é 100% compatível com Android, iOS, Web, macOS e Linux.

## 🚀 Começando

Siga as instruções abaixo para obter uma cópia do projeto e executá-lo em sua máquina local.

### Pré-requisitos

* **SDK do Flutter:** [Instruções de instalação](https://flutter.dev/docs/get-started/install)
* **Firebase CLI e FlutterFire CLI:** Siga os passos no post do blog para instalar e autenticar as ferramentas.
* **Um projeto Firebase:** Você precisará de um projeto ativo no [Console do Firebase](https://console.firebase.google.com/) com o Cloud Firestore habilitado.

### Instalação e Configuração

1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/thomazrb/flutter_firebase_db_example.git](https://github.com/thomazrb/flutter_firebase_db_example.git)
    cd flutter_firebase_db_example
    ```

2.  **Instale as dependências:**
    ```bash
    flutter pub get
    ```

3.  **Conecte ao seu projeto Firebase:**
    Este projeto usa um arquivo de configuração gerado para se conectar ao Firebase. Para gerar o seu, delete o arquivo `lib/firebase_options.dart` (se existir) e execute o comando abaixo, selecionando o seu projeto Firebase e a plataforma `windows` (ou a que desejar):
    ```bash
    flutterfire configure
    ```
    Isso irá gerar um novo `lib/firebase_options.dart` com as suas chaves de API.

## 🏃‍♂️ Executando o Aplicativo

Para rodar o aplicativo em modo de depuração, execute:
```bash
flutter run -d windows# App Flutter com Firebase (Exemplo de Leitura e Escrita)

Este é um projeto de exemplo simples que demonstra como conectar uma aplicação desktop (Windows) feita com Flutter a um banco de dados **Cloud Firestore** do Firebase. O foco é mostrar a comunicação básica, implementando as funcionalidades de **leitura (Read)** e **escrita (Create)** de dados em tempo real.

O aplicativo consiste em uma lista de usuários (nome e CPF) que é atualizada em tempo real e um botão para adicionar novos usuários ao banco de dados.

Este código foi criado como material de apoio para o post do blog: [**Criando um App com Flutter e Firebase**](https://thomazrb.github.io/pt-br/posts/flutter-firebase-db/).

## ✨ Funcionalidades

* **Leitura em Tempo Real:** A lista de usuários é sincronizada com o Firestore e atualizada automaticamente quando os dados mudam.
* **Criação de Dados:** Um formulário em um diálogo permite adicionar novos usuários ao banco de dados.
* **Interface Simples:** Foco na lógica de integração com o Firebase, sem complexidade de UI.
* **Multiplataforma:** Embora o exemplo seja focado no Windows, o código é 100% compatível com Android, iOS, Web, macOS e Linux.

## 🚀 Começando

Siga as instruções abaixo para obter uma cópia do projeto e executá-lo em sua máquina local.

### Pré-requisitos

* **SDK do Flutter:** [Instruções de instalação](https://flutter.dev/docs/get-started/install)
* **Firebase CLI e FlutterFire CLI:** Siga os passos no post do blog para instalar e autenticar as ferramentas.
* **Um projeto Firebase:** Você precisará de um projeto ativo no [Console do Firebase](https://console.firebase.google.com/) com o Cloud Firestore habilitado.

### Instalação e Configuração

1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/thomazrb/flutter_firebase_db_example.git](https://github.com/thomazrb/flutter_firebase_db_example.git)
    cd flutter_firebase_db_example
    ```

2.  **Instale as dependências:**
    ```bash
    flutter pub get
    ```

3.  **Conecte ao seu projeto Firebase:**
    Este projeto usa um arquivo de configuração gerado para se conectar ao Firebase. Para gerar o seu, delete o arquivo `lib/firebase_options.dart` (se existir) e execute o comando abaixo, selecionando o seu projeto Firebase e a plataforma `windows` (ou a que desejar):
    ```bash
    flutterfire configure
    ```
    Isso irá gerar um novo `lib/firebase_options.dart` com as suas chaves de API.

## 🏃‍♂️ Executando o Aplicativo

Para rodar o aplicativo em modo de depuração, execute:
```bash
flutter run -d windows
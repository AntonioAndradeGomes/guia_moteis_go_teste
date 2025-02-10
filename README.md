# Guia de Moteis Go - Teste para Desenvolvedor Mobile (Flutter)

O desafio consiste em criar uma réplica da tela de listagem de motéis (apenas a aba "Ir Agora") do aplicativo [Guia de Motéis GO](https://go.guiademoteis.com.br/).

Utilizei o seguinte endpoint:
- [https://www.npoint.io/docs/e728bb91e0cd56cc0711](https://www.npoint.io/docs/e728bb91e0cd56cc0711)
  
Os requisitos são:
- Flutter: Criar um app estruturado e modularizado
- Consumo de API's: Usar o package [Http](https://pub.dev/packages/http)
- Gerenciamento de estado, utilizei o [Bloc](https://bloclibrary.dev/pt-br/getting-started/)
- Implementar testes
  
Me basei no arquitetura proposta pelo Flutter nesse [doc](https://docs.flutter.dev/app-architecture), com um exemplo de app feito nesse [link](https://github.com/flutter/samples/tree/main/compass_app).

### Como executar o app

#### 1. Instale o Flutter

Se você ainda não instalou o Flutter, siga as instruções no site oficial do Flutter para configurar seu ambiente.
- [Instalação](https://flutter.dev/get-started/install)
  
#### 2. Clone o repositório, instalar as dependências

Abra o terminal e navegue até o diretório onde você quer armazenar o projeto. Então clone o repositório usando o comando:

```bash
git clone https://github.com/AntonioAndradeGomes/guia_moteis_go_teste
```

Em seguida navegue até o diretório e execute o comando:

```bash
flutter pub get
```

#### 3. Execute o app

- Emulador Android/iOS: para abrir o emulador, você pode usar o Android Studio ou o Visual Studio Code (se estiver usando um emulador configurado).

- Dispositivo físico: certifique-se de que o dispositivo esteja conectado via USB e que o modo de desenvolvedor esteja ativado.

Execute o seguinte comando para iniciar o aplicativo:

```bash
flutter run
```


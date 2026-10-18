# Taverna da Sorte — Frontend

Plataforma de entretenimento com minijogos de aposta e probabilidade, moeda virtual (ouro), loja de itens e inventário, com tema de taverna medieval mágica. Este repositório contém o **frontend**, feito em Dart/Flutter. O backend (Java) fica em outro repositório: [taverna-sorte-backend](https://github.com/C14-Inatel-2026-2/taverna-sorte-backend).

Site publicado: https://c14-inatel-2026-2.github.io/taverna-sorte-frontend/

## Funcionalidades

- Interface dos minijogos de aposta e probabilidade (dados, roletas)
- Loja de itens e poções
- Visualização de inventário
- Saldo de ouro do jogador

O cálculo de probabilidades e a resolução das apostas são feitos no servidor (backend).

## Tecnologias

- Dart e Flutter
- Gerenciador de dependências: `pub` (`pubspec.yaml`)
- Testes: `flutter_test`
- CI/CD: Jenkins com Docker

## Como executar o app

Pré-requisito: [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado.

```bash
git clone https://github.com/C14-Inatel-2026-2/taverna-sorte-frontend.git
cd taverna-sorte-frontend
flutter pub get
flutter run
```

Para rodar no navegador: `flutter run -d chrome`.

## Testes

```bash
flutter test
```

Os testes ficam na pasta `test/` e cobrem a tela da loja e os widgets `ItemCard` e `AppButton`.

## CI/CD com Jenkins

O pipeline roda no Jenkins (sem GitHub Actions) e tem quatro stages:

| Stage | O que faz |
|---|---|
| Build | Gera o APK (`flutter build apk --release`) e arquiva o artefato |
| Tests | Roda os testes (`flutter test`) |
| Build Web | Gera o site (`flutter build web --release`) |
| Deploy | Publica o site no GitHub Pages (somente na branch `main`) |

### Como subir o Jenkins

Pré-requisito: Docker Desktop instalado e aberto.

1. Copie o arquivo de exemplo e preencha as variáveis:

```bash
   cp .env.example .env
```

   | Variável | Descrição |
   |---|---|
   | `JENKINS_ADMIN_ID` / `JENKINS_ADMIN_PASSWORD` | Usuário e senha de acesso ao Jenkins |
   | `GITHUB_REPO_URL` | URL do repositório que o Jenkins monitora |
   | `PAGES_GITHUB_USER` | Usuário do GitHub que publica o site |
   | `PAGES_GITHUB_TOKEN` | Token clássico do GitHub com escopo `public_repo`, de uma conta com permissão de escrita no repositório |

   O arquivo `.env` está no `.gitignore`. Nunca faça commit do token.

2. Suba o container (a primeira vez demora, pois baixa o Flutter e o Android SDK):

```bash
   docker-compose up -d --build
```

3. Acesse http://localhost:8082, entre com o usuário e a senha do `.env`, abra o job `taverna-sorte-frontend`, escolha a branch `main` e clique em **Build Now**.

### Como funciona o deploy

- O stage **Build Web** gera o site com `--base-href /taverna-sorte-frontend/`, necessário porque o GitHub Pages serve o projeto dentro desse caminho.
- O stage **Deploy** roda apenas na `main`. Ele envia o conteúdo de `build/web` para a branch `gh-pages`, usando a credencial `GITHUB_PAGES`, cadastrada em `jenkins/casc.yaml` a partir das variáveis do `.env`.
- O GitHub Pages publica o site automaticamente a partir da branch `gh-pages`.

## Equipe

- [David Fernandes Barbon](https://github.com/DavidFBar)
- [João Victor Samuel de Faria](https://github.com/joaovsfaria)
- [João Vitor Souza Aldet](https://github.com/joaoaldet)
- [Lucas Emanuel da Silva Godoi](https://github.com/luscagodoi)
- [Luiz Gustavo Guimarães Santos](https://github.com/LuizGuimaraesz)
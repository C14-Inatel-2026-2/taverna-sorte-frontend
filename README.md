# Taverna da Sorte — Frontend

Plataforma de entretenimento com minijogos de aposta e probabilidade, moeda virtual (ouro), loja de itens e inventário, com tema de taverna medieval mágica. Este repositório contém o **frontend**, feito em Dart/Flutter. O backend (Java) fica em outro repositório: [taverna-sorte-backend](https://github.com/C14-Inatel-2026-2/taverna-sorte-backend).

Site publicado: https://c14-inatel-2026-2.github.io/taverna-sorte-frontend/

## Funcionalidades

- Interface dos minijogos de aposta e probabilidade (dados e roletas).
- Loja de itens e poções.
- Visualização do inventário do jogador.
- Visualização do saldo de ouro.
- Tela de navegação entre as funcionalidades do aplicativo.
- Consulta do histórico de partidas do jogador (em desenvolvimento).

O cálculo de probabilidades e a resolução das apostas são feitos no servidor (backend).

## Requisitos funcionais

Os requisitos funcionais descrevem as funcionalidades que o aplicativo deve oferecer ao jogador.

- **RF01 — Minijogos:** disponibilizar interfaces para os minijogos de aposta e probabilidade, incluindo dados e roletas.
- **RF02 — Navegação:** permitir a navegação entre as telas do aplicativo por meio de rotas nomeadas.
- **RF03 — Loja:** permitir que o jogador visualize os itens disponíveis e realize compras utilizando seu saldo de moedas, respeitando as regras de saldo e capacidade do inventário.
- **RF04 — Inventário:** permitir que o jogador visualize os itens adquiridos, respeitando o limite de 3 itens por inventário.
- **RF05 — Saldo de ouro:** apresentar o saldo de ouro disponível para o jogador.
- **RF06 — Histórico de partidas (em desenvolvimento):** disponibilizar uma tela para consultar as partidas realizadas pelo jogador, exibindo o tipo de jogo, valor apostado, resultado, prêmio obtido e data.
- **RF07 — Ordenação do histórico (em desenvolvimento):** apresentar as partidas da mais recente para a mais antiga.
- **RF08 — Histórico vazio (em desenvolvimento):** informar ao jogador quando não houver partidas registradas.

## Requisitos não funcionais

Os requisitos não funcionais descrevem características de qualidade, segurança e tecnologias utilizadas no desenvolvimento.

- **RNF01 — Tecnologia:** o frontend deve ser desenvolvido utilizando Dart e Flutter.
- **RNF02 — Comunicação com o servidor:** utilizar o backend para processar regras de negócio, autenticação, operações de compra, resultados dos jogos e consulta do histórico de partidas.
- **RNF03 — Navegação:** utilizar rotas nomeadas para organizar a navegação entre as telas.
- **RNF04 — Segurança:** informações pessoais e dados que dependem de autenticação devem ser tratados conforme as regras de segurança do backend.
- **RNF05 — Compatibilidade:** permitir a execução do aplicativo em navegadores compatíveis com Flutter Web.
- **RNF06 — Testabilidade:** possuir testes automatizados utilizando `flutter_test`.
- **RNF07 — Integração contínua:** utilizar Jenkins para automatizar a compilação e a execução dos testes.
- **RNF08 — Publicação:** disponibilizar a versão web por meio do GitHub Pages.

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

## Refactoring

### PR 11: https://github.com/C14-Inatel-2026-2/taverna-sorte-frontend/pull/11
- **Smell:** A navegação estava sendo feita no app.dart por meio de um enum AppRoutes, com um switch e um setstate. Estava tendo responsabilidade demais em uma unica classe e muito trabalho para fazer a navegação.
- **Refactoring Aplicado:** Mudei a navegação para utilizar as rotas nomeadas do flutter e criei o arquivo "routes.dart" para fazer a organização de rotas por lá.
- **Por quê:** Agora a questão da navegação fica bem mais organizada e facilitada também, tendo em vista que antes estava tendo que criar os comportamentos para navegação e agora só utiliza uma ferramenta que já é nativa do flutter.

### PR 16: https://github.com/C14-Inatel-2026-2/taverna-sorte-frontend/pull/16
- **Smell:** Código duplicado, estava fazendo uma appbar para cada screen e todas com o mesmo comportamento.
- **Refactoring Aplicado:** Criei um novo widget TavernAppbar para passar ele no parametro "appbar" nos Scaffold de todas as screens do projeto.
- **Por quê:** Agora caso queira mudar algum comportamento da appbar é só editar no arquivo tavern_appbar.dart ao invés de mudar todas as screens.

## Equipe

- [David Fernandes Barbon](https://github.com/DavidFBar)
- [João Victor Samuel de Faria](https://github.com/joaovsfaria)
- [João Vitor Souza Aldet](https://github.com/joaoaldet)
- [Lucas Emanuel da Silva Godoi](https://github.com/luscagodoi)
- [Luiz Gustavo Guimarães Santos](https://github.com/LuizGuimaraesz)

<h1 align="center">☕ Projetos Java</h1>

<p align="center">
Repositório com projetos e exercícios desenvolvidos em Java, do aprendizado à construção de uma aplicação web completa.
</p>

---

## 📖 Sobre o repositório

Este repositório reúne meus estudos e projetos práticos em **Java**, incluindo uma aplicação web (Java EE / Servlets) desenvolvida durante meu processo de aprendizado.

## 🗂️ Estrutura do repositório

### 🌐 Web Application/AplCurso

Aplicação web em Java (Servlets + JSP) estruturada em arquitetura **MVC com DAO**, para gestão de informações cadastrais de um pequeno sistema de negócio. Principais entidades gerenciadas:

- 👤 **Administrador** e **Usuário** — controle de acesso
- 🧑‍💼 **Cliente** e **Fornecedor** — cadastros de pessoas/empresas
- 🏙️ **Cidade** e **Estado** — dados de localização
- 💸 **Despesa** — controle financeiro básico

**Organização do código:**

```
src/java/br/com/curso/
├── controller/  # Servlets responsáveis pelas regras de cada entidade
├── dao/         # Camada de acesso a dados
├── filter/      # Filtros de requisição (ex: autenticação)
├── model/       # Classes de domínio
└── utils/       # Classes utilitárias
```

## 🛠️ Tecnologias

<p align="center">
<img src="https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white"/>
<img src="https://img.shields.io/badge/JSP%2FServlets-F80000?style=for-the-badge&logo=apachetomcat&logoColor=white"/>
<img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white"/>
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"/>
</p>

## ▶️ Como usar

1. Importe o projeto `AplCurso` em uma IDE compatível com projetos Java Web (ex: NetBeans).
2. Configure um servidor de aplicação (ex: Apache Tomcat).
3. Faça o deploy e acesse a aplicação pelo navegador.

---

<p align="center"><i>Parte dos meus estudos e materiais como Desenvolvedor Full Stack e Professor de TI.</i></p>

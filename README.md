<h1 align="center">☕ Java EE — Web Application (MVC + DAO)</h1>

<p align="center">
Aplicação Web completa em Java EE (Servlets, JSP, JSTL) estruturada na arquitetura MVC com padrão DAO para gestão cadastral e financeira.
</p>

---

## 📖 Sobre o repositório

Este repositório reúne uma **Aplicação Web Java EE** didática e completa, construída para demonstrar a arquitetura **MVC (Model-View-Controller)** e o padrão de projeto **DAO (Data Access Object)**.

O sistema realiza o gerenciamento completo (CRUD) de múltiplos módulos de um sistema corporativo:
- 👥 **Usuários e Administradores**: Controle de acesso, autenticação e permissões.
- 🧑‍💼 **Clientes e Fornecedores**: Cadastro de pessoas físicas e jurídicas.
- 🏙️ **Cidades e Estados**: Gestão de localidades geográficas relacionais.
- 💸 **Despesas**: Controle e lançamento financeiro básico.

---

## 🗂️ Arquitetura e Estrutura do Código

```
AplCurso/
├── src/java/br/com/curso/
│   ├── controller/     # Controllers (Servlets) — Regras de navegação e requisição
│   │   ├── CidadeCadastrar.java / CidadeCarregar.java / CidadeExcluir.java / CidadeListar.java
│   │   ├── EstadoCadastrar.java / EstadoCarregar.java / EstadoExcluir.java / EstadoListar.java
│   │   ├── ClienteCadastrar.java / ClienteListar.java / ClienteExcluir.java
│   │   ├── FornecedorCadastrar.java / FornecedorListar.java / FornecedorExcluir.java
│   │   ├── DespesaCadastrar.java / DespesaListar.java / DespesaExcluir.java
│   │   └── UsuarioCadastrar.java / UsuarioListar.java / UsuarioExcluir.java
│   │
│   ├── dao/            # Data Access Object — Comunicação direta com o banco SQL
│   │   ├── GenericDAO.java (Interface genérica CRUD)
│   │   ├── CidadeDAO.java / EstadoDAO.java
│   │   ├── ClienteDAO.java / FornecedorDAO.java
│   │   ├── DespesaDAO.java / UsuarioDAO.java / AdministradorDAO.java
│   │   └── PessoaDAO.java
│   │
│   ├── model/          # Classes de Modelo (Entidades Java POJO)
│   │   ├── Cidade.java / Estado.java
│   │   ├── Pessoa.java / Cliente.java / Fornecedor.java
│   │   ├── Despesa.java / Usuario.java / Administrador.java
│   │   └── Menu.java
│   │
│   ├── filter/         # Filtros de requisição e segurança (Filter)
│   │   └── FilterAutenticacao.java
│   │
│   └── utils/          # Conexão com banco e utilitários
│       ├── Conexao.java (Driver JDBC + Connection Factory)
│       └── SingleConnection.java
│
└── web/                # Páginas JSP, CSS (Bootstrap), JS e Recursos Web
    ├── index.jsp
    ├── home.jsp
    ├── cadastros/      # Formulários de cadastro e edição JSP
    └── vendor/         # Bootstrap, DataTables, FontAwesome, Chart.js
```

---

## 🛠️ Tecnologias Utilizadas

<p align="center">
  <img src="https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white" alt="Java"/>
  <img src="https://img.shields.io/badge/Java%20EE%20Servlets-F80000?style=for-the-badge&logo=apachetomcat&logoColor=white" alt="Servlets"/>
  <img src="https://img.shields.io/badge/JSP%20%2F%20JSTL-007396?style=for-the-badge&logo=java&logoColor=white" alt="JSP"/>
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL"/>
  <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white" alt="Bootstrap"/>
  <img src="https://img.shields.io/badge/GlassFish%20%2F%20Tomcat-FFBF00?style=for-the-badge&logo=apache&logoColor=black" alt="Server"/>
</p>

---

## ▶️ Como Executar o Projeto

### Pré-requisitos
- **JDK 8 ou 11**
- **IDE**: NetBeans, Eclipse for Enterprise Java, ou IntelliJ IDEA Ultimate.
- **Servidor de Aplicação**: Apache Tomcat 8.5+ ou GlassFish 5+.
- **Banco de Dados**: PostgreSQL.

### Passos
1. Clone o repositório:
   ```bash
   git clone https://github.com/Eduardo00073/java-web-app.git
   ```
2. Importe a pasta `AplCurso` na sua IDE como um projeto Web/Maven/NetBeans.
3. Configure o arquivo de conexão `src/java/br/com/curso/utils/Conexao.java` com as credenciais do seu PostgreSQL.
4. Faça o deploy no servidor de aplicação (Tomcat/GlassFish).
5. Acesse no navegador: `http://localhost:8080/AplCurso`

---

<p align="center"><i>Material didático desenvolvido como parte dos meus estudos e atuações em Desenvolvimento Full Stack e Docência em TI.</i></p>

<%@ page
	import="java.util.*,
br.com.gabriel.agenda.bd.*,
br.com.gabriel.agenda.modelo.*,
java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alterar Contato</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
.navbar {
	border-bottom: 3px solid #000;
}
</style>
<body class="bg-light">
	<script src="js/validator.min.js"></script>

	<header>
		<nav class="navbar fixed-top navbar-expand-lg navbar-light"
			style="background-color: #e3f2fd;">
			<a class="navbar-brand" href="#"><img
				src="/agendaGabriel/img/logo.png" width="30" height="30"
				class="d-inline-block align-top" alt=""> Agenda</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Alterna navegação">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="/agendaGabriel">Início</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="/agendaGabriel/lista-contatos.jsp?busca=">Contatos</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/agendaGabriel/adiciona-contato.html">Adicionar contato</a></li>
				</ul>
				<form action="buscaContato" class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="search" name="busca"
						placeholder="Buscar contato...">
					<button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Pesquisar</button>
				</form>
			</div>
		</nav>
	</header>

	<%
		ContatoDAO dao = new ContatoDAO();
		Contato contato = dao.getContatoById(request.getParameter("id"));
		String data = new SimpleDateFormat("dd/MM/yyyy")
				.format(new SimpleDateFormat("EEE MMM d HH:mm:ss zzz yyyy", Locale.US)
						.parse(contato.getDataNascimento().getTime().toString()));
	%>

	<main role="main" class="container"> <br />
	<h1 class="mt-5">Alterar contato existente</h1>
	<form action="alteraContato" data-toggle="validator">
		<input type="hidden" name="id" value="<%=contato.getId()%>">
		<div class="form-group">
			<label for="inputNome">Nome</label> <input class="form-control"
				type="text" id="inputNome" name="nome"
				value="<%=contato.getNome()%>" required>
		</div>
		<div class="form-group">
			<label for="inputEmail">E-mail</label> <input class="form-control"
				type="email" id="inputEmail" name="email"
				value="<%=contato.getEmail()%>" required>
		</div>
		<div class="form-group">
			<label for="inputEndereco">Endereço</label> <input
				class="form-control" type="text" id="inputEndereco" name="endereco"
				value="<%=contato.getEndereco()%>" required>
		</div>
		<div class="form-group">
			<label for="inputDataNascimento">Data de Nascimento</label> <input
				class="form-control" type="text" id="dataNascimento"
				name="dataNascimento" value="<%=data%>" required>
		</div>
		<button type="submit" class="btn btn-primary">Alterar</button>
	</form>
	</main>
</body>
</html>
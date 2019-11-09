<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,
br.com.gabriel.agenda.bd.*,
br.com.gabriel.agenda.modelo.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contato <%=request.getAttribute("status")%></title>
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

	<main role="main" class="container text-center"> <br />
	<br />
	<br />
	<img src="/agendaGabriel/img/sucess.png" />
	<p class="lead">
		O contato
		<%=request.getAttribute("nome")%>
		foi
		<%=request.getAttribute("status")%>
		com sucesso.
	</p>
	<a href="<%=request.getAttribute("btnUrl")%>" class="btn btn-primary"><%=request.getAttribute("btnMsg")%></a>
	</main>

</body>
</html>
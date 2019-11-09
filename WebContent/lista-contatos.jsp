<%@ page
	import="java.util.*,
br.com.gabriel.agenda.bd.*,
br.com.gabriel.agenda.modelo.*,
java.text.SimpleDateFormat"%>
<html>
<head>
<meta charset="UTF-8">
<title>Listagem de Contatos</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>
<style>
.navbar {
	border-bottom: 3px solid #000;
}
</style>
<body class="bg-light">

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
					<li class="nav-item active"><a class="nav-link"
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

	<main role="main" class="container"> <br />
	<h1 class="mt-5">Lista de contatos</h1>
	<table class="table">
		<thead>
			<tr>
				<th>Nome</th>
				<th>E-mail</th>
				<th>Endereço</th>
				<th>Data Nasc.</th>
				<th>Alterar</th>
				<th>Remover</th>
			</tr>
		</thead>

		<tbody>

			<%
				ContatoDAO dao = new ContatoDAO();
				List<Contato> contatos = dao.getLista();
				String dataNascimento;
				String nomeBusca = (request.getParameter("busca").equals("null") ? ""
						: request.getParameter("busca").toLowerCase());
				for (Contato contato : contatos) {
					dataNascimento = new SimpleDateFormat("dd/MM/yyyy")
							.format(new SimpleDateFormat("EEE MMM d HH:mm:ss zzz yyyy", Locale.US)
									.parse(contato.getDataNascimento().getTime().toString()));

					if (contato.getNome().toLowerCase().contains(nomeBusca)) {
			%>
			<tr>
				<th><%=contato.getNome()%></th>
				<td><%=contato.getEmail()%></td>
				<td><%=contato.getEndereco()%></td>
				<td><%=dataNascimento%></td>
				<td><a href="altera.jsp?id=<%=contato.getId()%>"
					class="btn btn-outline-primary btn-sm" Style="width: 80px;">Alterar</a></td>
				<td>
					<form action="removeContato">
						<input type="hidden" name="id" value="<%=contato.getId()%>">
						<input type="hidden" name="nome" value="<%=contato.getNome()%>">
						<button type="submit" class="btn btn-outline-danger btn-sm"
							Style="width: 80px;">Remover</button>
					</form>
				</td>
			</tr>
			<%
				}
				}
			%>
		</tbody>
	</table>
	</main>

</body>
</html>
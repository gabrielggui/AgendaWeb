package br.com.gabriel.agenda.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gabriel.agenda.bd.ContatoDAO;
import br.com.gabriel.agenda.modelo.Contato;

@WebServlet("/alteraContato")
public class AlteraContatoServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		PrintWriter out = response.getWriter();
// pegando os parâmetros do request
		Long id = Long.parseLong(request.getParameter("id"));
		String nome = request.getParameter("nome");
		String endereco = request.getParameter("endereco");
		String email = request.getParameter("email");
		String dataEmTexto = request.getParameter("dataNascimento");
		Calendar dataNascimento = null;
//fazendo a conversão da data
		try {
			Date date = new SimpleDateFormat("dd/MM/yyyy").parse(dataEmTexto);
			dataNascimento = Calendar.getInstance();
			dataNascimento.setTime(date);
		} catch (ParseException e) {
			request.setAttribute("erro", "Erro de conversão da data");
			request.getRequestDispatcher("erro.jsp").forward(request, response);
			return; // para a execução do método
		}
//monta um objeto contato
		Contato contato = new Contato();
		contato.setId(id);
		contato.setNome(nome);
		contato.setEndereco(endereco);
		contato.setEmail(email);
		contato.setDataNascimento(dataNascimento);
//salva o contato
		ContatoDAO dao = new ContatoDAO();
		dao.altera(contato);

		String status = "modificado";
		
		request.setAttribute("nome", nome);
		request.setAttribute("status", status);
		request.setAttribute("btnMsg", "Voltar a lista de contatos");
		request.setAttribute("btnUrl", "/agendaGabriel/lista-contatos.jsp?busca=");

		request.getRequestDispatcher("sucesso.jsp").forward(request, response);
	}
}

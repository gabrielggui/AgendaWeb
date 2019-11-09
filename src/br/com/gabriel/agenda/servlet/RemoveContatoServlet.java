package br.com.gabriel.agenda.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gabriel.agenda.bd.ContatoDAO;
import br.com.gabriel.agenda.modelo.Contato;

@WebServlet("/removeContato")
public class RemoveContatoServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String idString = request.getParameter("id");
		Long id = Long.parseLong(idString);
		ContatoDAO dao = new ContatoDAO();
		Contato c = new Contato();
		c.setId(id);
		dao.remove(c);

		String nome = request.getParameter("nome");
		String status = "removido";
		request.setAttribute("nome", nome);
		request.setAttribute("status", status);
		request.setAttribute("btnMsg", "Voltar a lista de contatos");
		request.setAttribute("btnUrl", "/agendaGabriel/lista-contatos.jsp?busca=");

		request.getRequestDispatcher("sucesso.jsp").forward(request, response);
	}
}

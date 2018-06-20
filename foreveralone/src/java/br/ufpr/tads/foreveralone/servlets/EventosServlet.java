/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.servlets;

import br.ufpr.tads.foreveralone.beans.Atributo;
import br.ufpr.tads.foreveralone.beans.Cidade;
import br.ufpr.tads.foreveralone.beans.Cliente;
import br.ufpr.tads.foreveralone.beans.Endereco;
import br.ufpr.tads.foreveralone.beans.Estado;
import br.ufpr.tads.foreveralone.beans.Evento;
import br.ufpr.tads.foreveralone.beans.Funcionario;
import br.ufpr.tads.foreveralone.beans.Login;
import br.ufpr.tads.foreveralone.facades.impl.ClienteFacade;
import br.ufpr.tads.foreveralone.facades.impl.EncontroFacade;
import br.ufpr.tads.foreveralone.facades.impl.EventoFacade;
import br.ufpr.tads.foreveralone.facades.impl.FuncionarioFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author luis_
 */
@WebServlet(name = "EventosServlet", urlPatterns = {"/eventos"})
public class EventosServlet extends HttpServlet {

    private ClienteFacade clientesFacade;
    private EncontroFacade encontroFacade;
    private FuncionarioFacade funcionarioFacade;
    private EventoFacade eventoFacade;

    public EventosServlet() {
        this.clientesFacade = new ClienteFacade();
        this.encontroFacade = new EncontroFacade();
        this.funcionarioFacade = new FuncionarioFacade();
        this.eventoFacade = new EventoFacade();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);

        if (session == null || ((Login) session.getAttribute("loginBean") == null)) {
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            request.setAttribute("msg", "Usuário deve se autenticar para acessar o sistema");
            rd.forward(request, response);
        }

        Login login = (Login) session.getAttribute("loginBean");
        MessageDigest md;

        String action = request.getParameter("action");
        String url = "/gestaoClientes.jsp";
        int formType = 0;
        if (action == null || action.isEmpty() || action.equals("list")) {
            if (login.getTipo().equals("cliente")) {
                response.sendRedirect("clientes?action=pares");
            } else {

                List<Evento> eventos = eventoFacade.getListaEventos();
                for (Evento evento : eventos) {
                    Funcionario funcionario = new Funcionario();
                    Endereco endereco = new Endereco();
                    Cidade cidade = new Cidade();
                    Estado estado = new Estado();
                    
                    funcionario = funcionarioFacade.buscarFuncionarioPorId(evento.getFuncionario().getId());
                    evento.setFuncionario(funcionario);
                    
                    endereco = clientesFacade.getEnderecoPorId(evento.getId());
                    cidade = clientesFacade.getCidadePorId(endereco.getCidade().getId());
                    estado = clientesFacade.getEstadoPorId(cidade.getEstado().getId());
                    cidade.setEstado(estado);
                    endereco.setCidade(cidade);
                    evento.setLocal(endereco);
                    
                    List<Cliente> convidados = eventoFacade.getListaDeConvidados(evento.getId());
                    for(Cliente cliente : convidados){
                        Cliente temp = clientesFacade.buscarClientePorId(cliente.getId());
                        cliente.setId(formType);
                        cliente.setCpf(url);
                        System.out.println("Nome: " + cliente.getNome());
                    }
                    
                    evento.setConvidados(convidados);
                    System.out.println("Teste: " + evento.getConvidados().get(0).getNome());
                    
                }

                request.setAttribute("eventos", eventos);
                url = "/gestaoEventos.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
        } else if (action.equals("remove")) {
            final int id = Integer.parseInt(request.getParameter("id"));
            this.eventoFacade.removeEvento(id);
            response.sendRedirect("eventos");
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

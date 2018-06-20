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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
                    endereco = clientesFacade.getEnderecoPorId(evento.getLocal().getId());
                    cidade = clientesFacade.getCidadePorId(endereco.getCidade().getId());
                    estado = clientesFacade.getEstadoPorId(cidade.getEstado().getId());
                    cidade.setEstado(estado);
                    endereco.setCidade(cidade);
                    evento.setLocal(endereco);

                    List<Cliente> convidados = eventoFacade.getListaDeConvidados(evento.getId());
                    for (Cliente cliente : convidados) {
                        Cliente temp = clientesFacade.buscarClientePorId(cliente.getId());
                        cliente.setId(temp.getId());
                        cliente.setNome(temp.getNome());
                    }

                    evento.setConvidados(convidados);

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
        } else if (action.equals("formNew")) {
            url = "/cadastraEvento.jsp";
            formType = 1;
            List<Estado> estados = this.clientesFacade.buscarEstados();
            request.setAttribute("estados", estados);
            RequestDispatcher rd = request.getRequestDispatcher(url);
            request.setAttribute("formType", formType);
            rd.forward(request, response);
        } else if (action.equals("new")) {
            Evento evento = new Evento();
            Estado estado = new Estado();
            Cidade cidade = new Cidade();
            Endereco endereco = new Endereco();
            Funcionario funcionario = new Funcionario();

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
            try {
                evento.setData(formatter.parse(request.getParameter("data")));
            } catch (ParseException ex) {
                Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            funcionario.setId(login.getId());
            evento.setFuncionario(funcionario);
            evento.setHorario(request.getParameter("horario"));
            evento.setTema(request.getParameter("tema"));

            cidade = clientesFacade.getCidadePorId(Integer.parseInt(request.getParameter("cidade")));
            estado = clientesFacade.getEstadoPorId(Integer.parseInt(request.getParameter("estado")));
            cidade.setEstado(estado);

            endereco.setRua(request.getParameter("rua"));
            endereco.setCep(request.getParameter("cep"));
            endereco.setId(clientesFacade.getProximoIdEndereco());
            endereco.setLogradouro(request.getParameter("numero"));
            endereco.setCidade(cidade);

            this.clientesFacade.criarEndereço(endereco);
            evento.setLocal(endereco);

            eventoFacade.criarEvento(evento);

            response.sendRedirect("eventos");
        } else if (action.equals("formUpdate")) {
            final int id = Integer.parseInt(request.getParameter("id"));
            Evento evento = new Evento();
            Endereco en = new Endereco();
            Cidade ci = new Cidade();
            Estado es = new Estado();
            Funcionario funcionario = new Funcionario();

            evento = eventoFacade.buscaEventoPorId(id);
            evento.setId(id);

            funcionario = funcionarioFacade.buscarFuncionarioPorId(evento.getFuncionario().getId());
            evento.setFuncionario(funcionario);

            en = clientesFacade.getEnderecoPorId(evento.getLocal().getId());
            ci = clientesFacade.getCidadePorId(en.getCidade().getId());
            es = clientesFacade.getEstadoPorId(ci.getEstado().getId());
            ci.setEstado(es);
            en.setCidade(ci);
            evento.setLocal(en);

            request.setAttribute("evento", evento);

            url = "/cadastraEvento.jsp";
            formType = 2;
            List<Estado> estados = this.clientesFacade.buscarEstados();
            List<Cidade> cidades = this.clientesFacade.buscarCidadesPorEstado(evento.getLocal().getCidade().getEstado());
            request.setAttribute("estados", estados);
            request.setAttribute("cidades", cidades);
            RequestDispatcher rd = request.getRequestDispatcher(url);
            request.setAttribute("formType", formType);
            rd.forward(request, response);
        } else if (action.equals("update")) {
            Evento evento = new Evento();
            Estado estado = new Estado();
            Cidade cidade = new Cidade();
            Endereco endereco = new Endereco();

            System.out.println("Id: " + request.getParameter("id"));
            evento.setId(Integer.parseInt(request.getParameter("id")));

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
            try {
                evento.setData(formatter.parse(request.getParameter("data")));
            } catch (ParseException ex) {
                Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            evento.setHorario(request.getParameter("horario"));
            evento.setTema(request.getParameter("tema"));

            cidade = clientesFacade.getCidadePorId(Integer.parseInt(request.getParameter("cidade")));
            estado = clientesFacade.getEstadoPorId(Integer.parseInt(request.getParameter("estado")));
            cidade.setEstado(estado);

            endereco.setRua(request.getParameter("rua"));
            endereco.setCep(request.getParameter("cep"));
            endereco.setId(clientesFacade.getProximoIdEndereco());
            endereco.setLogradouro(request.getParameter("numero"));
            endereco.setCidade(cidade);

            this.clientesFacade.criarEndereço(endereco);
            evento.setLocal(endereco);

            eventoFacade.atulizaEvento(evento);

            response.sendRedirect("eventos");
        } else if (action.equals("listConvidar")) {
             List<Cliente> clientes = new ArrayList<Cliente>();
                clientes = this.clientesFacade.listarClientes();
                for (Cliente cliente : clientes) {
                    Atributo p = new Atributo();
                    Atributo c = new Atributo();
                    p = this.clientesFacade.getAtributoPorId(cliente.getPreferencias().getIdAtributo());
                    c = this.clientesFacade.getAtributoPorId(cliente.getCaracteristicas().getIdAtributo());

                    cliente.setCaracteristicas(c);
                    cliente.setPreferencias(p);

                    Endereco en = new Endereco();
                    Cidade ci = new Cidade();
                    Estado es = new Estado();

                    en = clientesFacade.getEnderecoPorId(cliente.getEndereço().getId());
                    ci = clientesFacade.getCidadePorId(en.getCidade().getId());
                    es = clientesFacade.getEstadoPorId(ci.getEstado().getId());
                    ci.setEstado(es);
                    en.setCidade(ci);
                    cliente.setEndereço(en);
                }
                int idEvento = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("idEvento", idEvento);
                request.setAttribute("clientes", clientes);
                url = "/convidaClientes.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
        }else if(action.equals("convidar")){
            int idEvento = Integer.parseInt(request.getParameter("idEvento"));
            int idCliente = Integer.parseInt(request.getParameter("idCliente"));
            eventoFacade.convidaCliente(idCliente, idEvento);
            response.sendRedirect("eventos?action=listConvidar");
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

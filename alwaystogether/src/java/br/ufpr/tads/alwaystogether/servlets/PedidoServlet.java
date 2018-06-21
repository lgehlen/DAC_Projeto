/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.alwaystogether.servlets;

import br.ufpr.tads.alwaystogether.beans.Funcionario;
import br.ufpr.tads.alwaystogether.beans.Login;
import br.ufpr.tads.alwaystogether.beans.Orcamento;
import br.ufpr.tads.alwaystogether.beans.Pedido;
import br.ufpr.tads.alwaystogether.facades.impl.FuncionarioFacade;
import br.ufpr.tads.alwaystogether.facades.impl.PedidoFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 *
 * @author gqueiroz
 */
@WebServlet(name = "PedidoServlet", urlPatterns = {"/PedidoServlet"})
public class PedidoServlet extends HttpServlet {

    static PedidoFacade pedidoFacade;

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
        pedidoFacade = new PedidoFacade();

        if (session == null || ((Login) session.getAttribute("loginBean") == null)) {
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            request.setAttribute("msg", "Usuário deve se autenticar para acessar o sistema");
            rd.forward(request, response);
        }

        String action = request.getParameter("action");
        String url = "/manter-pedidos.jsp";
        int formType = 0;

        if (action == null || action.isEmpty() || action.equals("list")) {
            Client client = ClientBuilder.newClient();
            Response resp = client
                    .target("http://localhost:8080/foreveralone/webresources/orcamentoresource")
                    .request(MediaType.APPLICATION_JSON)
                    .get();
            List<Orcamento> orcamentos
                    = resp.readEntity(
                            new GenericType<List<Orcamento>>() {
                    }
                    );

           

            List<Pedido> pedidos = new ArrayList<>();
            
            for (Orcamento o : orcamentos){
                Pedido p = new Pedido();
                Orcamento orcamento = new Orcamento();
                orcamento.setId(o.getId());
                p.setIdOrcamento(orcamento);
                p.setStatusOrcamento(o.getStatus());
                pedidos.add(p);
                pedidoFacade.criaOrcamento(o);
            }
            
            
            
            List<Pedido> pedidosOrcados = new ArrayList<>();
            List<Pedido> pedidosAbertos = new ArrayList<>();
            List<Pedido> pedidosRejeitados = new ArrayList<>();
            List<Pedido> pedidosAceitos = new ArrayList<>();

            for (Pedido pedido : pedidos) {
                Pedido p = new Pedido();
                p = pedido;
                p.setIdOrcamento(pedidoFacade.buscarOrcamentoPorId(pedido.getIdOrcamento().getId()));
                if (p.getStatusOrcamento().equals("Aberto")) {
                    pedidosAbertos.add(p);
                } else if (p.getStatusOrcamento().equals("Orcado")) {
                    pedidosOrcados.add(p);
                } else if (p.getStatusOrcamento().equals("Rejeitado")) {
                    pedidosRejeitados.add(p);
                } else if (p.getStatusOrcamento().equals("Aprovado")) {
                    pedidosAceitos.add(p);
                }
            }

            request.setAttribute("pedidosAbertos", pedidosAbertos);
            request.setAttribute("pedidosOrcados", pedidosOrcados);
            request.setAttribute("pedidosRejeitados", pedidosRejeitados);
            request.setAttribute("pedidosAceitos", pedidosAceitos);
            url = "/manter-pedidos.jsp";
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } else if (action.equals("show")) {
            final int id = Integer.parseInt(request.getParameter("id"));
            //request.setAttribute("funcionario", funcionario);
            //url = "/manter-pedidos.jsp";
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } else if (action.equals("formUpdate")) {
            final int id = Integer.parseInt(request.getParameter("id"));
            //Funcionario funcionario = this.funcionarioFacade.buscarFuncionarioPorId(id);

            //if(funcionario != null)
            //    request.setAttribute("funcionario", funcionario);
            url = "/manter-pedidos.jsp";
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } else if (action.equals("remove")) {
            final int id = Integer.parseInt(request.getParameter("id"));
            Funcionario funcionario = new Funcionario();
            funcionario.setId(id);
            response.sendRedirect("/alwaystogether/FuncionarioServlet");
        } else if (action.equals("update")) {
            final int id = Integer.parseInt(request.getParameter("id"));
            //request.setAttribute("funcionarios", funcionarios);
            url = "/manter-pedidos.jsp";
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } else if (action.equals("new")) {
            Funcionario funcionario = new Funcionario();
            funcionario.setEmail(request.getParameter("E-mail"));
            funcionario.setNome(request.getParameter("Nome"));
            funcionario.setSenha(request.getParameter("Senha"));
            funcionario.setRegra("..");
            //this.funcionarioFacade.criarFuncionario(funcionario);

            response.sendRedirect("/alwaystogether/FuncionarioServlet");
        } else if (action.equals("formNew")) {
            int id = Integer.parseInt(request.getParameter("id"));

            url = "/enviar-orcamento.jsp";
            request.setAttribute("idPedido", id);
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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

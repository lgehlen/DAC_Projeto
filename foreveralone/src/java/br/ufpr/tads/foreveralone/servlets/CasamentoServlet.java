/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.servlets;

import br.ufpr.tads.foreveralone.beans.Cliente;
import br.ufpr.tads.foreveralone.beans.Funcionario;
import br.ufpr.tads.foreveralone.beans.Login;
import br.ufpr.tads.foreveralone.beans.Orcamento;
import br.ufpr.tads.foreveralone.daos.ClienteDao;
import br.ufpr.tads.foreveralone.facades.impl.ClienteFacade;
import br.ufpr.tads.foreveralone.facades.impl.FuncionarioFacade;
import br.ufpr.tads.foreveralone.facades.impl.PedidoFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
 * @author gqueiroz
 */
@WebServlet(name = "CasamentoServlet", urlPatterns = {"/CasamentoServlet"})
public class CasamentoServlet extends HttpServlet {
    PedidoFacade pedidoFacade;
    ClienteFacade clienteFacade;
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
        clienteFacade = new ClienteFacade();
        MessageDigest md;
        
        Login login = ((Login) session.getAttribute("loginBean"));
        
        if (session == null || login == null) {
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            request.setAttribute("msg", "Usuário deve se autenticar para acessar o sistema");
            rd.forward(request, response);
        }
        
        String action = request.getParameter("action");
        String url = "/casamento.jsp";
        int formType = 0;
        
            if (action == null || action.isEmpty() || action.equals("list")) {
                List<Orcamento> o = this.pedidoFacade.buscarOrcamentos(login.getId());
                request.setAttribute("orcamentos", o);
                url = "/casamento.jsp";  
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
            else if (action.equals("show")){
                final int id = Integer.parseInt(request.getParameter("id"));
                Orcamento o = this.pedidoFacade.buscarOrcamentoPorId(id);
                request.setAttribute("orcamento", o);
                url = "/casamento.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
            else if (action.equals("formUpdate")){
                final int id = Integer.parseInt(request.getParameter("id"));
                Orcamento o = this.pedidoFacade.buscarOrcamentoPorId(id);
                
                if(o != null)
                    request.setAttribute("orcamento", o);
                url = "/casamento.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
            else if (action.equals("update")){
                final int id = Integer.parseInt(request.getParameter("id"));
                Orcamento o = this.pedidoFacade.buscarOrcamentoPorId(id);
                Cliente c = this.clienteFacade.buscarClientePorId(login.getId());
                o.setDetalhamentoStandard("..");
                o.setEmailCliente(c.getEmail());
                o.setStatus("Aberto");

                this.pedidoFacade.atualizarOrcamento(o);
                
                url = "/casamento.jsp";  
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
            else if (action.equals("new")){
                final int id = Integer.parseInt(request.getParameter("id"));
                Orcamento o = this.pedidoFacade.buscarOrcamentoPorId(id);
                Cliente c = this.clienteFacade.buscarClientePorId(login.getId());
                o.setDetalhamentoStandard("..");
                o.setEmailCliente(c.getEmail());
                o.setStatus("Aberto");
                
                this.pedidoFacade.criarOrcamento(o);
                
                response.sendRedirect("/foreveralone/CasamentoServlet");
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

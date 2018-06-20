/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.servlets;

import br.ufpr.tads.foreveralone.beans.Atributo;
import br.ufpr.tads.foreveralone.beans.Cidade;
import br.ufpr.tads.foreveralone.beans.Cliente;
import br.ufpr.tads.foreveralone.beans.Estado;
import br.ufpr.tads.foreveralone.beans.Funcionario;
import br.ufpr.tads.foreveralone.beans.Login;
import br.ufpr.tads.foreveralone.facades.impl.FuncionarioFacade;
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
@WebServlet(name = "FuncionarioServlet", urlPatterns = {"/FuncionarioServlet"})
public class FuncionarioServlet extends HttpServlet {
    private FuncionarioFacade funcionarioFacade;
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
        funcionarioFacade = new FuncionarioFacade();
        MessageDigest md;
        
        if (session == null || ((Login) session.getAttribute("loginBean") == null)) {
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            request.setAttribute("msg", "Usuário deve se autenticar para acessar o sistema");
            rd.forward(request, response);
        }
        
        String action = request.getParameter("action");
        String url = "/gestaoFuncionarios.jsp";
        int formType = 0;
        
            if (action == null || action.isEmpty() || action.equals("list")) {
                List<Funcionario> funcionarios = this.funcionarioFacade.listarFuncionarios();
                request.setAttribute("funcionarios", funcionarios);
                url = "/gestaoFuncionarios.jsp";  
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
            else if (action.equals("show")){
                final int id = Integer.parseInt(request.getParameter("id"));
                Funcionario funcionario = this.funcionarioFacade.buscarFuncionarioPorId(id);
                request.setAttribute("funcionario", funcionario);
                url = "/gestaoFuncionarios.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
            else if (action.equals("formUpdate")){
                final int id = Integer.parseInt(request.getParameter("id"));
                Funcionario funcionario = this.funcionarioFacade.buscarFuncionarioPorId(id);
                
                if(funcionario != null)
                    request.setAttribute("funcionario", funcionario);
                url = "/gestaoFuncionarios.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
            else if (action.equals("remove")){
                final int id = Integer.parseInt(request.getParameter("id"));
                Funcionario funcionario = new Funcionario();
                funcionario.setId(id);
                this.funcionarioFacade.deletarFuncionario(funcionario);
                response.sendRedirect("/foreveralone/FuncionarioServlet");
            }
            else if (action.equals("update")){
                final int id = Integer.parseInt(request.getParameter("id"));
                Funcionario funcionario = this.funcionarioFacade.buscarFuncionarioPorId(id);
                funcionario.setCpf(request.getParameter("CPF"));
                funcionario.setEmail(request.getParameter("E-mail"));
                funcionario.setNome(request.getParameter("Nome"));

                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
                try {
                    if(request.getParameter("data")!= null)
                    funcionario.setDataNasc(formatter.parse(request.getParameter("data")));
                } catch (ParseException ex) {
                    Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

                this.funcionarioFacade.atualizarFuncionario(funcionario);
                
                List<Funcionario> funcionarios = this.funcionarioFacade.listarFuncionarios();
                request.setAttribute("funcionarios", funcionarios);
                url = "/gestaoFuncionarios.jsp";  
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
            else if (action.equals("new")){
                Funcionario funcionario = new Funcionario();
                funcionario.setCpf(request.getParameter("CPF"));
                funcionario.setEmail(request.getParameter("E-mail"));
                funcionario.setNome(request.getParameter("Nome"));
                
                try {
                    md = MessageDigest.getInstance("MD5");
                    BigInteger hash = new BigInteger(1, md.digest(request.getParameter("Senha").getBytes()));
                    funcionario.setSenha(hash.toString(16));
                } catch (NoSuchAlgorithmException ex) {
                    Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
                try {
                    if(request.getParameter("data")!= null)
                    funcionario.setDataNasc(formatter.parse(request.getParameter("data")));
                } catch (ParseException ex) {
                    Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                this.funcionarioFacade.criarFuncionario(funcionario);
                
                response.sendRedirect("/foreveralone/FuncionarioServlet");
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

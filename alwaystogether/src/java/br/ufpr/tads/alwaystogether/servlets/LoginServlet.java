/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.alwaystogether.servlets;

import br.ufpr.tads.alwaystogether.beans.Login;
import br.ufpr.tads.alwaystogether.facades.impl.FuncionarioFacade;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

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
        
        FuncionarioFacade funcionario = new FuncionarioFacade();
        
        String email = request.getParameter("email");
        String sen = request.getParameter("password"); 
        
        Login login = new Login();
        login =  funcionario.getLogin(email, sen);
        
        if(login != null && login.getId() == 1)
        {
                login.setTipo("admin");
                HttpSession session = request.getSession();
                session.setAttribute("loginBean", login);
                RequestDispatcher rd = request.
                            getRequestDispatcher("/FuncionarioServlet");
                    request.setAttribute("login", login);
                    rd.forward(request, response);   
        }
        else if(login.getId() != 1)
        {
            HttpSession session = request.getSession();
            session.setAttribute("loginBean", login);
            RequestDispatcher rd = request.
                            getRequestDispatcher("/PedidoServlet");
                    request.setAttribute("login", login);
                    rd.forward(request, response);    
        }else
        {    
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            request.setAttribute("msg", "Usuário/Senha inválidos.");
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

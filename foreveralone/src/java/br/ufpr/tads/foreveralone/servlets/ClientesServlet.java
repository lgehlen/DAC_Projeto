/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.servlets;

import br.ufpr.tads.foreveralone.beans.Cidade;
import br.ufpr.tads.foreveralone.beans.Cliente;
import br.ufpr.tads.foreveralone.beans.Estado;
import br.ufpr.tads.foreveralone.beans.Login;
import br.ufpr.tads.foreveralone.facades.impl.ClienteFacade;
import java.io.IOException;
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
 * @author luis_
 */
@WebServlet(name = "ClientesServlet", urlPatterns = {"/ClientesServlet"})
public class ClientesServlet extends HttpServlet {

    private ClienteFacade clientesFacade;
    
    public ClientesServlet(){
        this.clientesFacade = new ClienteFacade();
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
           
            
            if (session == null || ((Login) session.getAttribute("login") == null)) {
                RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                request.setAttribute("msg", "Usuário deve se autenticar para acessar o sistema");
                rd.forward(request, response);
            }
            
            String action = request.getParameter("action");
            String url = "/clientesListar.jsp";
            int formType = 0;
                                   
            if (action == null || action.isEmpty() || action.equals("list")){    
                request.setAttribute("clientes", this.clientesFacade.listarClientes());
                url = "/clientesListar.jsp";  
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
            else if (action.equals("show")){
                final int id = Integer.parseInt(request.getParameter("id"));
                Cliente cliente = this.clientesFacade.buscarClientePorId(id);
                request.setAttribute("cliente", cliente);
                url = "/clientesVisualizar.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
            else if (action.equals("formUpdate")){
                final int id = Integer.parseInt(request.getParameter("id"));
                Cliente c = this.clientesFacade.buscarClientePorId(id);
                
                request.setAttribute("cliente", c);
                
                url = "/clientesForm.jsp";
                formType = 2;
                List<Estado> estados = this.clientesFacade.buscarEstados();
                List<Cidade> cidades = this.clientesFacade.buscarCidadesPorEstado(c.getEndereço().getCidade().getEstado());
                request.setAttribute("estados", estados);
                request.setAttribute("cidades", cidades);
                RequestDispatcher rd = request.getRequestDispatcher(url);
                request.setAttribute("formType", formType);
                rd.forward(request, response);
            }
            else if (action.equals("remove")){
                final int id = Integer.parseInt(request.getParameter("id"));
                this.clientesFacade.deletarCliente(id);
                response.sendRedirect("clientes"); 
            }
            else if (action.equals("update")){
                
                Cliente cliente = new Cliente();
                
                cliente.getEndereço().setCep(request.getParameter("cep"));
                cliente.setCpf(request.getParameter("cpf"));
                cliente.setEmail(request.getParameter("email"));
                cliente.setNome(request.getParameter("nome"));
                cliente.getEndereço().setRua(request.getParameter("rua"));
                
                cliente.getEndereço().getCidade().setId(Integer.parseInt(request.getParameter("cidade")));
                cliente.getEndereço().getCidade().getEstado().setId(Integer.parseInt(request.getParameter("estado")));    
                cliente.setId(Integer.parseInt(request.getParameter("id")));
                

                System.out.println("asda");
                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                System.out.println("asda");
                try {
                    cliente.setDataNasc(formatter.parse(request.getParameter("data")));
                } catch (ParseException ex) {
                    Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                System.out.println("asda");
                this.clientesFacade.atualizarCliente(cliente);
                
                response.sendRedirect("clientes");                
            }            
            else if (action.equals("formNew")){
                url = "/clientesForm.jsp";
                formType = 1;
                List<Estado> estados = this.clientesFacade.buscarEstados();
                request.setAttribute("estados", estados);
                RequestDispatcher rd = request.getRequestDispatcher(url);
                request.setAttribute("formType", formType);
                rd.forward(request, response);
            }
            else if (action.equals("new")){
                Cliente cliente = new Cliente();
                    
                cliente.getEndereço().setCep(request.getParameter("cep"));
                cliente.setCpf(request.getParameter("cpf"));
                cliente.setEmail(request.getParameter("email"));
                cliente.setNome(request.getParameter("nome"));
                cliente.getEndereço().setRua(request.getParameter("rua"));
                
                cliente.getEndereço().getCidade().setId(Integer.parseInt(request.getParameter("cidade")));
                cliente.getEndereço().getCidade().getEstado().setId(Integer.parseInt(request.getParameter("estado")));

                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                try {
                    cliente.setDataNasc(formatter.parse(request.getParameter("data")));
                } catch (ParseException ex) {
                    Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                this.clientesFacade.criarCliente(cliente);
                
                response.sendRedirect("clientes");                
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
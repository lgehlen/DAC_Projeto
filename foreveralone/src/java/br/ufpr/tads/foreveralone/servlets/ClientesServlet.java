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
import br.ufpr.tads.foreveralone.beans.Login;
import br.ufpr.tads.foreveralone.facades.impl.ClienteFacade;
import java.io.IOException;
import java.nio.file.Files;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.apache.jasper.tagplugins.jstl.ForEach;

/**
 *
 * @author luis_
 */
@WebServlet(name = "ClientesServlet", urlPatterns = {"/clientes"})
public class ClientesServlet extends HttpServlet {

    private ClienteFacade clientesFacade;

    public ClientesServlet() {
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

        if (session == null || ((Login) session.getAttribute("loginBean") == null)) {
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            request.setAttribute("msg", "Usuário deve se autenticar para acessar o sistema");
            rd.forward(request, response);
        }

        Login login = (Login) session.getAttribute("loginBean");

        String action = request.getParameter("action");
        String url = "/gestaoClientes.jsp";
        int formType = 0;
        if (action == null || action.isEmpty() || action.equals("list")) {
            List<Cliente> clientes = new ArrayList<Cliente>();
            clientes = this.clientesFacade.listarClientes();
            for (Cliente cliente : clientes) {
                Atributo p = new Atributo();
                Atributo c = new Atributo();
                p = this.clientesFacade.getAtributoPorId(cliente.getPreferencias().getIdAtributo());
                c = this.clientesFacade.getAtributoPorId(cliente.getCaracteristicas().getIdAtributo());
                
                if(p.getSexo().equals("F")){
                    p.setSexo("Feminino");
                }else if (p.getSexo().equals("M")){
                    p.setSexo("Masculino");
                }else{
                    p.setSexo("Não Definido");
                }
                
                 if(c.getSexo().equals("F")){
                    c.setSexo("Feminino");
                }else if (c.getSexo().equals("M")){
                    c.setSexo("Masculino");
                }else{
                    c.setSexo("Não Definido");
                }
                
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
            request.setAttribute("clientes", clientes);
            url = "/gestaoClientes.jsp";
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } else if (action.equals("show")) {
            final int id = Integer.parseInt(request.getParameter("id"));
            Cliente cliente = this.clientesFacade.buscarClientePorId(id);
            request.setAttribute("cliente", cliente);
            url = "/clientesVisualizar.jsp";
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } else if (action.equals("formUpdate")) {
            final int id = Integer.parseInt(request.getParameter("id"));
            Cliente cliente = this.clientesFacade.buscarClientePorId(id);
            Atributo c = new Atributo();
            Atributo p = new Atributo();
            Endereco en = new Endereco();
            Cidade ci = new Cidade();
            Estado es = new Estado();
            
            en = clientesFacade.getEnderecoPorId(cliente.getEndereço().getId());
            ci = clientesFacade.getCidadePorId(en.getCidade().getId());
            es = clientesFacade.getEstadoPorId(ci.getEstado().getId());
            ci.setEstado(es);
            en.setCidade(ci);
            cliente.setEndereço(en);
            
            c = clientesFacade.getAtributoPorId(cliente.getCaracteristicas().getIdAtributo());
            p = clientesFacade.getAtributoPorId(cliente.getPreferencias().getIdAtributo());
            System.out.println("Cor do Cabelo: " + c.getCorDeCabelo());
            System.out.println("Cor do Cabelo: " + p.getCorDeCabelo());
            
            
            cliente.setCaracteristicas(c);
            cliente.setPreferencias(p);
            
            request.setAttribute("cliente", cliente);

            url = "/cadastraUsuario.jsp";
            formType = 2;
            List<Estado> estados = this.clientesFacade.buscarEstados();
            List<Cidade> cidades = this.clientesFacade.buscarCidadesPorEstado(cliente.getEndereço().getCidade().getEstado());
            request.setAttribute("estados", estados);
            request.setAttribute("cidades", cidades);
            RequestDispatcher rd = request.getRequestDispatcher(url);
            request.setAttribute("formType", formType);
            rd.forward(request, response);
        } else if (action.equals("remove")) {
            final int id = Integer.parseInt(request.getParameter("id"));
            this.clientesFacade.deletarCliente(id);
            response.sendRedirect("clientes");
        } else if (action.equals("update")) {

            Cliente cliente = new Cliente();
            
            Cidade cidade = new Cidade();
            Estado estado = new Estado();
            Endereco endereco =  new Endereco();
            Atributo preferencias = new Atributo();
            Atributo caracteristicas = new Atributo();
            
            cliente.setCpf(request.getParameter("cpf"));
            cliente.setEmail(request.getParameter("email"));
            cliente.setNome(request.getParameter("nome"));
            cliente.setEscolaridade(request.getParameter("escolaridade"));
            System.out.println("Escolaridade: " + cliente.getEscolaridade());
            cliente.setSenha(request.getParameter("senha"));
            
            
            cidade = clientesFacade.getCidadePorId(Integer.parseInt(request.getParameter("cidade")));
            estado = clientesFacade.getEstadoPorId(Integer.parseInt(request.getParameter("estado")));
            cidade.setEstado(estado);
            
            endereco.setRua(request.getParameter("rua"));
            endereco.setCep(request.getParameter("cep"));
            endereco.setId(clientesFacade.getProximoIdEndereco());
            endereco.setLogradouro(request.getParameter("numero"));
            endereco.setCidade(cidade);
            
            this.clientesFacade.alterarEndereco(endereco);
            cliente.setEndereço(endereco);
            
            
            if (!login.getTipo().equals("funcionario")) {
                preferencias.setCorDeCabelo(request.getParameter("cordocabelo"));
                preferencias.setCorDePele(request.getParameter("cordapele"));
                preferencias.setDescricao(request.getParameter("rangemin") + "-" + request.getParameter("rangemax"));
                preferencias.setSexo(request.getParameter("sexo"));
                preferencias.setIdAtributo(this.clientesFacade.buscaProximoIdAtributo());
                this.clientesFacade.alteraAtributo(preferencias);
                
                cliente.setPreferencias(preferencias);
                
                caracteristicas.setCorDeCabelo(request.getParameter("pcordocabelo"));
                caracteristicas.setCorDePele(request.getParameter("pcordapele"));
                caracteristicas.setDescricao(request.getParameter("descricao"));
                caracteristicas.setSexo(request.getParameter("psexo"));
                caracteristicas.setIdAtributo(this.clientesFacade.buscaProximoIdAtributo());
                this.clientesFacade.alteraAtributo(caracteristicas);
                cliente.setCaracteristicas(caracteristicas);
            }

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
            try {
                cliente.setDataNasc(formatter.parse(request.getParameter("data")));
            } catch (ParseException ex) {
                Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
            cliente.setDataCad(new Date());
            
            this.clientesFacade.atualizarCliente(cliente);

            response.sendRedirect("clientes");
            
        } else if (action.equals("formNew")) {
            url = "/cadastraUsuario.jsp";
            formType = 1;
            List<Estado> estados = this.clientesFacade.buscarEstados();
            request.setAttribute("estados", estados);
            RequestDispatcher rd = request.getRequestDispatcher(url);
            request.setAttribute("formType", formType);
            rd.forward(request, response);
        } else if (action.equals("new")) {
            Cliente cliente = new Cliente();
            
            Cidade cidade = new Cidade();
            Estado estado = new Estado();
            Endereco endereco =  new Endereco();
            Atributo preferencias = new Atributo();
            Atributo caracteristicas = new Atributo();
            
            cliente.setCpf(request.getParameter("cpf"));
            cliente.setEmail(request.getParameter("email"));
            cliente.setNome(request.getParameter("nome"));
            cliente.setEscolaridade(request.getParameter("escolaridade"));
            System.out.println("Escolaridade: " + cliente.getEscolaridade());
            cliente.setSenha(request.getParameter("senha"));
            
            
            cidade = clientesFacade.getCidadePorId(Integer.parseInt(request.getParameter("cidade")));
            estado = clientesFacade.getEstadoPorId(Integer.parseInt(request.getParameter("estado")));
            cidade.setEstado(estado);
            
            endereco.setRua(request.getParameter("rua"));
            endereco.setCep(request.getParameter("cep"));
            endereco.setId(clientesFacade.getProximoIdEndereco());
            endereco.setLogradouro(request.getParameter("numero"));
            endereco.setCidade(cidade);
            
             this.clientesFacade.criarEndereço(endereco);
            cliente.setEndereço(endereco);
            System.out.println("teste "+ cliente.getEndereço().getId());
            
            
            if (login.getTipo().equals("funcionario")) {
                preferencias.setCorDeCabelo("Não definido");
                preferencias.setCorDePele("Não definido");
                preferencias.setDescricao("Não definido");
                preferencias.setSexo("X");
                preferencias.setIdAtributo(clientesFacade.buscaProximoIdAtributo());
                this.clientesFacade.criaAtributo(preferencias);
                cliente.setPreferencias(preferencias);

                caracteristicas.setCorDeCabelo("Não definido");
                caracteristicas.setCorDePele("Não definido");
                caracteristicas.setDescricao("Não definido");
                caracteristicas.setSexo("X");
                caracteristicas.setIdAtributo(clientesFacade.buscaProximoIdAtributo());
                this.clientesFacade.criaAtributo(caracteristicas);
                cliente.setCaracteristicas(caracteristicas);
            } else {
                preferencias.setCorDeCabelo(request.getParameter("cordocabelo"));
                preferencias.setCorDePele(request.getParameter("cordapele"));
                preferencias.setDescricao(request.getParameter("rangemin") + "-" + request.getParameter("rangemax"));
                preferencias.setSexo(request.getParameter("sexo"));
                preferencias.setIdAtributo(this.clientesFacade.buscaProximoIdAtributo());
                this.clientesFacade.criaAtributo(preferencias);
                cliente.setPreferencias(preferencias);
                
                caracteristicas.setCorDeCabelo(request.getParameter("pcordocabelo"));
                caracteristicas.setCorDePele(request.getParameter("pcordapele"));
                caracteristicas.setDescricao(request.getParameter("descricao"));
                caracteristicas.setSexo(request.getParameter("psexo"));
                caracteristicas.setIdAtributo(this.clientesFacade.buscaProximoIdAtributo());
                this.clientesFacade.criaAtributo(caracteristicas);
                cliente.setCaracteristicas(caracteristicas);
            }

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
            try {
                cliente.setDataNasc(formatter.parse(request.getParameter("data")));
            } catch (ParseException ex) {
                Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            cliente.setDataCad(new Date());
            
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

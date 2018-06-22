/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.servlets;

import br.ufpr.tads.foreveralone.beans.Atributo;
import br.ufpr.tads.foreveralone.beans.Cidade;
import br.ufpr.tads.foreveralone.beans.Cliente;
import br.ufpr.tads.foreveralone.beans.Encontro;
import br.ufpr.tads.foreveralone.beans.Endereco;
import br.ufpr.tads.foreveralone.beans.Estado;
import br.ufpr.tads.foreveralone.beans.Login;
import br.ufpr.tads.foreveralone.facades.impl.ClienteFacade;
import br.ufpr.tads.foreveralone.facades.impl.EncontroFacade;
import br.ufpr.tads.foreveralone.facades.impl.EventoFacade;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
    private EncontroFacade encontroFacade;
    private EventoFacade eventoFacade;
    public ClientesServlet() {
        this.clientesFacade = new ClienteFacade();
        this.encontroFacade = new EncontroFacade();
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
            if(request.getParameter("action")!=null){
                String action = request.getParameter("action");
                if (action.equals("formNew")) {
                    String url = "/cadastraUsuario.jsp";
                    int formType = 1;
                    List<Estado> estados = this.clientesFacade.buscarEstados();
                    request.setAttribute("estados", estados);
                    RequestDispatcher rd = request.getRequestDispatcher(url);
                    request.setAttribute("formType", formType);
                    rd.forward(request, response);
                }else if (action.equals("new")) {
                    Cliente cliente = new Cliente();

                    Cidade cidade = new Cidade();
                    Estado estado = new Estado();
                    Endereco endereco = new Endereco();
                    Atributo preferencias = new Atributo();
                    Atributo caracteristicas = new Atributo();

                    cliente.setCpf(request.getParameter("cpf"));
                    cliente.setEmail(request.getParameter("email"));
                    cliente.setNome(request.getParameter("nome"));
                    cliente.setEscolaridade(request.getParameter("escolaridade"));

                    try {
                        MessageDigest md = MessageDigest.getInstance("MD5");
                        BigInteger hash = new BigInteger(1, md.digest(request.getParameter("senha").getBytes()));
                        cliente.setSenha(hash.toString(16));
                    } catch (NoSuchAlgorithmException ex) {
                        Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }

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

                    preferencias.setCorDeCabelo(request.getParameter("pcordocabelo"));
                    preferencias.setCorDePele(request.getParameter("pcordapele"));
                    preferencias.setDescricao(request.getParameter("rangemin") + "-" + request.getParameter("rangemax"));
                    preferencias.setSexo(request.getParameter("psexo"));
                    preferencias.setIdAtributo(this.clientesFacade.buscaProximoIdAtributo());
                    this.clientesFacade.criaAtributo(preferencias);
                    cliente.setPreferencias(preferencias);

                    caracteristicas.setCorDeCabelo(request.getParameter("cordocabelo"));
                    caracteristicas.setCorDePele(request.getParameter("cordapele"));
                    caracteristicas.setDescricao(request.getParameter("descricao"));
                    caracteristicas.setSexo(request.getParameter("sexo"));
                    caracteristicas.setIdAtributo(this.clientesFacade.buscaProximoIdAtributo());
                    this.clientesFacade.criaAtributo(caracteristicas);
                    cliente.setCaracteristicas(caracteristicas);

                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
                    try {
                        cliente.setDataNasc(formatter.parse(request.getParameter("data")));
                    } catch (ParseException ex) {
                        Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    cliente.setDataCad(new Date());

                    this.clientesFacade.criarCliente(cliente);

                    RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                    request.setAttribute("msg", "Usuário cadastrado");
                    rd.forward(request, response);
                }
            }
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            request.setAttribute("msg", "Usuário deve se autenticar para acessar o sistema");
            rd.forward(request, response);
        }

        Login login = (Login) session.getAttribute("loginBean");
        MessageDigest md;

        // ----------------------------------------------------------------------------------------------------- //
        // -------------------------------------------Funcionários--------------------------------------------- //
        // ---------------------------------------------------------------------------------------------------- //
        String action = request.getParameter("action");
        String url = "/gestaoClientes.jsp";
        int formType = 0;
        if (action == null || action.isEmpty() || action.equals("list")) {
            if (login.getTipo().equals("cliente")) {
                response.sendRedirect("clientes?action=pares");
            } else {
                List<Cliente> clientes = new ArrayList<Cliente>();
                
                clientes = this.clientesFacade.listarClientes();
                
                if(request.getParameter("search") != null)
                    clientes = this.clientesFacade.listarClientesPorCpfOrName(request.getParameter("search"));
                
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
                request.setAttribute("clientes", clientes);
                url = "/gestaoClientes.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
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

            String array[] = new String[2];
            array = p.getDescricao().split("-");
            p.setIdadeMin(Integer.parseInt(array[0]));
            p.setIdadeMax(Integer.parseInt(array[1]));
            p.setIdadeMin(18);
            p.setIdadeMax(18);

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
            int id = Integer.parseInt(request.getParameter("id"));

            Cliente cliente = clientesFacade.buscarClientePorId(id);

            Cidade cidade = new Cidade();
            Estado estado = new Estado();
            Endereco endereco = new Endereco();
            Atributo preferencias = new Atributo();
            Atributo caracteristicas = new Atributo();

            cliente.setCpf(request.getParameter("cpf"));
            cliente.setEmail(request.getParameter("email"));
            cliente.setNome(request.getParameter("nome"));
            cliente.setEscolaridade(request.getParameter("escolaridade"));
           
            try {
                md = MessageDigest.getInstance("MD5");
                BigInteger hash = new BigInteger(1, md.digest(request.getParameter("senha").getBytes()));
                cliente.setSenha(hash.toString(16));
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            cidade = clientesFacade.getCidadePorId(Integer.parseInt(request.getParameter("cidade")));
            estado = clientesFacade.getEstadoPorId(Integer.parseInt(request.getParameter("estado")));
            cidade.setEstado(estado);

            endereco.setRua(request.getParameter("rua"));
            endereco.setCep(request.getParameter("cep"));
            endereco.setId(cliente.getEndereço().getId());
            endereco.setLogradouro(request.getParameter("numero"));
            endereco.setCidade(cidade);

            this.clientesFacade.alterarEndereco(endereco);
            cliente.setEndereço(endereco);

            if (login.getTipo().equals("cliente")) {
                preferencias.setCorDeCabelo(request.getParameter("pcordocabelo"));

                preferencias.setCorDePele(request.getParameter("pcordapele"));
                preferencias.setDescricao(request.getParameter("rangemin") + "-" + request.getParameter("rangemax"));
                preferencias.setSexo(request.getParameter("psexo"));
                preferencias.setIdAtributo(cliente.getPreferencias().getIdAtributo());
                this.clientesFacade.alteraAtributo(preferencias);

                cliente.setPreferencias(preferencias);

                caracteristicas.setCorDeCabelo(request.getParameter("cordocabelo"));
                caracteristicas.setCorDePele(request.getParameter("cordapele"));
                caracteristicas.setDescricao(request.getParameter("descricao"));
                caracteristicas.setSexo(request.getParameter("sexo"));
                caracteristicas.setIdAtributo(cliente.getCaracteristicas().getIdAtributo());
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
            Endereco endereco = new Endereco();
            Atributo preferencias = new Atributo();
            Atributo caracteristicas = new Atributo();

            cliente.setCpf(request.getParameter("cpf"));
            cliente.setEmail(request.getParameter("email"));
            cliente.setNome(request.getParameter("nome"));
            cliente.setEscolaridade(request.getParameter("escolaridade"));
            
            try {
                md = MessageDigest.getInstance("MD5");
                BigInteger hash = new BigInteger(1, md.digest(request.getParameter("senha").getBytes()));
                cliente.setSenha(hash.toString(16));
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
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

            if (login.getTipo().equals("funcionario")) {
                preferencias.setCorDeCabelo("Não definido");
                preferencias.setCorDePele("Não definido");
                preferencias.setDescricao("18-18");
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
                preferencias.setCorDeCabelo(request.getParameter("pcordocabelo"));
                preferencias.setCorDePele(request.getParameter("pcordapele"));
                preferencias.setDescricao(request.getParameter("rangemin") + "-" + request.getParameter("rangemax"));
                preferencias.setSexo(request.getParameter("psexo"));
                preferencias.setIdAtributo(this.clientesFacade.buscaProximoIdAtributo());
                this.clientesFacade.criaAtributo(preferencias);
                cliente.setPreferencias(preferencias);

                caracteristicas.setCorDeCabelo(request.getParameter("cordocabelo"));
                caracteristicas.setCorDePele(request.getParameter("cordapele"));
                caracteristicas.setDescricao(request.getParameter("descricao"));
                caracteristicas.setSexo(request.getParameter("sexo"));
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

        // ------------------------------------------------------------------------------------------------ //
        // -------------------------------------------Clientes--------------------------------------------- //
        // ------------------------------------------------------------------------------------------------ //
        if (action == null || action.isEmpty() || action.equals("pares")) {

            if (login.getTipo().equals("funcionario") || login.getTipo().equals("administrador")) {
                response.sendRedirect("clientes?action=list");
            } else {
                Cliente usuario = this.clientesFacade.buscarClientePorId(login.getId());
                Atributo car = new Atributo();
                Atributo pre = new Atributo();
                Endereco end = new Endereco();
                Cidade cid = new Cidade();
                Estado est = new Estado();
                List<Integer> lista = encontroFacade.buscaListaNegra(login.getId());
                List<Integer> paraRemover = new ArrayList<Integer>();

                end = clientesFacade.getEnderecoPorId(usuario.getEndereço().getId());
                cid = clientesFacade.getCidadePorId(end.getCidade().getId());
                est = clientesFacade.getEstadoPorId(cid.getEstado().getId());
                cid.setEstado(est);
                end.setCidade(cid);
                usuario.setEndereço(end);

                List<Cliente> clientes = new ArrayList<Cliente>();
                Atributo pref = clientesFacade.getAtributoPorId(usuario.getPreferencias().getIdAtributo());
                clientes = this.clientesFacade.listarClientesPorPreferencia(pref);
                int count = 0;

                for (Cliente cliente : clientes) {
                    Atributo p = new Atributo();
                    Atributo c = new Atributo();
                    p = this.clientesFacade.getAtributoPorId(cliente.getPreferencias().getIdAtributo());
                    c = this.clientesFacade.getAtributoPorId(cliente.getCaracteristicas().getIdAtributo());

                    if (p.getSexo().equals("F")) {
                        p.setSexo("Feminino");
                    } else if (p.getSexo().equals("M")) {
                        p.setSexo("Masculino");
                    } else {
                        p.setSexo("Não Definido");
                    }

                    if (c.getSexo().equals("F")) {
                        c.setSexo("Feminino");
                    } else if (c.getSexo().equals("M")) {
                        c.setSexo("Masculino");
                    } else {
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

                    if(lista != null)
                    for (Integer l : lista) {
                        if (cliente.getId() == l) {
                            paraRemover.add(count);
                        }
                    }

                    count++;
                }

                for (Integer para : paraRemover) {
                    clientes.remove(para.intValue());
                }

                List<Estado> estados = this.clientesFacade.buscarEstados();

                url = "/paresCompativeis.jsp";

                if (!response.isCommitted()) {
                    request.setAttribute("usuario", usuario);
                    request.setAttribute("estados", estados);
                    request.setAttribute("clientes", clientes);
                    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                    dispatcher.forward(request, response);
                }

            }
        } else if (action.equals("newEncontro")) {
            Encontro encontro = new Encontro();
            Endereco endereco = new Endereco();
            Cidade cidade = new Cidade();
            Estado estado = new Estado();
            Cliente cliente1 = new Cliente();
            Cliente cliente2 = new Cliente();

            cliente1.setId(Integer.parseInt(request.getParameter("idusuario")));
            cliente2.setId(Integer.parseInt(request.getParameter("idcrush")));

            encontro.setIdCliente1(cliente1);
            encontro.setIdCliente2(cliente2);

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
            try {
                encontro.setData(formatter.parse(request.getParameter("data")));
            } catch (ParseException ex) {
                Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            encontro.setHorario(request.getParameter("horario"));

            cidade = clientesFacade.getCidadePorId(Integer.parseInt(request.getParameter("cidade")));
            estado = clientesFacade.getEstadoPorId(cidade.getEstado().getId());
            cidade.setEstado(estado);

            endereco.setRua(request.getParameter("rua"));
            endereco.setCep(request.getParameter("cep"));
            endereco.setId(clientesFacade.getProximoIdEndereco());
            endereco.setLogradouro(request.getParameter("numero"));
            endereco.setCidade(cidade);

            clientesFacade.criarEndereço(endereco);

            encontro.setLocal(endereco);

            encontroFacade.criarEncontro(encontro);

            url = "clientes";
            response.sendRedirect(url);

        } else if (action.equals("listEncontros")) {
            List<Encontro> encontros = new ArrayList<Encontro>();
            encontros = encontroFacade.listarEncontros(login.getId());

            for (Encontro encontro : encontros) {

                Endereco en = new Endereco();
                Cidade ci = new Cidade();
                Estado es = new Estado();

                en = clientesFacade.getEnderecoPorId(encontro.getLocal().getId());
                ci = clientesFacade.getCidadePorId(en.getCidade().getId());
                es = clientesFacade.getEstadoPorId(ci.getEstado().getId());
                ci.setEstado(es);
                en.setCidade(ci);
                encontro.setLocal(en);

                Cliente cliente1 = new Cliente();
                Cliente cliente2 = new Cliente();

                cliente1 = clientesFacade.buscarClientePorId(encontro.getIdCliente1().getId());
                cliente2 = clientesFacade.buscarClientePorId(encontro.getIdCliente2().getId());

                encontro.setIdCliente1(cliente1);
                encontro.setIdCliente2(cliente2);

            }

            List<Encontro> encontrosMarcados = new ArrayList<Encontro>();
            encontrosMarcados = encontroFacade.listarEncontrosMarcados(login.getId());
            List<Integer> paraRemover = new ArrayList<Integer>();
            int count = 0;

            for (Encontro encontro : encontrosMarcados) {

                Endereco en = new Endereco();
                Cidade ci = new Cidade();
                Estado es = new Estado();

                en = clientesFacade.getEnderecoPorId(encontro.getLocal().getId());
                ci = clientesFacade.getCidadePorId(en.getCidade().getId());
                es = clientesFacade.getEstadoPorId(ci.getEstado().getId());
                ci.setEstado(es);
                en.setCidade(ci);
                encontro.setLocal(en);

                Cliente cliente1 = new Cliente();
                Cliente cliente2 = new Cliente();

                cliente1 = clientesFacade.buscarClientePorId(encontro.getIdCliente1().getId());
                cliente2 = clientesFacade.buscarClientePorId(encontro.getIdCliente2().getId());

                encontro.setIdCliente1(cliente1);
                encontro.setIdCliente2(cliente2);

                Date dataAtual = new Date();
                if (encontro.getData().before(dataAtual)) {
                    encontroFacade.concluirEncontro(encontro.getId());
                    paraRemover.add(count);
                }

                count++;
            }

            for (Integer l : paraRemover) {
                encontrosMarcados.remove(l.intValue());
            }

            url = "/encontros.jsp";
            //request.setAttribute("eventos", this.eventoFacade.buscarEventosPorCliente(login.getId()));
            request.setAttribute("encontros", encontros);
            request.setAttribute("encontrosMarcados", encontrosMarcados);
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } else if (action.equals("listaNegra")) {
            int cliente = Integer.parseInt(request.getParameter("cliente"));
            int bloqueado = Integer.parseInt(request.getParameter("bloqueado"));
            encontroFacade.listaNegra(cliente, bloqueado);

            Encontro encontro = encontroFacade.buscarEncontroPorId(Integer.parseInt(request.getParameter("id")));
            encontroFacade.deletarEncontro(encontro);
            url = "clientes?action=listEncontros";
            response.sendRedirect(url);
        } else if (action.equals("aceitaEncontro")) {
            int id = Integer.parseInt(request.getParameter("id"));
            encontroFacade.aceitarEncontro(id);

            url = "clientes?action=listEncontros";
            response.sendRedirect(url);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.facades.impl;

import br.ufpr.tads.foreveralone.beans.Atributo;
import br.ufpr.tads.foreveralone.beans.Cidade;
import br.ufpr.tads.foreveralone.beans.Cliente;
import br.ufpr.tads.foreveralone.beans.Endereco;
import br.ufpr.tads.foreveralone.beans.Estado;
import br.ufpr.tads.foreveralone.beans.Login;
import br.ufpr.tads.foreveralone.daos.AtributoDao;
import br.ufpr.tads.foreveralone.daos.CidadeDao;
import br.ufpr.tads.foreveralone.daos.ClienteDao;
import br.ufpr.tads.foreveralone.daos.EstadoDao;
import br.ufpr.tads.foreveralone.daos.impl.DefaultAtributoDao;
import br.ufpr.tads.foreveralone.daos.impl.DefaultCidadeDao;
import br.ufpr.tads.foreveralone.daos.impl.DefaultClienteDao;
import br.ufpr.tads.foreveralone.daos.impl.DefaultEstadoDao;
import java.util.List;

/**
 *
 * author gqueiroz
 */
public class ClienteFacade {
    
    private static ClienteDao clienteDao;
    
    private static EstadoDao estadoDao;
    
    private static CidadeDao cidadeDao;
    
    private static AtributoDao atributoDao;

    public ClienteFacade()
    {
        clienteDao = new DefaultClienteDao();
        estadoDao = new DefaultEstadoDao();
        cidadeDao = new DefaultCidadeDao();
        atributoDao = new DefaultAtributoDao();
    }
    
    public List<Cidade> buscarCidadesPorEstado(Estado estado) {
        return getCidadeDao().buscarCidadesPorEstado(estado);
    }

    
    public void criarCliente(Cliente cliente) {
        getClienteDao().criarCliente(cliente);
    }

    public void criarEndereço(Endereco e) {
        getClienteDao().criarEndereço(e);
    }
    
    public void deletarCliente(int id) {
        getClienteDao().deletarCliente(id);
    }

    
    public void atualizarCliente(Cliente cliente) {
        getClienteDao().atualizarCliente(cliente);
    }

    
    public List<Cliente> listarClientes() {
        return getClienteDao().listarClientes();
    }

    public int buscaProximoIdAtributo() {
        return getAtributoDao().buscaProximoIdAtributo();
    }
    
    
    public Cliente buscarClientePorId(int id) {
        return getClienteDao().buscarClientePorId(id);
    }

    
    public Cliente buscarClientePorEmail(String email) {
        return getClienteDao().buscarClientePorEmail(email);
    }

    
    public void criaAtributo(Atributo atributo) {
        getAtributoDao().criaAtributo(atributo);
    }

    
    public void alteraAtributo(Atributo atributo) {
        getAtributoDao().alteraAtributo(atributo);
    }

    
    public List<Atributo> listaAtributo() {
        return getAtributoDao().listaAtributo();
    }

    
    public List<Estado> buscarEstados() {
        return getEstadoDao().buscarEstados();
    }    
    
    public Login getLogin(String email, String sen) {
        return getClienteDao().getLogin(email,sen);
    }
    
    public Cidade getCidadePorId(int id){
        return getCidadeDao().buscarCidadePorId(id);
    }
    
    public Estado getEstadoPorId(int id){
        return estadoDao.buscarEstadoPorId(id);
    }
    
     public Atributo getAtributoPorId(int id){
        return atributoDao.buscaAtributoPorId(id);
    }
     
    public int getProximoIdEndereco(){
        return clienteDao.buscaProximoIdEndereco();
    }
    
    public List<Cliente> listarClientesPorPreferencia(Atributo p)
    {
        return clienteDao.listarClientesPorPreferencia(p);
    }
    
    /**
     * @return the clienteDao
     */
    public static ClienteDao getClienteDao() {
        return clienteDao;
    }

    /**
     * @param aClienteDao the clienteDao to set
     */
    public static void setClienteDao(ClienteDao aClienteDao) {
        clienteDao = aClienteDao;
    }

    /**
     * @return the estadoDao
     */
    public static EstadoDao getEstadoDao() {
        return estadoDao;
    }

    /**
     * @param aEstadoDao the estadoDao to set
     */
    public static void setEstadoDao(EstadoDao aEstadoDao) {
        estadoDao = aEstadoDao;
    }

    /**
     * @return the cidadeDao
     */
    public static CidadeDao getCidadeDao() {
        return cidadeDao;
    }

    /**
     * @param aCidadeDao the cidadeDao to set
     */
    public static void setCidadeDao(CidadeDao aCidadeDao) {
        cidadeDao = aCidadeDao;
    }

    /**
     * @return the atributoDao
     */
    public static AtributoDao getAtributoDao() {
        return atributoDao;
    }

    /**
     * @param aAtributoDao the atributoDao to set
     */
    public static void setAtributoDao(AtributoDao aAtributoDao) {
        atributoDao = aAtributoDao;
    }
    
   
}

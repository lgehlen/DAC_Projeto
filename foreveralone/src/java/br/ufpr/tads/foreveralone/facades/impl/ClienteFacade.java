/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.facades.impl;

import br.ufpr.tads.foreveralone.beans.Atributo;
import br.ufpr.tads.foreveralone.beans.Cidade;
import br.ufpr.tads.foreveralone.beans.Cliente;
import br.ufpr.tads.foreveralone.beans.Estado;
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
    
    public Cidade buscarCidadesPorEstado(Estado estado) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public void criarCliente(Cliente cliente) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public void deletarCliente(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public void atualizarCliente(Cliente cliente) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public List<Cliente> listarClientes() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public Cliente buscarClientePorId(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public Cliente buscarClientePorEmail(String email) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public void criaAtributo(Atributo atributo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public void alteraAtributo(Atributo atributo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public List<Atributo> listaAtributo() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public List<Estado> buscarEstados() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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

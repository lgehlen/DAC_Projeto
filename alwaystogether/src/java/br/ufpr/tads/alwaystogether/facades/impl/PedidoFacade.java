/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.alwaystogether.facades.impl;

import br.ufpr.tads.alwaystogether.beans.Orcamento;
import br.ufpr.tads.alwaystogether.beans.Pedido;
import br.ufpr.tads.alwaystogether.daos.OrcamentoDao;
import br.ufpr.tads.alwaystogether.daos.PedidoDao;
import br.ufpr.tads.alwaystogether.daos.impl.DefaultOrcamentoDao;
import br.ufpr.tads.alwaystogether.daos.impl.DefaultPedidoDao;
import java.util.List;

/**
 *
 * @author gqueiroz
 */
public class PedidoFacade {
    
    private static OrcamentoDao orcamentoDao;
    private static PedidoDao pedidoDao;
            
    public PedidoFacade()
    {
        pedidoDao = new DefaultPedidoDao();
        orcamentoDao = new DefaultOrcamentoDao();
    }
    
    public void criarOrcamento(Orcamento orcamento) {
        getOrcamentoDao().criarOrcamento(orcamento);
    }

    
    public void deletarOrcamento(int id) {
        getOrcamentoDao().deletarOrcamento(id);
    }

    
    public void atualizarOrcamento(Orcamento orcamento) {
        getOrcamentoDao().atualizarOrcamento(orcamento);
    }

    
    public List<Orcamento> buscarOrcamentos() {
        return getOrcamentoDao().buscarOrcamentos();
    }

    
    public Orcamento buscarOrcamentoPorId(int id) {
        return getOrcamentoDao().buscarOrcamentoPorId(id);
    }
    
    public void criarPedido(Pedido pedido) {
        getPedidoDao().criarPedido(pedido);
    }
    
    public void deletarPedido(Pedido pedido) {
        getPedidoDao().deletarPedido(pedido);
    }
    
    public void atualizarPedido(Pedido pedido) {
        getPedidoDao().atualizarPedido(pedido);
    }
    
    public List<Pedido> listarPedidos() {
        return getPedidoDao().listarPedidos();
    }
    
    public Pedido buscarPedidoPorId(int id) {
        return getPedidoDao().buscarPedidoPorId(id);
    }

    /**
     * @return the orcamentoDao
     */
    public static OrcamentoDao getOrcamentoDao() {
       return orcamentoDao; 
    }

    /**
     * @param aOrcamentoDao the orcamentoDao to set
     */
    public static void setOrcamentoDao(OrcamentoDao aOrcamentoDao) {
        orcamentoDao = aOrcamentoDao;
    }

    /**
     * @return the pedidoDao
     */
    public static PedidoDao getPedidoDao() {
        return pedidoDao;
    }

    /**
     * @param aPedidoDao the pedidoDao to set
     */
    public static void setPedidoDao(PedidoDao aPedidoDao) {
        pedidoDao = aPedidoDao;
    }
}

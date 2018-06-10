/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.facades.impl;

import br.ufpr.tads.foreveralone.beans.Orcamento;
import br.ufpr.tads.foreveralone.daos.OrcamentoDao;
import br.ufpr.tads.foreveralone.daos.impl.DefaultOrcamentoDao;
import java.util.List;

/**
 *
 * @author gqueiroz
 */
public class PedidoFacade {
    
    private static OrcamentoDao orcamentoDao;
            
    public PedidoFacade()
    {
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
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos;

import br.ufpr.tads.foreveralone.beans.Orcamento;
import java.util.List;

/**
 *
 * @author gqueiroz
 */
public interface OrcamentoDao {
    void criarOrcamento(Orcamento orcamento);
    
    void deletarOrcamento(int id);
    
    void atualizarOrcamento(Orcamento orcamento);
    
    List<Orcamento> buscarOrcamentos();
    
    Orcamento buscarOrcamentoPorId(int id);
}

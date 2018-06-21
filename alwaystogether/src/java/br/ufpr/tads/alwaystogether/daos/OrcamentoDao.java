/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.alwaystogether.daos;

import br.ufpr.tads.alwaystogether.beans.Orcamento;
import java.util.List;

/**
 *
 * @author gqueiroz
 */
public interface OrcamentoDao {
    void criarOrcamento(Orcamento orcamento);
    
    void criaOrcamento(Orcamento orcamento);
    
    void atualizarOrcamento(Orcamento orcamento);
    
    List<Orcamento> buscarOrcamentos();
    
    Orcamento buscarOrcamentoPorId(int id);
}

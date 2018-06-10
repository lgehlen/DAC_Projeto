/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos;

import br.ufpr.tads.foreveralone.beans.Produtividade;
import java.util.Date;
import java.util.List;

/**
 *
 * @author gqueiroz
 */
public interface ProdutividadeDao {
    List<Produtividade> buscarOrcamentosPorMes(Date data);
    
    List<Produtividade> buscarOrcamentosPorAno(Date data);
    
    void criarProdutividade(Produtividade produtividade);
    
    void atualizarProdutividade(Produtividade produtividade);
}

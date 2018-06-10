/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos;

import br.ufpr.tads.foreveralone.beans.Encontro;
import java.util.List;


/**
 *
 * @author gqueiroz
 */
public interface EncontroDao {
    void criarEncontro(Encontro encontro);
    
    void deletarEncontro(Encontro encontro);
    
    void atualizarEncontro(Encontro encontro);
    
    List<Encontro> listarEncontros();
    
    Encontro buscarEncontroPorId(int id);
}

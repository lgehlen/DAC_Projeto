/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos;

import br.ufpr.tads.foreveralone.beans.Atributo;
import java.util.List;

/**
 *
 * @author gqueiroz
 */
public interface AtributoDao {
    void criaAtributo(Atributo atributo);
    
    void alteraAtributo(Atributo atributo);
    
    List<Atributo> listaAtributo();
}

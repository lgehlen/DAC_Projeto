/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos;

import br.ufpr.tads.foreveralone.beans.Cidade;
import br.ufpr.tads.foreveralone.beans.Estado;

/**
 *
 * @author gqueiroz
 */
public interface CidadeDao {
   Cidade buscarCidadesPorEstado(Estado estado);
}

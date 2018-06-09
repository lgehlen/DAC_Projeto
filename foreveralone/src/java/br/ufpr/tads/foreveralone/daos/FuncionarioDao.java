/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos;

import br.ufpr.tads.foreveralone.beans.Funcionario;
import java.util.List;

/**
 *
 * @author gqueiroz
 */
public interface FuncionarioDao {
    void criarFuncionario(Funcionario funcionario);
    
    void deletarFuncionario(Funcionario funcionario);
    
    void atualizarFuncionario(Funcionario funcionario);
    
    List<Funcionario> listarFuncionarios();
    
    List<Funcionario> listarFuncionariosPorId(int id);
    
    Funcionario buscarPorEmail(String email);
}

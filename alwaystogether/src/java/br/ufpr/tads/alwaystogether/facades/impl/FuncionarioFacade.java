/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.alwaystogether.facades.impl;

import br.ufpr.tads.alwaystogether.beans.Funcionario;
import br.ufpr.tads.alwaystogether.daos.FuncionarioDao;
import br.ufpr.tads.alwaystogether.daos.impl.DefaultFuncionarioDao;
import java.util.List;

/**
 *
 * @author gqueiroz
 */
public class FuncionarioFacade {
    
    private static FuncionarioDao funcionarioDao;
    
    public FuncionarioFacade()
    {
        funcionarioDao = new DefaultFuncionarioDao();
    }
   
    public void criarFuncionario(Funcionario funcionario) {
        getFuncionarioDao().criarFuncionario(funcionario);
    }

    
    public void deletarFuncionario(Funcionario funcionario) {
        getFuncionarioDao().deletarFuncionario(funcionario);
    }

    
    public void atualizarFuncionario(Funcionario funcionario) {
        getFuncionarioDao().atualizarFuncionario(funcionario);
    }

    
    public List<Funcionario> listarFuncionarios() {
return getFuncionarioDao().listarFuncionarios();
    }

    
    public Funcionario buscarFuncionarioPorId(int id) {
        return getFuncionarioDao().buscarFuncionariosPorId(id);
    }

    
    public Funcionario buscarFuncionarioPorEmail(String email) {
        return getFuncionarioDao().buscarPorEmail(email);
    }

    /**
     * @return the funcionarioDao
     */
    public static FuncionarioDao getFuncionarioDao() {
        return funcionarioDao;
    }

    /**
     * @param aFuncionarioDao the funcionarioDao to set
     */
    public static void setFuncionarioDao(FuncionarioDao aFuncionarioDao) {
        funcionarioDao = aFuncionarioDao;
    }

}

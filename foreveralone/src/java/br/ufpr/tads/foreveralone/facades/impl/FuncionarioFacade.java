/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.facades.impl;

import br.ufpr.tads.foreveralone.beans.Evento;
import br.ufpr.tads.foreveralone.beans.Funcionario;
import br.ufpr.tads.foreveralone.daos.EventoDao;
import br.ufpr.tads.foreveralone.daos.FuncionarioDao;
import br.ufpr.tads.foreveralone.daos.impl.DefaultEventoDao;
import br.ufpr.tads.foreveralone.daos.impl.DefaultFuncionarioDao;
import java.util.List;

/**
 *
 * @author gqueiroz
 */
public class FuncionarioFacade {
    
    private static FuncionarioDao funcionarioDao;
    
    private static EventoDao eventoDao;
    
    public FuncionarioFacade()
    {
        funcionarioDao = new DefaultFuncionarioDao();
        eventoDao = new DefaultEventoDao();
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
        return getFuncionarioDao().listarFuncionariosPorId(id).get(0);
    }

    
    public Funcionario buscarFuncionarioPorEmail(String email) {
        return getFuncionarioDao().buscarPorEmail(email);
    }

    
    public void criarEvento(Evento evento) {
        getEventoDao().criarEvento(evento);
    }

    
    public void deletarEvento(int id) {
        getEventoDao().deletarEvento(id);
    }

    
    public void atualizarEvento(Evento evento) {
        getEventoDao().atualizarEvento(evento);
    }

    
    public List<Evento> listarEventos() {
        return getEventoDao().listarEventos();
    }

    
    public Evento buscarEventoPorId(int id) {
        return getEventoDao().buscarEventoPorId(id);
    }

    
    public List<Evento> buscarEventosPorCliente(int idCliente) {
        return getEventoDao().buscarEventosPorCliente(idCliente);
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

    /**
     * @return the eventoDao
     */
    public static EventoDao getEventoDao() {
        return eventoDao;
    }

    /**
     * @param aEventoDao the eventoDao to set
     */
    public static void setEventoDao(EventoDao aEventoDao) {
        eventoDao = aEventoDao;
    }
}

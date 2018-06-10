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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public void deletarFuncionario(Funcionario funcionario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public void atualizarFuncionario(Funcionario funcionario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public List<Funcionario> listarFuncionarios() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public List<Funcionario> listarFuncionariosPorId(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public Funcionario buscarPorEmail(String email) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public void criarEvento(Evento evento) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public void deletarEvento(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public void atualizarEvento(Evento evento) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public List<Evento> listarEventos() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public Evento buscarEventoPorId(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public List<Evento> buscarEventosPorCliente(int idCliente) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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

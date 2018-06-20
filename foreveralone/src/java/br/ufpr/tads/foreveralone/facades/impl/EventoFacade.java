/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.facades.impl;

import br.ufpr.tads.foreveralone.beans.Cliente;
import br.ufpr.tads.foreveralone.beans.Evento;
import br.ufpr.tads.foreveralone.daos.EventoDao;
import br.ufpr.tads.foreveralone.daos.impl.DefaultEventoDao;
import java.util.List;

/**
 *
 * @author luis_
 */
public class EventoFacade {

    private static EventoDao eventoDao;

    public EventoFacade() {
        eventoDao = new DefaultEventoDao();
    }

    public List<Evento> getListaEventos() {
        return eventoDao.listarEventos();
    }

    public void removeEvento(int id){
        eventoDao.deletarEvento(id);
    }
    
    public List<Cliente> getListaDeConvidados(int id){
        return eventoDao.buscarListaDeConvidados(id);
    }
    
    public List<Evento> buscarEventosPorCliente(int idCliente) {
        return eventoDao.buscarEventosPorCliente(idCliente);
    }
}

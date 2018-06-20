/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos;

import br.ufpr.tads.foreveralone.beans.Cliente;
import br.ufpr.tads.foreveralone.beans.Evento;
import java.util.List;

/**
 *
 * @author gqueiroz
 */
public interface EventoDao {
    void criarEvento(Evento evento);
    
    void deletarEvento(int id);
    
    void atualizarEvento(Evento evento);
    
    List<Evento> listarEventos();
    
    Evento buscarEventoPorId(int id);
    
    List<Evento> buscarEventosPorCliente(int idCliente);
    
    List<Cliente> buscarListaDeConvidados(int id);
    
    void convidaCliente(int idCliente, int idEvento);
}

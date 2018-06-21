/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.alwaystogether.daos;

import br.ufpr.tads.alwaystogether.beans.Pedido;
import java.util.List;

/**
 *
 * @author gqueiroz
 */
public interface PedidoDao {
    void criarPedido(Pedido pedido);
        
    void atualizarPedido(Pedido pedido);
    
    List<Pedido> listarPedidos();
    
    Pedido buscarPedidoPorId(int id);
}

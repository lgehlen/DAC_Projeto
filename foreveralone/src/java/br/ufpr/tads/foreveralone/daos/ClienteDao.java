/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos;

import br.ufpr.tads.foreveralone.beans.Cliente;
import br.ufpr.tads.foreveralone.beans.Login;
import java.util.List;

/**
 *
 * @author gqueiroz
 */
public interface ClienteDao {
    void criarCliente(Cliente cliente);
    
    void deletarCliente(int id);
    
    void atualizarCliente(Cliente cliente);
    
    List<Cliente> listarClientes();
    
    Cliente buscarClientePorId(int id);
    
    Cliente buscarClientePorEmail(String email); 

    public Login getLogin(String email, String sen);
}

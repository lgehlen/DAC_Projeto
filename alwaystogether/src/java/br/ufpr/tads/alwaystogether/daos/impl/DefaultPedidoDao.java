/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.alwaystogether.daos.impl;

import br.ufpr.tads.alwaystogether.beans.Pedido;
import br.ufpr.tads.alwaystogether.daos.ConnectionFactory;
import br.ufpr.tads.alwaystogether.daos.PedidoDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author gqueiroz
 */
public class DefaultPedidoDao implements PedidoDao {

    Connection con = new ConnectionFactory().getConnection();
    
    @Override
    public void criarPedido(Pedido pedido) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("INSERT INTO always.Pedido (statusOrcanento, Orcamento_idOrcamento)"
                                        + " VALUES (?, ?)");
            st.setInt(1, pedido.getStatusOrcamento());
            st.setInt(2, pedido.getIdOrcamento());
            
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultPedidoDao.class.getName()).log(Level.SEVERE, null, ex);
	}     
    }

    @Override
    public void deletarPedido(Pedido pedido) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void atualizarPedido(Pedido pedido) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Pedido> listarPedidos() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idPedido, statusOrcanento, Orcamento_idOrcamento FROM always.Pedido");
            rs = ps.executeQuery();
            List<Pedido> list = new ArrayList<Pedido>();
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setEmailCliente(rs.getString("email"));
                pedido.setIdOrcamento(rs.getInt("id"));
                
                list.add(pedido);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Pedido buscarPedidoPorId(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idPedido, statusOrcanento, Orcamento_idOrcamento FROM always.Pedido WHERE idPedido = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            List<Pedido> list = new ArrayList<Pedido>();
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setEmailCliente(rs.getString("email"));
                pedido.setIdOrcamento(rs.getInt("id"));
                
                list.add(pedido);
            }
            return list.get(0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
}

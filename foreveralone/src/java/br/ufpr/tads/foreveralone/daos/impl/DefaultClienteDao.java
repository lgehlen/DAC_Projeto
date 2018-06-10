/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos.impl;

import br.ufpr.tads.foreveralone.beans.Cliente;
import br.ufpr.tads.foreveralone.daos.ClienteDao;
import br.ufpr.tads.foreveralone.daos.ConnectionFactory;
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
public class DefaultClienteDao implements ClienteDao {

    Connection con = new ConnectionFactory().getConnection();

    @Override
    public void criarCliente(Cliente cliente) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("INSERT INTO forever.Cliente (nomeCliente, CPF, datanasc, email, escolaridade, dataCada, senha, Endereco_idEndereco, Endereco_Cidade_idCliente1)"
                    + " VALUES(?,?,?,?,?,?,?,?,?)");
            st.setInt(1, cliente.getId());
            st.setString(2, cliente.getNome());
            st.setString(3, cliente.getCpf());
            st.setDate(4, new java.sql.Date(cliente.getDataNasc().getTime()));
            st.setString(5, cliente.getEmail());
            st.setString(6, cliente.getEscolaridade());
            st.setDate(7, new java.sql.Date(cliente.getDataCad().getTime()));
            st.setString(8, cliente.getSenha());
            st.setString(9, null);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultAtributoDao.class.getName()).log(Level.SEVERE, null, ex);
        }    
    }

    @Override
    public void deletarCliente(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("DELETE FROM forever.Cliente WHERE idCliente = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public void atualizarCliente(Cliente cliente) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("UPDATE forever.Cliente SET nomeCliente = ?, CPF = ?, datanasc = ?, email = ?, escolaridade = ?, dataCada = ?, senha = ?, Endereco_idEndereco = ?, Endereco_Cidade_idCliente1 = ? WHERE idCliente = ?");
            st.setString(1, cliente.getNome());
            st.setString(2, cliente.getCpf());
            st.setDate(3, new java.sql.Date(cliente.getDataNasc().getTime()));
            st.setString(4, cliente.getEmail());
            st.setString(5, cliente.getEscolaridade());
            st.setDate(6, new java.sql.Date(cliente.getDataCad().getTime()));
            st.setString(7, cliente.getSenha());
            st.setString(8, null);
            st.setInt(9, cliente.getId());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultAtributoDao.class.getName()).log(Level.SEVERE, null, ex);
        }    
    }

    @Override
    public List<Cliente> listarClientes() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idCliente, nomeCliente, CPF, datanasc, email, escolaridade, dataCada, senha, Endereco_idEndereco, Endereco_Cidade_idCliente1 FROM forever.Cliente");
            rs = ps.executeQuery();
            List<Cliente> list = new ArrayList<Cliente>();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(0);
                cliente.setCpf(rs.getString("CPF"));
                cliente.setDataCad(rs.getDate("dataCada"));
                cliente.setDataNasc(rs.getDate("datanasc"));
                cliente.setEmail(rs.getString("email"));
                cliente.setEscolaridade(rs.getString("escolaridade"));
                cliente.setNome(rs.getString("nomeCliente"));
                list.add(cliente);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Cliente buscarClientePorId(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idCliente, nomeCliente, CPF, datanasc, email, escolaridade, dataCada, senha, Endereco_idEndereco, Endereco_Cidade_idCliente1 FROM forever.Cliente where idCliente = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            List<Cliente> list = new ArrayList<Cliente>();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(0);
                cliente.setCpf(rs.getString("CPF"));
                cliente.setDataCad(rs.getDate("dataCada"));
                cliente.setDataNasc(rs.getDate("datanasc"));
                cliente.setEmail(rs.getString("email"));
                cliente.setEscolaridade(rs.getString("escolaridade"));
                cliente.setNome(rs.getString("nomeCliente"));
                list.add(cliente);
            }
            return list.get(0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Cliente buscarClientePorEmail(String email) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idCliente, nomeCliente, CPF, datanasc, email, escolaridade, dataCada, senha, Endereco_idEndereco, Endereco_Cidade_idCliente1 FROM forever.Cliente WHERE email = ? ");
            ps.setString(1, email);
            rs = ps.executeQuery();
            List<Cliente> list = new ArrayList<Cliente>();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(0);
                cliente.setCpf(rs.getString("CPF"));
                cliente.setDataCad(rs.getDate("dataCada"));
                cliente.setDataNasc(rs.getDate("datanasc"));
                cliente.setEmail(rs.getString("email"));
                cliente.setEscolaridade(rs.getString("escolaridade"));
                cliente.setNome(rs.getString("nomeCliente"));
                list.add(cliente);
            }
            return list.get(0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
}
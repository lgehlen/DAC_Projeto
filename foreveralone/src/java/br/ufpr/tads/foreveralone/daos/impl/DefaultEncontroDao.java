/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos.impl;

import br.ufpr.tads.foreveralone.beans.Cliente;
import br.ufpr.tads.foreveralone.beans.Encontro;
import br.ufpr.tads.foreveralone.beans.Endereco;
import br.ufpr.tads.foreveralone.daos.ConnectionFactory;
import br.ufpr.tads.foreveralone.daos.EncontroDao;
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
public class DefaultEncontroDao implements EncontroDao {

    Connection con = new ConnectionFactory().getConnection();

    @Override
    public void criarEncontro(Encontro encontro) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("INSERT INTO forever.Encontro (data, horario, Endereco_idEndereco, local, Cliente_idCliente, Cliente_idCliente1 )"
                    + " VALUES (?, ?, ?, ?, ?, ?)");
            st.setDate(1, new java.sql.Date(encontro.getData().getTime()));
            st.setString(2, encontro.getHorario());
            st.setInt(3, encontro.getLocal().getId());
            st.setString(4, encontro.getLocal().getRua());
            st.setInt(5, encontro.getIdCliente1().getId());
            st.setInt(6, encontro.getIdCliente2().getId());

            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultAtributoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deletarEncontro(Encontro encontro) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("DELETE FROM forever.Encontro WHERE idEncontro = ?");
            ps.setInt(1, encontro.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void atualizarEncontro(Encontro encontro) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("UPDATE forever.Encontro set data = ?, horario = ?, Endereco_idEndereco = ?, Endereco_Cidade_idCidade = ? WHERE idEncontro = ?");
            st.setDate(1, new java.sql.Date(encontro.getData().getTime()));
            st.setString(2, encontro.getHorario());
            st.setInt(3, /*encontro.getLocal()*/ 0);
            st.setInt(4, 0);
            st.setInt(5, encontro.getId());

            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultAtributoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Encontro buscarEncontroPorId(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idEncontro, local, data, horario, Endereco_idEndereco, Cliente_idCliente, Cliente_idCliente1 FROM forever.Encontro WHERE idEncontro = ?  ");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            List<Encontro> list = new ArrayList<Encontro>();
            while (rs.next()) {
                Encontro encontro = new Encontro();
                Cliente cliente1 = new Cliente();
                Cliente cliente2 = new Cliente();
                Endereco local = new Endereco();
                encontro.setData(rs.getDate("data"));
                encontro.setHorario(rs.getString("horario"));
                encontro.setId(rs.getInt("idEncontro"));
                local.setId(rs.getInt("Endereco_idEndereco"));
                cliente1.setId(rs.getInt("Cliente_idCliente"));
                cliente2.setId(rs.getInt("Cliente_idCliente1"));

                encontro.setIdCliente1(cliente1);
                encontro.setIdCliente2(cliente2);
                encontro.setLocal(local);
                list.add(encontro);
            }
            return list.get(0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Encontro> listarEncontros(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idEncontro, local, data, horario, Endereco_idEndereco, Cliente_idCliente, Cliente_idCliente1 FROM forever.Encontro WHERE isAceito = 0 AND ( Cliente_idCliente = ? OR Cliente_idCliente1 = ? )");
            ps.setInt(1, id);
            ps.setInt(2, id);
            rs = ps.executeQuery();
            List<Encontro> list = new ArrayList<Encontro>();
            while (rs.next()) {
                Encontro encontro = new Encontro();
                Cliente cliente1 = new Cliente();
                Cliente cliente2 = new Cliente();
                Endereco local = new Endereco();

                encontro.setData(rs.getDate("data"));
                encontro.setHorario(rs.getString("horario"));
                encontro.setId(rs.getInt("idEncontro"));
                local.setId(rs.getInt("Endereco_idEndereco"));
                cliente1.setId(rs.getInt("Cliente_idCliente"));
                cliente2.setId(rs.getInt("Cliente_idCliente1"));

                encontro.setIdCliente1(cliente1);
                encontro.setIdCliente2(cliente2);
                encontro.setLocal(local);
                list.add(encontro);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void listaNegra(int idcliente, int idbloqueado) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("INSERT INTO forever.listanegra (cliente, bloqueado)"
                    + " VALUES (?, ?)");
            st.setInt(1, idcliente);
            st.setInt(2, idbloqueado);

            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultAtributoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<Integer> buscaListaNegra(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT bloqueado FROM listanegra WHERE cliente = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            List<Integer> list = new ArrayList<Integer>();
            while (rs.next()) {
                list.add(rs.getInt("bloqueado"));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;    
    }

    @Override
    public void aceitarEncontro(int id) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("UPDATE forever.Encontro set isAceito = 1 WHERE idEncontro = ?");
            st.setInt(1, id);

            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultAtributoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<Encontro> listarEncontrosMarcados(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idEncontro, local, data, horario, Endereco_idEndereco, Cliente_idCliente, Cliente_idCliente1 FROM forever.Encontro WHERE isAceito = 1 AND ( Cliente_idCliente = ? OR Cliente_idCliente1 = ? )");
            ps.setInt(1, id);
            ps.setInt(2, id);
            rs = ps.executeQuery();
            List<Encontro> list = new ArrayList<Encontro>();
            while (rs.next()) {
                Encontro encontro = new Encontro();
                Cliente cliente1 = new Cliente();
                Cliente cliente2 = new Cliente();
                Endereco local = new Endereco();

                encontro.setData(rs.getDate("data"));
                encontro.setHorario(rs.getString("horario"));
                encontro.setId(rs.getInt("idEncontro"));
                local.setId(rs.getInt("Endereco_idEndereco"));
                cliente1.setId(rs.getInt("Cliente_idCliente"));
                cliente2.setId(rs.getInt("Cliente_idCliente1"));

                encontro.setIdCliente1(cliente1);
                encontro.setIdCliente2(cliente2);
                encontro.setLocal(local);
                list.add(encontro);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void concluirEncontro(int id) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("UPDATE forever.Encontro set isAceito = 2 WHERE idEncontro = ?");
            st.setInt(1, id);

            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultAtributoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
}

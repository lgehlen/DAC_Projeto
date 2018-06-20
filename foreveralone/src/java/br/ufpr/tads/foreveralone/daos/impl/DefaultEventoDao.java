/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos.impl;

import br.ufpr.tads.foreveralone.beans.Cliente;
import br.ufpr.tads.foreveralone.beans.Encontro;
import br.ufpr.tads.foreveralone.beans.Endereco;
import br.ufpr.tads.foreveralone.beans.Evento;
import br.ufpr.tads.foreveralone.beans.Funcionario;
import br.ufpr.tads.foreveralone.daos.ConnectionFactory;
import br.ufpr.tads.foreveralone.daos.EventoDao;
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
public class DefaultEventoDao implements EventoDao {

    Connection con = new ConnectionFactory().getConnection();

    
    @Override
    public void criarEvento(Evento evento) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("INSERT INTO forever.Evento (data, horario, Funcionario_idFuncionario, Endereco_idEndereco, tema, local) "
                    + " VALUES(?,?,?,?,?,?)");
            st.setDate(1, new java.sql.Date(evento.getData().getTime()));
            st.setString(2, evento.getHorario());
            st.setInt(3, evento.getFuncionario().getId());
            st.setInt(4, evento.getLocal().getId());
            st.setString(5, evento.getTema());
            st.setString(6, evento.getLocal().getRua());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultAtributoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deletarEvento(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("DELETE FROM forever.Evento WHERE idEvento = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void atualizarEvento(Evento evento) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("UPDATE forever.Evento SET data = ? , horario = ?, Endereco_idEndereco = ?, local = ?, tema = ? WHERE idEvento = ? ");
            st.setDate(1, new java.sql.Date(evento.getData().getTime()));
            st.setString(2, evento.getHorario());
            st.setInt(3, evento.getLocal().getId());
            st.setString(4, evento.getLocal().getRua());
            st.setString(5, evento.getTema());
            st.setInt(6, evento.getId());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultAtributoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<Evento> listarEventos() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idEvento, data, horario, local, Funcionario_idFuncionario, Endereco_idEndereco, tema FROM forever.Evento ");
            rs = ps.executeQuery();
            List<Evento> list = new ArrayList<Evento>();
            while (rs.next()) {
                Endereco local = new Endereco();
                Funcionario funcionario = new Funcionario();
                
                Evento evento = new Evento();
                evento.setData(rs.getDate("data"));
                evento.setHorario(rs.getString("horario"));
                evento.setId(rs.getInt("idEvento"));
                local.setId(rs.getInt("Endereco_idEndereco"));
                evento.setLocal(local);
                funcionario.setId(rs.getInt("Funcionario_idFuncionario"));
                evento.setFuncionario(funcionario);
                evento.setTema(rs.getString("tema"));
                
                //evento.setConvidados(convidados);
                list.add(evento);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Evento buscarEventoPorId(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idEvento, tema, data, horario, local, Funcionario_idFuncionario, Endereco_idEndereco FROM forever.Evento WHERE idEvento = ? ");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            List<Evento> list = new ArrayList<Evento>();
            while (rs.next()) {
                Funcionario funcionario = new Funcionario();
                Endereco local = new Endereco();
                
                Evento evento = new Evento();
                evento.setData(rs.getDate("data"));
                evento.setHorario(rs.getString("horario"));
                evento.setTema(rs.getString("tema"));
                funcionario.setId(rs.getInt("Funcionario_idFuncionario"));
                evento.setFuncionario(funcionario);
                local.setId(rs.getInt("Endereco_idEndereco"));
                evento.setLocal(local);
                list.add(evento);
            }
            return list.get(0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Evento> buscarEventosPorCliente(int idCliente) {
    PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idEvento, data, horario, local, Convidado_idPar, Funcioario_idFuncionario, Endereco_idEndereco FROM forever.Evento WHERE Convidado_idPar = ?");
            ps.setInt(1, idCliente);
            rs = ps.executeQuery();
            List<Evento> list = new ArrayList<Evento>();
            while (rs.next()) {
                Evento evento = new Evento();
                evento.setData(rs.getDate("data"));
                evento.setHorario(rs.getString("horario"));
                evento.setId(rs.getInt("idEvento"));
                //evento.setLocal(list);
                //evento.setConvidados(convidados);
                list.add(evento);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Cliente> buscarListaDeConvidados(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT (Cliente_idCliente) FROM ListaConvidados WHERE Evento_idEvento = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            List<Cliente> list = new ArrayList<Cliente>();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("Cliente_idCliente"));
                list.add(cliente);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void convidaCliente(int idCliente, int idEvento) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("INSERT INTO forever.ListaConvidados (Evento_idEvento, Cliente_idCliente)"
                    + " VALUES (?, ?)");
            st.setInt(1, idEvento);
            st.setInt(2, idCliente);

            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultAtributoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}

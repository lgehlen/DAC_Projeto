/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos.impl;

import br.ufpr.tads.foreveralone.beans.Encontro;
import br.ufpr.tads.foreveralone.beans.Evento;
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
            st = con.prepareStatement("INSERT INTO forever.Atributo (data, horario, Convidado_idPar, Funcioario_idFuncionario, Endereco_idEndereco, Endereco_cidade_idCidade, idEvento) "
                    + " VALUES(?,?,?,?,?,?)");
            st.setDate(1, new java.sql.Date(evento.getData().getTime()));
            st.setString(2, evento.getHorario());
            st.setInt(3, 1);
            st.setInt(4, 1);
            st.setInt(5, 1);
            st.setInt(6, evento.getId());
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
            st = con.prepareStatement("UPDATE forever.Atributo SET data = ? , horario = ?, Funcioario_idFuncionario = ?, Endereco_idEndereco = ?, Endereco_cidade_idCidade = ? WHERE idEvento = ? ");
            st.setDate(1, new java.sql.Date(evento.getData().getTime()));
            st.setString(2, evento.getHorario());
            st.setInt(3, 1);
            st.setInt(4, 1);
            st.setInt(5, 1);
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
            ps = con.prepareStatement("SELECT idEvento, data, horario, local, Convidado_idPar, Funcioario_idFuncionario, Endereco_idEndereco, Endereco_cidade_idCidade FROM forever.Evento ");
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
    public Evento buscarEventoPorId(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT data, horario, local, Convidado_idPar, Funcioario_idFuncionario, Endereco_idEndereco, Endereco_cidade_idCidade FROM forever.Evento WHERE idEvento = ? ");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            List<Evento> list = new ArrayList<Evento>();
            while (rs.next()) {
                Evento evento = new Evento();
                evento.setData(rs.getDate("data"));
                evento.setHorario(rs.getString("horario"));
                //evento.setLocal(list);
                //evento.setConvidados(convidados);
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
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos.impl;

import br.ufpr.tads.foreveralone.beans.Estado;
import br.ufpr.tads.foreveralone.daos.ConnectionFactory;
import br.ufpr.tads.foreveralone.daos.EstadoDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author gqueiroz
 */
public class DefaultEstadoDao implements EstadoDao {
    
    Connection con = new ConnectionFactory().getConnection();

    @Override
    public List<Estado> buscarEstados() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idEstado, uf, nome FROM forever.Estado");
            rs = ps.executeQuery();
            List<Estado> list = new ArrayList<Estado>();
            while (rs.next()) {
                Estado estado = new Estado();
                estado.setId(rs.getInt("idEstado"));
                estado.setNome(rs.getString("nome"));
                estado.setUf(rs.getString("uf"));
                list.add(estado);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Estado buscarEstadoPorId(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Estado estado = new Estado();
        try {
            ps = con.prepareStatement("SELECT idEstado, uf, nome FROM forever.Estado WHERE idEstado = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                estado.setId(rs.getInt("idEstado"));
                estado.setNome(rs.getString("nome"));
                estado.setUf(rs.getString("uf"));
            }
            return estado;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
}

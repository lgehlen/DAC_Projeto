/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos.impl;

import br.ufpr.tads.foreveralone.beans.Cidade;
import br.ufpr.tads.foreveralone.beans.Estado;
import br.ufpr.tads.foreveralone.daos.CidadeDao;
import br.ufpr.tads.foreveralone.daos.ConnectionFactory;
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
public class DefaultCidadeDao implements CidadeDao {

    Connection con = new ConnectionFactory().getConnection();

    
    @Override
    public List<Cidade> buscarCidadesPorEstado(Estado estado) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idCidade, nomeCidade FROM forever.Cidade WHERE Estado_idEstado = ?");
            ps.setInt(1, estado.getId());
            rs = ps.executeQuery();
            List<Cidade> list = new ArrayList<Cidade>();
            while (rs.next()) {
                Cidade cidade = new Cidade();
                cidade.setId(rs.getInt("idCidade"));
                cidade.setNome(rs.getString("nomeCidade"));
                cidade.setEstado(estado);
                list.add(cidade);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Cidade buscarCidadePorId(int id) {
    PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idCidade, nomeCidade, Estado_idEstado FROM forever.Cidade WHERE idCidade = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            Cidade cidade = new Cidade();
            while (rs.next()) {
                cidade.setId(rs.getInt("idCidade"));
                cidade.setNome(rs.getString("nomeCidade"));
                Estado estado = new Estado();
                estado.setId(rs.getInt("Estado_idEstado"));
                cidade.setEstado(estado);
            }
            return cidade;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;   
    }

    
}

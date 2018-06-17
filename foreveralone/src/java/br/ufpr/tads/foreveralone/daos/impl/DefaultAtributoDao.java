/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos.impl;

import br.ufpr.tads.foreveralone.beans.Atributo;
import br.ufpr.tads.foreveralone.daos.AtributoDao;
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
public class DefaultAtributoDao implements AtributoDao {
    
    Connection con = new ConnectionFactory().getConnection();
     
    @Override
    public void alteraAtributo(Atributo atributo) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("UPDATE forever.Atributo SET corDeCabelo = ?, codDePele = ?, sexo = ?, descricao = ? WHERE idAtributo = ?");
            st.setString(1, atributo.getCorDeCabelo());
            st.setString(2, atributo.getCorDePele());
            st.setString(3, atributo.getSexo());
            st.setString(4, atributo.getDescricao());
            st.setInt(5, atributo.getIdAtributo());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultAtributoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void criaAtributo(Atributo atributo) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("INSERT INTO forever.Atributo (corDeCabelo, corDePele, sexo, descricao)"
                                        + " VALUES (?, ?, ?, ?)");
            st.setString(1, atributo.getCorDeCabelo());
            st.setString(2, atributo.getCorDePele());
            st.setString(3, atributo.getSexo());
            st.setString(4, atributo.getDescricao());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultAtributoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<Atributo> listaAtributo() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT corDeCabelo, codDePele, sexo, descricao FROM forever.Atributo");
            rs = ps.executeQuery();
            List<Atributo> list = new ArrayList<Atributo>();
            while (rs.next()) {
                Atributo atributo = new Atributo();
                atributo.setCorDeCabelo(rs.getString("corDeCabelo"));
                atributo.setCorDePele(rs.getString("codDePele"));
                atributo.setDescricao(rs.getString("sexo"));
                atributo.setSexo(rs.getString("descricao"));
                list.add(atributo);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int buscaProximoIdAtributo() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT AUTO_INCREMENT FROM   information_schema.tables " +
                                        " WHERE  table_name = 'Atributo'" +
                                        " AND    table_schema = 'forever'");
            rs = ps.executeQuery();
            if(rs.next())
            {
                return rs.getInt("AUTO_INCREMENT");
            }
            return -1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    public Atributo buscaAtributoPorId(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Atributo atributo = new Atributo();
        try {
            ps = con.prepareStatement("SELECT IdAtributo, corDeCabelo, corDePele, sexo, descricao FROM  Atributo " +
                                        " WHERE  IdAtributo = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if(rs.next())
            {
                atributo.setIdAtributo(rs.getInt("IdAtributo"));
                atributo.setCorDeCabelo(rs.getString("corDeCabelo"));
                atributo.setCorDePele(rs.getString("corDePele"));
                atributo.setDescricao(rs.getString("descricao"));
                atributo.setSexo(rs.getString("sexo"));
            }
            return atributo;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return atributo;
    }
    
}

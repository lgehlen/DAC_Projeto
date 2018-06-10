/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos.impl;

import br.ufpr.tads.foreveralone.beans.Encontro;
import br.ufpr.tads.foreveralone.daos.ConnectionFactory;
import br.ufpr.tads.foreveralone.daos.EncontroDao;
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
public class DefaultEncontroDao implements EncontroDao {

    Connection con = new ConnectionFactory().getConnection();

    
    @Override
    public void criarEncontro(Encontro encontro) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Encontro> listarEncontros() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idEncontro, local, data, horario, Endereco_idEndereco, Endereco_Cidade_idCidade FROM forever.Encontro ");
            rs = ps.executeQuery();
            List<Encontro> list = new ArrayList<Encontro>();
            while (rs.next()) {
                Encontro encontro = new Encontro();
                encontro.setData(rs.getDate("data"));
                encontro.setHorario(rs.getString("horario"));
                encontro.setId(rs.getInt("idEncontro"));
                //encontro.setIdCliente1(rs.getInt("Convidado_idPar"));
                //encontro.setIdCliente2(rs.getInt("idEvento"));
                //encontro.setLocal(list);
                list.add(encontro);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Encontro buscarEncontroPorId(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos.impl;

import br.ufpr.tads.foreveralone.beans.Orcamento;
import br.ufpr.tads.foreveralone.daos.ConnectionFactory;
import br.ufpr.tads.foreveralone.daos.OrcamentoDao;
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
public class DefaultOrcamentoDao implements OrcamentoDao {

    Connection con = new ConnectionFactory().getConnection();
    
    @Override
    public void criarOrcamento(Orcamento orcamento) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deletarOrcamento(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("DELETE * FROM forever.Orcamento WHERE idPedido = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
}    }

    @Override
    public void atualizarOrcamento(Orcamento orcamento) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Orcamento> buscarOrcamentos() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idOrcamento, Status, detalhamentoStd, detalhamentoPrm, emailFuncionario, emailCliente1, emailCliente2, valorPremium, valorStandard FROM forever.Orcamento");
            rs = ps.executeQuery();
            List<Orcamento> list = new ArrayList<Orcamento>();
            while (rs.next()) {
                Orcamento o = new Orcamento();
                o.setDetalhamentoPremium(rs.getString("detalhamentoPrm"));
                o.setDetalhamentoStandard(rs.getString("detalhamentoStd"));
                o.setEmailCliente(rs.getString("emailCliente1"));
                o.setEmailFuncionario(rs.getString("emailFuncionario"));
                o.setId(rs.getInt("idOrcamento"));
                o.setStatus(rs.getString("Status"));
                o.setValorPremium(rs.getFloat("valorPremium"));
                o.setValorStandard(rs.getFloat("valorStandard"));
                list.add(o);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Orcamento buscarOrcamentoPorId(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Orcamento> buscarOrcamentos(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idOrcamento, Status, detalhamentoStd, detalhamentoPrm, emailFuncionario, emailCliente1, emailCliente2, valorPremium, valorStandard FROM forever.Orcamento");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            List<Orcamento> list = new ArrayList<Orcamento>();
            while (rs.next()) {
                Orcamento o = new Orcamento();
                o.setDetalhamentoPremium(rs.getString("detalhamentoPrm"));
                o.setDetalhamentoStandard(rs.getString("detalhamentoStd"));
                o.setEmailCliente(rs.getString("emailCliente1"));
                o.setEmailFuncionario(rs.getString("emailFuncionario"));
                o.setId(rs.getInt("idOrcamento"));
                o.setStatus(rs.getString("Status"));
                o.setValorPremium(rs.getFloat("valorPremium"));
                o.setValorStandard(rs.getFloat("valorStandard"));
                list.add(o);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
}

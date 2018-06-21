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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author gqueiroz
 */
public class DefaultOrcamentoDao implements OrcamentoDao {

    Connection con = new ConnectionFactory().getConnection();
    
    @Override
    public void criarOrcamento(Orcamento orcamento) {
    PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("INSERT INTO forever.Orcamento ('status','detalhamentoStd','detalhamentoPrm','valorStd','valorPrm','emailFuncionario','emailCliente','idUltimoFuncionario','idPedido','Cliente_idCliente','Cliente_idCliente1')"
                    + " VALUES(?,?,?,?,?,?,?,?)");
            st.setString(1, orcamento.getStatus());
            st.setString(2, orcamento.getDetalhamentoStandard());
            st.setString(3, orcamento.getDetalhamentoPremium());
            st.setString(4, orcamento.getEmailFuncionario());
            st.setString(5, orcamento.getEmailCliente());
            st.setDouble(7, orcamento.getValorPremium());
            st.setDouble(8, orcamento.getValorStandard());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultOrcamentoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
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
                o.setEmailCliente(rs.getString("emailCliente2"));
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
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idOrcamento, Status, detalhamentoStd, detalhamentoPrm, emailFuncionario, emailCliente1, emailCliente2 FROM always.Orcamento WHERE idOrcamento = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            List<Orcamento> list = new ArrayList<Orcamento>();
            while (rs.next()) {
                Orcamento o = new Orcamento();
                o.setDetalhamentoPremium(rs.getString("detalhamentoPrm"));
                o.setDetalhamentoStandard(rs.getString("detalhamentoStd"));
                o.setEmailCliente(rs.getString("emailCliente"));
                o.setEmailFuncionario(rs.getString("emailFuncionario"));
                o.setId(rs.getInt("idOrcamento"));
                o.setStatus(rs.getString("Status"));
                o.setValorPremium(rs.getDouble("emailCliente2"));
                o.setValorStandard(rs.getDouble("emailCliente2"));
                list.add(o);
            }
            return list.get(0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Orcamento> buscarOrcamentos(String id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idOrcamento, Status, detalhamentoStd, detalhamentoPrm, emailFuncionario, emailCliente1, emailCliente2, valorPremium, valorStandard FROM forever.Orcamento WHERE emailCliente1 = ? OR emailCliente2 = ? ");
            ps.setString(1, id);
            ps.setString(2, id);
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

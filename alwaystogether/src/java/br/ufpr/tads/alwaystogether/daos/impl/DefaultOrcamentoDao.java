/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.alwaystogether.daos.impl;

import br.ufpr.tads.alwaystogether.beans.Orcamento;
import br.ufpr.tads.alwaystogether.beans.Pedido;
import br.ufpr.tads.alwaystogether.daos.ConnectionFactory;
import br.ufpr.tads.alwaystogether.daos.OrcamentoDao;
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
            st = con.prepareStatement("INSERT INTO always.Orcamento (Status, detalhamentoStd, detalhamentoPrm, emailFuncionario, emailCliente1, emailCliente2, valorPremium, valorStandard)"
                    + " VALUES(?,?,?,?,?,?,?,?)");
            st.setString(1, orcamento.getStatus());
            st.setString(2, orcamento.getDetalhamentoStandard());
            st.setString(3, orcamento.getDetalhamentoPremium());
            st.setString(4, orcamento.getEmailFuncionario());
            st.setString(5, orcamento.getEmailCliente());
            st.setString(6, orcamento.getEmailCliente2());
            st.setDouble(7, orcamento.getValorPremium());
            st.setDouble(8, orcamento.getValorStandard());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultOrcamentoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    public void atualizarOrcamento(Orcamento orcamento) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("UPDATE always.Orcamento SET Status = ?,detalhamentoStd = ?,detalhamentoPrm = ?,emailFuncionario = ?,emailCliente1 = ?,emailCliente2 = ?, valorPremium=?, valorStandard= ?  WHERE idOrcamento = ?");
            st.setString(1, orcamento.getStatus());
            st.setString(2, orcamento.getDetalhamentoStandard());
            st.setString(3, orcamento.getDetalhamentoPremium());
            st.setString(4, orcamento.getEmailFuncionario());
            st.setString(5, orcamento.getEmailCliente());
            st.setString(6, orcamento.getEmailCliente2());
            st.setDouble(7, orcamento.getValorPremium());
            st.setDouble(8, orcamento.getValorStandard());
            st.setInt(9, orcamento.getId());
            
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultOrcamentoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<Orcamento> buscarOrcamentos() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idOrcamento, Status, detalhamentoStd, detalhamentoPrm, emailFuncionario, emailCliente1, emailCliente2, valorPremium, valorStandard FROM always.orcamento");
            rs = ps.executeQuery();
            List<Orcamento> list = new ArrayList<Orcamento>();
            while (rs.next()) {
                Orcamento o = new Orcamento();
                o.setDetalhamentoPremium(rs.getString("detalhamentoPrm"));
                o.setDetalhamentoStandard(rs.getString("detalhamentoStd"));
                o.setEmailCliente(rs.getString("emailCliente1"));
                o.setEmailCliente2(rs.getString("emailCliente2"));
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
        System.out.println("Id: " + id);
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idOrcamento, Status, detalhamentoStd, detalhamentoPrm, emailFuncionario, emailCliente1, emailCliente2, valorPremium, valorStandard FROM always.Orcamento WHERE idOrcamento = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            List<Orcamento> list = new ArrayList<Orcamento>();
            while (rs.next()) {
                Orcamento o = new Orcamento();
                o.setDetalhamentoPremium(rs.getString("detalhamentoPrm"));
                o.setDetalhamentoStandard(rs.getString("detalhamentoStd"));
                o.setEmailCliente(rs.getString("emailCliente1"));
                o.setEmailCliente2(rs.getString("emailCliente2"));
                o.setEmailFuncionario(rs.getString("emailFuncionario"));
                o.setId(rs.getInt("idOrcamento"));
                o.setStatus(rs.getString("Status"));
                o.setValorPremium(rs.getDouble("valorPremium"));
                o.setValorStandard(rs.getDouble("valorStandard"));
                list.add(o);
            }
            return list.get(0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void criaOrcamento(Orcamento orcamento) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("INSERT INTO always.Orcamento (Status, detalhamentoStd, detalhamentoPrm, emailFuncionario, emailCliente1, emailCliente2, valorPremium, valorStandard, idOrcamento)"
                    + " VALUES(?,?,?,?,?,?,?,?,?)");
            st.setString(1, orcamento.getStatus());
            st.setString(2, orcamento.getDetalhamentoStandard());
            st.setString(3, orcamento.getDetalhamentoPremium());
            st.setString(4, orcamento.getEmailFuncionario());
            st.setString(5, orcamento.getEmailCliente());
            st.setString(6, "Email");
            st.setDouble(7, orcamento.getValorPremium());
            st.setDouble(8, orcamento.getValorStandard());
            st.setInt(9, orcamento.getId());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultOrcamentoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}

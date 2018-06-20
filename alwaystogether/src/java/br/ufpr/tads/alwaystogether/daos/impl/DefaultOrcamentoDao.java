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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void atualizarOrcamento(Orcamento orcamento) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Orcamento> buscarOrcamentos() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
                o.setEmailCliente2(rs.getString("emailCliente2"));
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
    
}

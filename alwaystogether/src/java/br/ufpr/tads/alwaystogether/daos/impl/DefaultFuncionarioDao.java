/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.alwaystogether.daos.impl;

import br.ufpr.tads.alwaystogether.beans.Funcionario;
import br.ufpr.tads.alwaystogether.daos.ConnectionFactory;
import br.ufpr.tads.alwaystogether.daos.FuncionarioDao;
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
public class DefaultFuncionarioDao implements FuncionarioDao {

   Connection con = new ConnectionFactory().getConnection();
    
    @Override
    public void criarFuncionario(Funcionario funcionario) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("INSERT INTO Always.Funcionario (nomeFuncionario, email, senha, regra)"
                                        + " VALUES (?, ?, ?, ?, ?)");
            st.setString(1, funcionario.getNome());
            st.setString(2, funcionario.getEmail());
            st.setString(3, funcionario.getSenha());
            st.setString(4, funcionario.getRegra());
            
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultFuncionarioDao.class.getName()).log(Level.SEVERE, null, ex);
	} 
    }
    
    @Override
    public void deletarFuncionario(Funcionario funcionario) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("DELETE * FROM Always.Funcionario WHERE idFuncionario = ?");
            ps.setInt(1, funcionario.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void atualizarFuncionario(Funcionario funcionario) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("UPDATE Always.Funcionario SET nomeFuncionario = ?, email = ?, senha = ?, regra = ?"
                                        + " WHERE idFuncionario = ?");
            st.setString(1, funcionario.getNome());
            st.setString(2, funcionario.getEmail());
            st.setString(3, funcionario.getSenha());
            st.setString(4, funcionario.getRegra());
            st.setInt(5, funcionario.getId());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultFuncionarioDao.class.getName()).log(Level.SEVERE, null, ex);
	} 
    }

    @Override
    public List<Funcionario> listarFuncionarios() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT nomeFuncionario, email, senha, idFuncionario, regra FROM Always.funcionario ");
            rs = ps.executeQuery();
            List<Funcionario> list = new ArrayList<Funcionario>();
            while (rs.next()) {
                Funcionario funcionario = new Funcionario();
                funcionario.setEmail(rs.getString("email"));
                funcionario.setNome(rs.getString("nomeFuncionario"));
                funcionario.setSenha(rs.getString("senha"));
                funcionario.setRegra(rs.getString("regra"));
                funcionario.setId(rs.getInt("idFuncionario"));
                list.add(funcionario);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Funcionario buscarFuncionariosPorId(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT nomeFuncionario, regra, email, senha FROM Always.funcionario WHERE idFuncionario = ? ");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            List<Funcionario> list = new ArrayList<Funcionario>();
            while (rs.next()) {
                Funcionario funcionario = new Funcionario();
                funcionario.setEmail(rs.getString("email"));
                funcionario.setNome(rs.getString("nomeFuncionario"));
                funcionario.setSenha(rs.getString("senha"));
                funcionario.setRegra(rs.getString("regra"));
                list.add(funcionario);
            }
            return list.get(0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Funcionario buscarPorEmail(String email) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT nomeFuncionario, regra, email, idFuncionario, senha FROM Always.funcionario WHERE email = ? ");
            ps.setString(1, email);
            rs = ps.executeQuery();
            List<Funcionario> list = new ArrayList<Funcionario>();
            while (rs.next()) {
                Funcionario funcionario = new Funcionario();
                funcionario.setEmail(rs.getString("email"));
                funcionario.setNome(rs.getString("nomeFuncionario"));
                funcionario.setSenha(rs.getString("senha"));
                funcionario.setRegra(rs.getString("regra"));
                funcionario.setId(rs.getInt("idFuncionario"));
                list.add(funcionario);
            }
            return list.get(0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
}

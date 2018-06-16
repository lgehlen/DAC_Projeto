/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos.impl;

import br.ufpr.tads.foreveralone.beans.Funcionario;
import br.ufpr.tads.foreveralone.beans.Login;
import br.ufpr.tads.foreveralone.daos.ConnectionFactory;
import br.ufpr.tads.foreveralone.daos.FuncionarioDao;
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
    
    private Connection con;
    
    public DefaultFuncionarioDao(){
        con = new ConnectionFactory().getConnection();
    }
    
    @Override
    public void criarFuncionario(Funcionario funcionario) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("INSERT INTO forever.Funcionario (nomeFuncionario, datanasc, email, senha)"
                                        + " VALUES (?, ?, ?, ?)");
            st.setString(1, funcionario.getNome());
            st.setDate(2, new java.sql.Date(funcionario.getDataNasc().getTime()));
            st.setString(3, funcionario.getEmail());
            st.setString(4, funcionario.getSenha());
            
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
            ps = con.prepareStatement("DELETE * FROM forever.Funcionario WHERE idFuncionario = ?");
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
            st = con.prepareStatement("UPDATE forever.Funcionario SET nomeFuncionario = ?, datanasc = ?, email = ?, senha = ?"
                                        + " WHERE idFuncionario = ?");
            st.setString(1, funcionario.getNome());
            st.setDate(2, new java.sql.Date(funcionario.getDataNasc().getTime()));
            st.setString(3, funcionario.getEmail());
            st.setString(4, funcionario.getSenha());
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
            ps = con.prepareStatement("SELECT nomeFuncionario, datanasc, email, senha, idFuncionario FROM forever.Funcionario ");
            rs = ps.executeQuery();
            List<Funcionario> list = new ArrayList<Funcionario>();
            while (rs.next()) {
                Funcionario funcionario = new Funcionario();
                funcionario.setEmail(rs.getString("email"));
                funcionario.setNome(rs.getString("nomeFuncionario"));
                funcionario.setSenha(rs.getString("senha"));
                funcionario.setDataNasc(rs.getDate("datanasc"));
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
    public List<Funcionario> listarFuncionariosPorId(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT nomeFuncionario, datanasc, email, senha FROM forever.Funcionario WHERE idFuncionario = ? ");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            List<Funcionario> list = new ArrayList<Funcionario>();
            while (rs.next()) {
                Funcionario funcionario = new Funcionario();
                funcionario.setEmail(rs.getString("email"));
                funcionario.setNome(rs.getString("nomeFuncionario"));
                funcionario.setSenha(rs.getString("senha"));
                funcionario.setDataNasc(rs.getDate("datanasc"));
                list.add(funcionario);
            }
            return list;
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
            ps = con.prepareStatement("SELECT nomeFuncionario, datanasc, email, idFuncionario, senha FROM forever.Funcionario WHERE email = ? ");
            ps.setString(1, email);
            rs = ps.executeQuery();
            List<Funcionario> list = new ArrayList<Funcionario>();
            while (rs.next()) {
                Funcionario funcionario = new Funcionario();
                funcionario.setEmail(rs.getString("email"));
                funcionario.setNome(rs.getString("nomeFuncionario"));
                funcionario.setSenha(rs.getString("senha"));
                funcionario.setDataNasc(rs.getDate("datanasc"));
                funcionario.setId(rs.getInt("idFuncionario"));
                list.add(funcionario);
            }
            return list.get(0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Login buscarPorLogin(String email, String senha) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idFuncionario, nomeFuncionario FROM forever.Funcionario WHERE email = ? AND senha = ?");
            ps.setString(1, email);
            ps.setString(2, senha);
            rs = ps.executeQuery();
            Login login = new Login();
            while (rs.next()) {
                login.setId(rs.getInt("idFuncionario"));
                login.setNome(rs.getString("nomeFuncionario"));
                login.setTipo("funcionario");
            }
            return login;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
}

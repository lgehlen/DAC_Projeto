/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.alwaystogether.daos.impl;

import br.ufpr.tads.alwaystogether.beans.Funcionario;
import br.ufpr.tads.alwaystogether.beans.Login;
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
            st = con.prepareStatement("INSERT INTO always.Funcionario (nomeFuncionario, email, senha, regra)"
                                        + " VALUES (?, ?, ?, ?)");
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
            ps = con.prepareStatement("UPDATE always.Funcionario SET isRemovido = 1 WHERE idFuncionario = ?");
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
            st = con.prepareStatement("UPDATE always.Funcionario SET nomeFuncionario = ?, email = ?, senha = ?, regra = ?"
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
            ps = con.prepareStatement("SELECT nomeFuncionario, email, senha, idFuncionario, regra FROM always.Funcionario wHERE idFuncionario != 1 AND isRemovido != 1  ");
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
            ps = con.prepareStatement("SELECT nomeFuncionario, regra, email, senha FROM always.Funcionario WHERE idFuncionario = ? AND isRemovido != 1 ");
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
            ps = con.prepareStatement("SELECT nomeFuncionario, regra, email, idFuncionario, senha FROM always.funcionario WHERE email = ? AND isRemovido != 1");
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
    
    @Override
    public Login buscarPorLogin(String email, String senha) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idFuncionario, nomeFuncionario FROM always.Funcionario WHERE email = ? AND senha = ? AND isRemovido != 1");
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

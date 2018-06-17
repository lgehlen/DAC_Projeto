/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.daos.impl;

import br.ufpr.tads.foreveralone.beans.Atributo;
import br.ufpr.tads.foreveralone.beans.Cidade;
import br.ufpr.tads.foreveralone.beans.Cliente;
import br.ufpr.tads.foreveralone.beans.Endereco;
import br.ufpr.tads.foreveralone.beans.Login;
import br.ufpr.tads.foreveralone.daos.ClienteDao;
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
public class DefaultClienteDao implements ClienteDao {

    Connection con = new ConnectionFactory().getConnection();

    @Override
    public void criarCliente(Cliente cliente) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("INSERT INTO forever.Cliente (nomeCliente, CPF, datanasc, email, escolaridade, dataCad, senha, Endereco_idEndereco, Atributo_IdAtributoPreferencia, Atributo_IdAtributoAtributo)"
                    + " VALUES(?,?,?,?,?,?,?,?,?,?)");
            st.setString(1, cliente.getNome());
            st.setString(2, cliente.getCpf());
            st.setDate(3, new java.sql.Date(cliente.getDataNasc().getTime()));
            st.setString(4, cliente.getEmail());
            st.setString(5, cliente.getEscolaridade());
            st.setDate(6, new java.sql.Date(cliente.getDataCad().getTime()));
            st.setString(7, cliente.getSenha());
            st.setInt(8, cliente.getEndereço().getId());
            st.setInt(9, cliente.getPreferencias().getIdAtributo());
            st.setInt(10, cliente.getCaracteristicas().getIdAtributo());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultAtributoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void criarEndereço(Endereco e) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("INSERT INTO forever.endereco (rua,CEP,numero,Cidade_idCidade)"
                    + " VALUES(?,?,?,?)");
            st.setString(1, e.getRua());
            st.setString(2, e.getCep());
            st.setString(3, e.getLogradouro());
            st.setInt(4, e.getCidade().getId());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultAtributoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void alteraEndereco(Endereco e) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("UPDATE forever.endereco SET rua = ?,CEP = ?,numero = ?,Cidade_idCidade = ? WHERE idEndereco = ?");
            st.setString(1, e.getRua());
            st.setString(2, e.getCep());
            st.setString(3, e.getLogradouro());
            st.setInt(4, e.getCidade().getId());
            st.setInt(5, e.getId());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultAtributoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void deletarCliente(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("UPDATE forever.Cliente SET isRemovido = 1 WHERE idCliente = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void atualizarCliente(Cliente cliente) {
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            st = con.prepareStatement("UPDATE forever.Cliente SET nomeCliente = ?, CPF = ?, datanasc = ?, email = ?, escolaridade = ?, senha = ?, Endereco_idEndereco = ?, Atributo_IdAtributoPreferencia = ?, Atributo_IdAtributoAtributo = ? WHERE idCliente = ?");
            st.setString(1, cliente.getNome());
            st.setString(2, cliente.getCpf());
            st.setDate(3, new java.sql.Date(cliente.getDataNasc().getTime()));
            st.setString(4, cliente.getEmail());
            st.setString(5, cliente.getEscolaridade());
            st.setString(6, cliente.getSenha());
            st.setInt(7, (cliente.getEndereço().getId()));
            st.setInt(8, cliente.getPreferencias().getIdAtributo());
            st.setInt(9, cliente.getCaracteristicas().getIdAtributo());
            st.setInt(10, cliente.getId());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DefaultAtributoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<Cliente> listarClientes() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idCliente, nomeCliente, CPF, datanasc, email, escolaridade, dataCad, senha, Endereco_idEndereco, Atributo_IdAtributoPreferencia, Atributo_IdAtributoAtributo FROM Cliente WHERE isRemovido = 0");
            rs = ps.executeQuery();
            List<Cliente> list = new ArrayList<Cliente>();
            while (rs.next()) {
                Endereco endereco = new Endereco();
                Atributo caracteristicas = new Atributo();
                Atributo preferencias = new Atributo();
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("IdCliente"));
                cliente.setCpf(rs.getString("CPF"));
                cliente.setDataCad(rs.getDate("dataCad"));
                cliente.setDataNasc(rs.getDate("datanasc"));
                cliente.setEmail(rs.getString("email"));
                cliente.setEscolaridade(rs.getString("escolaridade"));
                cliente.setNome(rs.getString("nomeCliente"));
                caracteristicas.setIdAtributo(rs.getInt("Atributo_IdAtributoAtributo"));
                preferencias.setIdAtributo(rs.getInt("Atributo_IdAtributoPreferencia"));
                endereco.setId(rs.getInt("Endereco_idEndereco"));
                cliente.setCaracteristicas(caracteristicas);
                cliente.setPreferencias(preferencias);
                cliente.setEndereço(endereco);
                list.add(cliente);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    

    public List<Cliente> listarClientesPorPreferencia(Atributo p) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idCliente, nomeCliente, CPF, datanasc, email, escolaridade, dataCad, senha, Endereco_idEndereco, Atributo_IdAtributoPreferencia, Atributo_IdAtributoAtributo FROM Cliente, Atributo WHERE isRemovido = 0 AND idCliente = idAtributo AND corDeCabelo = ? AND codDePele = ? AND sexo = ?");
            ps.setString(1,p.getCorDeCabelo());
            ps.setString(2, p.getCorDePele());
            ps.setString(3, p.getSexo());
            rs = ps.executeQuery();
            List<Cliente> list = new ArrayList<Cliente>();
            while (rs.next()) {
                Endereco endereco = new Endereco();
                Atributo caracteristicas = new Atributo();
                Atributo preferencias = new Atributo();
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("IdCliente"));
                cliente.setCpf(rs.getString("CPF"));
                cliente.setDataCad(rs.getDate("dataCad"));
                cliente.setDataNasc(rs.getDate("datanasc"));
                cliente.setEmail(rs.getString("email"));
                cliente.setEscolaridade(rs.getString("escolaridade"));
                cliente.setNome(rs.getString("nomeCliente"));
                caracteristicas.setIdAtributo(rs.getInt("Atributo_IdAtributoAtributo"));
                preferencias.setIdAtributo(rs.getInt("Atributo_IdAtributoPreferencia"));
                endereco.setId(rs.getInt("Endereco_idEndereco"));
                cliente.setCaracteristicas(caracteristicas);
                cliente.setPreferencias(preferencias);
                cliente.setEndereço(endereco);
                list.add(cliente);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    @Override
    public Cliente buscarClientePorId(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idCliente, nomeCliente, CPF, datanasc, email, escolaridade, dataCad, senha, Endereco_idEndereco, Atributo_IdAtributoPreferencia, Atributo_IdAtributoAtributo FROM forever.Cliente where idCliente = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            Cliente cliente = new Cliente();
            while (rs.next()) {
                Endereco endereco = new Endereco();
                Atributo preferencias = new Atributo();
                Atributo caracteristicas = new Atributo();
                
                cliente.setId(0);
                cliente.setCpf(rs.getString("CPF"));
                cliente.setDataCad(rs.getDate("dataCad"));
                cliente.setDataNasc(rs.getDate("datanasc"));
                cliente.setEmail(rs.getString("email"));
                cliente.setEscolaridade(rs.getString("escolaridade"));
                cliente.setNome(rs.getString("nomeCliente"));
                cliente.setSenha(rs.getString("senha"));
                
                endereco.setId(rs.getInt("Endereco_idEndereco"));
                preferencias.setIdAtributo(rs.getInt("Atributo_IdAtributoPreferencia"));
                caracteristicas.setIdAtributo(rs.getInt("Atributo_IdAtributoAtributo"));
                System.out.println("Id Pref: " + preferencias.getIdAtributo());
                System.out.println("Id Carac: " + caracteristicas.getIdAtributo());
                
                cliente.setEndereço(endereco);
                cliente.setCaracteristicas(caracteristicas);
                cliente.setPreferencias(preferencias);
            }
            return cliente;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Cliente buscarClientePorEmail(String email) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idCliente, nomeCliente, CPF, datanasc, email, escolaridade, dataCada, senha, Endereco_idEndereco, Endereco_Cidade_idCliente1 FROM forever.Cliente WHERE email = ? ");
            ps.setString(1, email);
            rs = ps.executeQuery();
            List<Cliente> list = new ArrayList<Cliente>();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(0);
                cliente.setCpf(rs.getString("CPF"));
                cliente.setDataCad(rs.getDate("dataCada"));
                cliente.setDataNasc(rs.getDate("datanasc"));
                cliente.setEmail(rs.getString("email"));
                cliente.setEscolaridade(rs.getString("escolaridade"));
                cliente.setNome(rs.getString("nomeCliente"));
                list.add(cliente);
            }
            return list.get(0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Login getLogin(String email, String sen) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idCliente, nomeCliente FROM forever.Cliente WHERE email = ? AND senha = ?");
            ps.setString(1, email);
            ps.setString(2, sen);
            rs = ps.executeQuery();
            Login login = new Login();
            while (rs.next()) {
                login.setId(rs.getInt("idCliente"));
                login.setNome(rs.getString("nomeCliente"));
                login.setTipo("cliente");
            }
            return login;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int buscaProximoIdEndereco() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT AUTO_INCREMENT FROM   information_schema.tables "
                    + " WHERE  table_name = 'endereco'"
                    + " AND    table_schema = 'forever'");
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("AUTO_INCREMENT");
            }

            return -1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    public Endereco buscarEnderecoPorId(int id) {
       PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("SELECT idEndereco, rua, CEP, numero, Cidade_idCidade FROM forever.Endereco where idEndereco = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            Endereco endereco = new Endereco();
            Cidade cidade = new Cidade();
            while (rs.next()) {
                endereco.setCep(rs.getString("CEP"));
                cidade.setId(rs.getInt("Cidade_idCidade"));
                endereco.setCidade(cidade);
                endereco.setId(rs.getInt("idEndereco"));
                endereco.setLogradouro(rs.getString("numero"));
                endereco.setRua(rs.getString("rua"));
            }
            return endereco;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}

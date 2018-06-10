/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.beans;

import java.util.Date;

/**
 *
 * @author gqueiroz
 */
public class Cliente {
    private int id;
    
    private String nome;
    
    private String cpf;
    
    private Date dataNasc;
    
    private String email;
    
    private String escolaridade;
    
    private Date dataCad;
    
    private String senha;
    
    private Endereco endereço;
    
    private Atributo caracteristicas;
    
    private Atributo preferencias;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the cpf
     */
    public String getCpf() {
        return cpf;
    }

    /**
     * @param cpf the cpf to set
     */
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    /**
     * @return the dataNasc
     */
    public Date getDataNasc() {
        return dataNasc;
    }

    /**
     * @param dataNasc the dataNasc to set
     */
    public void setDataNasc(Date dataNasc) {
        this.dataNasc = dataNasc;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the escolaridade
     */
    public String getEscolaridade() {
        return escolaridade;
    }

    /**
     * @param escolaridade the escolaridade to set
     */
    public void setEscolaridade(String escolaridade) {
        this.escolaridade = escolaridade;
    }

    /**
     * @return the dataCad
     */
    public Date getDataCad() {
        return dataCad;
    }

    /**
     * @param dataCad the dataCad to set
     */
    public void setDataCad(Date dataCad) {
        this.dataCad = dataCad;
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
    }

    /**
     * @return the endereço
     */
    public Endereco getEndereço() {
        return endereço;
    }

    /**
     * @param endereço the endereço to set
     */
    public void setEndereço(Endereco endereço) {
        this.endereço = endereço;
    }

    /**
     * @return the caracteristicas
     */
    public Atributo getCaracteristicas() {
        return caracteristicas;
    }

    /**
     * @param caracteristicas the caracteristicas to set
     */
    public void setCaracteristicas(Atributo caracteristicas) {
        this.caracteristicas = caracteristicas;
    }

    /**
     * @return the preferencias
     */
    public Atributo getPreferencias() {
        return preferencias;
    }

    /**
     * @param preferencias the preferencias to set
     */
    public void setPreferencias(Atributo preferencias) {
        this.preferencias = preferencias;
    }
}

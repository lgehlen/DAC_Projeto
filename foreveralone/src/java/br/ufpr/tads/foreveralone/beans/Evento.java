/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.beans;

import java.util.Date;
import java.util.List;

/**
 *
 * @author gqueiroz
 */
public class Evento {
    private int id;
    
    private List<Cliente> convidados;
    
    private Date data;
    
    private String horario;
    
    private Endereco local;
    
    private Funcionario funcionario;
    
    private String tema;

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
     * @return the convidados
     */
    public List<Cliente> getConvidados() {
        return convidados;
    }

    /**
     * @param convidados the convidados to set
     */
    public void setConvidados(List<Cliente> convidados) {
        this.convidados = convidados;
    }

    /**
     * @return the data
     */
    public Date getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(Date data) {
        this.data = data;
    }

    /**
     * @return the horario
     */
    public String getHorario() {
        return horario;
    }

    /**
     * @param horario the horario to set
     */
    public void setHorario(String horario) {
        this.horario = horario;
    }

    /**
     * @return the local
     */
    public Endereco getLocal() {
        return local;
    }

    /**
     * @param local the local to set
     */
    public void setLocal(Endereco local) {
        this.local = local;
    }

    public Funcionario getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(Funcionario funcionario) {
        this.funcionario = funcionario;
    }

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }
}

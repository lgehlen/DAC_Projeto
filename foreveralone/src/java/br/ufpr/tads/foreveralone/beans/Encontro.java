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
public class Encontro {
    private int id;
    
    private int idCliente1;
    
    private int idCliente2;
    
    private Endereco local;
    
    private Date data;
    
    private String horario;

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
     * @return the idCliente1
     */
    public int getIdCliente1() {
        return idCliente1;
    }

    /**
     * @param idCliente1 the idCliente1 to set
     */
    public void setIdCliente1(int idCliente1) {
        this.idCliente1 = idCliente1;
    }

    /**
     * @return the idCliente2
     */
    public int getIdCliente2() {
        return idCliente2;
    }

    /**
     * @param idCliente2 the idCliente2 to set
     */
    public void setIdCliente2(int idCliente2) {
        this.idCliente2 = idCliente2;
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
}

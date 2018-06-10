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
public class Produtividade {
    private int idCliente1;
    
    private int idCliente2;
    
    private Date data;
    
    private boolean orcamentoAceito;

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
     * @return the orcamentoAceito
     */
    public boolean isOrcamentoAceito() {
        return orcamentoAceito;
    }

    /**
     * @param orcamentoAceito the orcamentoAceito to set
     */
    public void setOrcamentoAceito(boolean orcamentoAceito) {
        this.orcamentoAceito = orcamentoAceito;
    }
}

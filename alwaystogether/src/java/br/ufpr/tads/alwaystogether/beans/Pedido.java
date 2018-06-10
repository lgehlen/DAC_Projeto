/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.alwaystogether.beans;

/**
 *
 * @author gqueiroz
 */
public class Pedido {
    private int idPedido;
    
    private int idOrcamento;
    
    private String emailCliente;
    
    private int statusOrcamento;

    /**
     * @return the idPedido
     */
    public int getIdPedido() {
        return idPedido;
    }

    /**
     * @param idPedido the idPedido to set
     */
    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    /**
     * @return the idOrcamento
     */
    public int getIdOrcamento() {
        return idOrcamento;
    }

    /**
     * @param idOrcamento the idOrcamento to set
     */
    public void setIdOrcamento(int idOrcamento) {
        this.idOrcamento = idOrcamento;
    }

    /**
     * @return the emailCliente
     */
    public String getEmailCliente() {
        return emailCliente;
    }

    /**
     * @param emailCliente the emailCliente to set
     */
    public void setEmailCliente(String emailCliente) {
        this.emailCliente = emailCliente;
    }

    /**
     * @return the statusOrcamento
     */
    public int getStatusOrcamento() {
        return statusOrcamento;
    }

    /**
     * @param statusOrcamento the statusOrcamento to set
     */
    public void setStatusOrcamento(int statusOrcamento) {
        this.statusOrcamento = statusOrcamento;
    }
}

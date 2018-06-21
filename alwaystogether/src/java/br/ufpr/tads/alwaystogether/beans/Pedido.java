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
    
    private Orcamento idOrcamento;
    
    private String statusOrcamento;

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

    /**
     * @return the statusOrcamento
     */
    public String getStatusOrcamento() {
        return statusOrcamento;
    }

    /**
     * @param statusOrcamento the statusOrcamento to set
     */
    public void setStatusOrcamento(String statusOrcamento) {
        this.statusOrcamento = statusOrcamento;
    }

    public Orcamento getIdOrcamento() {
        return idOrcamento;
    }

    public void setIdOrcamento(Orcamento idOrcamento) {
        this.idOrcamento = idOrcamento;
    }
}

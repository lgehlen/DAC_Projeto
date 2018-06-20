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
public class Orcamento {
    private int id;
    
    private String status;
    
    private String detalhamentoStandard;
    
    private String detalhamentoPremium;
    
    private double valorStandard;
    
    private double valorPremium;
    
    private String emailFuncionario;
    
    private String emailCliente;
    
    private String emailCliente2;
    
    private int idUltimoFucnionario;
    
    private int idPedido;

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
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the detalhamentoStandard
     */
    public String getDetalhamentoStandard() {
        return detalhamentoStandard;
    }

    /**
     * @param detalhamentoStandard the detalhamentoStandard to set
     */
    public void setDetalhamentoStandard(String detalhamentoStandard) {
        this.detalhamentoStandard = detalhamentoStandard;
    }

    /**
     * @return the detalhamentoPremium
     */
    public String getDetalhamentoPremium() {
        return detalhamentoPremium;
    }

    /**
     * @param detalhamentoPremium the detalhamentoPremium to set
     */
    public void setDetalhamentoPremium(String detalhamentoPremium) {
        this.detalhamentoPremium = detalhamentoPremium;
    }

    /**
     * @return the valorStandard
     */
    public double getValorStandard() {
        return valorStandard;
    }

    /**
     * @param valorStandard the valorStandard to set
     */
    public void setValorStandard(double valorStandard) {
        this.valorStandard = valorStandard;
    }

    /**
     * @return the valorPremium
     */
    public double getValorPremium() {
        return valorPremium;
    }

    /**
     * @param valorPremium the valorPremium to set
     */
    public void setValorPremium(double valorPremium) {
        this.valorPremium = valorPremium;
    }

    /**
     * @return the emailFuncionario
     */
    public String getEmailFuncionario() {
        return emailFuncionario;
    }

    /**
     * @param emailFuncionario the emailFuncionario to set
     */
    public void setEmailFuncionario(String emailFuncionario) {
        this.emailFuncionario = emailFuncionario;
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
     * @return the idUltimoFucnionario
     */
    public int getIdUltimoFucnionario() {
        return idUltimoFucnionario;
    }

    /**
     * @param idUltimoFucnionario the idUltimoFucnionario to set
     */
    public void setIdUltimoFucnionario(int idUltimoFucnionario) {
        this.idUltimoFucnionario = idUltimoFucnionario;
    }

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
     * @return the emailCliente2
     */
    public String getEmailCliente2() {
        return emailCliente2;
    }

    /**
     * @param emailCliente2 the emailCliente2 to set
     */
    public void setEmailCliente2(String emailCliente2) {
        this.emailCliente2 = emailCliente2;
    }
}

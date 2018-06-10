/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.beans;

/**
 *
 * @author gqueiroz
 */
public class Atributo {
    private int idAtributo;
    
    private String corDeCabelo;
    
    private String corDePele;
    
    private String sexo;
    
    private String descricao;

    /**
     * @return the corDeCabelo
     */
    public String getCorDeCabelo() {
        return corDeCabelo;
    }

    /**
     * @param corDeCabelo the corDeCabelo to set
     */
    public void setCorDeCabelo(String corDeCabelo) {
        this.corDeCabelo = corDeCabelo;
    }

    /**
     * @return the corDePele
     */
    public String getCorDePele() {
        return corDePele;
    }

    /**
     * @param corDePele the corDePele to set
     */
    public void setCorDePele(String corDePele) {
        this.corDePele = corDePele;
    }

    /**
     * @return the sexo
     */
    public String getSexo() {
        return sexo;
    }

    /**
     * @param sexo the sexo to set
     */
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * @return the idAtributo
     */
    public int getIdAtributo() {
        return idAtributo;
    }

    /**
     * @param idAtributo the idAtributo to set
     */
    public void setIdAtributo(int idAtributo) {
        this.idAtributo = idAtributo;
    }
}

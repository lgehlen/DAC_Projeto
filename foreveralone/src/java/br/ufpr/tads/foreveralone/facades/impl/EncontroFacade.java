/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.facades.impl;

import br.ufpr.tads.foreveralone.beans.Encontro;
import br.ufpr.tads.foreveralone.daos.EncontroDao;
import br.ufpr.tads.foreveralone.daos.impl.DefaultEncontroDao;
import java.util.List;

/**
 *
 * @author gqueiroz
 */
public class EncontroFacade {
    
    private static EncontroDao encontroDao;

    public EncontroFacade()
    {
        encontroDao = new DefaultEncontroDao();
    }
    
    public void criarEncontro(Encontro encontro) {
        getEncontroDao().criarEncontro(encontro);
    }

    
    public void deletarEncontro(Encontro encontro) {
        getEncontroDao().deletarEncontro(encontro);
    }

    
    public void atualizarEncontro(Encontro encontro) {
        getEncontroDao().atualizarEncontro(encontro);
    }

    
    public List<Encontro> listarEncontros(int id) {
        return getEncontroDao().listarEncontros(id);
    }

    
    public Encontro buscarEncontroPorId(int id) {
        return getEncontroDao().buscarEncontroPorId(id);
    }
    
    public void listaNegra(int cliente, int bloqueado){
        encontroDao.listaNegra(cliente, bloqueado);
    }

    /**
     * @return the encontroDao
     */
    public static EncontroDao getEncontroDao() {
        return encontroDao;
    }

    /**
     * @param aEncontroDao the encontroDao to set
     */
    public static void setEncontroDao(EncontroDao aEncontroDao) {
        encontroDao = aEncontroDao;
    }
}

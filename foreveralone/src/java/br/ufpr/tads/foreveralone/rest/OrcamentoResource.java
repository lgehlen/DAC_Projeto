/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.foreveralone.rest;

import br.ufpr.tads.foreveralone.facades.impl.ClienteFacade;
import br.ufpr.tads.foreveralone.facades.impl.PedidoFacade;

import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 *
 * @author lgehlen
 */
@Path("orcamento")
public class OrcamentoResource {
    
    @Context
    private UriInfo context;

    /**
     * Creates a new instance of AtendimentoResource
     */
    private PedidoFacade pedidoFacade;
    private ClienteFacade clienteFacade;
    
    public OrcamentoResource() {
        this.pedidoFacade = new PedidoFacade();
        this.clienteFacade = new ClienteFacade();
    }

}   


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tads.alwaystogether.rest;

import br.ufpr.tads.alwaystogether.beans.Orcamento;
import br.ufpr.tads.alwaystogether.facades.impl.PedidoFacade;

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
    
    public OrcamentoResource() {
        this.pedidoFacade = new PedidoFacade();
    }
    
    @POST
    @Path("/inserir")  
    @Consumes(MediaType.APPLICATION_JSON)
    public Response setOrcamento(Orcamento orcamento) {
        this.pedidoFacade.criarOrcamento(orcamento);
        return Response
        .ok(Response.Status.OK)
        .build(); 
    }
    
    @POST
    @Path("/atualizar")  
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updtOrcamento(Orcamento orcamento) {
        this.pedidoFacade.atualizarOrcamento(orcamento);
        return Response
        .ok(Response.Status.OK)
        .build(); 
    }

}   


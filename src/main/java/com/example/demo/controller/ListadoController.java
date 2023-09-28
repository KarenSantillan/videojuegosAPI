
package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.Videojuego;
import com.example.demo.service.VideojuegoService;

@Controller
public class ListadoController {
	
	private final VideojuegoService videojuegoService;
	
	public ListadoController(VideojuegoService videojuegoService) {
		this.videojuegoService = videojuegoService;
	}
	
    @RequestMapping("/")
    public String listarVideojuegos(Model model) {
    	List<Videojuego> destacados =  videojuegoService.buscarDestacados();
    	model.addAttribute("videojuegos", destacados);
    	return "listado";
    }
    
    @RequestMapping("/videojuegosPorDistribuidor")
    public String listarVideojuegosPorDistribuidor(int distribuidorId, Model model) {
    	List<Videojuego> juegos =  videojuegoService.buscarPorDistribuidor(distribuidorId);  
    	model.addAttribute("videojuegos", juegos);
    	return "listado";
    }

    @RequestMapping("/buscar")
    public String buscar(@RequestParam("q")String consulta, Model model) {
    	List<Videojuego> nombre =  videojuegoService.buscar(consulta);
    	model.addAttribute("videojuegos", nombre);
    	return "listado";
    }



}

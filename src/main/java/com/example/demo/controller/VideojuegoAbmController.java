package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.domain.Videojuego;
import com.example.demo.service.DistribuidorService;
import com.example.demo.service.VideojuegoService;

@Controller
public class VideojuegoAbmController {
	
	private final DistribuidorService distribuidorService;
	private final VideojuegoService videojuegoService;

	public VideojuegoAbmController(DistribuidorService distribuidorService, VideojuegoService videojuegoService) {
		this.distribuidorService = distribuidorService;
		this.videojuegoService = videojuegoService;
		
	}
	
	@RequestMapping("/videojuegos/crear")
	public String mostrarFormAlta(Model model) {
		model.addAttribute("distribuidores", distribuidorService.buscarTodos());
		model.addAttribute("videojuego",new Videojuego());
		return "formVideojuego";
	}
	
	@PostMapping("/videojuegos/guardar")
	public String guardar(Videojuego videojuego) {
		videojuegoService.guardar(videojuego);
		return "redirect:/";
	}
	
}

package com.repouniversity.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.repouniversity.model.services.ArchivoService;

@Controller
public class ArchivoController {

	@Autowired
	private ArchivoService archivoService;
}

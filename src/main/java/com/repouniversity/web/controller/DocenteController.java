package com.repouniversity.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.repouniversity.model.services.DocenteService;

@Controller
public class DocenteController {

    @Autowired
    private DocenteService docenteService;

}

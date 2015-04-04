package com.repouniversity.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AlumnoController {

    @RequestMapping(value = "/newAlumno", method = {RequestMethod.GET})
    public ModelAndView createAlumno() {
        return new ModelAndView("newAlumno");
    }

}

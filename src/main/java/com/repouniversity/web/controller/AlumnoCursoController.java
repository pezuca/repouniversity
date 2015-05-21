package com.repouniversity.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.Materia;
import com.repouniversity.model.entity.Usuario;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.AlumnoTO;
import com.repouniversity.model.entity.to.UsuarioTO;
import com.repouniversity.model.services.AlumnoService;
import com.repouniversity.model.services.CursoService;
import com.repouniversity.model.services.DocenteService;
import com.repouniversity.model.services.MateriaService;
import com.repouniversity.model.services.PersonaService;
import com.repouniversity.model.services.UsuarioRolService;
import com.repouniversity.model.services.UsuarioService;

@Controller
public class AlumnoCursoController {

    @Autowired
    public PersonaService personaService;

    @Autowired
    public AlumnoService alumnoService;
    
    @Autowired
    public DocenteService docenteService;

    @Autowired
    public UsuarioService usuarioService;
    
    @Autowired
    public UsuarioRolService usuarioRolService;
    
    @Autowired
    public CursoService cursoService;
    
    @Autowired
    public MateriaService materiaService;

   @RequestMapping(value = "curso/alumnoSinGrupo", method = {RequestMethod.GET})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public List<AlumnoTO> crearUsuarioAjax(@RequestParam(value = "cursoId") Long cursoId) {

	   List<AlumnoTO> listaAlumnoTo =	cursoService.ObtenerAlumnosSinGrupo(cursoId);
           
        return listaAlumnoTo;
    }
    
 }

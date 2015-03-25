package com.repouniversity.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.CursoMateria;
import com.repouniversity.model.entity.Docente;
import com.repouniversity.model.entity.Grupo;
import com.repouniversity.model.services.DocenteService;

@Controller
public class DocenteController {

	@Autowired
	private DocenteService docenteService;

	@RequestMapping(value = "docente/navegacion", method = { RequestMethod.GET })
	public ModelAndView sendDocentes() {
		List<Docente> docentes = docenteService.getAll();

		for (Docente docente : docentes) {
			System.out.println("                                         ");
			System.out.println("                                         ");
			ArrayList<CursoMateria> cursoMateria = new ArrayList<CursoMateria>(
					docente.getCursosMaterias());
			
			System.out.println("============================== Docente ");
			System.out.println("Docente id: " + docente.getId());
			System.out.println("Nombre: " + docente.getPersona().getNombre() + " "
					+ docente.getPersona().getApellido());
			System.out.println("Mail: " + docente.getPersona().getMail());
			System.out.println("    ========================== CursoMateria ");
			for (CursoMateria curMat : cursoMateria) {
				System.out.println("    Materia: "
						+ curMat.getMateria().getCodigo() + " - "
						+ curMat.getMateria().getNombre() + " - "
						+ curMat.getMateria().getDescripcion() + " // Curso: "
						+ curMat.getCurso().getCodigo() + " - "
						+ curMat.getCurso().getNombre() + " - "
						+ curMat.getCurso().getDescripcion());
				System.out.println("        Alumnos: ");
				List<Alumno> alumnos = new ArrayList<Alumno>(curMat.getCurso()
						.getAlumnos());
				for (Alumno alumno : alumnos) {
					System.out.println("            " + alumno.getId() + " - "
							+ alumno.getPersona().getNombre() + " "
							+ alumno.getPersona().getApellido() + " - "
							+ alumno.getPersona().getMail());
					
					System.out.println("            GRupos: ");
					
					List<Grupo> grupos = new ArrayList<Grupo>(alumno.getGrupos());
					for (Grupo grupo : grupos) {
						System.out.println("            Nombre: "
								+ grupo.getNombre());
						
						List<Alumno> integrantes = new ArrayList<Alumno>(
								grupo.getAlumnos());
						
						for (Alumno integrante : integrantes) {
							System.out.println("                 "
									+ integrante.getPersona().getNombre() + " "
									+ integrante.getPersona().getApellido());
						}
					}
				}
			}
			
		}

		return new ModelAndView("index").addObject("docente", docentes);
	}
}

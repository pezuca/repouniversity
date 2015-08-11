package com.repouniversity.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.CursoMateria;
import com.repouniversity.model.entity.Grupo;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.VwArchivo;
import com.repouniversity.model.entity.to.AlumnoTO;
import com.repouniversity.model.entity.to.GrupoTO;
import com.repouniversity.model.entity.to.NotificacionTO;
import com.repouniversity.model.services.AlumnoService;
import com.repouniversity.model.services.ArchivoService;
import com.repouniversity.model.services.CursoService;
import com.repouniversity.model.services.DocenteService;
import com.repouniversity.model.services.GrupoService;
import com.repouniversity.model.services.NotificacionService;
import com.repouniversity.model.services.TipoNotificacionService;

@Controller
@SessionAttributes("login")
public class CursoController {

    @Autowired
    private CursoService cursoService;
    @Autowired
    private DocenteService docenteService;
    @Autowired
    private NotificacionService notificacionService;
    @Autowired
    private TipoNotificacionService tipoNotificacionService;
    @Autowired
    private AlumnoService alumnoService;
    @Autowired
    private ArchivoService archivoService;
    
    @Autowired
    private GrupoService grupoService;

    @RequestMapping(value = "alumno/cursos", method = {RequestMethod.GET})
    public ModelAndView sendAlumnoCursos(HttpServletRequest request, @ModelAttribute("login") UsuarioRol usuario) {

        List<Curso> cursos = cursoService.getCursosForAlumno(usuario.getIdAluDoc());

        return new ModelAndView("verCursosAlumno").addObject("cursos", cursos);
    }

    @RequestMapping(value = "alumno/verCurso", method = {RequestMethod.GET})
    public ModelAndView verCurso(@RequestParam(value = "cursoId", required = true) Long cursoId, @ModelAttribute("login") UsuarioRol usuario) {
        Curso curso = cursoService.getById(cursoId);
        curso.setNotificaciones(notificacionService.getNotificacionPorCurso(cursoId));
        curso.setGrupoAlumno(grupoService.getGrupoForCursoAlumno(cursoId, usuario.getIdAluDoc()));
        List<VwArchivo> archivos = archivoService.getArchivosDelCurso(cursoId);
               
        return new ModelAndView("verCursoAlumno").addObject("curso", curso).addObject("archivos", archivos);
    }

    @RequestMapping(value = "alumno/solicitarCurso", method = {RequestMethod.GET})
    public ModelAndView solicitarCurso(@ModelAttribute("login") UsuarioRol usuario) {
        List<CursoMateria> cursos = cursoService.getCursosMateriaDisponiblesParaAlumno(usuario.getIdAluDoc());
        return new ModelAndView("solicitarCurso").addObject("cursosMaterias", cursos);
    }

    @RequestMapping(value = "alumno/bajaCurso", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public void bajaCurso(@RequestParam(value = "cursoId", required = true) Long cursoId, @ModelAttribute("login") UsuarioRol usuario) {
    	cursoService.bajaCursoAlumno(cursoId, usuario.getIdAluDoc());
    	
    }

    @RequestMapping(value = "docente/verCursos", method = {RequestMethod.GET})
    public ModelAndView verCursosDocente(HttpServletRequest request, @ModelAttribute("login") UsuarioRol usuario) {
        List<CursoMateria> cursos = cursoService.getCursosMateriaDisponiblesParaDocente(usuario.getIdAluDoc());

        return new ModelAndView("verCursosDocente").addObject("cursosMaterias", cursos);
    }

    @RequestMapping(value = "docente/verCurso", method = {RequestMethod.GET})
    public ModelAndView verCursoDocente(HttpServletRequest request, @RequestParam("cursoId") Long cursoId) {

        Curso curso = cursoService.getById(cursoId);
        List<NotificacionTO> notificaciones = notificacionService.getNotificacionPorCurso(curso.getId());
        curso.setNotificaciones(notificaciones);

        List<Grupo> grupos = grupoService.getGruposForCurso(curso.getId());
        curso.setGrupos(grupos);

        List<AlumnoTO> alumnos = alumnoService.getAlumnosForCurso(curso.getId());

        List<AlumnoTO> alumnosSinGrupo = alumnoService.getAlumnosForCursoSinGrupo(curso.getId());

        curso.setAlumnos(alumnos);
        curso.setAlumnosSinGrupo(alumnosSinGrupo);
        
        List<VwArchivo> archivos = archivoService.getArchivosDelCurso(cursoId);

        return new ModelAndView("verCursoDocente").addObject("curso", curso).addObject("archivos", archivos);
    }

    @RequestMapping(value = "docente/crearGrupo", method = {RequestMethod.POST})
	@ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Grupo crearGrupo(@RequestParam(value = "idcurso", required = true) Long idCurso,
            @RequestParam(value = "alumnosIds", required = true) Long[] listaAlumnoId, @RequestParam(value = "nombre", required = true) String nombre) {
        
        return grupoService.crearGrupo(idCurso, listaAlumnoId, nombre);
    }

    @RequestMapping(value = "docente/verGrupo", method = {RequestMethod.GET})
    public ModelAndView verGrupoDocente(HttpServletRequest request, @RequestParam("grupoId") Long grupoId) {
        GrupoTO grupo = grupoService.getGrupoById(grupoId);

        List<AlumnoTO> alumnosSinGrupo = alumnoService.getAlumnosForCursoSinGrupo(grupo.getIdCurso());

        grupo.setAlumnosSinGrupo(alumnosSinGrupo);

        return new ModelAndView("verGrupoDocente").addObject("grupo", grupo);
    }
    
    @RequestMapping(value = "docente/alumnosSinGrupo", method = {RequestMethod.GET})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public List<AlumnoTO> alumnosSinGrupo(HttpServletRequest request, @RequestParam("grupoId") Long grupoId) {
    	GrupoTO grupo = grupoService.getGrupoById(grupoId);
    	
        return alumnoService.getAlumnosForCursoSinGrupo(grupo.getIdCurso());
    }
    
    @RequestMapping(value = "alumno/verGrupo", method = {RequestMethod.GET})
    public ModelAndView verGrupoAlumno(HttpServletRequest request, @RequestParam("grupoId") Long grupoId) {
        GrupoTO grupo = grupoService.getGrupoById(grupoId);

    //    List<AlumnoTO> alumnosSinGrupo = alumnoService.getAlumnosForCursoSinGrupo(grupo.getIdCurso());

        //grupo.setAlumnosSinGrupo(alumnosSinGrupo);

        return new ModelAndView("verGrupoAlumno").addObject("grupo", grupo);
    }
}

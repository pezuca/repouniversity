package com.repouniversity.web.controller;

import java.util.Arrays;
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

import com.repouniversity.model.entity.Carrera;
import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.Materia;
import com.repouniversity.model.entity.Usuario;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.CarreraTO;
import com.repouniversity.model.entity.to.CursoTO;
import com.repouniversity.model.entity.to.DocenteTO;
import com.repouniversity.model.entity.to.UsuarioTO;
import com.repouniversity.model.services.AlumnoService;
import com.repouniversity.model.services.CarreraService;
import com.repouniversity.model.services.CursoService;
import com.repouniversity.model.services.DocenteService;
import com.repouniversity.model.services.MateriaService;
import com.repouniversity.model.services.PersonaService;
import com.repouniversity.model.services.UsuarioRolService;
import com.repouniversity.model.services.UsuarioService;

@Controller
public class AdministradorController {

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

    @Autowired
    public CarreraService carreraService;

    @RequestMapping(value = "admin/verUsuarios", method = {RequestMethod.GET})
    public ModelAndView getUsuarios() {

        List<UsuarioTO> listaUsuarios = usuarioService.getAll();
        return new ModelAndView("verUsuariosAdmin").addObject("usuarios", listaUsuarios);
    }

    @RequestMapping(value = "admin/verCursos", method = {RequestMethod.GET})
    public ModelAndView getCursos() {

        List<CursoTO> listaCurso = cursoService.getAll();
        List<DocenteTO> listaDocentes = docenteService.getAll();
        List<Materia> listamaterias = materiaService.getAll();

        return new ModelAndView("verCursosAdmin").addObject("cursos", listaCurso).addObject("docentes", listaDocentes).addObject("materias", listamaterias);
    }

    @RequestMapping(value = "admin/verMaterias", method = {RequestMethod.GET})
    public ModelAndView getMaterias() {

        List<Materia> listaMaterias = materiaService.getAll();

        return new ModelAndView("admin-panel/verMateriasAdmin").addObject("materias", listaMaterias);
    }

    @RequestMapping(value = "admin/verCarreras", method = {RequestMethod.GET})
    public ModelAndView getCarreras() {

        List<Carrera> listaCarreras = carreraService.getAll();
        List<Materia> listaMaterias = materiaService.getAll();

        return new ModelAndView("admin-panel/verCarrerasAdmin").addObject("carreras", carreraService.buildCarreras(listaCarreras)).addObject("materias",
            listaMaterias);
    }

    /**
     * AMB de Usuarios
     */
    @RequestMapping(value = "admin/nuevoUsuario", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public UsuarioTO crearUsuarioAjax(@RequestParam(value = "nombre") String nombre, @RequestParam(value = "apellido") String apellido,
            @RequestParam(value = "mail") String mail, @RequestParam(value = "user") String user, @RequestParam(value = "password") String password,
            @RequestParam(value = "rol") String rol) {

        Usuario usuario = usuarioService.saveUser(nombre, apellido, mail, user, password, rol);

        UsuarioTO usuarioTo = usuarioService.getUserById(usuario.getId());

        return usuarioTo;
    }

    @RequestMapping(value = "admin/editarUsuario", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public UsuarioTO editarUsuarioAjax(@RequestParam(value = "userId") Long userId, @RequestParam(value = "nombre") String nombre,
            @RequestParam(value = "apellido") String apellido, @RequestParam(value = "mail") String mail, @RequestParam(value = "user") String user,
            @RequestParam(value = "password") String password) {

        Usuario usuario = usuarioService.updateUser(userId, nombre, apellido, mail, user, password, password);

        UsuarioTO usuarioTo = usuarioService.getUserById(usuario.getId());
        return usuarioTo;
    }

    @RequestMapping(value = "admin/eliminarUsuario", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public void deleteUsuarioAjax(@RequestParam(value = "userId") Long userId) {
        UsuarioRol usuarioRol = usuarioRolService.getUsuarioById(userId);

        usuarioService.completelyDeleteUsuario(usuarioRol);
    }

    /**
     * AMB de Materias
     */
    @RequestMapping(value = "admin/nuevoMateria", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Materia crearMateriaAjax(@RequestParam(value = "nombre") String nombre, @RequestParam(value = "descripcion") String descripcion) {

        return materiaService.save(nombre, descripcion);
    }

    @RequestMapping(value = "admin/editarMateria", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public Materia editarMateriaAjax(@RequestParam(value = "materiaId") Long materiaId, @RequestParam(value = "nombre") String nombre,
            @RequestParam(value = "descripcion") String descripcion) {

        return materiaService.update(materiaId, nombre, descripcion);
    }

    @RequestMapping(value = "admin/eliminarMateria", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public void deleteMateriaAjax(@RequestParam(value = "materiaId") Long materiaId) {
        materiaService.delete(materiaId);
    }

    /**
     * AMB de Cursos
     */
    @RequestMapping(value = "admin/eliminarCurso", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public void deleteCursoAjax(@RequestParam(value = "cursoId") Long cursoId) {
        cursoService.delete(cursoId);
    }

    @RequestMapping(value = "admin/nuevoCurso", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public CursoTO crearCursoAjax(@RequestParam(value = "nombre") String nombre, @RequestParam(value = "descripcion") String descripcion,
            @RequestParam(value = "codigo") String codigo, @RequestParam(value = "materia") Long materiaId, @RequestParam(value = "docente") Long docenteId) {

        Curso curso = cursoService.save(nombre, descripcion, codigo, materiaId, docenteId);

        return cursoService.buildCurso(curso);
    }

    @RequestMapping(value = "admin/editarCurso", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public CursoTO editarCursoAjax(@RequestParam(value = "cursoId") Long cursoId, @RequestParam(value = "nombre") String nombre,
            @RequestParam(value = "descripcion") String descripcion, @RequestParam(value = "codigo") String codigo,
            @RequestParam(value = "materia") Long materiaId, @RequestParam(value = "docente") Long docenteId) {

        Curso curso = cursoService.update(cursoId, nombre, descripcion, codigo, materiaId, docenteId);
        return cursoService.buildCurso(curso);
    }

    /**
     * AMB de Carreras
     */
    @RequestMapping(value = "admin/eliminarCarrera", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public void deleteCarreraAjax(@RequestParam(value = "carreraId") Long carreraId) {
        carreraService.delete(carreraId);
    }

    @RequestMapping(value = "admin/nuevoCarrera", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public CarreraTO crearCarreraAjax(@RequestParam(value = "nombre") String nombre, @RequestParam(value = "materias") Long[] listaMaterias) {

        Carrera carrera = carreraService.save(nombre);

        carreraService.asociarMateriasCarreras(carrera.getId(), Arrays.asList(listaMaterias));

        return carreraService.buildCarrera(carrera);
    }

    @RequestMapping(value = "admin/editarCarrera", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public CarreraTO editarCursoAjax(@RequestParam(value = "carreraId") Long carreraId, @RequestParam(value = "nombre") String nombre,
            @RequestParam(value = "materias") Long[] listaMaterias) {

        Carrera carrera = carreraService.update(carreraId, nombre);

        carreraService.removerAsociacionesMaterias(carrera.getId());
        carreraService.asociarMateriasCarreras(carrera.getId(), Arrays.asList(listaMaterias));

        return carreraService.buildCarrera(carrera);
    }
}

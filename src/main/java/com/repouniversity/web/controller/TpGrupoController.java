package com.repouniversity.web.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.disk.DiskFileItem;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.TpEntregaTO;
import com.repouniversity.model.entity.to.TpGrupoTO;
import com.repouniversity.model.services.AlumnoService;
import com.repouniversity.model.services.ArchivoService;
import com.repouniversity.model.services.CursoService;
import com.repouniversity.model.services.DocenteService;
import com.repouniversity.model.services.GrupoService;
import com.repouniversity.model.services.TpGrupoService;

@Controller
@SessionAttributes("login")
public class TpGrupoController {

	@Autowired
	private CursoService cursoService;

	@Autowired
	private DocenteService docenteService;

	@Autowired
	private GrupoService grupoService;

	@Autowired
	private TpGrupoService tpGrupoService;
	
	@Autowired
	private AlumnoService alumnoService;

	@Autowired
	private ArchivoService archivoService;
	
	@RequestMapping(value = "grupo/nuevoTp", method = { RequestMethod.POST })
	@ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
	public TpGrupoTO nuevoTpAjax(
			@RequestParam(value = "grupoId", required = false) Long grupoId,
			@RequestParam(value = "descripcion", required = false) String descripcion,
			@RequestParam(value = "file", required = false) CommonsMultipartFile[] file,
			@RequestParam(value = "cursoId", required = false) Long cursoId, 
			@ModelAttribute("login") UsuarioRol usuario) throws IOException {
		
		//abria q convertir el file a commons multi file para que funcione bien
		//    DiskFileItem fileItem = new DiskFileItem("file", "text/plain", false, file.getName(), (int) file.length() , file.getParentFile());
		 //   fileItem.getOutputStream();
		  //  CommonsMultipartFile multipartFile = new CommonsMultipartFile();
		   // multipartFile[0].
		    //(fileItem);
				
		return tpGrupoService.nuevoTp(grupoId, descripcion, file, cursoId, usuario);
		

	}
	@RequestMapping(value = "grupo/editarTp", method = { RequestMethod.POST })
	@ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
	public TpGrupoTO editarTpAjax(
			@RequestParam(value = "grupoId", required = true) Long grupoId,
			@RequestParam(value = "tpId", required = true) Long tpId,
			@RequestParam(value = "descripcion", required = true) String descripcion,
			@RequestParam(value = "nota", required = true) String nota) {

	return	tpGrupoService.editarTp(grupoId, tpId, descripcion, nota);
		

	}
	
	@RequestMapping(value = "grupo/eliminarTp", method = { RequestMethod.POST })
	@ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
	public void eliminarTpAjax(
			@RequestParam(value = "tpId", required = true) Long tpId) {

		tpGrupoService.eliminarTp(tpId);
		

	}
	
	  @RequestMapping(value = "grupo/verTrabajosPracticos", method = {RequestMethod.GET})
	    public ModelAndView verTrabajosPracticos(HttpServletRequest request, @RequestParam("tpGrupoId") Long tpGrupoId) {
	        TpGrupoTO tpgrupo = tpGrupoService.getTpGrupoById(tpGrupoId);

	        return new ModelAndView("verTpGrupoDocente").addObject("tpgrupo", tpgrupo);
	    }

	  @RequestMapping(value = "grupo/verTrabajosPracticosAlumno", method = {RequestMethod.GET})
	    public ModelAndView verTrabajosPracticosAlumno(HttpServletRequest request, @RequestParam("tpGrupoId") Long tpGrupoId) {
		  TpGrupoTO tpgrupo = tpGrupoService.getTpGrupoById(tpGrupoId);

	        return new ModelAndView("verTpGrupoAlumno").addObject("tpgrupo", tpgrupo);
	    }
}

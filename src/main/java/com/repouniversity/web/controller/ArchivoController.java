package com.repouniversity.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.Archivo;
import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.services.ArchivoService;
import com.repouniversity.model.services.PersonaService;
import com.repouniversity.web.exceptions.SubirArchivoException;

@Controller
@SessionAttributes("login")
public class ArchivoController {

	@Autowired
	private ArchivoService archivoService;

	@Autowired
	private PersonaService personaService;

	/**
	 * @param request
	 * @return Model and View for loginAnonimo
	 */
	@RequestMapping(value = "/subirArchivo", method = { RequestMethod.GET })
	public ModelAndView subirArchivo(HttpServletRequest request) {
		return new ModelAndView("subirArchivo");
	}

	@RequestMapping(value = "/subirArchivo", method = { RequestMethod.POST })
	@ResponseBody
	@ResponseStatus(value = HttpStatus.OK)
	public void guardaFichero(
			HttpServletRequest request,
			@RequestParam(value = "file[]") CommonsMultipartFile[] file,
			@RequestParam(value = "mytext", required = false) String[] myText,
			@RequestParam(value = "descripcion", required = false) String descripcion,
			@ModelAttribute("login") UsuarioRol usuario) {

		try {
			grabarFicheroALocal(file, myText, descripcion, usuario);
		} catch (Exception e) {
			throw new SubirArchivoException(
					"Ha ocurrido un error al intentar subir el archivo.", e);
		}
	}

	private void grabarFicheroALocal(CommonsMultipartFile[] file,
			String[] mytext, String descripcion, UsuarioRol usuario) {
		StringBuffer etiqueta = new StringBuffer();

		// AGREGO LAS ETIQUETAS AL CAMPO ETIQUETAS PARA LUEGO SUBIR A LA BASE
		// ASOCIADAS AL ARCHIVO

		for (int i = 0; i < mytext.length; i++) {
			etiqueta.append(mytext[i] + ";");
		}

		// AGREGO LOS ARCHIVOS Y LOS SUBO A LA CARPETA DEL SERVER.
		for (int i = 0; i < file.length; i++) {
			File localFile = new File("C:/Archivos/" + (new Date()).getTime()
					+ file[i].getOriginalFilename());
			FileOutputStream os = null;
			try {
				// GUARDO LOS ARCHIVOS EN LA CARPETA
				os = new FileOutputStream(localFile);
				os.write(file[i].getBytes());

				// AGEGO LAS ETIQUETAS AL ARCHIVO Y GUARDO EN LA BASE EL NOMBRE
				// DEL ARCHIVO
				Archivo nuevoArchivo = new Archivo();
				nuevoArchivo.setNombre(file[i].getOriginalFilename());
				nuevoArchivo.setDescripcion(descripcion);
				nuevoArchivo.setFechaDespublicacion(null);
				nuevoArchivo.setFechaPublicacion(null);
				nuevoArchivo.setId(null);
				nuevoArchivo.setFechasys(null);
				nuevoArchivo.setEstado(null);
				nuevoArchivo.setPath(localFile.getAbsolutePath());

				nuevoArchivo.setPersona(personaService.findById(usuario
						.getIdPersona()));
				nuevoArchivo.setTags(etiqueta.toString());
				nuevoArchivo.setCurso(new Curso());

				nuevoArchivo.getCurso().setId(1L);
				archivoService.subirArchivo(nuevoArchivo);

			} catch (Exception e) {
				System.out.println(e);
			} finally {
				if (os != null) {
					try {
						os.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}

	}
}

package com.repouniversity.model.services;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.UsuarioParametroDAO;
import com.repouniversity.model.entity.Parametro;
import com.repouniversity.model.entity.UsuarioParametro;
import com.repouniversity.model.entity.to.UsuarioParametroTO;

@Service
public class UsuarioParametroService {

    @Autowired
    private UsuarioParametroDAO usuarioParametroDAO;

    @Autowired
    private PersonaService personaService;

    @Autowired
    private ParametroService parametroService;

    @Autowired
    private ColorService colorService;

    @Autowired
    private UsuarioRolService usuarioRolService;

    

    public UsuarioParametroTO getUsuarioParametroById(Long usuarioParametroId) {
    	UsuarioParametro usuarioParametro = usuarioParametroDAO.findById(usuarioParametroId);

        return buildUsuarioParametro(usuarioParametro);
    }

    private UsuarioParametroTO buildUsuarioParametro(UsuarioParametro usuarioParametroId) {
      
    	UsuarioParametroTO usuarioParametroTO = new UsuarioParametroTO();
        
    	usuarioParametroTO.setId(usuarioParametroId.getId());
    	usuarioParametroTO.setUsuario(usuarioParametroId.getUsuario());
    	usuarioParametroTO.setFechasys(usuarioParametroId.getFechasys());
    	usuarioParametroTO.setActivo(usuarioParametroId.isActivo());
    	usuarioParametroTO.setParametro(parametroService.getParametroById(usuarioParametroId.getParametro()));
    	usuarioParametroTO.setOrden(usuarioParametroId.getOrden());
    	usuarioParametroTO.setColor(colorService.getColorById(usuarioParametroId.getColor()));
        
        return usuarioParametroTO;

    }
    
    public List<UsuarioParametroTO> getUsuarioParametroforUsuario(Long usuarioId) {
        List<UsuarioParametroTO> usuarioParametroList = new ArrayList<UsuarioParametroTO>();

        for (UsuarioParametro usuarioParametro : usuarioParametroDAO.findUsuarioParametroforUsuario(usuarioId)) {
        	usuarioParametroList.add(buildUsuarioParametro(usuarioParametro));
        }

        return usuarioParametroList;
    }
    
    
    
    public List<UsuarioParametroTO> getUsuarioParametroActivoforUsuario(Long usuarioId) {
        List<UsuarioParametroTO> usuarioParametroList = new ArrayList<UsuarioParametroTO>();
        List<UsuarioParametro> usuarioParametroLi = usuarioParametroDAO.findUsuarioParametroActivoforUsuario(usuarioId);
        
        Collections.sort(usuarioParametroLi);
        
        for (UsuarioParametro usuarioParametro : usuarioParametroLi) {
        	usuarioParametroList.add(buildUsuarioParametro(usuarioParametro));
        }

        return usuarioParametroList;
    }
    

    public List<UsuarioParametroTO> getAll() {
        List<UsuarioParametroTO> usuarioParametroList = new ArrayList<UsuarioParametroTO>();

        for (UsuarioParametro usuarioParametro : usuarioParametroDAO.findAll()) {
        	usuarioParametroList.add(buildUsuarioParametro(usuarioParametro));
        }

        return usuarioParametroList;
    }
    
    public void eliminarParametro(Long idusuario) {
        
    	usuarioParametroDAO.eliminarParametro(idusuario);
        
    }
    
    private void delete(Long userParamId) {
      
    	UsuarioParametro usuarioParametro = usuarioParametroDAO.findById(userParamId);
    	usuarioParametroDAO.delete(usuarioParametro);
        
    }

	public UsuarioParametroTO editarParametro(Long userParamId, Long orden, Long color, boolean activo) {
		UsuarioParametro usuarioParametro = usuarioParametroDAO.findById(userParamId);
		usuarioParametro.setOrden(orden);
		usuarioParametro.setColor(color);
		usuarioParametro.setActivo(activo);
		
		usuarioParametroDAO.update(usuarioParametro);
				
		return buildUsuarioParametro(usuarioParametroDAO.findById(userParamId));
	}

	public void crearParametro(Long userId, Long roleId) {
		
		Long i = 1L;
		List<Parametro> parametros = parametroService.getParametrosByRole(roleId);
		
		for (Parametro parametro : parametros) {
			UsuarioParametro usuarioParametro = new UsuarioParametro();
			
			usuarioParametro.setUsuario(userId);
			usuarioParametro.setParametro(parametro.getId());
			usuarioParametro.setOrden(i);
			usuarioParametro.setColor(1L);
			usuarioParametro.setActivo(true);
			
			usuarioParametroDAO.insert(usuarioParametro);
			
			i++;
		
		}
	
	}
	
    
}

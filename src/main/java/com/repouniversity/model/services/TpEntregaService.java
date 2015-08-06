package com.repouniversity.model.services;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.repouniversity.model.dao.GrupoDAO;
import com.repouniversity.model.dao.TpEntregaDAO;
import com.repouniversity.model.dao.TpGrupoDAO;
import com.repouniversity.model.entity.Archivo;
import com.repouniversity.model.entity.Grupo;
import com.repouniversity.model.entity.TpEntrega;
import com.repouniversity.model.entity.TpGrupo;
import com.repouniversity.model.entity.UsuarioRol;
import com.repouniversity.model.entity.to.TpEntregaTO;
import com.repouniversity.model.entity.to.TpGrupoTO;

@Service
public class TpEntregaService {

    @Autowired
    private GrupoDAO grupoDao;
    @Autowired
    private TpGrupoDAO tpGrupoDao;
    @Autowired
    private TpEntregaDAO tpEntregaDao;

    @Autowired
    private AlumnoService alumnoService;
    
    @Autowired
    private GrupoService grupoService;
    
    @Autowired
    private TpGrupoService tpGrupoService;
    
    @Autowired
    private ArchivoService archivoService;

    public TpEntrega save(TpEntrega tpEntrega) {
        return tpEntregaDao.insert(tpEntrega);
    }

    public TpEntregaTO nuevoEntregaTp(Long tpGrupoId, String descripcion, CommonsMultipartFile[] file, UsuarioRol usuario) throws IOException {
        String[] tags = null;

        Long cursoId = tpGrupoService.getIdCursoForTpGrupo(tpGrupoId);

        List<Archivo> nuevoArchivo = archivoService.parseArchivo(file, tags, descripcion, cursoId, tpGrupoId, false, usuario);
        List<Archivo> elArchivo = archivoService.subirArchivo(nuevoArchivo);

        TpEntrega tpEntrega = new TpEntrega();
    	tpEntrega.setIdTpGrupo(tpGrupoId);
    	tpEntrega.setDescripcion(descripcion);
    	tpEntrega.setIdArchivo(elArchivo.get(0).getId());
       	tpEntrega.setActivo(true);
    	
    	tpEntrega = save(tpEntrega);
    	return buildTpEntrega(tpEntrega);

    }

    

   
    public TpEntregaTO editarEntregaTp(Long tpGrupoId, Long tpEntregaId, String descripcion, Long archivoId) {
		// TODO Auto-generated method stub
    	TpEntrega tpEntrega = new TpEntrega();

    	tpEntrega.setIdTpGrupo(tpGrupoId);
    	tpEntrega.setId(tpEntregaId);
    	tpEntrega.setDescripcion(descripcion);
    	tpEntrega.setIdArchivo(archivoId);
    	tpEntrega.setActivo(true);
    	tpEntregaDao.update(tpEntrega);
    	
    	return buildTpEntrega(tpEntrega);
	}
	public void eliminarEntregaTp(Long tpEntregaId) {
		// TODO Auto-generated method stub
		tpEntregaDao.delete(tpEntregaDao.findById(tpEntregaId));
	}
   
   

    public TpEntregaTO getTpEntregaById(Long tpEntregaId) {
    	TpEntrega tpEntrega = tpEntregaDao.findById(tpEntregaId);
        
    	TpEntregaTO tpEntregaTo = buildTpEntrega(tpEntrega);

        return tpEntregaTo;
    }

    private TpEntregaTO buildTpEntrega(TpEntrega tpEntrega) {
    	TpEntregaTO tpEntregaTo = new TpEntregaTO();

              
    	tpEntregaTo.setId(tpEntrega.getId());
    	tpEntregaTo.setDescripcion(tpEntrega.getDescripcion());
    	tpEntregaTo.setActivo(tpEntrega.isActivo());
    	tpEntregaTo.setFechasys(tpEntrega.getFechasys());
        //tpGrupoTo.setGrupo(grupoService.getGrupoById(tpGrupo.getIdGrupo()));
    	tpEntregaTo.setTpGrupo(tpEntrega.getIdTpGrupo());
    	tpEntregaTo.setArchivo(tpEntrega.getIdArchivo());
       
        return tpEntregaTo;
    }

 
	public List<TpEntregaTO> getTpEntregaForTpGrupo(Long tpGrupoid) {
		
        List<TpEntregaTO> tpEntregaToList = new ArrayList<TpEntregaTO>();
        List<TpEntrega> tpEntregaList = tpEntregaDao.findTpEntregaForTpGrupo(tpGrupoid);
        
        for (TpEntrega tpEntrega : tpEntregaList) {
        	tpEntregaToList.add(buildTpEntrega(tpEntrega));
        }
        
        return tpEntregaToList;
	}



}

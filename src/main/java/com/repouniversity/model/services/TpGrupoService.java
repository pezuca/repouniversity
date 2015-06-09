package com.repouniversity.model.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.GrupoDAO;
import com.repouniversity.model.dao.TpGrupoDAO;
import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Grupo;
import com.repouniversity.model.entity.TpGrupo;
import com.repouniversity.model.entity.to.AlumnoTO;
import com.repouniversity.model.entity.to.TpGrupoTO;

@Service
public class TpGrupoService {

    @Autowired
    private GrupoDAO grupoDao;
    @Autowired
    private TpGrupoDAO tpGrupoDao;

    @Autowired
    private AlumnoService alumnoService;
    
    @Autowired
    private GrupoService grupoService;
    @Autowired
    private TpEntregaService tpEntregaService;

    public TpGrupo save(TpGrupo tpGrupo) {
        return tpGrupoDao.insert(tpGrupo);
    }

    public TpGrupoTO nuevoTp(Long grupoId, String descripcion, Long archivoId, Long nota) {
        
    	TpGrupo tpGrupo = new TpGrupo();
    	tpGrupo.setIdGrupo(grupoId);
    	tpGrupo.setDescripcion(descripcion);
    	tpGrupo.setIdArchivo(archivoId);
    	tpGrupo.setNota(nota);
    	tpGrupo.setActivo(true);
    	
    	tpGrupo = save(tpGrupo);
    	return buildTpGrupo(tpGrupo);

      //  saveGrupoAlumnoCurso(grupo.getId(), cursoId, alumnos);
    }

   
	public TpGrupoTO editarTp(Long grupoId, Long tpId, String descripcion, Long archivoId, Long nota) {
		// TODO Auto-generated method stub
		TpGrupo tpGrupo = new TpGrupo();

		tpGrupo.setIdGrupo(grupoId);
		tpGrupo.setId(tpId);
    	tpGrupo.setDescripcion(descripcion);
    	tpGrupo.setIdArchivo(archivoId);
    	tpGrupo.setNota(nota);
    	tpGrupo.setActivo(true);
    	tpGrupoDao.update(tpGrupo);
    	
    	return buildTpGrupo(tpGrupo);
	}
	public void eliminarTp(Long tpId) {
		// TODO Auto-generated method stub
		tpGrupoDao.delete(tpGrupoDao.findById(tpId));
	}
	
    public TpGrupoTO getTpGrupoById(Long tpGrupoId) {
    	TpGrupo tpGrupo = tpGrupoDao.findById(tpGrupoId);
        
        TpGrupoTO tpGrupoTo = buildTpGrupo(tpGrupo);

        return tpGrupoTo;
    }

    private TpGrupoTO buildTpGrupo(TpGrupo tpGrupo) {
        TpGrupoTO tpGrupoTo = new TpGrupoTO();

              
        tpGrupoTo.setId(tpGrupo.getId());
        tpGrupoTo.setDescripcion(tpGrupo.getDescripcion());
        tpGrupoTo.setActivo(tpGrupo.isActivo());
        tpGrupoTo.setFechasys(tpGrupo.getFechasys());
        //tpGrupoTo.setGrupo(grupoService.getGrupoById(tpGrupo.getIdGrupo()));
        tpGrupoTo.setGrupo(tpGrupo.getIdGrupo());
        tpGrupoTo.setArchivo(tpGrupo.getIdArchivo());
        tpGrupoTo.setNota(tpGrupo.getNota());
        tpGrupoTo.setTpEntrega(tpEntregaService.getTpEntregaForTpGrupo(tpGrupo.getId()));
        return tpGrupoTo;
    }

 
	public List<TpGrupoTO> getTpGrupoForGrupo(Long grupoid) {
		
        List<TpGrupoTO> tpGrupoToList = new ArrayList<TpGrupoTO>();
        List<TpGrupo> tpGrupoList = tpGrupoDao.findTpGrupoForGrupo(grupoid);
        
        for (TpGrupo tpGrupo : tpGrupoList) {
        	tpGrupoToList.add(buildTpGrupo(tpGrupo));
        }
        
        return tpGrupoToList;
	}






}

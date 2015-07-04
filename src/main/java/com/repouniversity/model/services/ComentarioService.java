package com.repouniversity.model.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.ComentarioDAO;
import com.repouniversity.model.dao.GrupoDAO;
import com.repouniversity.model.dao.TpGrupoDAO;
import com.repouniversity.model.entity.Comentario;
import com.repouniversity.model.entity.to.ComentarioTO;

@Service
public class ComentarioService {

    @Autowired
    private GrupoDAO grupoDao;
    @Autowired
    private TpGrupoDAO tpGrupoDao;

    @Autowired
    private ComentarioDAO comentarioDao;

    @Autowired
    private AlumnoService alumnoService;

    @Autowired
    private GrupoService grupoService;
    @Autowired
    private TpEntregaService tpEntregaService;

    @Autowired
    private ArchivoService archivoService;


    private ComentarioTO buildComentario(Comentario comentario) {
    	ComentarioTO comentarioTO = new ComentarioTO();

    	comentarioTO.setId(comentario.getId());
    	comentarioTO.setDescripcion(comentario.getDescripcion());
    	comentarioTO.setActivo(comentario.isActivo());
    	comentarioTO.setFechasys(comentario.getFechasys());
        // tpGrupoTo.setGrupo(grupoService.getGrupoById(tpGrupo.getIdGrupo()));
    	comentarioTO.setIdPersona(comentario.getIdPersona());
    
        return comentarioTO;
    }

    public List<ComentarioTO> getComentariosForTpGrupo(Long tpGrupoId) {

        List<ComentarioTO> comentarioTOList = new ArrayList<ComentarioTO>();
        List<Comentario> comentarioList = comentarioDao.findComentariosForTpGrupo(tpGrupoId);

        for (Comentario comentario : comentarioList) {
        	comentarioTOList.add(buildComentario(comentario));
        }

        return comentarioTOList;
    }
    public Long getIdCursoForTpGrupo(long idTpGrupo) {

        return tpGrupoDao.findIdCursoForTpGrupo(idTpGrupo);
    } 

}

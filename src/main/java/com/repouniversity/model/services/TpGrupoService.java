package com.repouniversity.model.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.GrupoDAO;
import com.repouniversity.model.dao.TpGrupoDAO;
import com.repouniversity.model.entity.Grupo;
import com.repouniversity.model.entity.TpGrupo;
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

    public Grupo save(Grupo grupo) {
        return grupoDao.insert(grupo);
    }

    public void crearGrupo(Long cursoId, Long[] alumnos, String nombre) {
        Grupo grupo = new Grupo();

        grupo.setNombre(nombre);
        grupo.setActivo(true);

        grupo = save(grupo);

      //  saveGrupoAlumnoCurso(grupo.getId(), cursoId, alumnos);
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
        tpGrupoTo.setGrupo(grupoService.getGrupoById(tpGrupo.getIdGrupo()));
        tpGrupoTo.setArchivo(tpGrupo.getIdArchivo());
        return tpGrupoTo;
    }

    public List<Grupo> getGruposForCurso(Long idCurso) {
        List<Grupo> grupos = grupoDao.findGruposByCurso(idCurso);
//        List<GrupoTO> gruposTo = new ArrayList<GrupoTO>();
//        
//        for (Grupo grupo : grupos) {
//            gruposTo.add(buildGrupo(grupo));
//        }
        
        return grupos;
    }
}

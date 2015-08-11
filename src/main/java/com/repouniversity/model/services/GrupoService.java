package com.repouniversity.model.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.CursoDAO;
import com.repouniversity.model.dao.GrupoDAO;
import com.repouniversity.model.entity.Grupo;
import com.repouniversity.model.entity.to.GrupoTO;

@Service
public class GrupoService {

    @Autowired
    private GrupoDAO grupoDao;

    @Autowired
    private CursoDAO cursoDao;

    @Autowired
    private AlumnoService alumnoService;

    @Autowired
    private TpGrupoService tpGrupoService;

    public Grupo save(Grupo grupo) {
        return grupoDao.insert(grupo);
    }

    public Grupo crearGrupo(Long cursoId, Long[] alumnos, String nombre) {
        Grupo grupo = new Grupo();

        grupo.setNombre(nombre);
        grupo.setActivo(true);

        grupo = save(grupo);

        saveGrupoAlumnoCurso(grupo.getId(), cursoId, alumnos);
        return grupoDao.findById(grupo.getId());
    }

    private void saveGrupoAlumnoCurso(Long grupoId, Long cursoId, Long[] alumnos) {
        for (Long alumnoId : alumnos) {
            cursoDao.saveAlumnoCursoGrupo(grupoId, cursoId, alumnoId);
        }
    }

    /*
     * public void crearGrupo(Alumno alumno, Curso curso, String nombreGrupo) {
     * Notificacion nuevaNoti = new Notificacion();
     * nuevaNoti.setAlumno(alumno);
     * nuevaNoti.setCurso(curso);
     * nuevaNoti.setDocente(docente);
     * // Id de notificacion tipo 3 es solicitud confirmada
     * nuevaNoti.setTipo(tipoNotificacionService.getTipoNotificacionById(tipoNotificacion));
     * notificacionDao.saveOrUpdate(nuevaNoti);
     * }
     */

    public GrupoTO getGrupoById(Long grupoId) {
        Grupo grupo = grupoDao.findById(grupoId);

        GrupoTO grupoTo = buildGrupo(grupo);

        return grupoTo;
    }

    public Long getIdCursoForGrupo(long idGrupo) {

        return grupoDao.findIdCursoForGrupo(idGrupo);
    }

    private GrupoTO buildGrupo(Grupo grupo) {
        GrupoTO grupoTo = new GrupoTO();

        grupoTo.setId(grupo.getId());
        grupoTo.setNombre(grupo.getNombre());
        grupoTo.setActivo(grupo.isActivo());
        grupoTo.setFechasys(grupo.getFechasys());
        grupoTo.setAlumnos(alumnoService.getAlumnosForGrupo(grupo.getId()));
        grupoTo.setTpGrupo(tpGrupoService.getTpGrupoForGrupo(grupo.getId()));
        grupoTo.setIdCurso(getIdCursoForGrupo(grupo.getId()));
        return grupoTo;
    }

    public List<Grupo> getGruposForCurso(Long idCurso) {
        List<Grupo> grupos = grupoDao.findGruposByCurso(idCurso);
        // List<GrupoTO> gruposTo = new ArrayList<GrupoTO>();
        //
        // for (Grupo grupo : grupos) {
        // gruposTo.add(buildGrupo(grupo));
        // }

        return grupos;
    }
    public GrupoTO getGrupoForCursoAlumno(Long idCurso, Long idAlumno) {
        List<Grupo> grupos = grupoDao.findGrupoByCursoAlumno(idCurso, idAlumno);
         List<GrupoTO> gruposTo = new ArrayList<GrupoTO>();
        
         for (Grupo grupo : grupos) {
         gruposTo.add(buildGrupo(grupo));
         }

        return gruposTo.get(0);
    }
    public GrupoTO agregarAlumnosGrupo(Long idGrupo, Long[] listaAlumnoId) {
        // TODO Auto-generated method stub

        saveGrupoAlumnoCurso(idGrupo, getGrupoById(idGrupo).getIdCurso(), listaAlumnoId);

        return getGrupoById(idGrupo);
    }

    public void eliminarAlumno(Long alumnoId, Long cursoId) {
        // TODO Auto-generated method stub
        cursoDao.saveAlumnoCursoGrupo(1L, cursoId, alumnoId);
    }
    
    public List<GrupoTO> getGruposDeAlumno(long idAlumno) {

        List<Grupo> grupos = grupoDao.findGruposDeAlumno(idAlumno);
        List<GrupoTO> gruposTo = new ArrayList<GrupoTO>();
       
        for (Grupo grupo : grupos) {
        gruposTo.add(buildGrupo(grupo));
        }

        return gruposTo;

    }

	public void eliminarGrupo(Long grupoId) {
		grupoDao.delete(grupoDao.findById(grupoId));
        grupoDao.eliminarAlumnosGrupo(grupoId);
        
	}
    
}

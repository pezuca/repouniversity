package com.repouniversity.model.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.dao.CursoDAO;
import com.repouniversity.model.entity.Alumno;
import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.CursoMateria;
import com.repouniversity.model.entity.Notificacion;
import com.repouniversity.model.entity.to.AlumnoTO;

@Service
public class CursoService {

    @Autowired
    private CursoDAO cursoDao;

    @Autowired
    private AlumnoService alumnoService;
    
    @Autowired
    private DocenteService docenteService;

    @Autowired
    private GrupoService grupoService;
    
    @Autowired
    private NotificacionService notificacionService;

    public List<Curso> getAll() {
        return cursoDao.findAll();
    }

    public Curso getById(Long cursoId) {
        return cursoDao.findById(cursoId);
    }

    public List<CursoMateria> getCursosMateriaDisponiblesParaAlumno(Long alumnoId) {
        List<CursoMateria> cursoMateriaList = cursoDao.findCursosMateriaDisponiblesParaAlumno(alumnoId);
        
        for (CursoMateria cursoMateria : cursoMateriaList) {
            cursoMateria.setDocente(docenteService.getByCursoMateriaId(cursoMateria.getId()));
        }
        
        return cursoMateriaList;
    }

    public void save(Curso curso) {
        cursoDao.insert(curso);
    }

    public void registrarAlumnoACurso(Notificacion noti) {
        cursoDao.saveAlumnoCursoGrupo(noti.getAlumnoId(), noti.getCursoId(), 0L);
        
        notificacionService.insertarNotificacion(noti.getAlumnoId(), noti.getCursoId(), noti.getDocenteId(), 3L);
        
        notificacionService.remove(noti);
    }
    
    public void rechazarAlumnoACurso(Notificacion noti) {
        notificacionService.insertarNotificacion(noti.getAlumnoId(), noti.getCursoId(), noti.getDocenteId(), 4L);
        
        notificacionService.remove(noti);
    }

    public List<Curso> getCursosForAlumno(Long idAluDoc) {
        return cursoDao.findCursosForAlumnoId(idAluDoc);
    }
    
    public List<CursoMateria> getCursosMateriaDisponiblesParaDocente(Long idAluDoc) {
        List<CursoMateria> cursoMateriaList = cursoDao.findCursosForDocenteId(idAluDoc);
        
        for (CursoMateria cursoMateria : cursoMateriaList) {
            cursoMateria.setDocente(docenteService.getById(idAluDoc));
        }
        
        return cursoMateriaList;
    }

	public void completelyDeleteCurso(Curso curso) {
		cursoDao.delete(curso);
	}

	public List<AlumnoTO> ObtenerAlumnosSinGrupo(Long idCurso) {
		// TODO Auto-generated method stub
		List<Long> listaAlumnosid=  cursoDao.ObtenerAlumnosSinGrupo(idCurso);
		
		return alumnoService.getAlumnosByIds(listaAlumnosid);
	}
}

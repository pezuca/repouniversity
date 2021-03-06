package com.repouniversity.model.services;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repouniversity.model.cache.CacheManager;
import com.repouniversity.model.dao.CursoDAO;
import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.CursoMateria;
import com.repouniversity.model.entity.Notificacion;
import com.repouniversity.model.entity.to.AlumnoTO;
import com.repouniversity.model.entity.to.CursoTO;

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
    private MateriaService materiaService;

    @Autowired
    private NotificacionService notificacionService;
    
    @Autowired
    public CacheManager cache;

    public List<CursoTO> getAll() {
        List<CursoTO> cursoToList = new ArrayList<CursoTO>();
        List<Long> cursoIdsTofind = new ArrayList<Long>();

        for (Long archivoId : cursoDao.findAllIds()) {
            CursoTO cursoTO = cache.getCursoMap().get(archivoId);

            if (cursoTO == null) {
                cursoIdsTofind.add(archivoId);
            } else {
                cursoToList.add(cursoTO);
            }
        }

        for (Curso curso : cursoDao.findByIds((Long[]) cursoIdsTofind.toArray(new Long[0]))) {
            cursoToList.add(buildCurso(curso));
        }

        return cursoToList;
    }

    public List<CursoTO> buildCursos(List<Curso> cursos) {
        return cursos.stream().map(curso -> buildCurso(curso)).collect(Collectors.toList());
    }

    public CursoTO buildCurso(Curso curso) {
        CursoTO cursoTo = new CursoTO();
        cursoTo.setId(curso.getId());
        cursoTo.setNombre(curso.getNombre());
        cursoTo.setDescripcion(curso.getDescripcion());
        cursoTo.setCodigo(curso.getCodigo());
        cursoTo.setFechasys(curso.getFechasys());
        cursoTo.setDocente(docenteService.getCompleteById(curso.getDocenteId()));
        cursoTo.setMateria(materiaService.getById(curso.getMateriaId()));
        return cursoTo;
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
        
        cache.getCursoMap().put(curso.getId(), buildCurso(curso));
    }

    public void registrarAlumnoACurso(Notificacion noti) {
        cursoDao.insertAlumnoCursoGrupo(1L, noti.getCursoId(), noti.getAlumnoId());

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
            cursoMateria.setDocente(docenteService.getDocenteById(idAluDoc));
        }

        return cursoMateriaList;
    }

    public void delete(Long cursoId) {
        cursoDao.delete(getById(cursoId));
        cache.getCursoMap().remove(cursoId);
    }

    public Curso save(String nombre, String descripcion, String codigo, Long materiaId, Long docenteId) {
        Curso curso = new Curso();
        curso.setNombre(nombre);
        curso.setDescripcion(descripcion);
        curso.setCodigo(codigo);
        curso.setMateriaId(materiaId);
        curso.setDocenteId(docenteId);

        cursoDao.insert(curso);
        cache.getCursoMap().put(curso.getId(), buildCurso(curso));
        
        return curso;
    }

    public Curso update(Long cursoId, String nombre, String descripcion, String codigo, Long materiaId, Long docenteId) {
        Curso curso = cursoDao.findById(cursoId);

        curso.setNombre(nombre);
        curso.setDescripcion(descripcion);
        curso.setCodigo(codigo);
        curso.setMateriaId(materiaId);
        curso.setDocenteId(docenteId);

        cursoDao.update(curso);
        cache.getCursoMap().remove(curso.getId());

        return curso;
    }

    public List<AlumnoTO> ObtenerAlumnosSinGrupo(Long idCurso) {
        // TODO Auto-generated method stub
        List<Long> listaAlumnosid = cursoDao.ObtenerAlumnosSinGrupo(idCurso);

        return alumnoService.getAlumnosByIds(listaAlumnosid);
    }

    public void bajaCursoAlumno(Long cursoId, Long idAluDoc) {
        cursoDao.bajaCursoAlumno(cursoId, idAluDoc);
    }
}

package com.repouniversity.model.services;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.repouniversity.model.dao.GrupoDAO;
import com.repouniversity.model.dao.TpGrupoDAO;
import com.repouniversity.model.entity.Archivo;
import com.repouniversity.model.entity.TpGrupo;
import com.repouniversity.model.entity.UsuarioRol;
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
    @Autowired
    private ComentarioService comentarioService;
    
    @Autowired
    private ArchivoService archivoService;

    public TpGrupo save(TpGrupo tpGrupo) {
        return tpGrupoDao.insert(tpGrupo);
    }

    public TpGrupoTO nuevoTp(Long grupoId, String descripcion, CommonsMultipartFile[] file, Long cursoId, UsuarioRol usuario) throws IOException {
        String[] tags = null;

        List<Archivo> nuevoArchivo = archivoService.parseArchivo(file, tags, descripcion, cursoId, grupoId, usuario);
        List<Archivo> elArchivo = archivoService.subirArchivo(nuevoArchivo);

        TpGrupo tpGrupo = new TpGrupo();
        tpGrupo.setIdGrupo(grupoId);
        tpGrupo.setDescripcion(descripcion);
        tpGrupo.setIdArchivo(elArchivo.get(0).getId());
        tpGrupo.setActivo(true);

        tpGrupo = save(tpGrupo);
        return buildTpGrupo(tpGrupo);
    }

    public TpGrupoTO editarTp(Long grupoId, Long tpId, String descripcion, String nota) {
        // TODO Auto-generated method stub
        TpGrupo tpGrupo = new TpGrupo();

        tpGrupo.setIdGrupo(grupoId);
        tpGrupo.setId(tpId);
        tpGrupo.setDescripcion(descripcion);
        tpGrupo.setIdArchivo(archivoService.getArchivoById(tpId).getId());
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
        // tpGrupoTo.setGrupo(grupoService.getGrupoById(tpGrupo.getIdGrupo()));
        tpGrupoTo.setGrupo(tpGrupo.getIdGrupo());
        // tpGrupoTo.setGrupoNombre(grupoService.getGrupoById(tpGrupo.getIdGrupo()).getNombre());
        tpGrupoTo.setGrupoNombre("aa");
        tpGrupoTo.setArchivo(tpGrupo.getIdArchivo());
        tpGrupoTo.setArchivoNombre(archivoService.getArchivoById(tpGrupo.getIdArchivo()).getNombre());
        tpGrupoTo.setArchivoDescripcion(archivoService.getArchivoById(tpGrupo.getIdArchivo()).getDescripcion());
        tpGrupoTo.setArchivoPath(archivoService.getArchivoById(tpGrupo.getIdArchivo()).getPath());
        tpGrupoTo.setNota(tpGrupo.getNota());
        tpGrupoTo.setTpEntrega(tpEntregaService.getTpEntregaForTpGrupo(tpGrupo.getId()));
        tpGrupoTo.setComentario(comentarioService.getComentariosForTpGrupo(tpGrupo.getId()));
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
    public Long getIdCursoForTpGrupo(long idTpGrupo) {

        return tpGrupoDao.findIdCursoForTpGrupo(idTpGrupo);
    } 

}

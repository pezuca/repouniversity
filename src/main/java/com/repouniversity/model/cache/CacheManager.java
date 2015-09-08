package com.repouniversity.model.cache;

import java.util.Map;

import org.springframework.stereotype.Component;

import com.repouniversity.model.entity.to.ArchivoTO;
import com.repouniversity.model.entity.to.CursoTO;
import com.repouniversity.model.entity.to.UsuarioTO;

@Component
public class CacheManager {

    private Map<Long, UsuarioTO> usuarioMap;
    private Map<Long, CursoTO> cursoMap;
    private Map<Long, ArchivoTO> archivoMap;

    public Map<Long, UsuarioTO> getUsuarioMap() {
        return usuarioMap;
    }

    public void setUsuarioMap(Map<Long, UsuarioTO> usuarioMap) {
        this.usuarioMap = usuarioMap;
    }

    public Map<Long, CursoTO> getCursoMap() {
        return cursoMap;
    }

    public void setCursoMap(Map<Long, CursoTO> cursoMap) {
        this.cursoMap = cursoMap;
    }

    public Map<Long, ArchivoTO> getArchivoMap() {
        return archivoMap;
    }

    public void setArchivoMap(Map<Long, ArchivoTO> archivoMap) {
        this.archivoMap = archivoMap;
    }
}

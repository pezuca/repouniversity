package com.repouniversity.model.cache;

import java.util.Map;

import org.springframework.stereotype.Component;

import com.repouniversity.model.entity.Curso;
import com.repouniversity.model.entity.to.UsuarioTO;

@Component
public class CacheManager {

    private Map<Long, UsuarioTO> usuarioMap;
    private Map<Long, Curso> cursoMap;

    public Map<Long, UsuarioTO> getUsuarioMap() {
        return usuarioMap;
    }

    public void setUsuarioMap(Map<Long, UsuarioTO> usuarioMap) {
        this.usuarioMap = usuarioMap;
    }

    public Map<Long, Curso> getCursoMap() {
        return cursoMap;
    }

    public void setCursoMap(Map<Long, Curso> cursoMap) {
        this.cursoMap = cursoMap;
    }
}

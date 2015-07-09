package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.ArchivoDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.ArchivoRowMapper;
import com.repouniversity.model.dao.rowmapper.VwArchivoRowMapper;
import com.repouniversity.model.entity.Archivo;
import com.repouniversity.model.entity.VwArchivo;

@Repository
public class ArchivoDAOImpl extends GenericDAOImpl<Archivo> implements ArchivoDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final Archivo a) {
        return new InsertSQLStatement(
                "INSERT INTO archivo (nombre,descripcion,fecha_despublicacion,fecha_publicacion,id_tipo,fecsys,activo,estado,path,persona_id_persona,id_curso,Tags) VALUES(?,?,now(),now(),1,now(),1,1,?,?,?,?)") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, a.getNombre());
                ps.setString(2, a.getDescripcion());
                ps.setString(3, a.getPath());
                ps.setLong(4, a.getPersona());
                ps.setLong(5, a.getCurso());
                ps.setString(6, a.getTags());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    public List<Archivo> findArchivoByEtiqueta(String etiqueta) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Archivo> findArchivoByMateria(String materia) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Archivo> findArchivoByDocente(String string) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    protected Class<Archivo> getEntityClass() {
        return Archivo.class;
    }

    @Override
    protected String getTableName() {
        return "archivo";
    }

    @Override
    protected Archivo extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        return (new ArchivoRowMapper()).mapRow(rs, line);
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(Archivo t) {
        return new SQLStatement("UPDATE archivo SET descripcion = ?, tags = ?, fecsys = now()  where " + getColumnIdName() + " = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getDescripcion());
                ps.setString(2, t.getTags());
                ps.setLong(3, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected String getColumnIdName() {
        return "id_archivo";
    }

    @Override
    public List<VwArchivo> findArchivosDePersona(final long idPersona) {
        StringBuilder sql = new StringBuilder();

        sql.append("select * from vw_archivos where activo = 1 and persona_id_persona = ? ");

        List<VwArchivo> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, idPersona);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new VwArchivoRowMapper(), "findArchivosDePersona: " + idPersona);

        if (list.isEmpty()) {
            return new ArrayList<VwArchivo>();
        }

        return list;
    }

    @Override
    public VwArchivo findVwArchivo(final Long archivoId) {
        StringBuilder sql = new StringBuilder();

        sql.append("select * from vw_archivos where activo = 1 and id_archivo = ? ");

        List<VwArchivo> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, archivoId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new VwArchivoRowMapper(), "findVwArchivo: " + archivoId);

        if (list.isEmpty()) {
            return null;
        }

        return list.get(0);
    }
}

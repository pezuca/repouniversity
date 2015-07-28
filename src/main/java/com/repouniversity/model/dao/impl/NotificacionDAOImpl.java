package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.NotificacionDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.NotificacionRowMapper;
import com.repouniversity.model.entity.Notificacion;

@Repository
public class NotificacionDAOImpl extends GenericDAOImpl<Notificacion> implements NotificacionDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Notificacion> getNotificacionesSinConfirmar(final Long cursoId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT * FROM notificacion n WHERE n.tiponotificacion = 1 AND n.idcurso = ? ");
        sql.append("AND n.activo = 1");

        List<Notificacion> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, cursoId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new NotificacionRowMapper(), "getNotificacionesSinConfirmar: " + cursoId);

        if (list.isEmpty()) {
            return new ArrayList<Notificacion>();
        }

        return list;
    }

    @Override
    protected Class<Notificacion> getEntityClass() {
        return Notificacion.class;
    }

    @Override
    protected String getTableName() {
        return "notificacion";
    }

    @Override
    protected Notificacion extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
        return (new NotificacionRowMapper()).mapRow(rs, line);
    }

    @Override
    protected InsertSQLStatement buildInsertSQLStatement(final Notificacion t) {
        return new InsertSQLStatement("INSERT INTO notificacion (tiponotificacion, idcurso, iddocente, idalumno) values (?, ?, ?, ?)") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getTipoId());
                ps.setLong(2, t.getCursoId());
                ps.setLong(3, t.getDocenteId());
                ps.setLong(4, t.getAlumnoId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final Notificacion t) {
        return new SQLStatement("UPDATE curso SET tiponotificacion = ?, idcurso = ?, iddocente = ?, idalumno = ? WHERE id = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getTipoId());
                ps.setLong(2, t.getCursoId());
                ps.setLong(3, t.getDocenteId());
                ps.setLong(4, t.getAlumnoId());
                ps.setLong(5, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected String getColumnIdName() {
        return "idnotificacion";
    }
    
    @Override
    public List<Notificacion> findNotificacionesForAlumnoId(final Long idAluDoc) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT * FROM notificacion n WHERE(n.tiponotificacion = 3 or n.tiponotificacion = 4) AND n.idalumno = ? ");
        sql.append("AND n.activo = 1 ");
        sql.append("order by n.idnotificacion asc");

        List<Notificacion> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, idAluDoc);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new NotificacionRowMapper(), "findNotificacionesForAlumnoId: " + idAluDoc);

        return list;
    }
    @Override
    public List<Notificacion> findNotificacionesForDocenteId(final Long idAluDoc) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT * FROM notificacion n WHERE(n.tiponotificacion = 1 or n.tiponotificacion = 2) AND n.iddocente = ? AND activo = 1 ");
        sql.append("order by n.idnotificacion asc");

        List<Notificacion> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, idAluDoc);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new NotificacionRowMapper(), "findNotificacionesForDocenteId: " + idAluDoc);
        
  
        return list;
    }
    
    
    
}

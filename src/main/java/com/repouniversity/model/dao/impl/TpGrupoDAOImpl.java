package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.TpGrupoDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.dao.rowmapper.TpGrupoRowMapper;
import com.repouniversity.model.entity.TpGrupo;

@Repository
public class TpGrupoDAOImpl extends GenericDAOImpl<TpGrupo> implements TpGrupoDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    protected Class<TpGrupo> getEntityClass() {
        return TpGrupo.class;
    }

    @Override
    protected String getTableName() {
        return "tp_grupo";
    }

    @Override
    protected TpGrupo extractEntityFromResultSet(ResultSet rs, int line) throws SQLException {
    	TpGrupo result = new TpGrupo();
         
         result.setId(rs.getLong("idtp_grupo"));
         result.setIdArchivo(rs.getLong("id_archivo"));
         result.setIdGrupo(rs.getLong("id_grupo"));
         result.setDescripcion(rs.getString("descripcion"));
         result.setNota(rs.getString("nota"));
         result.setActivo(rs.getBoolean("activo"));
         result.setFechasys(rs.getDate("fecsys"));
         
         return result;
    }


    @Override
    protected String getColumnIdName() {
        return "idtp_grupo";
    }

    @Override
    public List<TpGrupo> findTpGrupoForGrupo(final Long grupoId) {
        StringBuilder sql = new StringBuilder();

        sql.append("SELECT * FROM tp_grupo ");
        sql.append("WHERE id_grupo = ? ");
        sql.append("AND activo = 1");

        List<TpGrupo> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, grupoId);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new TpGrupoRowMapper(), "findTpGrupoForGrupo: " + grupoId);

        if (list.isEmpty()) {
            return new ArrayList<TpGrupo>();
        }

        return list;
    }
    
    protected InsertSQLStatement buildInsertSQLStatement(final TpGrupo t) {
        return new InsertSQLStatement("INSERT INTO tp_grupo (id_grupo, id_archivo, descripcion) values (?, ?, ?)") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getIdGrupo());
                ps.setLong(2, t.getIdArchivo());
                ps.setString(3, t.getDescripcion());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }

    @Override
    protected SQLStatement buildUpdateSQLStatement(final TpGrupo t) {
        return new SQLStatement("UPDATE tp_grupo SET id_grupo = ?, descripcion = ?, nota = ?, activo = ?, fecsys = now() WHERE idtp_grupo = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, t.getIdGrupo());
                ps.setString(2, t.getDescripcion());
                ps.setString(3, t.getNota());
                ps.setBoolean(4, t.isActivo());
                ps.setLong(5, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        };
    }
    @Override
    public long findIdCursoForTpGrupo(long tpGrupoId) {
        
        long id = jdbcTemplate.queryForLong("select distinct ac.id_curso from tp_grupo tp JOIN alumno_curso ac ON ac.id_grupo = tp.id_grupo where tp.idtp_grupo =  " + tpGrupoId + " LIMIT 1");

        return id;
    }
    
    @Override
    public long findTPsAprobadoForAlumno(long alumnoId) {
        
  	
        long TPs = jdbcTemplate.queryForLong("SELECT count(*) FROM repouniversity.tp_grupo t join alumno_curso a on a.id_grupo = t.id_grupo where t.nota = 'Aprobado' and a.id_alumno = " + alumnoId);

        return TPs;
    }



}

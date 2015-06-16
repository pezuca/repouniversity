package com.repouniversity.model.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.repouniversity.model.dao.ArchivoDAO;
import com.repouniversity.model.dao.query.InsertSQLStatement;
import com.repouniversity.model.dao.query.SQLStatement;
import com.repouniversity.model.entity.Archivo;

@Repository
public class ArchivoDAOImpl extends GenericDAOImpl<Archivo> implements
		ArchivoDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    protected Class<Archivo> getEntityClass() {
        return Archivo.class;
    }

    @Override
    protected String getTableName() {
        return "archivo";
    }

	@Override
	public Archivo subirArchivo(final Archivo a) {
		KeyHolder keyHolder = new GeneratedKeyHolder();

		final InsertSQLStatement sqlStatement = buildInsertSQLStatement(a);

		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(
					Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(
						sqlStatement.getQuery(),
						Statement.RETURN_GENERATED_KEYS);
				sqlStatement.buildPreparedStatement(ps);
				return ps;
			}
		}, keyHolder);
		
        Long id = extractId(keyHolder);

        a.setId(id);

        sqlStatement.doAfterInsert(id);

        return a;
	}

	@Override
	protected InsertSQLStatement buildInsertSQLStatement(final Archivo a) {
		return new InsertSQLStatement(
				"INSERT INTO archivo (nombre,descripcion,fecha_despublicacion,fecha_publicacion,id_tipo,fecsys,activo,estado,path,persona_id_persona,id_curso,Tags) VALUES(?,?,now(),now(),1,now(),1,1,?,?,?,?)") {

			@Override
			public void doAfterInsert(Long id) {
			}

			@Override
			public void buildPreparedStatement(PreparedStatement ps)
					throws SQLException {
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
	public void update(Archivo e) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean delete(Archivo e) {
		// TODO Auto-generated method stub
		return false;
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
	protected Archivo extractEntityFromResultSet(ResultSet rs, int line)
			throws SQLException {
		Archivo result = new Archivo();
        
        result.setId(rs.getLong("id_archivo"));
        result.setArchivoTipo(rs.getLong("id_tipo"));
        result.setCurso(rs.getLong("id_Curso"));
        result.setDescripcion(rs.getString("descripcion"));
        result.setNombre(rs.getString("nombre"));
        result.setActivo(rs.getBoolean("activo"));
        result.setFechasys(rs.getDate("fecsys"));
        result.setPersona(rs.getLong("persona_id_persona"));
       // result.setFechaDespublicacion(rs.getDate("fecha_despublicacion"));
       // result.setFechaPublicacion(rs.getDate("fecha_publicacion"));
        result.setEstado(rs.getLong("estado"));
        result.setPath(rs.getString("path"));
        result.setTags(rs.getString("tags"));
      //  result.setGrupo(rs.getLong("grupo"));

        return result;
	}

	@Override
	protected SQLStatement buildUpdateSQLStatement(Archivo t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected String getColumnIdName() {
		return "id_archivo";
	}

}

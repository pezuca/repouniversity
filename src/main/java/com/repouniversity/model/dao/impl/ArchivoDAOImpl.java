package com.repouniversity.model.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
	public void subirArchivo(final Archivo a) {
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
				ps.setLong(4, a.getPersona().getId());
				ps.setLong(5, a.getCurso().getId());
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
	protected Class<Archivo> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected String getTableName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected Archivo extractEntityFromResultSet(ResultSet rs, int line)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected SQLStatement buildUpdateSQLStatement(Archivo t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected String getColumnIdName() {
		// TODO Auto-generated method stub
		return null;
	}

}

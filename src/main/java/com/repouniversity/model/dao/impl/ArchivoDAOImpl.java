package com.repouniversity.model.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

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
                "INSERT INTO archivo (nombre,descripcion,fecha_despublicacion,fecha_publicacion,id_tipo,fecsys,activo,estado,path,persona_id_persona,id_curso,Tags) VALUES(?,?,now(),now(),?,now(),1,?,?,?,?,?)") {

            @Override
            public void doAfterInsert(Long id) {
            }

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, a.getNombre());
                ps.setString(2, a.getDescripcion());
                ps.setLong(3, a.getArchivoTipo());
                ps.setLong(4, a.getEstado());
                ps.setString(5, a.getPath());
                ps.setLong(6, a.getPersona());
                ps.setLong(7, a.getCurso());
                ps.setString(8, a.getTags());
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
        return new SQLStatement("UPDATE archivo SET descripcion = ?, tags = ?, estado =?  where " + getColumnIdName() + " = ?") {

            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setString(1, t.getDescripcion());
                ps.setString(2, t.getTags());
                ps.setLong(3, t.getEstado());
                ps.setLong(4, t.getId());
            }

            @Override
            public void doAfterTransaction(int result) {
                // TODO Auto-generated method stub

            }
        };
    }

    @Override
    public List<Archivo> requestArchivos(String parametro) {
        List<Archivo> resultList = new ArrayList<Archivo>();
        List<String> parametrosBusqueda = new ArrayList<String>();
        // quitamos las noise word
        parametro = parametro.toUpperCase();
        parametrosBusqueda = quitarNoiseWords(parametro);

        // agregamos las palabras equivalentes
        parametrosBusqueda = agregarEquivalencias(parametrosBusqueda);

        // realizamos la busqueda a los archivos que tengan estado 1 o 2
        resultList = generarBusqueda(parametrosBusqueda);
        return resultList;
    }

    @Override
    public List<Archivo> generarBusqueda(final List<String> parametrosBusqueda) {
        StringBuilder sql = new StringBuilder();
        // se genera la condicion a mano, pero en la condicion es donde se va a armarse la query
        // con las cadenas que llegaron de los filtros.

        // quitamos los duplicados
        HashSet hs = new HashSet();
        hs.addAll(parametrosBusqueda);
        parametrosBusqueda.clear();
        parametrosBusqueda.addAll(hs);

        // armamos la cadena con todos los tags con LIKE
        String tags = new String();

        // se inicializa tagas por si se agrega un espacio solamente en la busqued para que no rompa
        // para el resto de los caracteres especiales no hay problemas
        tags = "tags=\'\'";

        if (parametrosBusqueda.size() > 0) {
            tags = "";
            for (String parametro : parametrosBusqueda) {
                tags = tags.concat(" tags like \'%" + parametro.trim() + "%\' OR ");
            }
            tags = tags.substring(0, tags.length() - 3);
        }

        // armamos la query de busqueda en la base
        sql.append("select * from repouniversity.archivo ");
        sql.append("where " + tags);
        sql.append("AND (estado=1 OR  estado=2)");

        List<Archivo> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                // ps.setString (1, parametro);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new ArchivoRowMapper(), "generarBusqueda: ");

        if (list.isEmpty()) {
            return null;
        }

        return list;
    }

    @Override
    public List<Archivo> busquedaAvanzada(String materia, String nbreDocente, String apeDocente, String carrera, String descripcion, Date fechaDde,
            Date fechaHta) {
        StringBuilder sql = new StringBuilder();
        // se genera la condicion a mano, pero en la condicion es donde se va a armarse la query

        List<String> laDescripcion = new ArrayList<String>();
        // quitamos las noise word
        descripcion = descripcion.toUpperCase();
        laDescripcion = quitarNoiseWords(descripcion);

        // agregamos las palabras equivalentes
        laDescripcion = agregarEquivalencias(laDescripcion);

        // se inicializa tags por si se agrega un espacio solamente en la busqued para que no rompa
        // para el resto de los caracteres especiales no hay problemas
        String tags = new String();
        tags = "tags=\'\' ";

        if (laDescripcion.size() > 0) {
            tags = "";
            for (String parametro : laDescripcion) {
                tags = tags.concat(" tags like \'%" + parametro.trim() + "%\' OR ");
            }
            tags = tags.substring(0, tags.length() - 3);
        }

        // armamos la query de busqueda en la base
        // FALTA AGEGREGAR LA QUERY A LA BASE CON LA VISTA DE FEDE PARA
        sql.append("select * from repouniversity.vw_archivos ");
        sql.append("where " + tags + "AND");
        sql.append(" nombreDocente like \'%" + nbreDocente.trim() + "%\' AND");
        sql.append(" apellidoDocente like \'%" + apeDocente.trim() + "%\' AND");
        sql.append(" carrera like \'%" + carrera.trim() + "%\' AND");
        sql.append(" materia like \'%" + materia.trim() + "%\' AND");
        sql.append(" fecha_publicacion between \'" + new SimpleDateFormat("yyyy-MM-dd").format(fechaDde) + "\' AND \'"
                + new SimpleDateFormat("yyyy-MM-dd").format(fechaHta) + "\'");
        sql.append(" AND (estado=1 OR  estado=2)");

        List<Archivo> resultList = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                // ps.setString (1, parametro);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new ArchivoRowMapper(), "generarBusqueda: ");

        if (resultList.isEmpty()) {
            return null;
        }

        return resultList;
    }

    @Override
    public List<String> quitarNoiseWords(String parametro) {

        // doy de alta el listado de Noise words y verifico si cada string esta dentro del listado
        List<String> noiseWords = new ArrayList<String>();
        noiseWords.add("EN");
        noiseWords.add("DE");
        noiseWords.add("DONDE");
        noiseWords.add("CUANDO");
        noiseWords.add(",");
        noiseWords.add(";");
        noiseWords.add("'");
        noiseWords.add("`");
        noiseWords.add("´");
        noiseWords.add(".");
        noiseWords.add("&");
        noiseWords.add("/");

        // tokenizo la cadena
        String[] tokens = parametro.split(" ");
        List<String> parametrosBusqueda = new ArrayList<String>();

        for (int i = 0; i < tokens.length; i++) {
            if (!noiseWords.contains(tokens[i])) {
                parametrosBusqueda.add(tokens[i]);
            }
        }

        return parametrosBusqueda;
    }

    public List<String> agregarEquivalencias(List<String> parametrosBusqueda) {

        List<String> terminosBusqueda = new ArrayList<String>();
        List<String> listaTemporal = new ArrayList<String>();

        // Agregando equivalencias
        // mapa de listas con el termino y sus equivalencias
        Map<String, List<String>> equivList = new HashMap<String, List<String>>();
        List<String> equivalencia = new ArrayList<String>();

        equivalencia.add("VECTOR");
        equivalencia.add("MATRIZ");
        equivalencia.add("MATEMATICA");
        equivList.put("ALGEBRA", equivalencia);
        // equivalencia.clear();

        equivalencia.add("ALGEBRA");
        equivalencia.add("FISICA");
        equivalencia.add("MATRIZ");
        equivList.put("MATEMATICA", equivalencia);
        // equivalencia.clear();

        equivalencia.add("OBJETOS");
        equivalencia.add("LENGUAJE");
        equivalencia.add("MODELO");
        equivList.put("PROGRAMACION", equivalencia);
        // equivalencia.clear();

        equivalencia.add("RED");
        equivalencia.add("COMPUTACION");
        equivalencia.add("INTERNET");
        equivList.put("HARDWARE", equivalencia);
        // equivalencia.clear();

        for (String termino : parametrosBusqueda) {
            if (equivList.containsKey(termino)) {
                listaTemporal = equivList.get(termino);
                for (String e : listaTemporal) {
                    terminosBusqueda.add(e);
                }
            }
            terminosBusqueda.add(termino);
        }
        return terminosBusqueda;

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
    public List<VwArchivo> findArchivosDelCurso(final long idCurso) {
        StringBuilder sql = new StringBuilder();

        sql.append("select * from vw_archivos where activo = 1 and id_curso = ? ");
        sql.append("and id_archivo not in (select distinct id_archivo from tp_entrega) ");
        sql.append("and id_archivo not in (select distinct id_archivo from tp_grupo) ");

        List<VwArchivo> list = doQuery(new SQLStatement(sql.toString()) {
            @Override
            public void buildPreparedStatement(PreparedStatement ps) throws SQLException {
                ps.setLong(1, idCurso);
            }

            @Override
            public void doAfterTransaction(int result) {
            }
        }, new VwArchivoRowMapper(), "findArchivosDelCurso: " + idCurso);

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

package com.repouniversity.web.utils;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Row;

import com.repouniversity.model.entity.Materia;
import com.repouniversity.web.enums.MateriaColsEnum;

/**
 * This code give the logic to how to map columns into the spreadsheet and when
 * it has to stop run reading questions.
 */
public class ExcelMaterias implements IExcelRowMapper<Materia> {

    @Override
    public boolean stop(Row row) {
        if (row.getCell(0) == null) {
            return true;
        }
        return StringUtils.isEmpty(row.getCell(0).getStringCellValue());
    }

    @Override
    public Materia map(Row row) {
        return extractAdmQuestion(row);
    }

    private Materia extractAdmQuestion(Row row) {
        Materia materia = new Materia();

        materia.setNombre(ExcelParserUtils.getColumnValue(row, MateriaColsEnum.NOMBRE.ordinal()));
        materia.setDescripcion(ExcelParserUtils.getColumnValue(row, MateriaColsEnum.DESCRIPCION.ordinal()));
        materia.setActivo(Boolean.TRUE);

        return materia;
    }
}

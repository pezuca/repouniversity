package com.repouniversity.web.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public final class ExcelParser {

    private ExcelParser() {

    }

    public static Sheet getSheet(InputStream inputStream, String fileName, int sheetNumber) throws IOException {

        Workbook workBook = null;

        if (fileName.endsWith(".xls")) {
            POIFSFileSystem poiFS = new POIFSFileSystem(inputStream);
            workBook = new HSSFWorkbook(poiFS);
        }

        return workBook.getSheetAt(sheetNumber);
    }

    public static String getStringFieldValue(Sheet sheet, int row, int cell) {
        return sheet.getRow(row).getCell(cell).getStringCellValue();
    }

    public static Date getDateFieldValue(Sheet sheet, int row, int cell) {
        return sheet.getRow(row).getCell(cell).getDateCellValue();
    }

    public static Double getNumberFieldValue(Sheet sheet, int row, int cell) {
        return sheet.getRow(row).getCell(cell).getNumericCellValue();
    }

    public static <T> List<T> mapRows(Sheet sheet, int start, IExcelRowMapper<T> mapper) {

        List<T> result = new ArrayList<T>();

        Iterator<Row> rows = sheet.rowIterator();

        while (rows.hasNext()) {

            Row row = rows.next();

            if (row.getRowNum() > start) {

                if (mapper.stop(row)) {
                    break;
                }

                result.add(mapper.map(row));

            }
        }
        return result;
    }
}

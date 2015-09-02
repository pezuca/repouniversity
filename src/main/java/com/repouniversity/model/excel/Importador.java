package com.repouniversity.model.excel;

import java.io.IOException;
import java.io.OutputStream;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Component;

import com.repouniversity.web.enums.MateriaColsEnum;

@Component
public class Importador {

    public void generateExcelSpreadsheet(OutputStream os) throws IOException {

        Workbook workBook = new HSSFWorkbook();
        Sheet sheet = workBook.createSheet("questions");

        Row row = sheet.createRow(0);

        MateriaColsEnum[] cols = MateriaColsEnum.values();
        for (int i = 0; i < cols.length; i++) {

            MateriaColsEnum col = cols[i];
            row.createCell(i).setCellValue(col.name());
        }

        for (int i = 0; i < cols.length; i++) {
            sheet.autoSizeColumn(i);
        }

        workBook.write(os);
    }
}

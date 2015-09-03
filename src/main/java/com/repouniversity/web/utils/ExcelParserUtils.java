package com.repouniversity.web.utils;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

/**
 * This class give tools to proccess an excel spreadsheet.
 */
public final class ExcelParserUtils {

    private ExcelParserUtils() {

    }

    /**
     * Extract the date value from the cell and convert it in a Date class to
     * return. If it's not a date type returns null.
     * @param dateCell
     * @return same value date as a Date class.
     */
    public static Date extractTime(Cell dateCell) {

        Date result = null;

        if (dateCell.getCellType() == Cell.CELL_TYPE_STRING) {
            result = parseDate(dateCell.getStringCellValue());
        } else {
            result = dateCell.getDateCellValue();
        }
        return result;
    }

    private static Date parseDate(String strDate) {

        Date result;

        if (strDate.indexOf("/") > 0) {
            throw new UnsupportedOperationException("extractTime parse only time");
        }

        int seconds = 0;
        int hour = Integer.valueOf(strDate.substring(0, strDate.indexOf(":")));
        int minutes = Integer.valueOf(strDate.substring(strDate.indexOf(":") + 1, strDate.lastIndexOf(":")));

        // Sometimes excel save the time with hour > 24
        if (hour > 24) {
            hour = hour % 24;
        }

        // If has p.m.-*
        if (strDate.indexOf("p") > 0) {

            seconds = Integer.valueOf(strDate.substring(strDate.lastIndexOf(":") + 1, strDate.lastIndexOf("p")).trim());

            if (hour < 12) {
                hour += 12;
            }

        } else if (strDate.indexOf("a") > 0) {

            seconds = Integer.valueOf(strDate.substring(strDate.lastIndexOf(":") + 1, strDate.lastIndexOf("a")).trim());

            if (hour > 12) {
                hour = hour % 12;
            }

        } else {
            seconds = Integer.valueOf(strDate.substring(strDate.lastIndexOf(":") + 1, strDate.length()));
        }

        Calendar calendar = new GregorianCalendar();
        calendar.set(Calendar.HOUR_OF_DAY, hour);
        calendar.set(Calendar.MINUTE, minutes);
        calendar.set(Calendar.SECOND, seconds);
        result = calendar.getTime();

        return result;
    }

    /**
     * Returns the cell value on the columnOrdinal is pointed. If the value is
     * null or empty returns an empty string. Also, if is a mandatory field and
     * it's null or empty throws a QuestionException.
     * @param row
     * @param question
     * @param columnOrdinal
     * @param isMandatory
     * @return cell value
     */
    public static String getColumnValue(Row row, int columnOrdinal) {
        return getCellValue(row, columnOrdinal);
    }

    /**
     * Returns the cell value as a String
     * @param row
     * @param columnOrdinal
     * @return cell value
     */
    public static String getCellValue(Row row, int columnOrdinal) {
        Cell cell = row.getCell(columnOrdinal);

        if (cell == null || cell.getCellType() == Cell.CELL_TYPE_BLANK) {
            return null;
        } else if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
            String result = cell.getStringCellValue();
            if (StringUtils.isEmpty(result)) {
                return result;
            }

            return result.trim();

        } else if (cell.getCellType() == Cell.CELL_TYPE_BOOLEAN) {
            return Boolean.toString(cell.getBooleanCellValue());
        } else if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
            return String.valueOf(Double.valueOf(cell.getNumericCellValue()).intValue());
        }
        
        return null;
    }

    /**
     * Check if the condition to stop is met. The stop condition is find an
     * empty cell at the beginning of the row
     * @param row
     * @return true if it's met and false if not.
     */
    public static boolean reachesStopCondition(Row row) {
        if (row.getCell(0) == null) {
            return true;
        }
        return StringUtils.isEmpty(row.getCell(0).getStringCellValue());
    }
}

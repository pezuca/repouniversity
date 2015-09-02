package com.repouniversity.web.utils;

import org.apache.poi.ss.usermodel.Row;

public interface IExcelRowMapper<T> {

    boolean stop(Row row);

    T map(Row row);

}

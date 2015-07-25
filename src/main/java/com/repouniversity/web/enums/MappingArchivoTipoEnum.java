package com.repouniversity.web.enums;

import java.util.Arrays;
import java.util.List;

public enum MappingArchivoTipoEnum {

    DOC(1L, "doc"),
    DOCX(1L, "docx"),
    ODT(1L, "odt"),
    TXT(1L, "txt"),
    PDF(2L, "pdf"),
    XLS(3L, "xls"),
    XLSX(3L, "xlsx"),
    ODS(3L, "ods"),
    JPG(4L, "jpg"),
    PNG(4L, "png"),
    BMP(4L, "bmp");

    private Long tipoId;
    private String extension;

    MappingArchivoTipoEnum(Long tipoId, String extension) {
        this.tipoId = tipoId;
        this.extension = extension;
    }

    public Long getTipoId() {
        return tipoId;
    }

    public void setTipoId(Long tipoId) {
        this.tipoId = tipoId;
    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public static MappingArchivoTipoEnum getByExtension(String extension) {

        List<MappingArchivoTipoEnum> values = Arrays.asList(MappingArchivoTipoEnum.values());

        return values.stream().filter(element -> element.getExtension().equals(extension)).findFirst().orElse(null);
    }
}

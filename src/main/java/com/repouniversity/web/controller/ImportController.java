package com.repouniversity.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.repouniversity.model.entity.Materia;
import com.repouniversity.model.excel.Importador;
import com.repouniversity.model.services.MateriaService;
import com.repouniversity.web.exceptions.ExcelParserException;
import com.repouniversity.web.exceptions.StrongPasswordException;
import com.repouniversity.web.utils.ExcelMaterias;
import com.repouniversity.web.utils.ExcelParser;

@Controller
public class ImportController {

    @Autowired
    private Importador importador;

    @Autowired
    private MateriaService materiaService;

    @RequestMapping(value = "import/downloadMateriasTemplate", method = {RequestMethod.GET})
    public void downloadTemplate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setHeader("Content-Disposition", "attachment; filename=template.xls");
        response.setContentType("application/vdn.ms-excel");

        importador.generateExcelSpreadsheet(response.getOutputStream());
    }

    @RequestMapping(value = "import/uploadMaterias", method = {RequestMethod.GET})
    public ModelAndView uploadMaterias(HttpServletRequest request, HttpServletResponse response) throws IOException {

        return new ModelAndView("importarMaterias");
    }

    @RequestMapping(value = "import/uploadMaterias", method = {RequestMethod.POST})
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public List<Materia> saveMaterias(HttpServletRequest request, @RequestParam(value = "file") CommonsMultipartFile[] file) {
        List<Materia> resultTO = null;
        try {
            resultTO = parseXLS(file[0]);

            for (Materia materia : resultTO) {
                materiaService.save(materia.getNombre(), materia.getDescripcion());
            }

        } catch (Exception e) {
            throw new ExcelParserException("Hubo un error al intentar importar los datos del archivo. Por favor intentelo más tarde.", e);
        }

        return resultTO;
    }

    private List<Materia> parseXLS(MultipartFile file) throws IOException {
        org.apache.poi.ss.usermodel.Sheet sheet = ExcelParser.getSheet(file.getInputStream(), file.getOriginalFilename(), 0);

        List<Materia> result = ExcelParser.mapRows(sheet, 0, new ExcelMaterias());

        return result;
    }

    @ExceptionHandler(ExcelParserException.class)
    public void strongPasswordExceptionHandler(StrongPasswordException ex, HttpServletResponse response) throws IOException {
        response.getWriter().write(ex.getMessage());
        response.setStatus(HttpStatus.CONFLICT.value());
        response.flushBuffer();
    }
}

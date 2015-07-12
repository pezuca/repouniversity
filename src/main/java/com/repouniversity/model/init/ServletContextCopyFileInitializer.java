package com.repouniversity.model.init;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

public class ServletContextCopyFileInitializer implements ApplicationListener<ContextRefreshedEvent> {
    @Autowired
    public String systemFilePreviewTomcatLocation;
    
    @Autowired
    public String systemFilePreviewLocation;
    
    public void onApplicationEvent(ContextRefreshedEvent event) {
        File srcFolder = new File(systemFilePreviewLocation);
        File destFolder = new File(systemFilePreviewTomcatLocation);

        try {
            copyFolder(srcFolder, destFolder);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void copyFolder(File src, File dest) throws IOException {

        if (src.isDirectory()) {

            String files[] = src.list();

            for (String file : files) {
                File srcFile = new File(src, file);
                File destFile = new File(dest, file);
                copyFolder(srcFile, destFile);
            }

        } else {
            InputStream in = new FileInputStream(src);
            OutputStream out = new FileOutputStream(dest);

            byte[] buffer = new byte[1024];

            int length;
            while ((length = in.read(buffer)) > 0) {
                out.write(buffer, 0, length);
            }

            in.close();
            out.close();
        }
    }
}

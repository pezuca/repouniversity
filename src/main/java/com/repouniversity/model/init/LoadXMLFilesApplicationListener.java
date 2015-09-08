package com.repouniversity.model.init;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 * Web application listener
 */
@Service
public class LoadXMLFilesApplicationListener implements ApplicationListener<ContextRefreshedEvent> {

    @Autowired
    public String noiseWordsTomcatLocation = "/home/federico/movile-workspace/repouniversity/noiseWords.xml";

    @Autowired
    public String equivalenciasTomcatLocation = "/home/federico/movile-workspace/repouniversity/listadoEquivalencias.xml";

    public static List<String> listadoNoiseWord;
    public static Map<String, List<String>> listadoEquivalencias;

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        try {
            File noiseWordsXmlFile = new File(noiseWordsTomcatLocation);

            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document noiseWordsDoc = dBuilder.parse(noiseWordsXmlFile);
            noiseWordsDoc.getDocumentElement().normalize();

            List<String> noiseWords = new ArrayList<String>();

            NodeList nList = noiseWordsDoc.getElementsByTagName("noise-word");

            for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);

                if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element eElement = (Element) nNode;

                    noiseWords.add(eElement.getTextContent().toUpperCase());

                }
            }

            File equivalenciasXmlFile = new File(equivalenciasTomcatLocation);
            Map<String, List<String>> equivList = new HashMap<String, List<String>>();

            Document equivalenciasDoc = dBuilder.parse(equivalenciasXmlFile);
            equivalenciasDoc.getDocumentElement().normalize();
            NodeList equiList = equivalenciasDoc.getElementsByTagName("equivalencia");

            for (int temp = 0; temp < equiList.getLength(); temp++) {
                Node nNode = equiList.item(temp);

                if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element eElement = (Element) nNode;

                    String palabra = eElement.getElementsByTagName("palabra").item(0).getTextContent();
                    NodeList listaPalabras = eElement.getElementsByTagName("equivalente");
                    List<String> palabras = new ArrayList<String>();

                    for (int i = 0; i < listaPalabras.getLength(); i++) {
                        Node nPalabra = listaPalabras.item(i);
                        Element ePalabra = (Element) nPalabra;

                        palabras.add(ePalabra.getTextContent().toUpperCase());
                    }

                    equivList.put(palabra.toUpperCase(), palabras);
                }
            }

            listadoNoiseWord = noiseWords;
            listadoEquivalencias = equivList;

        } catch (ParserConfigurationException | SAXException | IOException e) {
            e.printStackTrace();
        }

    }
}



package java_ADM;

import com.itextpdf.text.Anchor;
import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chapter;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.List;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Section;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.DottedLineSeparator;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.io.*;
import java.util.ArrayList; 
import javax.servlet.http.*;

public class GeneratePDFFileIText {
    // Fonts definitions (DefiniciÛn de fuentes).
    private static final Font chapterFont = FontFactory.getFont(FontFactory.HELVETICA, 26, Font.BOLDITALIC);
    private static final Font paragraphFont = FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL);
        
    private static final Font categoryFont = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
    private static final Font subcategoryFont = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD);
    private static final Font blueFont = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.RED);    
    private static final Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
    
    private static final String iTextExampleImage = "/images/banner.jpg";
    
    public void createPDFEventos(File pdfNewFile, ArrayList<Evento> eventos)  throws MalformedURLException, IOException {
    	
    	 // Creamos el documento e indicamos el nombre del fichero.
        try {
            Document document = new Document();
            try {

                PdfWriter.getInstance(document, new FileOutputStream(pdfNewFile));

            } catch (FileNotFoundException fileNotFoundException) {
                System.out.println("(No se encontrado el fichero para generar el pdf)" + fileNotFoundException);
            }
            BD_Controller controladorBD = new BD_Controller();
            document.open();
            // Anadimos los metadatos del PDF
            document.addTitle("Listado de Eventos ADM");
            document.addSubject("Using iText (usando iText)");
            document.addKeywords("Java, PDF, iText");
            document.addAuthor("ADM");
            document.addCreator("ADM");
            
            // First page
            // Primera pagina 
            Chunk chunk = new Chunk("Amigos Del mundo", chapterFont);
            chunk.setBackground(BaseColor.WHITE);
            // Let's create de first Chapter (Creemos el primer capitulo)
            Chapter chapter = new Chapter(new Paragraph(chunk), 1);
            chapter.setNumberDepth(0);
            chapter.add(new Paragraph("Listado de Eventos ADM", paragraphFont));
            // AÒadimos la imagen de la portada del documento
            Image image;
           
            	
            	image = Image.getInstance("C:\\Users\\natim\\eclipse-workspace4\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\dynamicWebProject_adm\\images\\banner.jpg");  
            	
                image.setAbsolutePosition(-450, 200);
                chapter.add(image);
            
            document.add(chapter);
            
            // Segunda pagina - Algunos elementos
            Chapter chapSecond = new Chapter(new Paragraph(new Anchor("Listado de Eventos")), 1);
            Paragraph paragraphS = new Paragraph("Listado de Eventos ADM", subcategoryFont);
            
            // Underline a paragraph by iText (subrayando un p√°rrafo por iText)
            //Paragraph paragraphE = new Paragraph("This line will be underlined with a dotted line (Est√° l√≠nea ser√° subrayada con una l√≠nea de puntos).");
            DottedLineSeparator dottedline = new DottedLineSeparator();
            dottedline.setOffset(-2);
            dottedline.setGap(2f);
            //paragraphE.add(dottedline);
            //chapSecond.addSection(paragraphE);
            
            Section paragraphMoreS = chapSecond.addSection(paragraphS);
            
            Anchor anchor = new Anchor("", categoryFont);
            anchor.setName("");            
            Chapter chapTitle = new Chapter(new Paragraph(anchor), 1);
            Paragraph paragraph = new Paragraph("", subcategoryFont);
            Section paragraphMore = chapTitle.addSection(paragraph);
            //paragraphMore.add(new Paragraph("This is a simple example (Este es un ejemplo sencillo)"));
            Integer numColumns = 4;
            Integer numRows = eventos.size();
            // We create the table (Creamos la tabla).
            PdfPTable table = new PdfPTable(numColumns); 
            
            // Ahora llenamos la tabla del PDF
            PdfPCell columnHeader;
           //Rellenamos las cabeceras de la tabla).                
            //for (int column = 0; column < numColumns; column++) {
                columnHeader = new PdfPCell(new Phrase("Imagen"));
                columnHeader.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(columnHeader);
                
                columnHeader = new PdfPCell(new Phrase("Nombre"));
                columnHeader.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(columnHeader);

                columnHeader = new PdfPCell(new Phrase("Municipio"));
                columnHeader.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(columnHeader);
                
                columnHeader = new PdfPCell(new Phrase("fecha"));
                columnHeader.setHorizontalAlignment(Element.ALIGN_LEFT);
                table.addCell(columnHeader);
            //}
            table.setHeaderRows(1);
            //Rellenamos las filas de la tabla).                
            
            Image imageEvento;

            for (int row = 0; row < numRows; row++) {
                //for (int column = 0; column < numColumns; column++) {
	            	
					imageEvento = Image.getInstance("C:\\Users\\natim\\eclipse-workspace4\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\dynamicWebProject_adm\\images\\eventos\\" + eventos.get(row).getCod_evento() + ".jpg");
					table.addCell(imageEvento); 
					
                    table.addCell(eventos.get(row).getNombre());
                    
                    table.addCell(eventos.get(row).getMunicipio());
                    
                    table.addCell(eventos.get(row).getFecha());
                    
                   
                //}
            }
            // AÒadimos la tabla)
            paragraphMore.add(table);
            // AÒadimos el elemento con la tabla).
            document.add(chapTitle);
            
            document.close();
            System.out.println("Se ha generado la hoja PDF!");
        } catch (DocumentException documentException) {
            System.out.println("Se ha producido un error al generar un documento: " + documentException);
        }
    	
    }
   
    
    
}
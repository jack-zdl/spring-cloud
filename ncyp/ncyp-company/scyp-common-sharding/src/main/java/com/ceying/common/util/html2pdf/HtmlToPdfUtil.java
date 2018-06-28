package com.ceying.common.util.html2pdf;

import com.ceying.common.exception.ServiceException;
import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;

import java.io.*;

/**
 * @author: mzq
 * @date: 2018/4/26
 * @description :html转pdf工具
 * @version: 2.0
 */
public class HtmlToPdfUtil {
    /*
     * @description TODO
     * @author mzq
     * @date 2018/4/26
     * @param htmlCode html代码
     * @return byte[]
     */
    public static byte[] htmlCodeToPdf(String htmlCode) throws ServiceException {
        Document document = new Document(PageSize.A4);
        byte[] bytes=null;
        try {
//            OutputStream outputStream = new  FileOutputStream("c:\\ceying\\ceying.pdf");
            ByteArrayOutputStream byteArrayOutputStream=new ByteArrayOutputStream();
            PdfWriter writer = PdfWriter.getInstance(document, byteArrayOutputStream);
            document.open();
            htmlCode=htmlCode.replace("<table>","<table border=\"0.05\" cellspacing=\"0\" cellpadding=\"0\" text-align=\"center\">");
            InputStream byteArrayInputStream = new ByteArrayInputStream(htmlCode.getBytes("UTF-8"));
            XMLWorkerHelper.getInstance().parseXHtml(writer, document, byteArrayInputStream);
            document.close();
            bytes = byteArrayOutputStream.toByteArray();
        }catch(Exception e) {
            e.printStackTrace();
            throw new ServiceException("html 转换 pdf失败");
        }
        return bytes;
    }

}

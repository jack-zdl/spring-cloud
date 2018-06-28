package com.ceying.common.util.excel;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class ExcelReadUtil {
	/**特殊处理，第一行如果为空的时候跳过整行
     * 读取Excel的内容，第一维数组存储的是一行中各列的值，二维数组存储的是多少个行
     * @param in 读取数据的源Excel
     * @param ignoreRows 读取数据忽略的行数，比喻行头不需要读入 忽略的行数为1
     * @return 读出的Excel中数据的内容
     * @throws FileNotFoundException
     * @throws IOException 
     */
    @SuppressWarnings("deprecation")
	public static String[][][] getData(String filetype, InputStream in, int ignoreRows) throws FileNotFoundException, IOException {
       List<List<String[]>> resultList = new ArrayList<List<String[]>>();

       Workbook wb;
	   if(filetype.equals("2007")) {
		   wb = new XSSFWorkbook(in);
       }  
	   else {
		   wb = new HSSFWorkbook(in);
	   }
       Cell cell = null;       
       Integer[] rowSizeArray = new Integer[wb.getNumberOfSheets()];
       for (int sheetIndex = 0; sheetIndex < wb.getNumberOfSheets(); sheetIndex++) {
           Sheet st = wb.getSheetAt(sheetIndex);
           int rowSize = 0;
           // 第一行为标题，不取
           List<String[]> result = new ArrayList<String[]>();
           resultList.add(result);
           for (int rowIndex = ignoreRows; rowIndex <= st.getLastRowNum(); rowIndex++) {
              Row row = st.getRow(rowIndex);
              if (row == null) {
                  continue;
              }
              int tempRowSize = row.getLastCellNum() + 1;
              if (tempRowSize > rowSize) {
                  rowSize = tempRowSize;
                  rowSizeArray[sheetIndex]=rowSize;
              }
              String[] values = new String[rowSize];
              Arrays.fill(values, "");
              boolean hasValue = false;
              for (short columnIndex = 0; columnIndex <= row.getLastCellNum(); columnIndex++) {
                  String value = "";
                  cell = row.getCell(columnIndex);
                  if (cell != null) {
                     // 注意：一定要设成这个，否则可能会出现乱码
                     //cell.setEncoding(HSSFCell.ENCODING_UTF_16);
                     switch (cell.getCellType()) {
                     case Cell.CELL_TYPE_STRING:
                         value = cell.getStringCellValue();
                         break;
                     case Cell.CELL_TYPE_NUMERIC:
                         if (DateUtil.isCellDateFormatted(cell)) {
                            Date date = cell.getDateCellValue();
                            if (date != null) {
                                value = new SimpleDateFormat("yyyy-MM-dd").format(date);
                            } else {
                                value = "";
                            }
                         } else {
                            value = new DecimalFormat("0.00").format(cell.getNumericCellValue());
                         }
                         break;
                     case Cell.CELL_TYPE_FORMULA:
                         // 导入时如果为公式生成的数据则无值
//                         if (!"".equals(cell.getStringCellValue())) {
//                            value = cell.getStringCellValue();
//                         } else {
//                            value = cell.getNumericCellValue() + "";
//                         }
                    	 cell.setCellType(Cell.CELL_TYPE_STRING);
                    	 value = cell.getStringCellValue();
                         break;
                     case Cell.CELL_TYPE_BLANK:
                         break;
                     case Cell.CELL_TYPE_ERROR:
                         value = "";
                         break;
                     case Cell.CELL_TYPE_BOOLEAN:
                         value = (cell.getBooleanCellValue() == true ? "Y" : "N");
                         break;
                     default:
                         value = "";
                     }
                  }
                  if (columnIndex == 0 && value.trim().equals("")) {
                     break;
                  }
                  values[columnIndex] = rightTrim(value);
                  hasValue = true;
              }
              if (hasValue) {
                  result.add(values);
              }
           }
       }
       String[][][] returnArray = new String[resultList.size()][][];
       for(int i=0;i<resultList.size();++i){
	       String[][] sheetArray = new String[resultList.get(i).size()][rowSizeArray[i]];
	       for (int j = 0; j < resultList.get(i).size(); j++) {
	    	   sheetArray[j] = resultList.get(i).get(j);
	       }
	       returnArray[i]=sheetArray;
       }
       return returnArray;
    }
    
    
    /** 特殊处理，第一行如果为空的时候不跳过整行
     * 读取Excel的内容，第一维数组存储的是一行中各列的值，二维数组存储的是多少个行
     * @param in 读取数据的源Excel
     * @param ignoreRows 读取数据忽略的行数，比喻行头不需要读入 忽略的行数为1
     * @return 读出的Excel中数据的内容
     * @throws FileNotFoundException
     * @throws IOException
     */
	@SuppressWarnings("deprecation")
	public static String[][][] getDataOther(String filetype, InputStream in, int ignoreRows) throws FileNotFoundException, IOException {
		String[][][] obj;
		obj=getDataOther( filetype,in,ignoreRows,2);
		return obj;
	}
    @SuppressWarnings("deprecation")
	public static String[][][] getDataOther(String filetype, InputStream in, int ignoreRows,int num) throws FileNotFoundException, IOException {
       List<List<String[]>> resultList = new ArrayList<List<String[]>>();
       // 打开HSSFWorkbook
//       POIFSFileSystem fs = new POIFSFileSystem(in);
//       HSSFWorkbook wb = new HSSFWorkbook(fs);
//       HSSFCell cell = null;
       Workbook wb=null;
       if(filetype.equals("2007"))
	   {
		   wb=(Workbook) new XSSFWorkbook(in);
       }  
	   else
	   {
		   wb=(Workbook) new HSSFWorkbook(in);
	   }
       Cell cell = null;
       Integer[] rowSizeArray = new Integer[wb.getNumberOfSheets()];
	   //System.out.println(wb.getNumberOfSheets()+"个表单");
       for (int sheetIndex = 0; sheetIndex < wb.getNumberOfSheets(); sheetIndex++) {
           Sheet st = wb.getSheetAt(sheetIndex);
           int rowSize = 0;
           // 第一行为标题，不取
           List<String[]> result = new ArrayList<String[]>();
           resultList.add(result);
           for (int rowIndex = ignoreRows; rowIndex <= st.getLastRowNum(); rowIndex++) {
              Row row = st.getRow(rowIndex);
              if (row == null) {
                  continue;
              }
              int tempRowSize = row.getLastCellNum() + 1;
              if (tempRowSize > rowSize) {
                  rowSize = tempRowSize;
                  rowSizeArray[sheetIndex]=rowSize;
              }
              String[] values = new String[rowSize];
              Arrays.fill(values, "");
              boolean hasValue = false;
              for (short columnIndex = 0; columnIndex <= row.getLastCellNum(); columnIndex++) {
                  String value = "";
                  cell = row.getCell(columnIndex);
                  if (cell != null) {
                     // 注意：一定要设成这个，否则可能会出现乱码
                     //cell.setEncoding(HSSFCell.ENCODING_UTF_16);
                     switch (cell.getCellType()) {
                     case Cell.CELL_TYPE_STRING:
                         value = cell.getStringCellValue();
                         break;
                     case Cell.CELL_TYPE_NUMERIC:
                         if (DateUtil.isCellDateFormatted(cell)) {
                            Date date = cell.getDateCellValue();
                            if (date != null) {
                                value = new SimpleDateFormat("yyyy-MM-dd").format(date);
                            } else {
                                value = "";
                            }
                         } else {
                        	 String numstr="0.";
								for(int k=0;k<num;k++){
									numstr +="0";
								}
                            value = new DecimalFormat(numstr).format(cell.getNumericCellValue());
                         }
                         break;
                     case Cell.CELL_TYPE_FORMULA:
                         // 导入时如果为公式生成的数据则无值
//                         if (!"".equals(cell.getStringCellValue())) {
//                            value = cell.getStringCellValue();
//                         } else {
//                            value = cell.getNumericCellValue() + "";
//                         }
                    	 cell.setCellType(Cell.CELL_TYPE_STRING);
                    	 value = cell.getStringCellValue();
                         break;
                     case Cell.CELL_TYPE_BLANK:
                         break;
                     case Cell.CELL_TYPE_ERROR:
                         value = "";
                         break;
                     case Cell.CELL_TYPE_BOOLEAN:
                         value = (cell.getBooleanCellValue() == true ? "Y" : "N");
                         break;
                     default:
                         value = "";
                     }
                  }
                  values[columnIndex] = rightTrim(value);
                  hasValue = true;
              }
              if (hasValue) {
                  result.add(values);
              }
           }
       }
       String[][][] returnArray = new String[resultList.size()][][];
       for(int i=0;i<resultList.size();++i){
	       String[][] sheetArray = new String[resultList.get(i).size()][rowSizeArray[i]];
	       for (int j = 0; j < resultList.get(i).size(); j++) {
	    	   sheetArray[j] = resultList.get(i).get(j);
	       }
	       returnArray[i]=sheetArray;
       }
       return returnArray;
    }
    
    /**
     * 去掉字符串右边的空格
     * @param str 要处理的字符串
     * @return 处理后的字符串
     */
    public static String rightTrim(String str) {
       if (str == null) {
           return "";
       }
       int length = str.length();
       for (int i = length - 1; i >= 0; i--) {
           if (str.charAt(i) != 0x20) {
              break;
           }
           length--;
       }
       return str.substring(0, length);
    }
    
    

}

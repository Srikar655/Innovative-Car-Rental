package Main;

import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.view.JasperViewer;

import java.util.*;

public class JasperTrail {

    public static void main(String[] args) {
        try {
            // Compile the JasperReport XML template to a JasperReport object
            JasperReport jasperReport = JasperCompileManager.compileReport("D:\\Demo\\invoice.jrxml");

            List<Map<String, Object>> dataSourceList = new ArrayList<>();
            Map<String, Object> dataMap = new HashMap<>();
            dataMap.put("Invoice", "INV-001");
            dataMap.put("InvoiceDate", new Date());
            dataMap.put("InvoicePeriod", "June 2024");
            dataMap.put("Name", "John Doe");
            dataMap.put("Address", "123 Main St, Anytown, USA");
            dataMap.put("PhoneNo", "123-456-7890");
            dataSourceList.add(dataMap);

            JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(dataSourceList);

            // Parameters map
            Map<String, Object> parameters = new HashMap<>();
            parameters.put("TABLE_DATA_SOURCE", dataSource);

            // Fill the report with data
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);

         // View the report (optional)
            JasperViewer.viewReport(jasperPrint);

            // Export the report to PDF (optional)
            String outputFilePath = "D:\\JasperReports";
            JasperExportManager.exportReportToPdfFile(jasperPrint, outputFilePath);


            System.out.println("Invoice generated successfully!");

        } catch (JRException e) {
            e.printStackTrace();
        }
    }
}

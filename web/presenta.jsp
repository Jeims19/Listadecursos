<%@page import="bd.ConectaBd"%>
<%@page import= "java.sql.*" %>
<%@page import= "bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%! 
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
        
        %>
        
    </head>
    <body>
        <table border="1" cellpading="0">
            <thead>
                <th>IDE</th>
                <th>NOMBRE</th>
                <th>APELLIDO</th>
                <th>DNI</th>
                <th>CODIGO</th>
                <th>ESTADO</th>
                <th>ELIMINAR</th>
                <th>MODIFICAR</th>
                
            </thead>
            
        <%
        try{
            ConectaBd bd= new ConectaBd();
            cn = bd.getConnection(); //ruta de conexion
            consulta = "Select idestudiante, nombre, apellido, dni, codigo, estado " + "from estudiante";
            pst = cn.prepareStatement(consulta);
            rs = pst.executeQuery();
            
            while(rs.next()){
                
                %>
                               
              
                 <tbody>
                        <tr>
                            <td><%out.print(rs.getString(1));%></td>
                            <td><%out.print(rs.getString(2));%></td>
                            <td><%out.print(rs.getString(3));%></td>
                            <td><%out.print(rs.getString(4));%></td>
                            <td><%out.print(rs.getString(5));%></td>
                            <td><% out.print(rs.getString(6));%></td>
                            <td>Eliminar</td>
                            <td>Modificar</td>
                        </tr>
                    </tbody>
               

                
                <%
                
                 
                      
          
            }
            
            
        }catch(Exception e){
            out.print("Error SQL");
        }
        
        
        %>
         </table>
    </body>
</html>

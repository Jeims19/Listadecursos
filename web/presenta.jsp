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
            
            String s_accion;
            String s_ideestudiante;
        
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
            
            s_accion = request.getParameter("f_accion");
            s_ideestudiante = request.getParameter("f_ideestudiante");
            
                if(s_accion != null){
                    if(s_accion.equals("E")){
                        consulta = "Delete from estudiante "
                                + " Where "
                                + " idestudiante = " +s_ideestudiante+ "";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }
                }
            consulta = "Select idestudiante, nombre, apellido, dni, codigo, estado " + "from estudiante";
            //out.print(consulta);
            pst = cn.prepareStatement(consulta);
            rs = pst.executeQuery();
            
            int num=0;
            String ide;
            
            while(rs.next()){
                num++;
                ide=rs.getString(1);
                %>
                               
              
                 <tbody>
                        <tr>
                            <td><%out.print(num);%></td>
                            <td><%out.print(rs.getString(2));%></td>
                            <td><%out.print(rs.getString(3));%></td>
                            <td><%out.print(rs.getString(4));%></td>
                            <td><%out.print(rs.getString(5));%></td>
                            <td><% out.print(rs.getString(6));%></td>
                            <td><a href="presenta.jsp?f_accion=E&f_ideestudiante= <%out.print(ide);%> ">Eliminar</a></td>
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

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
            String s_nombre;
            String s_apellido;
            String s_dni;
            String s_codigo;
            String s_estado;
        
        %>
        
    </head>
    <body>
        <form name="agregarForm" action="presenta.jsp" method="get">
        
        <table border="0" align="center">
            <thead>
                <tr align="center">
                    <th colspan="2">Agregar Nuevo Estudiante</th>
                    
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Nombre: </td>
                    <td><input type="text" name="f_nombre" value="" /></td>
                </tr>
                <tr>
                    <td>Apellido: </td>
                    <td><input type="text" name="f_apellido" value="" /></td>
                </tr>
                <tr>
                    <td>Dni: </td>
                    <td><input type="text" name="f_dni" value="" /></td>
                </tr>
                <tr>
                    <td>Codigo: </td>
                    <td><input type="text" name="f_codigo" value="" /></td>
                </tr>
                <tr>
                    <td>Estado: </td>
                    <td><input type="text" name="f_estado" value="" /></td>
                </tr>
                <tr align="center">
                    <td colspan="2"><input type="submit" value="Agregar" /></td>
                    <input type="hidden" name="f_accion" value="C"/>
                </tr>
            </tbody>
        </table>

        </form>
        
        <br><br>
        
        <table border="1" cellpading="0" align="center">
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
                    }else if(s_accion.equals("C")){
                       
                        s_nombre= request.getParameter("f_nombre");
                        s_apellido= request.getParameter("f_apellido");
                        s_dni= request.getParameter("f_dni");
                        s_codigo= request.getParameter("f_codigo");
                        s_estado= request.getParameter("f_estado");
                        
                        consulta = "insert into "
                                + "estudiante (nombre, apellido, dni, codigo, estado) "
                                + "values ('" +s_nombre+ "','"+s_apellido+"','"+s_dni+"','"+s_codigo+"','"+s_estado+"' )";
                                
                        out.print(consulta);
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

<%@include file="conecta.jsp" %>
<%@page contentType="text/xml" pageEncoding="UTF-8"%>
<dados_professores>        
        <%
            ResultSet rs = null;
            String sql = "";
            PreparedStatement pstm= null;            
            try{
                sql = "SELECT * FROM tb_professor";
                pstm = con.prepareStatement(sql);
                rs = pstm.executeQuery();                
                while(rs.next()) {            
                    %>
                    <professor>
                        <id><%= rs.getInt("id_Professor")%></id>
                        <Nome><%= rs.getString("Nome")%></Nome>
                        <Sobrenome><%= rs.getString("Sobrenome")%></Sobrenome>
                        <Login><%= rs.getString("login")%></Login>
                        <Senha><%= rs.getString("senha")%></Senha>
                    </professor>
                    <%
                } 
        } catch(Exception ex){
            out.print(ex.getMessage());
        }
        finally {
            if(rs!=null) rs.close();
            if(pstm!=null) pstm.close();
        }
        %>
</dados_professores>

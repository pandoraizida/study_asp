<html>
<body>

  <%
      ' если параметр пришел, то считываем его в переменную
      ' если не пришел - заносим нулевое значение
      if(Request.QueryString("razmer")<>"")then
          temp_razmer = Cint(Request.QueryString("razmer"))
      else
          temp_razmer = 0
      end if
       
  
  %>


	<h1>“аблица умножени€</h1>
  <form action="test.asp" method="GET" 
    name="frm_razmer" id="razmer"
  >  
      –азмерность
      <select name="razmer" id="razmer" 
         OnChange="frm_razmer.submit();"
      >
          <%
              for i=1 to 20
                Response.Write("<option ")
                ' отмечаем выбранный элемент
                if(i = temp_razmer) then
                    Response.Write(" selected ")
                end if
                Response.Write(" value='"+CStr(i)+"'>")
                Response.Write(i)
                Response.Write("</option>")
              next
          %>
      </select>
      <!--
      <input type="submit" value="ѕостроить">
      -->
  </form>
  
  <%
     
      
      Response.Write("<table border='1' cellpadding='8'>")
        znak=1
        ' цикл по строкам таблицы
        for count_tr=1 to temp_razmer
            Response.Write("<tr>")
            ' цикл по €чейкам слева направо
            for count_td=1 to temp_razmer
                Response.Write("<td ")
                if((count_td + count_tr) mod 2 = 0)  then
                  Response.Write("bgcolor='silver'")
                end if
                Response.Write(">")
                Response.Write(count_tr*count_td)
                Response.Write("</td>")
                znak=-znak
            next
            Response.Write("</tr>")
        next
      Response.Write("</table>")
  
  
  %>
  

</body>

</html>




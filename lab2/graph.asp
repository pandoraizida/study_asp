<html>
<head>
</head>
<body>
    <h1>Выборы</h1>
    <hr>
    <%
              'специальный цикл рассчитываем всего проголосовало и данные лидера
          gv_n=Cint(Request.QueryString("n"))
              'присваеваем глобальной переменной 0
              gv_vsego=0
              gv_lider=0
              for i=1 to gv_n
              Response.Write("<td>")
                'считаем сколько проголосовало всего, к исходной глобальной переменной плюсуем
                'запрос querystring извлекает значения переменных из строки http запроса
                gv_vsego=gv_vsego+Cint(Request.QueryString("g"+Cstr(i)))
                if((Cint(Request.QueryString("g"+Cstr(i))))>gv_lider) then
                gv_lider=Cint(Request.QueryString("g"+Cstr(i)))
                end if
              
              next
           Response.Write(gv_lider)   
             'выводим всего на экран
           'Response.Write(gv_vsego)
              
           Response.Write("<table border=1 cellpadding=6>")     
           'выводим строку с процентом и столбиками
           Response.Write("<tr valign='bottom' align='center' height=200px>") 
              for i=1 to gv_n
              Response.Write("<td>")
              'Response.Write(Request.QueryString("g"+Cstr(i))) 
              temp_proc=Cint(Request.QueryString("g"+Cstr(i)))/gv_vsego
              'переводим в % и показываем целую часть
              Response.Write(Cint(100*temp_proc))
              Response.Write("%<br>") 
              
               if(Cint(Request.QueryString("g"+Cstr(i)))=gv_lider) then
                tekcolor="red"
               else
                tekcolor="blue"
               end if  
              'высота столбика не больше 200 пикселей
                Response.Write("<table width=25 bgcolor='"+tekcolor+"' height="+Cstr(Cint(100*temp_proc)*2)+">")
                Response.Write("<tr><td></td></tr>")
                Response.Write("</table>")         
              Response.Write("</td>")
           
           next  
           Response.Write("</tr>")   
           'выводим строку с именами
           Response.Write("<tr align='center'>")  
           for i=1 to gv_n
              Response.Write("<td>")
              Response.Write(Request.QueryString("fio"+Cstr(i)))           
              Response.Write("</td>")
           
           next
           Response.Write("</tr>")
           Response.Write("</table>")
    %>




</body>
</html>
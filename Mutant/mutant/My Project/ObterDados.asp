<%
' �rea de acesso aos dados da HomePage
' Contador de p�ginas
dim obj2, WContHomePage
dim retorno
dim obj1
dim rst

'Set obj2 = server.CreateObject("MSWC.PageCounter")
'WContHomePage = obj2.PageHit()
'WContHomePage = obj2.hits()
'Set obj2 = nothing

'Verifica��o da sauda��o
if time() > "00:00:00" AND time() < "12:00:00" then
	vSaudacao = "Bom dia "
elseif time() > "12:00:00" AND time() < "18:00:00" then
	vSaudacao = "Boa tarde "
else
	vSaudacao = "Boa noite "
end if

%>
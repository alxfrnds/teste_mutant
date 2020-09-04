<!--#include file="BIBLIO.ASP"-->
<!--#include file="EstilosHomepage.inc"-->
<!--#include file="ObterDados.asp"--> 
<%
	vDescricao=request.Form("vDescricao")
	vValor=request.Form("vValor")
	Salvar_Ingrediente()%>
<br><br><br><br><br><br>
<p class=font8 align=center>
	<a href="ingredientes.asp" class="font8">
		Clique AQUI para voltar aos ingredientes 
	</a>
</p>
 
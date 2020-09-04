<!--#include file="BIBLIO.ASP"-->
<!--#include file="EstilosHomepage.inc"-->
<!--#include file="ObterDados.asp"--> 
<%
	vId_lanche=request.Form("vidlanche")
	vDescricao=request.Form("vDescricao")
	vIngrediente=request.Form("vIngrediente")
	Salvar_Lanche()%>
<br><br><br><br><br><br>
<p class=font8 align=center>
	<form id="formlanche" action="novo_lanche.asp" method=post>
		<input type=hidden name="vidlanche" value="<%=vId_lanche%>" ID="vacao">
		<script language="javascript">
			document.getElementById("formlanche").submit();
        </script>
	</form>
</p>
 
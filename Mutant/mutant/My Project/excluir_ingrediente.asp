<!--#include file="BIBLIO.ASP"-->
<!--#include file="EstilosHomepage.inc"-->
<!--#include file="ObterDados.asp"--> 
<%
	vId=request("vId")
	Call Excluir_Ingrediente(vId)%>
<br><br><br><br><br><br>
<p class=font8 align=center>
	<form id="formingrediente" action="ingredientes.asp" method=post>
		<input type=hidden name="vid" value="<%=vId%>" ID="vacao">
		<script language="javascript">
			document.getElementById("formingrediente").submit();
        </script>
	</form>
</p>
 
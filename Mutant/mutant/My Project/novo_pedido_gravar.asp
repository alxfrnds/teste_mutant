<!--#include file="BIBLIO.ASP"-->
<!--#include file="EstilosHomepage.inc"-->
<!--#include file="ObterDados.asp"--> 
<%
	Response.Write(Request.Form) 
	'Response.Write("<br>")
	'for i=1 to Request.Form("vQuantidade").Count
	'	Response.Write(Request.Form("vQuantidade")(i) & " - " & Request.Form("vIngrediente")(i) & "<br>")
	'next
	'response.end
	vId_lanche=request.Form("vidlanche")
	vDescricao=request.Form("vDescricao")
	vIngrediente=request.Form("vIngrediente")
	vPedido = Inserir_Pedido()	
	for i=1 to Request.Form("vQuantidade").Count
		Call Inserir_Pedido_x_Itens(vPedido, vId_lanche, Request.Form("vIngrediente")(i), Request.Form("vQuantidade")(i))	
		'Response.Write(Request.Form("vQuantidade")(i) & " - " & Request.Form("vIngrediente")(i) & "<br>")
	next
	Atualizar_Valor_Pedido(vPedido)	
	%>
<br><br><br><br><br><br>
<p class=font8 align=center>
	<form id="formpedido" action="default.asp" method=post>
		<script language="javascript">
            document.getElementById("formpedido").submit();
        </script>
	</form>
</p>
 
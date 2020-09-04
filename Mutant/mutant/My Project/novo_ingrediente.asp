<!--#include file="BIBLIO.ASP"-->
<!--#include file="EstilosHomepage.inc"-->
<!--#include file="ObterDados.asp"-->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Lanchonete Mutant - NOVO INGREDIENTE</title>
</head>
<body topmargin=0 leftmargin=0 onload="javascript:document.formingredientes.vDescricao.focus();">
    <form name="formingredientes" action=novo_ingrediente_gravar.asp" method=post>
		<table cellpadding=2 cellspacing=2 border=0 width=100% align=center bgcolor="#F0F0F0">
            <tr bgcolor=white><td class=font8 colspan="3" align="center"><h1>Lanchonete Mutant - NOVO INGREDIENTE</h1></td></tr>
        </table>
        <table cellpadding=5 cellspacing=2 border=0 width=95% align=center border=1 ID="Table11" bgcolor=white>
			<tr bgcolor=white>
				<td align=left class=font8 colspan=2><font color=white>. </font></td>
			</tr>	
			<tr bgcolor=white>
				<td align=left class=font8>Descri&ccedil;&atilde;o: </td>
				<td align=left class=font8><input type=text name=vDescricao class=font8 maxlenght=50 size=50></td>
			</tr>
			<tr bgcolor=white>
				<td align=left class=font8>Valor: </td>
				<td align=left class=font8><input type=text name=vValor class=font8 maxlenght=13 size=13></td>
			</tr>
			<tr bgcolor=ffcc99>
				<td align=center class=font8 colspan=2>
					<input type=submit value="Confirma inclus&atilde;o?" class=font8 ID="Submit1" NAME="Submit1">
				</td>
			</tr>
		</table>
		<table cellpadding=2 cellspacing=2 border=0 width=100% align=center bgcolor="#F0F0F0">
            <tr bgcolor=white><td class=font8 align=center colspan="3"><button formaction="lanches.asp">Lanches</button>&nbsp;<button formaction="default.asp">Pedidos</button>&nbsp;<button formaction="ingredientes.asp">Ingredientes</button></td></tr>
        </table>
    </form>
</body>
</html>
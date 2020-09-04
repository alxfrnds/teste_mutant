<!--#include file="BIBLIO.ASP"-->
<!--#include file="EstilosHomepage.inc"-->
<!--#include file="ObterDados.asp"-->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Lanchonete Mutant - LANCHES</title>
</head>
<body topmargin=0 leftmargin=0>
    <form id="formingredientes" method="post">
        <table cellpadding=2 cellspacing=2 border=0 width=100% align=center bgcolor="#F0F0F0">
            <tr bgcolor=white><td class=font8 colspan="3" align="center"><h1>Lanchonete Mutant - LANCHES</h1></td></tr>
            <tr bgcolor=white><td class=font13 align=left colspan="3"><b>&nbsp;LANCHE</b></td></tr>
            <%ListaLanches()%>
            </br>
            <input type=hidden name="vacao" value="I" ID="vacao">
            <tr bgcolor=white><td class=font8 align=center colspan="3"><button formaction="ingredientes.asp">Ingredientes</button>&nbsp;<button formaction="default.asp">Pedidos</button>&nbsp;<button formaction="novo_lanche.asp">Novo Lanche</button></td></tr>            
        </table>
    </form>
</body>
</html>
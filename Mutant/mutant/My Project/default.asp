﻿<!--#include file="BIBLIO.ASP"-->
<!--#include file="EstilosHomepage.inc"-->
<!--#include file="ObterDados.asp"-->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Lanchonete Mutant - PEDIDOS</title>
</head>
    <body topmargin=0 leftmargin=0>
        <form id="formpedidos" runat="server">
            <table cellpadding=2 cellspacing=2 border=0 width=100% align=center bgcolor="#F0F0F0">
                <tr bgcolor=white><td class=font8 colspan="3" align="center"><h1>Lanchonete Mutant - PEDIDOS</h1></td></tr>
                <tr bgcolor=white><td class=font13 align=left >&nbsp;<b>PEDIDO</b></td><td class=font13 align=right colspan="2"><b>VALOR</b></td></tr>
                <%ListaPedidos()%>
                </br>
                <tr bgcolor=white><td class=font8 align=center colspan="3"><button formaction="lanches.asp">Lanches</button>&nbsp;<button formaction="ingredientes.asp">Ingredientes</button>&nbsp;<button formaction="novo_pedido.asp">Novo Pedido</button></td></tr>            
            </table>
        </form>
    </body>
</html>
<!--#include file="BIBLIO.ASP"-->
<!--#include file="EstilosHomepage.inc"-->
<!--#include file="ObterDados.asp"-->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Lanchonete Mutant - NOVO PEDIDO</title>
</head>
<body topmargin=0 leftmargin=0>
	<%
	Dim vId_lanche
	vId_lanche = request("vidlanche")
	'Response.Write ("vId_lanche: "&vId_lanche)
    'Response.End
	%>
    <form id="formpedido" action="novo_pedido_gravar.asp" method=post>
		<table cellpadding="2" cellspacing="2" border="0" width="100%" align="center" bgcolor="#F0F0F0">
            <tr bgcolor="white"><td class="font8" colspan="3" align="center"><h1>Lanchonete Mutant - NOVO PEDIDO</h1></td></tr>            
        </table>
		<table cellpadding=5 cellspacing=2 border=0 width=95% align=center border=1 ID="Table11" bgcolor=white>
			<tr bgcolor=white>
				<td align="left" class="font8">Lanche:&nbsp;
				    <select name="vidlanche" class="font8" id="vidlanche">
                        <%	
                            Dim StrConn3
							Set ObjCmd3 = Server.CreateObject ("ADODB.Command")
							Set ObjConn3 = Server.CreateObject ("ADODB.Connection")
							Set ObjRS3 = Server.CreateObject ("ADODB.RecordSet")
							ObjRS3.CursorLocation = adUseClient
							ObjRS3.CursorType = adOpenKeySet
							ObjRS3.LockType = adLockBatchOptimistic
	
							'Abre a conexão
							ObjConn3.ConnectionString = "file name=D:\Temp\Mutant\mutant\My Project\mutant.udl"
							ObjConn3.Open StrConn3	
							Dim strSQL
    
							ObjCmd3.CommandText = "sp_lista_lanches"		' Nome procedimento no servidor
							ObjCmd3.CommandType  = adCmdStoredProc		        ' Tipo comando
							Set ObjCmd3.ActiveConnection = ObjConn3		        ' Associa o cammand com a conecção corrente
		
							Set ObjRS3 = ObjCmd3.Execute()
							Response.Write "<OPTION value=0>ESCOLHA O LANCHE</Option>"
							Do While Not ObjRS3.EOF 
								Set ObjCmd3 = Server.CreateObject ("ADODB.Command")	
								if Cint(ObjRS3("id")) = Cint(vId_lanche) Then
									Response.Write "<OPTION value="&ObjRS3("id")&" selected>"&ObjRS3("descricao")&"</Option>"
								Else
									Response.Write "<OPTION value="&ObjRS3("id")&">"&ObjRS3("descricao")&"</Option>"
								End if 
								ObjRS3.MoveNext
							Loop
                        %>		
					</select>&nbsp;&nbsp;<button formaction="novo_pedido.asp">Selecionar</button>
				</td>
			</tr>
		</table>
		<%If vId_lanche <> "" And vId_lanche <> "0" Then%>
		<table cellpadding="2" cellspacing="2" border="0" width="100%" align="center" bgcolor="#F0F0F0">
            <tr bgcolor="white"><td class="font13" align="left" colspan="3">&nbsp;<b>INGREDIENTES</b></td></tr>
			<tr bgcolor="white"><td class="font13" align="left">&nbsp;<b>QUANTIDADE</b></td><td class="font13" align="left">&nbsp;<b>DESCRI&Ccedil;&Atilde;O</b></td><td class="font13" align="left">&nbsp;<b>VALOR</b></td></tr>
            <%
				'Response.Write ("vId_lanche: "&vId_lanche)
				'Response.End
				ListaIngredientesPedido(vId_lanche)
			%>
            </br>
        </table>
        <table cellpadding=5 cellspacing=2 border=0 width=95% align=center border=1 ID="Table11" bgcolor=white>
			<tr bgcolor=white>
				<td align=left class=font8 colspan=2><font color=white>. </font></td>
			</tr>	
			<tr bgcolor=ffcc99>
				<td align=center class=font8 colspan=2>
					<input type=submit value="Confirma Pedido?" class=font8 ID="Submit1" NAME="Submit1">
				</td>
			</tr>
		</table>
		<%End If%>
        <table cellpadding=2 cellspacing=2 border=0 width=100% align=center bgcolor="#F0F0F0">
            <tr bgcolor=white><td class=font8 align=center colspan="3"><button formaction="lanches.asp">Lanches</button>&nbsp;<button formaction="default.asp">Pedidos</button>&nbsp;<button formaction="ingredientes.asp">Ingredientes</button></td></tr>
        </table>
    </form>
</body>
</html>
<!--#include file="BIBLIO.ASP"-->
<!--#include file="EstilosHomepage.inc"-->
<!--#include file="ObterDados.asp"-->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Lanchonete Mutant - NOVO LANCHE</title>
</head>
<body topmargin=0 leftmargin=0 onload="javascript:document.formlanche.vDescricao.focus();">
    <%vAcao = request.Form("vacao")
      Dim vId_lanche
	  Dim vDescricao
    If vacao="I" Then
        vId_lanche = Inserir_Lanche()
		vDescricao = ""
    Else
        vId_lanche = request("vidlanche")
		vDescricao = busca_lanche(vId_lanche)
    End if 
    'Response.Write ("vacao: "&vacao)
    'Response.Write ("</br>")
    'Response.Write ("vId_lanche: "&vId_lanche)
    'Response.End
        %>
    <form name="formlanche" action="novo_lanche_gravar.asp" method=post>
		<input type=hidden name="vidlanche" value="<%=vId_lanche%>" ID="vidlanche">
        <table cellpadding=2 cellspacing=2 border=0 width=100% align=center bgcolor="#F0F0F0">
            <tr bgcolor=white><td class=font8 colspan="3" align="center"><h1>Lanchonete Mutant - NOVO LANCHE</h1></td></tr>
            <tr bgcolor=white><td class=font13 align=left colspan="3">&nbsp;<b>INGREDIENTE</b></td></tr>
            <%ListaIngredientesNovo(vId_lanche )%>
            </br>
        </table>
        <table cellpadding=5 cellspacing=2 border=0 width=95% align=center border=1 ID="Table11" bgcolor=white>
			<tr bgcolor=white>
				<td align=left class=font8 colspan=2><font color=white>. </font></td>
			</tr>	
			<tr bgcolor=white>
				<td align=left class=font8>Descri&ccedil;&atilde;o: </td>
				<td align=left class=font8><input type=text name=vDescricao class=font8 maxlenght=50 size=50 value="<%=vDescricao%>">&nbsp;&nbsp;</td>
			</tr>
			<tr bgcolor=white>
				<td align=left class=font8>Ingrediente: </td>
				<td align=left class=font8>
                    <select name=vIngrediente class=font8 ID="vIngrediente">
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
    
							ObjCmd3.CommandText = "sp_lista_ingredientes"		' Nome procedimento no servidor
							ObjCmd3.CommandType  = adCmdStoredProc		        ' Tipo comando
							Set ObjCmd3.ActiveConnection = ObjConn3		        ' Associa o cammand com a conecção corrente
		
							Set ObjRS3 = ObjCmd3.Execute()
							Do While Not ObjRS3.EOF 
								Set ObjCmd3 = Server.CreateObject ("ADODB.Command")	
								Response.Write "<OPTION value="&ObjRS3("id")&">"&ObjRS3("descricao")&"</Option>"
								ObjRS3.MoveNext
							Loop
                        %>		
					</select>
				</td>
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
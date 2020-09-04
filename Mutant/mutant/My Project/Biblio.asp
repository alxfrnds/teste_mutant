<!--#include file="adovbs.inc"--><%
Response.Expires =0

'Declaração de Variáveis Globais
Dim ObjConn
Dim ObjRS
Dim udl 
udl = "D:\Temp\Mutant\mutant\My Project\mutant.udl"

Sub Conecta_Base()
	Dim StrConn
	Set ObjConn = Server.CreateObject ("ADODB.Connection")
	Set ObjRS = Server.CreateObject ("ADODB.RecordSet")
	ObjRS.CursorLocation = adUseClient
	ObjRS.CursorType = adOpenKeySet
	ObjRS.LockType = adLockBatchOptimistic
	
	'Abre a conexão
	ObjConn.ConnectionString = "file name="+udl
	ObjConn.Open StrConn	
End Sub

Sub ListaPedidos()
	Conecta_Base
	Dim strSQL
    Set ObjCmd = Server.CreateObject ("ADODB.Command")
	Set ObjRS = Server.CreateObject ("ADODB.RecordSet")	
	ObjCmd.CommandText = "sp_lista_pedidos"		' Nome procedimento no servidor
	ObjCmd.CommandType  = adCmdStoredProc		        ' Tipo comando
	Set ObjCmd.ActiveConnection = ObjConn		        ' Associa o cammand com a conecção corrente
		
	Set ObjRS = ObjCmd.Execute()
	Do While Not ObjRS.EOF 
		Set ObjCmd2 = Server.CreateObject ("ADODB.Command")	
		Response.Write("<tr><td class=font8 align=left >&nbsp;&nbsp;Pedido:&nbsp;" & ObjRS("id") & "</td><td colspan='2' class=font8 align=right >" & ObjRS("valor") & "</td></tr>")
		ObjCmd2.CommandText = "sp_lista_pedidos_itens"		' Nome procedimento no servidor
		ObjCmd2.CommandType  = adCmdStoredProc		        ' Tipo comando
		Set ObjCmd2.ActiveConnection = ObjConn		        ' Associa o cammand com a conecção corrente
		Set ObjParam = ObjCmd2.CreateParameter("@vID", adInteger, adParamInput, 4, ObjRS("id"))
		ObjCmd2.Parameters.Append ObjParam
		Set ObjRS2 = Server.CreateObject ("ADODB.RecordSet")
		Set ObjRS2 = ObjCmd2.Execute()
		Response.Write("<tr><td colspan='3'>")
		Response.Write("<table width='100%'>")
	    Response.Write("<tr><td class=font13 align=center ><b>ITEM</b></td><td class=font13 align=center ><b>QT</b></td><td class=font13 align=left ><b>DESCRI&Ccedil;&Atilde;O</b></td><td class=font13 align=right ><b>VALOR</b></td><td class=font13 align=right ><b>TOTAL</b></td></tr>")
		decTotalPedido = 0
		Do While Not ObjRS2.EOF 
			Response.Write("<tr><td class=font8 align=center >&nbsp;&nbsp;&nbsp;" & ObjRS2("id") & "</td><td class=font8 align=center >" & ObjRS2("qt") & "</td><td class=font8 align=left >" & ObjRS2("descricao") & "</td><td class=font8 align=right >" & ObjRS2("valor") & "</td><td class=font8 align=right >" & ObjRS2("total") & "</td></tr>")
			decTotalPedido = decTotalPedido + CDbl(replace(ObjRS2("total"),".",","))
			ObjRS2.MoveNext
		Loop
		Response.Write("<tr><td>&nbsp;&nbsp;&nbsp;</td><td></td><td></td><td class=font8 align=right >TOTAL</td><td class=font8 align=right >" & FormatNumber(decTotalPedido,2) & "</td></tr>")
		if decTotalPedido > Cdbl(replace(ObjRS("valor"),".",",")) Then
			Response.Write("<tr><td>&nbsp;&nbsp;&nbsp;</td><td></td><td></td><td class=font8 align=right >DESCONTO</td><td class=font8 align=right >" & FormatNumber(decTotalPedido-Cdbl(replace(ObjRS("valor"),".",",")),2) & "</td></tr>")
			Response.Write("<tr><td>&nbsp;&nbsp;&nbsp;</td><td></td><td></td><td class=font8 align=right >LIQUIDO</td><td class=font8 align=right >" & FormatNumber(Cdbl(replace(ObjRS("valor"),".",",")),2) & "</td></tr>")
		End if
		
		Response.Write("</table>")		
		Response.Write("</td></tr>")
		ObjRS.MoveNext
		If Not ObjRS.EOF Then
			Response.Write("<tr><td colspan=3><hr></td></hr>")
		End If
	Loop
	ObjConn.Close 
	Set ObjConn = Nothing
End Sub

Sub ListaIngredientes()
	Dim StrConn3
	Set ObjCmd3 = Server.CreateObject ("ADODB.Command")
	Set ObjConn3 = Server.CreateObject ("ADODB.Connection")
	Set ObjRS3 = Server.CreateObject ("ADODB.RecordSet")
	ObjRS3.CursorLocation = adUseClient
	ObjRS3.CursorType = adOpenKeySet
	ObjRS3.LockType = adLockBatchOptimistic
	
	'Abre a conexão
	ObjConn3.ConnectionString = "file name="+udl
	ObjConn3.Open StrConn3	
	Dim strSQL
    
	ObjCmd3.CommandText = "sp_lista_ingredientes"		' Nome procedimento no servidor
	ObjCmd3.CommandType  = adCmdStoredProc		        ' Tipo comando
	Set ObjCmd3.ActiveConnection = ObjConn3		        ' Associa o cammand com a conecção corrente
		
	Set ObjRS3 = ObjCmd3.Execute()
	Do While Not ObjRS3.EOF 
		Set ObjCmd3 = Server.CreateObject ("ADODB.Command")	
		Response.Write("<tr><td class=font8 align=left >&nbsp;&nbsp;Item:&nbsp;" & ObjRS3("id") & "</td><td class=font8 align=right >" & ObjRS3("descricao") & "&nbsp;&nbsp;<a href='excluir_ingrediente.asp?vId="&Trim(ObjRS3("id"))&"' class='BarraMenu'>&nbsp;<font color=red>EXCLUIR INGREDIENTE</font></a></td><td class=font8 align=right >" & ObjRS3("valor") & "</td></tr>")
		ObjRS3.MoveNext
	Loop
	ObjConn3.Close 
	Set ObjConn3 = Nothing
End Sub
Sub ListaLanches()
	Dim StrConn4
	Set ObjCmd4 = Server.CreateObject ("ADODB.Command")
	Set ObjConn4 = Server.CreateObject ("ADODB.Connection")
	Set ObjRS4 = Server.CreateObject ("ADODB.RecordSet")
	ObjRS4.CursorLocation = adUseClient
	ObjRS4.CursorType = adOpenKeySet
	ObjRS4.LockType = adLockBatchOptimistic
	
	'Abre a conexão
	ObjConn4.ConnectionString = "file name="+udl
	ObjConn4.Open StrConn4	
	Dim strSQL    
	ObjCmd4.CommandText = "sp_lista_lanches"		' Nome procedimento no servidor
	ObjCmd4.CommandType  = adCmdStoredProc		        ' Tipo comando
	Set ObjCmd4.ActiveConnection = ObjConn4		        ' Associa o cammand com a conecção corrente
	Set ObjRS4 = ObjCmd4.Execute()
	Do While Not ObjRS4.EOF 
		Set ObjCmd4 = Server.CreateObject ("ADODB.Command")	
		Response.Write("<tr><td class=font8 align=left colspan=3>&nbsp;&nbsp;<a href=novo_lanche.asp?vidlanche="&ObjRS4("id")&" class=BarraMenu>" & ObjRS4("descricao") & "</a><a href='excluir_lanche.asp?vId_lanche="&Trim(ObjRS4("id"))&"' class='BarraMenu'>&nbsp;<font color=red>EXCLUIR LANCHE</font></a></td></tr>")
		ObjRS4.MoveNext
	Loop
	ObjConn4.Close 
	Set ObjConn4 = Nothing
End Sub
Sub Salvar_Ingrediente()	
	'Abre a conexão
	Set ObjConn5 = Server.CreateObject ("ADODB.Connection")
	ObjConn5.ConnectionString = "file name="+udl
	ObjConn5.Open StrConn5	
	Set ObjCmd5 = Server.CreateObject ("ADODB.Command")	
	ObjCmd5.CommandText = "sp_inserir_ingrediente"		' Nome procedimento no servidor
	ObjCmd5.CommandType  = adCmdStoredProc		        ' Tipo comando
	Set ObjCmd5.ActiveConnection = ObjConn5		        ' Associa o cammand com a conecção corrente
	Set ObjParam = ObjCmd5.CreateParameter("@vDescricao", adVarchar, adParamInput, 50, vDescricao)
	ObjCmd5.Parameters.Append ObjParam
	Set ObjParam = ObjCmd5.CreateParameter("@vValor", adCurrency, adParamInput, 4, vValor)
	ObjCmd5.Parameters.Append ObjParam
	ObjCmd5.Execute()
	ObjConn5.Close 
	Set ObjConn5 = Nothing
End Sub
Function Inserir_Lanche()	
	Set ObjRS6 = Server.CreateObject ("ADODB.RecordSet")
	ObjRS6.CursorLocation = adUseClient
	ObjRS6.CursorType = adOpenKeySet
	ObjRS6.LockType = adLockBatchOptimistic
	'Abre a conexão
	Set ObjConn6 = Server.CreateObject ("ADODB.Connection")
	ObjConn6.ConnectionString = "file name="+udl
	ObjConn6.Open StrConn6	
	Set ObjCmd6 = Server.CreateObject ("ADODB.Command")	
	ObjCmd6.CommandText = "sp_inserir_lanche"		' Nome procedimento no servidor
	ObjCmd6.CommandType  = adCmdStoredProc		        ' Tipo comando
	Set ObjCmd6.ActiveConnection = ObjConn6		        ' Associa o cammand com a conecção corrente
	Set ObjRS6 = ObjCmd6.Execute()
	Inserir_Lanche = ObjRS6("SCOPE_IDENTITY")
	ObjConn6.Close 
	Set ObjConn6 = Nothing
End Function
Sub ListaIngredientesNovo(vId)
	Dim strSQL
	Set ObjConn3 = Server.CreateObject ("ADODB.Connection")
	Set ObjCmd3 = Server.CreateObject ("ADODB.Command")
	Set ObjRS3 = Server.CreateObject ("ADODB.RecordSet")
	ObjRS3.CursorLocation = adUseClient
	ObjRS3.CursorType = adOpenKeySet
	ObjRS3.LockType = adLockBatchOptimistic
	
	'Abre a conexão
	ObjConn3.ConnectionString = "file name="+udl
	ObjConn3.Open StrConn3		
    
	ObjCmd3.CommandText = "sp_lista_lanches_ingredientes"		' Nome procedimento no servidor
	ObjCmd3.CommandType  = adCmdStoredProc		        ' Tipo comando
	Set ObjCmd3.ActiveConnection = ObjConn3		        ' Associa o cammand com a conecção corrente
	Set ObjParam = ObjCmd3.CreateParameter("@vId", adInteger, adParamInput, 4, vId)
	ObjCmd3.Parameters.Append ObjParam		
	Set ObjRS3 = ObjCmd3.Execute()
	Do While Not ObjRS3.EOF 
		Set ObjCmd3 = Server.CreateObject ("ADODB.Command")	
		Response.Write("<tr><td class=font8 align=left colspan=3>&nbsp;&nbsp;Item:&nbsp;" & ObjRS3("Id") & " - " & ObjRS3("descricao") & "<a href='excluir_ingrediente_lanche.asp?vId_lanche="&Trim(vId)&"&vIngrediente="&Trim(ObjRS3("id"))&"' class='BarraMenu'>&nbsp;<font color=red>EXCLUIR INGREDIENTE</font></a></td></tr>")
		ObjRS3.MoveNext
	Loop
	ObjConn3.Close 
	Set ObjConn3 = Nothing
End Sub
Sub Salvar_Lanche()	
	Set ObjRS6 = Server.CreateObject ("ADODB.RecordSet")
	ObjRS6.CursorLocation = adUseClient
	ObjRS6.CursorType = adOpenKeySet
	ObjRS6.LockType = adLockBatchOptimistic
	'Abre a conexão
	Set ObjConn6 = Server.CreateObject ("ADODB.Connection")
	ObjConn6.ConnectionString = "file name="+udl
	ObjConn6.Open StrConn6	
	Set ObjCmd6 = Server.CreateObject ("ADODB.Command")	
	ObjCmd6.CommandText = "sp_atualizar_lanche"		' Nome procedimento no servidor
	ObjCmd6.CommandType  = adCmdStoredProc		        ' Tipo comando
	Set ObjCmd6.ActiveConnection = ObjConn6		        ' Associa o cammand com a conecção corrente
	Set ObjParam = ObjCmd6.CreateParameter("@vId_lanche", adInteger, adParamInput, 4, vId_lanche)
	ObjCmd6.Parameters.Append ObjParam		
	Set ObjParam = ObjCmd6.CreateParameter("@vDescricao", adVarchar, adParamInput, 50, vDescricao)
	ObjCmd6.Parameters.Append ObjParam		
	Set ObjParam = ObjCmd6.CreateParameter("@vIngrediente", adInteger, adParamInput, 4, vIngrediente)
	ObjCmd6.Parameters.Append ObjParam		
	ObjCmd6.Execute()
	ObjConn6.Close 
	Set ObjConn6 = Nothing
End Sub	
Function busca_lanche(vId_lanche)
	Dim StrConn4
	Set ObjCmd4 = Server.CreateObject ("ADODB.Command")
	Set ObjConn4 = Server.CreateObject ("ADODB.Connection")
	Set ObjRS4 = Server.CreateObject ("ADODB.RecordSet")
	ObjRS4.CursorLocation = adUseClient
	ObjRS4.CursorType = adOpenKeySet
	ObjRS4.LockType = adLockBatchOptimistic
	
	'Abre a conexão
	ObjConn4.ConnectionString = "file name="+udl
	ObjConn4.Open StrConn4	
	Dim strSQL    
	ObjCmd4.CommandText = "sp_busca_lanche"		' Nome procedimento no servidor
	ObjCmd4.CommandType  = adCmdStoredProc		        ' Tipo comando
	Set ObjCmd4.ActiveConnection = ObjConn4		        ' Associa o cammand com a conecção corrente
	Set ObjParam = ObjCmd4.CreateParameter("@vId_lanche", adInteger, adParamInput, 4, vId_lanche)
	ObjCmd4.Parameters.Append ObjParam		
	Set ObjRS4 = ObjCmd4.Execute()
	If Not ObjRS4.EOF Then  
		busca_lanche = ObjRS4("descricao") 
	End IF
	ObjConn4.Close 
	Set ObjConn4 = Nothing
End Function
sub Excluir_Ingrediente_Lanche(vId_lanche,vIngrediente)	
	'Response.Write("vId_lanche="&vId_lanche)
	'Response.Write("vIngrediente="&vIngrediente)
	'Response.End
	Set ObjRS7 = Server.CreateObject ("ADODB.RecordSet")
	ObjRS7.CursorLocation = adUseClient
	ObjRS7.CursorType = adOpenKeySet
	ObjRS7.LockType = adLockBatchOptimistic
	'Abre a conexão
	Set ObjConn7 = Server.CreateObject ("ADODB.Connection")
	ObjConn7.ConnectionString = "file name="+udl
	ObjConn7.Open StrConn7
	Set ObjCmd7 = Server.CreateObject ("ADODB.Command")	
	ObjCmd7.CommandText = "sp_excluir_ingrediente_lanche"		' Nome procedimento no servidor
	ObjCmd7.CommandType  = adCmdStoredProc		        ' Tipo comando
	Set ObjCmd7.ActiveConnection = ObjConn7		        ' Associa o cammand com a conecção corrente
	Set ObjParam = ObjCmd7.CreateParameter("@vId_lanche", adInteger, adParamInput, 4, vId_lanche)
	ObjCmd7.Parameters.Append ObjParam		
	Set ObjParam = ObjCmd7.CreateParameter("@vIngrediente", adInteger, adParamInput, 4, vIngrediente)
	ObjCmd7.Parameters.Append ObjParam		
	ObjCmd7.Execute()
	ObjConn7.Close 
	Set ObjConn7 = Nothing
End sub
sub Excluir_Lanche(vId_lanche)	
	'Response.Write("vId_lanche="&vId_lanche)
	'Response.End
	Set ObjRS7 = Server.CreateObject ("ADODB.RecordSet")
	ObjRS7.CursorLocation = adUseClient
	ObjRS7.CursorType = adOpenKeySet
	ObjRS7.LockType = adLockBatchOptimistic
	'Abre a conexão
	Set ObjConn7 = Server.CreateObject ("ADODB.Connection")
	ObjConn7.ConnectionString = "file name="+udl
	ObjConn7.Open StrConn7
	Set ObjCmd7 = Server.CreateObject ("ADODB.Command")	
	ObjCmd7.CommandText = "sp_excluir_lanche"		' Nome procedimento no servidor
	ObjCmd7.CommandType  = adCmdStoredProc		        ' Tipo comando
	Set ObjCmd7.ActiveConnection = ObjConn7		        ' Associa o cammand com a conecção corrente
	Set ObjParam = ObjCmd7.CreateParameter("@vId_lanche", adInteger, adParamInput, 4, vId_lanche)
	ObjCmd7.Parameters.Append ObjParam		
	ObjCmd7.Execute()
	ObjConn7.Close 
	Set ObjConn7 = Nothing
End sub
sub Excluir_Ingrediente(vId)	
	'Response.Write("vId="&vId)
	'Response.End
	Set ObjRS7 = Server.CreateObject ("ADODB.RecordSet")
	ObjRS7.CursorLocation = adUseClient
	ObjRS7.CursorType = adOpenKeySet
	ObjRS7.LockType = adLockBatchOptimistic
	'Abre a conexão
	Set ObjConn7 = Server.CreateObject ("ADODB.Connection")
	ObjConn7.ConnectionString = "file name="+udl
	ObjConn7.Open StrConn7
	Set ObjCmd7 = Server.CreateObject ("ADODB.Command")	
	ObjCmd7.CommandText = "sp_excluir_ingrediente"		' Nome procedimento no servidor
	ObjCmd7.CommandType  = adCmdStoredProc		        ' Tipo comando
	Set ObjCmd7.ActiveConnection = ObjConn7		        ' Associa o cammand com a conecção corrente
	Set ObjParam = ObjCmd7.CreateParameter("@vId", adInteger, adParamInput, 4, vId)
	ObjCmd7.Parameters.Append ObjParam		
	ObjCmd7.Execute()
	ObjConn7.Close 
	Set ObjConn7 = Nothing
End sub
Sub ListaIngredientesPedido(vId)
	'Response.Write ("vId: "&vId)
	'Response.End
	if vId <> "" Then 		
		Dim StrConn3
		Set ObjCmd3 = Server.CreateObject ("ADODB.Command")
		Set ObjConn3 = Server.CreateObject ("ADODB.Connection")
		Set ObjRS3 = Server.CreateObject ("ADODB.RecordSet")
		ObjRS3.CursorLocation = adUseClient
		ObjRS3.CursorType = adOpenKeySet
		ObjRS3.LockType = adLockBatchOptimistic
		
		'Abre a conexão
		ObjConn3.ConnectionString = "file name="+udl
		ObjConn3.Open StrConn3	
		Dim strSQL
		
		ObjCmd3.CommandText = "sp_lista_lanches_ingredientes"		' Nome procedimento no servidor
		ObjCmd3.CommandType  = adCmdStoredProc		        ' Tipo comando
		Set ObjCmd3.ActiveConnection = ObjConn3		        ' Associa o cammand com a conecção corrente
		Set ObjParam = ObjCmd3.CreateParameter("@vId", adInteger, adParamInput, 4, vId)
		ObjCmd3.Parameters.Append ObjParam		
			
		Set ObjRS3 = ObjCmd3.Execute()
		Do While Not ObjRS3.EOF 
			Set ObjCmd3 = Server.CreateObject ("ADODB.Command")	
			Response.Write("<tr><td class=font8 align=left >&nbsp;&nbsp;Item:&nbsp;")
			Response.Write("<input type=hidden name=vIngrediente value="&ObjRS3("id")&">")
			Response.Write("&nbsp;&nbsp;"& ObjRS3("id") & "&nbsp;&nbsp;<input type=text name=vQuantidade class=font8 maxlenght=2 size=3 value='1'></td><td class=font8 align=left >" & ObjRS3("descricao") & "</td><td class=font8 align=right >" & ObjRS3("valor") & "</td></tr>")
			ObjRS3.MoveNext
		Loop
		ObjConn3.Close 
		Set ObjConn3 = Nothing
	end if
End Sub
Function Inserir_Pedido()	
	Set ObjRS6 = Server.CreateObject ("ADODB.RecordSet")
	ObjRS6.CursorLocation = adUseClient
	ObjRS6.CursorType = adOpenKeySet
	ObjRS6.LockType = adLockBatchOptimistic
	'Abre a conexão
	Set ObjConn6 = Server.CreateObject ("ADODB.Connection")
	ObjConn6.ConnectionString = "file name="+udl
	ObjConn6.Open StrConn6	
	Set ObjCmd6 = Server.CreateObject ("ADODB.Command")	
	ObjCmd6.CommandText = "sp_inserir_pedido"		' Nome procedimento no servidor
	ObjCmd6.CommandType  = adCmdStoredProc		        ' Tipo comando
	Set ObjCmd6.ActiveConnection = ObjConn6		        ' Associa o cammand com a conecção corrente
	Set ObjRS6 = ObjCmd6.Execute()
	Inserir_Pedido = ObjRS6("SCOPE_IDENTITY")
	ObjConn6.Close 
	Set ObjConn6 = Nothing
End Function
Sub Inserir_Pedido_x_Itens(vid_pedido, vid_lanche, vid_ingrediente, vqt_ingrediente)	
	'Abre a conexão
	Set ObjConn6 = Server.CreateObject ("ADODB.Connection")
	ObjConn6.ConnectionString = "file name="+udl
	ObjConn6.Open StrConn6	
	Set ObjCmd6 = Server.CreateObject ("ADODB.Command")	
	ObjCmd6.CommandText = "sp_inserir_pedido_x_itens"		' Nome procedimento no servidor
	ObjCmd6.CommandType  = adCmdStoredProc		        ' Tipo comando
	Set ObjCmd6.ActiveConnection = ObjConn6		        ' Associa o cammand com a conecção corrente
	Set ObjParam = ObjCmd6.CreateParameter("@vid_pedido", adInteger, adParamInput, 4, vid_pedido)
	ObjCmd6.Parameters.Append ObjParam		
	Set ObjParam = ObjCmd6.CreateParameter("@vid_lanche", adInteger, adParamInput, 4, vid_lanche)
	ObjCmd6.Parameters.Append ObjParam		
	Set ObjParam = ObjCmd6.CreateParameter("@vid_ingrediente", adInteger, adParamInput, 4, vid_ingrediente)
	ObjCmd6.Parameters.Append ObjParam		
	Set ObjParam = ObjCmd6.CreateParameter("@vqt_ingrediente", adSmallInt, adParamInput, 2, vqt_ingrediente)
	ObjCmd6.Parameters.Append ObjParam		
	Set ObjRS6 = ObjCmd6.Execute()
	ObjConn6.Close 
	Set ObjConn6 = Nothing
End Sub
Sub	Atualizar_Valor_Pedido(vid_pedido)	
	'Abre a conexão
	Set ObjConn6 = Server.CreateObject ("ADODB.Connection")
	ObjConn6.ConnectionString = "file name="+udl
	ObjConn6.Open StrConn6	
	Set ObjCmd6 = Server.CreateObject ("ADODB.Command")	
	ObjCmd6.CommandText = "sp_atualizar_valor_pedido"		' Nome procedimento no servidor
	ObjCmd6.CommandType  = adCmdStoredProc		        ' Tipo comando
	Set ObjCmd6.ActiveConnection = ObjConn6		        ' Associa o cammand com a conecção corrente
	Set ObjParam = ObjCmd6.CreateParameter("@vid_pedido", adInteger, adParamInput, 4, vid_pedido)
	ObjCmd6.Parameters.Append ObjParam		
	Set ObjRS6 = ObjCmd6.Execute()
	ObjConn6.Close 
	Set ObjConn6 = Nothing
End Sub
%>
    
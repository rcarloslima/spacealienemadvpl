#Include 'TOTVS.CH'

/**************************************************************************************************
{Protheus.doc} SPPersona

@description	Classe responsavel por carregar as caractericas dos personagens do jogo

@type   		Class 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
class SPPersona from LongClassName

	data nLen		As Integer 	Init 0	
	data nTop		As Integer 	Init 0	
	data nLeft		As Integer 	Init 0	
	data nId		As Integer 	Init 0	
	data nBottom  	As Integer 	Init 0	  	
	data nRight  	As Integer 	Init 0	  
	data oPanel		As Object 	Init Nil
	data nVisible	As Integer 	Init 1
	data cTipo		As String 	Init ''
	data cImage		As String 	Init ''
	data nWidth		As Integer 	Init 0	
	data nHeight	As Integer 	Init 0	
	data lDesc		As Boolean 	Init .T.
	data nMove		As Integer 	Init 0	
	data cPath		As String 	Init ''
	
	method new() constructor
	method Add()
	method Move()
	method Remove()
	method SetVisible()
	method Clash()
		
endClass
/**************************************************************************************************
{Protheus.doc} SPPersona

@description	Metodo construtor da classe SPPersona

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method New(  oPanel , cPath ) class SPPersona

	::cPath  	:= cPath
	::oPanel 	:= oPanel 
	
return 
/**************************************************************************************************
{Protheus.doc} SPPersona

@description	Metodo responsavel por adicionar os shapes do jogo

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method Add( cImage ) class SPPersona

	::cImage := ::cPath + ( cImage ) 

    ::oPanel:AddShape( 	"id=" 			+ cValToChar( ::nId )  		+;
     					";type=8" 					 				+;
     					";left=" 		+ cValToChar( ::nLeft ) 	+;
     					";top=" 		+ cValToChar( ::nTop )		+; 
     					";width="  		+ cValToChar( ::nWidth ) 	+;
     					";height=" 		+ cValToChar( ::nHeight ) 	+;
     					";image-file=" 	+ ::cImage					+; 
     					";can-move=0"  								+;
     					";can-mark=0" 								+;			
     					";is-blinker=1"  							+;
     					";is-container=1;" )
return 
/**************************************************************************************************
{Protheus.doc} SPPersona

@description	Metodo responsavel por movimentar os shapes do jogo

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method Move() class SPPersona
	
	If ::lDesc
	
		If ::nTop <= 10
			
			::SetVisible()
			
		EndIf
	
		For nX := 1 To ::nMove
			::nTop -= 2
		Next nX	
	
	Else
	
		If ::nTop >= 600 - 50
			
			If ::cTipo <> 'Nave' 
				::SetVisible()
			EndIf
			
		EndIf
			
		For nX := 1 To ::nMove
			::nTop += 2
		Next nx
					
	EndIf

	If ::nVisible == 1
		::oPanel:SetPosition(  ::nId  , ::nLeft , ::nTop )
		::oPanel:oWnd:CtrlRefresh()
	EndIf
	
return 
/**************************************************************************************************
{Protheus.doc} SPPersona

@description	Metodo responsavel por remover os shapes do jogo

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method Remove() class SPPersona
return ::oPanel:DeleteItem( ::nId )
/**************************************************************************************************
{Protheus.doc} SPPersona

@description	Metodo responsavel por mudar a visibilidade dos shapes do jogo

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method SetVisible() class SPPersona
	::nVisible := 0 
	::oPanel:setVisible( ::nId , iif( ::nVisible == 0 , .F. , .T. ) )
	::oPanel:oWnd:CtrlRefresh()
return
/**************************************************************************************************
{Protheus.doc} SPPersona

@description	Metodo responsavel por excluir os shapes que nao estao mais visiveis na tela

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method Clash( aClash ) class SPPersona

	Local nX   := 0
	Local lRet := .F. 

	For nX := 1 To Len( aClash )
	
		If aClash[nX]:cTipo == 'Missel'
		
			If aClash[nX]:nVisible == 1
				
				//Na mesma direcao
				If aClash[nX]:nLeft >= ( ::nLeft ) .And. aClash[nX]:nLeft <=( ::nLeft + ::nLen  ) 
					
					//Na mesma altura
					If ::nTop >= aClash[nX]:nTop  
						
						::SetVisible()
						
						 aClash[nX]:SetVisible()
						 
						 lRet := .T.
		
					EndIf
				
				EndIf
				 
			EndIf
		
		EndIf
		
	Next nX
	
return lRet


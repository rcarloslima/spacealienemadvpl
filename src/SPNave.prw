#Include 'TOTVS.CH'

/**************************************************************************************************
{Protheus.doc} SPNave

@description	Classe responsavel por carregar as caractericas da Nave

@type   		Class 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
class SPNave from SPPersona

	data nMissel		As Integer 	Init 0 
	data nTotMissel		As Integer 	Init 0 
	data aSpMissel		As Array 	Init {} 
	
	method New() constructor
	method MoveNave() 
	method Shoot()
	method SetKey()
		
endClass
/**************************************************************************************************
{Protheus.doc} SPNave

@description	Metodo construtor da classe SPNave

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method New( oPanel, nRight , nBottom , cPath , cImage  ) class SPNave

	_Super:New( oPanel , cPath )

	::nBottom    := nBottom 	
	::nRight     := nRight
	::nId		 := 2
	::nLeft		 := nRight / 2
	::nMissel	 := 0   
	::aSpMissel  := {}
	::nVisible	 := 1
	::cTipo		 := 'Nave'
	::nWidth 	 := 55
	::nHeight	 := 75
	::nLen  	 := ::nWidth
	::nTop		 := nBottom - 200 
	
	::Add( cImage )
	
	::SetKey()
	
return 
/**************************************************************************************************
{Protheus.doc} SPNave

@description	Metodo responsavel por movimentar as naves

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method MoveNave( cTipo ) class SPNave
	
	Do Case
	
		Case cTipo == 'D'		//Direita
			
			::nLeft += 30
			
			If ::nLeft >=  ::nRight   
				::nLeft -= 30
			EndIf 
			
			
		Case cTipo == 'L'	//Esquerda
		 	
		 	::nLeft -= 30
		 	
		 	If ::nLeft <= ( ::nLen * -1 ) 
				::nLeft += 30
			EndIf 
		 	
		Case cTipo == 'T'	//Acima
		 	
		 	::nTop -= 30
		 	
		 	If ::nTop <= 0
				::nTop += 30
			EndIf 
		 	
		Case cTipo == 'B'	//Abaixo
		
		 	::nTop += 30

	EndCase 
	
	::Move()

return
/**************************************************************************************************
{Protheus.doc} SPNave

@description	Metodo responsavel por realizar o disparo dos misseis

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method Shoot() class SPNave

	++::nMissel

	aAdd( ::aSpMissel ,  SPMissel():New( ::oPanel , ::nMissel , ::nTop , ::nLeft + 19 , ::cPath , 'spmissel.png' )   )
		
return
/**************************************************************************************************
{Protheus.doc} SPNave

@description	Metodo responsavel por carregar o funcionameto do jogo nos botoes

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method SetKey() class SPNave

	//Tentei usar o setkey, mas por algum motivo nao funcionou
	Local oTBtnA 		:= TButton():New( 1480, 10, '&A', ::oPanel, { || ::MoveNave( 'L' )  }, 01, 01,,,.F.,.T.,.F.,,.F.,,,.F. )
	Local oTBtnS 		:= TButton():New( 1480, 20, '&S', ::oPanel, { || ::MoveNave( 'B' )  }, 01, 01,,,.F.,.T.,.F.,,.F.,,,.F. )
	Local oTBtnD 		:= TButton():New( 1480, 30, '&D', ::oPanel, { || ::MoveNave( 'D' )  }, 01, 01,,,.F.,.T.,.F.,,.F.,,,.F. )
	Local oTBtnW 		:= TButton():New( 1480, 40, '&W', ::oPanel, { || ::MoveNave( 'T' )  }, 01, 01,,,.F.,.T.,.F.,,.F.,,,.F. )
	Local oTBtnSpace 	:= TButton():New( 1480, 50, '& ', ::oPanel, { || ::Shoot()          }, 01, 01,,,.F.,.T.,.F.,,.F.,,,.F. )
	
return
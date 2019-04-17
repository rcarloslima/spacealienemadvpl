#Include 'TOTVS.CH'

/**************************************************************************************************
{Protheus.doc} SpaceAlien

@description	Classe responsavel por desenhar a tela principal do jogo

@type   		Class 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
class SpaceAlien from LongClassName
		 
	data oSPCore		As Object 	Init Nil

	method New() constructor
	method Show()
	method Activate() 
	method Close()

endClass
/**************************************************************************************************
{Protheus.doc} SpaceAlien

@description	Metodo construtor da classe SpaceAlien

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method New() class SpaceAlien
	
	::oSPCore 			:= SPCore():New()
	::oSPCore:nBottom 	:= 800  	
	::oSPCore:nRight  	:= 1000 	
	 
return SELF
/**************************************************************************************************
{Protheus.doc} SpaceAlien

@description	Metodo reponsavel por desenhar a tela principal

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method Show( oDlg , oPanel ) class SpaceAlien

	Local cTitle	:= 'SPACE ALIEN EM ADVPL [' + ::oSPCore:cVersion + ']'
	Local oFont		:= TFont():New('Courier new',,-16,.T.,.T.)
	Local oTitle	:= Nil
	Local oScore	:= Nil
	Local oLevel	:= Nil
	Local oMissel	:= Nil
	Local oPanel1	:= Nil
	Local oPanel2 	:= Nil
	
	oDlg 			:= MsDialog():New( 0, 0 , ::oSPCore:nBottom + 40 ,  ::oSPCore:nRight , cTitle, ,,,, CLR_BLACK, CLR_WHITE, ,, .T. )	 
	
	SetWndDefault ( oDlg ) 
	
	oPanel1			:= TPanel():New( 0, 0, , oDlg, , .T., , CLR_WHITE, CLR_BLACK, 0, 50, .T., .T. )
	oPanel1:Align 	:= CONTROL_ALIGN_TOP
	
	oTitle			:= TSay():New( 010, 010, {|| cTitle										 	  }, oPanel1, , oFont, , , , .T., CLR_WHITE, CLR_BLACK )
	oScore			:= TSay():New( 025, 010, {|| 'SCORE.: ' + cValToChar( ::oSPCore:nScore 		) }, oPanel1, , oFont, , , , .T., CLR_WHITE, CLR_BLACK )
	oLevel			:= TSay():New( 025, 150, {|| 'LEVEL.: ' + cValToChar( ::oSPCore:nLevel 		) }, oPanel1, , oFont, , , , .T., CLR_WHITE, CLR_BLACK )
	oMissel			:= TSay():New( 025, 300, {|| 'MÍSSEL: ' + cValToChar( ::oSPCore:nTotMissel  ) }, oPanel1, , oFont, , , , .T., CLR_WHITE, CLR_BLACK )
	
	oPanel2			:= TPanel():New( 51, 0, , oDlg, , .T., , CLR_WHITE, CLR_YELLOW, 0, ::oSPCore:nBottom /2  , .T., .T. )
	oPanel2:Align 	:= CONTROL_ALIGN_TOP
		
	oPanel 			:= TPaintPanel():new( 0, 0, 0, 0, oPanel2, .F. )
	oPanel:Align 	:= CONTROL_ALIGN_ALLCLIENT
	
return
/**************************************************************************************************
{Protheus.doc} SpaceAlien

@description	Metodo reponsavel por ativar a tela principal

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method Activate() class SpaceAlien

	Local oPanel	:= Nil
	Local oDlg		:= Nil
	
	If ::oSPCore:ValidImage() 
		
		::Show( @oDlg , @oPanel )
			
		::oSPCore:Load( oPanel )
			
		oDlg:Activate(,,,.T.)
		
	EndIf
	
	::oSPCore:Close()
	
return 
/**************************************************************************************************
{Protheus.doc} SpaceAlien

@description	Metodo reponsavel por destruir o objeto

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method Close() class SpaceAlien
return FwFreeObj() 
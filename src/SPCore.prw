#Include 'TOTVS.CH'

#DEFINE CLRF CHR(13)+CHR(10)

/**************************************************************************************************
{Protheus.doc} SPCore

@description	Classe responsavel pela dinamica do jogo

@type   		Class 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
class SPCore from LongClassName

	data nBottom 		As Integer 	Init 0  	
	data nRight 		As Integer 	Init 0  		
	data oTimer1		As Object 	Init Nil
	data oTimer2		As Object 	Init Nil
	data cPath			As String 	Init ''
	data aImage 		As Array 	Init {}
	data oPanel 		As Object 	Init Nil
	data oSPNave 		As Object 	Init Nil
	data aSpAlien 		As Array 	Init {}
	data aSpMissel 		As Array 	Init {}	
	data bMoveAlien		As Object 	Init Nil
	data bMoveMissel 	As Object 	Init Nil
	data nAlien			As Integer 	Init 0
	data nLevel			As Integer 	Init 0
	data nScore			As Integer 	Init 0
	data nTotMissel		As Integer 	Init 0
	data cVersion		As String 	Init ''
	data oScore 		As Object 	Init Nil
	data oLevel 		As Object 	Init Nil 
	data nRemote		As Integer 	Init 0
	
	method New() constructor
	
	method MoveAuto()
	method Clear()
	
	method UpdateScreen()
	method Close()
	
	method UpdateLevel()
	
	method ValidImage()
	method GetImage()
	
	method Load()
	method IniNave()
	method IniAlien() 
	method IniBackGround()
	
	method GetTotMissel()
	method ValidPhase()
	method Reset()
	
endClass
/**************************************************************************************************
{Protheus.doc} SPCore

@description	Metodo construtor da classe SPCore

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method New() class SPCore	
	
	::cVersion			:= '1.0'
	::cPath				:= Lower( GetTempPath() ) + 'spacealien/'
	::nAlien			:= 0 
	::aSpAlien			:= {}
	::aSpMissel			:= {}
	::aImage 			:= { 'spbackground.png' , 'spalien1.png' , 'spalien2.png' , 'spmissel.png' , 'spnave.png'}
	::bMoveAlien		:= {|| ::ValidPhase() , ::IniAlien() , ::MoveAuto( ::aSpAlien  , ::aSpMissel , @::nScore , @::nLevel  )   }
	::bMoveMissel 		:= {|| ::ValidPhase() , 			   ::MoveAuto( ::aSpMissel , ::aSpAlien  , @::nScore , @::nLevel  )   }
	::nRemote			:= GetRemoteType()
	::nScore	 		:= 0
	::nLevel			:= 0 
	
return Self 
/**************************************************************************************************
{Protheus.doc} SPCore

@description	Metodo responsavel por calcular a quantidade de misseis por fase

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method GetTotMissel() class SPCore	
return iif( ::nLevel > 10 , 100 , int( 1000 / ::nLevel )  )
/**************************************************************************************************
{Protheus.doc} SPCore

@description	Metodo responsavel por realizar o carregamento da dinamica e imagem do jogo

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method Load( oPanel )class SPCore	

	::oPanel := oPanel
	
	::Reset()

	::IniBackGround()
	
	::IniNave()
	
	::UpdateScreen( ::bMoveAlien   , ::bMoveMissel , GetWndDefault() )
		
return Self 
/**************************************************************************************************
{Protheus.doc} SPCore

@description	Metodo responsavel por carregar a imagem do background

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method IniBackGround() class SPCore
return SPBackGround():New( ::oPanel , ::cPath , ::aImage[1] )
/**************************************************************************************************
{Protheus.doc} SPCore

@description	Metodo responsavel por carregar a classe da nave

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method IniNave() class SPCore

	::oSPNave 	 := SPNave():new( ::oPanel, ::nRight , ::nBottom  , ::cPath, ::aImage[5]  )
	::aSpMissel  := ::oSPNave:aSpMissel
	
return 
/**************************************************************************************************
{Protheus.doc} SPCore

@description	Metodo responsavel por resetar o jogo

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method Reset() class SPCore

	::aSpMissel  := {}
	::aSpAlien   := {}	
	
	::UpdateLevel( ::nScore )
			
return
/**************************************************************************************************
{Protheus.doc} SPCore

@description	Metodo responsavel por validar a fase

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method ValidPhase() class SPCore
	/*
	If ::nTotMissel <= 0 
		
		::oTimer1:DeActivate()
		::oTimer2:DeActivate()
		
		If MsgYesNo( 'Você não possui mais míssel!!' + CLRF + 'GAME OVER' + CLRF + 'Deseja jogar novamente?'   )
			
			::nScore := 0
			::nLevel := 0
					
			::Reset()
			
		Else
			__QUIT()
		EndIf
		
	Else
		::nTotMissel -= Len( ::aSpMissel )
		::UpdateLevel( ::nScore  )
	EndIf 
	*/
	
	::nTotMissel := ::GetTotMissel() - Len( ::aSpMissel )
	::UpdateLevel( ::nScore  )
	
return
/**************************************************************************************************
{Protheus.doc} SPCore

@description	Metodo responsavel por carregar a classe de alien

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method IniAlien() class SPCore

	nSpeed := 10 * ::nLevel 
	
	aAdd( ::aSpAlien , SPAlien():new( ::oPanel , ::nRight , ++::nAlien ,  ::cPath, '' , nSpeed )   )
	
return  
/**************************************************************************************************
{Protheus.doc} SPCore

@description	Metodo responsavel por realizar o movimento automatico

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method MoveAuto( aTarget, aClash , nScore, nLevel ) class SPCore

	Local nI 		:= 1 
	Local aDelete 	:= {}
	
	aSort( aTarget, , , { | x,y | x:nVisible > y:nVisible } )

	For nI := 1 To Len( aTarget ) 
		
		If aTarget[nI]:nVisible == 1 
		
			aTarget[nI]:Move()
			
			If aTarget[nI]:Clash( aClash )
				nScore++
				aAdd( aDelete , nI )
			EndIf
			
		Else
			aAdd( aDelete , nI )
		EndIf
		 
	Next
	
	::Clear( aTarget , aDelete ) 
	
return
/**************************************************************************************************
{Protheus.doc} SPCore

@description	Metodo responsavel por calcular o nivel do jogo

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method UpdateLevel( nScore  ) class SPCore
	
	Local nLevel := Int( nScore / 100 ) + 1  
	
	If nLevel <> ::nLevel
	
		::nLevel 	 := nLevel
		::nTotMissel := ::GetTotMissel()
			
	EndIf

return 
/**************************************************************************************************
{Protheus.doc} SPCore

@description	Metodo responsavel por limpar o itens que nao estao visiveis

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method Clear( aTarget , aDelete  ) class SPCore

	Local nI := 0  
	
	If Len( aDelete ) > 0 
	
		For nI := 1 To Len( aDelete )
		
			If aDelete[nI] <=  Len( aTarget ) 
			
				aTarget[ aDelete[nI] ]:Remove()
				
				aDel( aTarget , aDelete[nI] )
					 
				aSize( aTarget , Len( aTarget ) - 1 ) 
				
			EndIf
		
		Next nI
		
	EndIf
	
return
/**************************************************************************************************
{Protheus.doc} SPCore

@description	Metodo responsavel por atualizar a tela

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method UpdateScreen( bAction1 , bAction2 , oTarget  ) class SPCore

	Local nI := 0 
	
	// +------------------------------------------------------------------+
	// | Com apenas um TTimer o valor minimo eh de 1 segundo,			  |
	// | como preciso atualizar os aliens e os misseis coloquei 		  | 
	// | um TTimer para cada objeto para um nao prender o outro.		  |
	// | Sem o For tem um diferenca de milessimos em cada atualizacao	  | 
	// | com o for consigo sincronizar os dois e com isso da melhor		  | 
	// | sensacao de continuidade dos objetos.							  | 
	// | 																  |		
	// +------------------------------------------------------------------+
	For nI := 1 To 2
	
		::oTimer1 := TTimer():New( 1000 , bAction1 , oTarget ) 
		::oTimer1:Activate()
		
		::oTimer2 := TTimer():New( 1000 , bAction2 , oTarget ) 
		::oTimer2:Activate()
		
	Next nI
	
return
/**************************************************************************************************
{Protheus.doc} SPCore

@description	Metodo responsavel por validar se as imagens estao no rpo ou na maquina local

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method ValidImage() class SPCore

	Local aFiles := {}
	Local nI	 := 0 
	
	If ::nRemote == 5 .or. ::nRemote == 2
		
		For nI := 1 To Len( ::aImage )
				
			If !Len( GetResArray( ::aImage[nI] ) ) > 0 
				
				Alert( 'Imagem: ' + ::aImage[nI] + ' não está disponivel no rpo!!' + CLRF + 'Não é possível carregar a imagem,' + CLRF + 'Compile a imagem no rpo ou acesse pelo o smartcliente' )
	
				return .F.
			
			EndIf 
		
		Next nI
		
		::cPath := 'rpo:'
		
	Else
		
		aFiles := Directory( ::cPath + 'sp*.png', "D" )
	
		If Len ( aFiles ) < 5
			
			::GetImage()
			
			aFiles := Directory( ::cPath + 'sp*.png', "D" )
			
			If Len ( aFiles ) < 5
				Alert( 'Não foi possível baixar as imagens, verifique a sua conexão com o github.com' )
				return .F.
			EndIf
		EndIf
		
	EndIf
	
return .T.
/**************************************************************************************************
{Protheus.doc} SPCore

@description	Metodo responsavel por realizar o download das imagens

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method GetImage() class SPCore

	Local nExec	 	:= 0
	Local cUrl 	 	:= 'https://raw.githubusercontent.com/rcarloslima/spacealienemadvpl/master/src/image/'
	Local aFiles 	:= Directory( ::cPath + 'sp*.png' , "D" )
	Local nI	 	:= 0 

	//5 Tentativas para tentar baixar as imagens
	While ( Len( aFiles ) < 5 ) .And. ( nExec < 5 ) 
	
		If !ExistDir( ::cPath )
			MakeDir( ::cPath )
		EndIf 
	
		If !( ExistDir( ::cPath  ) ) 
			//Se nao conseguiu criar a pasta utilizo a pasta temp
			::cPath := Lower( GetTempPath() )		
		EndIf
		
		For nI := 1 To Len( ::aImage )
			
			If !File( ::cPath + ::aImage[nI] ) 
				
				cHtml := HttpGet( cUrl + ::aImage[nI] )
	
				MemoWrite( ::cPath + ::aImage[nI] , cHtml )
			
			EndIf 
		
		Next nI
		
		nExec++ 
		
		aFiles := Directory( ::cPath + 'sp*.png' , "D" )
	
	EndDo
 
return
/**************************************************************************************************
{Protheus.doc} SPCore

@description	Metodo responsavel por limpar as variaveis da memoria

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method Close() class SPCore
return FwFreeObj() 
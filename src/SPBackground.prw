#Include 'TOTVS.CH'

/**************************************************************************************************
{Protheus.doc} SPBackGround

@description	Classe responsavel por definir as caracteristicas do background

@type   		Class 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
class SPBackGround from SPPersona
	
	method new() constructor
		
endClass
/**************************************************************************************************
{Protheus.doc} SPBackGround

@description	Metodo construtor da classe SPBackGround

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method New(  oPanel , cPath , cImage ) class SPBackGround

	 _Super:New( oPanel , cPath )

	::nId		:= 1
	::nLen		:= 0
	::nTop		:= 0
	::nLeft		:= 0 
	::nVisible	:= 1
	::cTipo		:= 'background'
	::nWidth 	:= 0
	::nHeight	:= 0
	::lDesc		:= .T.
	::nMove		:= 0 
	
	::Add( cImage	 )
	
return
#Include 'TOTVS.CH'

/**************************************************************************************************
{Protheus.doc} SPMissel

@description	Classe responsavel por definir as caracteristicas do personagem missel

@type   		Class 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
class SPMissel from SPPersona
	
	method new() constructor
		
endClass
/**************************************************************************************************
{Protheus.doc} SPMissel

@description	Metodo construtor da classe SPMissel

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method New(  oPanel , nMissel , nTop , nLeft , cPath , cImage ) class SPMissel

	 _Super:New( oPanel , cPath )

	::nId		:= 10  + nMissel
	::nTop		:= nTop
	::nLeft		:= nLeft 
	::nVisible	:= 1
	::cTipo		:= 'Missel'
	::nWidth 	:= 19
	::nHeight	:= 35
	::nLen  	:= ::nWidth
	::lDesc		:= .T.
	::nMove		:= 20 
	
	::Add( cImage )
	
return
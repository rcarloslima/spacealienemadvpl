#Include 'TOTVS.CH'

/**************************************************************************************************
{Protheus.doc} SPAlien

@description	Classe responsavel por definir as caracteristicas do personagem Alien

@type   		Class 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
class SPAlien from SPPersona

	method new() constructor
		
endClass
/**************************************************************************************************
{Protheus.doc} SPAlien

@description	Metodo construtor da classe SPAlien

@type   		Metodo 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
method New( oPanel , nWidth , nAlien , cPath , cImage , nSpeed ) class SPAlien

	 _Super:New( oPanel , cPath )

	::nId		:= 10000  + nAlien
	::nTop		:= 0 
	::nVisible	:= 1
	::cTipo		:= 'Alien' 
	::nWidth 	:= 60
	::nHeight	:= 45
	::nLen  	:= ::nWidth
	::nLeft		:= Randomize( ::nLen , ( nWidth - ::nLen ) )
	::lDesc		:= .F.
	::nMove		:= nSpeed 
	
	::Add( iif( Randomize( 1 , 10 ) % 2 == 0 , 'spalien1.png', 'spalien2.png' ) ) 
	
return 
#INCLUDE 'TOTVS.CH'

/**************************************************************************************************
{Protheus.doc} SPCore

@description	Funcao responsavel pelo carregamento do jogo

@type   		User Function 
@author			Ruann Carlos Rodrigues Lima
@version   		1.00
@since     		15/04/2019
**************************************************************************************************/
user function SPGame()
   
   	oSpace := SpaceAlien():New()
   	oSpace:Activate()
   	oSpace:Close()

return

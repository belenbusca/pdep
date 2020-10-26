import Villano.*
import Minion.*
import Arma.*
import Ciudad.*
import Objetivo.*

object congelar {
	
	var property nivelConcentracionRequerido = 500
	
	method estaCapacitado(unMinion) {
		return unMinion.tiene("rayoCongelante") && unMinion.nivelDeConcentracion() > nivelConcentracionRequerido
	}
	
	method serRealizadaPor(unosMinions, unVillano, unaCiudad) {
		unaCiudad.disminuirTemperatura(30)
		unVillano.alimentarGrupoDeMinions(unosMinions, 10)
	}

}

class Robar {
	
	const objetivo
	
	method estaCapacitado(unMinion) {
		return unMinion.esPeligroso() && objetivo.cumpleRequisitos(unMinion)
	}
	
	method serRealizada(unosMinions, unVillano, unaCiudad) {
		unaCiudad.perderObjetoRobado(objetivo)
		objetivo.provocarCambioEnMinions(unosMinions)
	}
}

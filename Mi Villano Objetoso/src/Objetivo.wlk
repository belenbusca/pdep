import Villano.*
import Minion.*
import Maldad.*

class Piramide {
	
	const altura
	
	method cumpleRequisito(unMinion) {
		return unMinion.nivelDeConcentracion() > altura / 2
	}
	
	method provocarCambioEnMinions(unosMinions, unVillano) {
		unVillano.alimentarGrupoDeMinions(unosMinions, 10)
	}
}

object sueroMutante {
	
	method cumpleRequisito(unMinion) {
		return unMinion.estaBienAlimentado() && unMinion.nivelDeConcentracion() > 23
	}
	
	method provocarCambioEnMinions(unosMinions, unVillano) {
		unVillano.administrarSueroMutante(unosMinions)
	}
}

object laLuna {
	
	method cumpleRequisito(unMinion) {
		return unMinion.tiene("rayoEncogedor")
	}
	
	method provocarCambioEnMinions(unosMinions, unVillano) {
		unVillano.otorgarRayoCongelantePotencia10(unosMinions)
	}
}

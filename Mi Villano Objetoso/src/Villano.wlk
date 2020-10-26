import Minion.*
import Maldad.*
import Arma.*

class Villano {
	
	const ciudad
	const minions = []
	var minionsReclutados = []
	const rayoCongelante10 = new Arma(nombre = "rayoCongelante", potencia = 10)
	
	method alimentarUnMinion(unMinion, unasBananas) {
		unMinion.aumentarBananas(unasBananas)
	}
	
	method nuevoMinion() {
		minions.add(new Minion(color = amarillo, armas = [rayoCongelante10], cantBananas = 5))
	}
	
	method otorgarArmaA(unMinion, unArma) {
		unMinion.agregarArma(unArma)
	}
	
	method nivelDeConcentracion(unMinion) {
		return unMinion.nivelDeConcentracion()
	}
	
	method esPeligroso(unMinion) {
		unMinion.esPeligroso()
	}
	
	method planificar(unaMaldad) {
		minionsReclutados = self.buscarMinionPara(unaMaldad)
		
		if(minionsReclutados.isEmpty()) 
			throw new Exception(message = "oops! Ningun minion esta capacitado para esta maldad :( ")
		
		self.realizarMaldadCon(minionsReclutados, unaMaldad)
	}
	
	method realizarMaldadCon(unosMinions, unaMaldad) {
		unaMaldad.serRealizadaPor(unosMinions, self, ciudad)
		unosMinions.forEach({unMinion => unMinion.auemntarCantVecesParticipoEnMaldad()})
	}

	method buscarMinionPara(unaMaldad) {
		return minions.filter({unMinion => unaMaldad.estaCapacitado(unMinion)})
	}
	
	method alimentarGrupoDeMinions(unosMinions, cantBananas) {
		unosMinions.forEach({unMinion => self.alimentarUnMinion(unMinion, cantBananas)})
	}
	
	method administrarSueroMutante(unosMinions) {
		unosMinions.forEach({unMinion => unMinion.absorberSueroMutante()})
	}
	
	method otorgarRayoCongelantePotencia10(unosMinions) {
		unosMinions.forEach({unMinion => self.otorgarArmaA(unMinion, rayoCongelante10)})
	}

	method minionMasUtil() {
		return minions.max({unMinion => unMinion.cantVecesParticipoEnMaldad()})
	}
	
	method minionsInutiles() {
		return minions.filter({unMinion => unMinion.cantVecesParticipoEnMaldad() == 0})
	}
}

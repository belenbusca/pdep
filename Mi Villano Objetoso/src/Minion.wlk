import Arma.*
import Villano.*

class Minion {
	
	var color = amarillo
	const armas = []
	var cantBananas 
	var cantVecesParticipoEnMaldad = 0
	
	method cantVecesParticipoEnMaldad() {
		return cantVecesParticipoEnMaldad
	}
	
	method cambiarColorA(unColor) {
		color = unColor
	}
	
	method cantBananas() {
		return cantBananas
	}
	
	method perderUnaBanana() {
		cantBananas -= 1 
	}
	
	method aumentarBananas(unaCantidad) {
		cantBananas += unaCantidad
	}
	
	method agregarArma(unArma) {
		armas.add(unArma)
	}
	
	method potenciaArmaMasPoderosa() {
		return armas.max({unArma => unArma.potencia()}).potencia()
	}
	
	method tiene(nombreArma) {
		return armas.any({unArma => unArma.nombre() == nombreArma})
	}
	
	method absorberSueroMutante() {
		color.transformar(self)
	}
	
	method esPeligroso() {
		return color.esPeligroso(self)
	}
	
	method nivelDeConcentracion() {
		return color.nivelDeConcentracion(self)
	}
	
	method cantArmas() {
		return armas.size()
	}
	
	method perderArmas() {
		armas.clear()
	}
	
	method estaBienAlimentado() {
		return cantBananas > 100
	}
	
	method aumentarCantVecesParticipoEnMaldad() {
		cantVecesParticipoEnMaldad ++
	}
}

object violeta {
	
	method esPeligroso(unMinion) {
		return true
	}
	
	method nivelDeConcentracion(unMinion) {
		return unMinion.cantBananas()
	}
	
	method transformar(unMinion) {
		unMinion.perderUnaBanana()
		unMinion.cambiarColorA(amarillo)
	}
	
}

object amarillo {
	
	method esPeligroso(unMinion) {
		return unMinion.cantArmas() > 2	// se rompe el encapsulamiento?
	}	
	
	method nivelDeConcentracion(unMinion) {
		return unMinion.potenciaArmaMasPoderosa() + unMinion.cantBananas()	
	}
	
	
	method transformar(unMinion) {
		unMinion.perderArmas()
		unMinion.perderUnaBanana()
		unMinion.cambiarColorA(violeta)
	}
}
import Barco.*

class Pirata {
	
//	const property invitador 
	const property items = []
	var nivelEbriedad 
	var cantMonedas
	
	method nivelEbriedad() {
		return nivelEbriedad
	}
	
	method cantMonedas() {
		return cantMonedas
	}
	
	method tiene(unItem) {
		return items.contains(unItem)
	}

	method cantidadItems() {
		return items.size()
	}
	
	method estaPasadoDeGrog() {
		return nivelEbriedad >= 90
	}
	
	method tomarTrago() {
		nivelEbriedad += 5
		self.gastarMoneda()
	}
	
	method gastarMoneda() {
		self.puedeGastarMoneda()
		cantMonedas -= 1
	}
	
	method puedeGastarMoneda() {
		if(cantMonedas == 0)
			throw new Exception(message = 'Oops! No tiene mas monedas :( ')
	}
	
	method seAnimaASaquear(victima) {
		return victima.esSaqueablePor(self)
	}
}

class EspiaDeLaCorona inherits Pirata {
	
	override method estaPasadoDeGrog() {
		return false
	}
	
	override method seAnimaASaquear(victima) {
		return super(victima) && self.tiene('permiso de la corona')
	}
	
}

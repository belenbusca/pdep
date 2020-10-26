import Pirata.*
import Barco.*

class Mision {
	
	method puedeCompletarsePor(unBarco){
		return unBarco.tieneSuficienteTripulacion()
	}
	
	method esUtil(unPirata)
}

class BusquedaDelTesoro inherits Mision {
	
	override method esUtil(unPirata) {
		const tieneItemObligatorios = ['brujula', 'mapa', 'botellaDeGrogXD'].any({unItem => unPirata.tiene(unItem)})
		return unPirata.cantMonedas() <= 5  && tieneItemObligatorios
	}
	
	override method puedeCompletarsePor(unBarco) {
		return super(unBarco) and unBarco.tiene('llaveDeCofre')
	}
}

class ConvertirseEnLeyenda inherits Mision {
	const itemObligatorio
	
	override method esUtil(unPirata) {
		return unPirata.cantidadItems() >= 10 && unPirata.tiene(itemObligatorio)
	}
}

class Saqueo inherits Mision {
	
	const victima
	
	override method esUtil(unPirata) {
		return unPirata.cantMonedas() < cantMonedasDeterminada.maxCantidadMonedas() && victima.esSaqueablePor(unPirata)
	}
	
	override method puedeCompletarsePor(unBarco) {
		return super(unBarco) and victima.esVulnerableA(unBarco)
	}
}

object cantMonedasDeterminada {
	var property maxCantidadMonedas = 0
}
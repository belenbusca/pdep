// preguntar constructor, casamiento, patrimonio casa (linea 19)

import Personalidad.*

class Personaje {
	const casa
	const conyugues = []
	const acompaniantesDeViaje = []
	var estaVivo = true
	const personalidad
	
	method estaVivo() {
		return estaVivo
	}
	
	method esSoltero() {
		return conyugues.isEmpty()
	}
	
	/*method cantidadConyugues() {
		return conyugues.size()
	}*/
	
	method puedeCasarseCon(unaPersona) {
		return self.casaAdmiteCasamientoCon(unaPersona) && unaPersona.casaAdmiteCasamientoCon(self)
	}
	
	method casaAdmiteCasamientoCon(unaPersona) {
		return casa.admiteCasamiento(self, unaPersona)
	}
	
	method casarseCon(unaPersona) {
		if(!self.puedeCasarseCon(unaPersona))
			throw new Exception(message = "Oops! No puede casarse, su casa no lo permite D:")
		conyugues.add(unaPersona)
	}
	
	method patrimonio() {
		return casa.patrimonio() / casa.cantidadDeMiembros()
	}
	
	method morir() {
		estaVivo = false
	}
	
	method estaSolo() {
		return acompaniantesDeViaje.isEmpty()
	}
	
	method aliados() {
		const miembrosDeLaCasa = casa.miembros()
		miembrosDeLaCasa.remove(self)
		return conyugues + acompaniantesDeViaje + miembrosDeLaCasa
	}
	
	method esPeligroso() {
		return estaVivo and (self.conyuguesSonDeCasaRica() or self.estaAliadoConAlguienPeligroso() or self.aliadosSumanDiezMilMonedas())
	}
	
	method conyuguesSonDeCasaRica() {
		return conyugues.all{ conyugue => conyugue.suCasaEsRica() }
	}
	
	method suCasaEsRica() {
		return casa.esRica()
	}
	
	method estaAliadoConAlguienPeligroso() {
		return self.aliados().any{ unAliado => unAliado.esPeligroso() }
	}
	
	method aliadosSumanDiezMilMonedas() {
		return self.aliadosCantidadDeMonedas() == 10000
	}
	
	method aliadosCantidadDeMonedas() {
		return self.aliados().sum{ unAliado => unAliado.patrimonio()}
	}
	
	method esHodor() {
		return false
	}
	
	method tieneComoAliadoA(unaPersona) {
		return self.aliados().contains(unaPersona)
	}
	
	method ejecutarAccionConspirativaContra(unaPersona) {
		personalidad.conspirarContra(unaPersona)
	}
	
	method derrocharPatrimonioFamiliar(porcentajeADerrochar) {
		casa.perderPorcentajeDeDinero(porcentajeADerrochar)
	}
}

object hodor inherits Personaje {
	override method esHodor() {
		return true
	}
}
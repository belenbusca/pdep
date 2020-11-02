class Persona {
	var posicion 
	const elementosCercanos = []
	var criterioPasarElemento
	var criterioEleccionComida
	const comidas = []
	
	method elementosCercanos() {
		return elementosCercanos
	}
	
	method posicion() {
		return posicion
	}
	
	method pedirPasarA(unaPersona, unElemento) {
		unaPersona.pasarA(self, unElemento)
	}
	
	method pasarA(unaPersona, unElemento) {
		if(!self.puedePasar(unElemento))
			throw new Exception(message = "No se puede pasar el elemento")
		criterioPasarElemento.pasarElemento(self, unaPersona, unElemento)
	} 
	
	method puedePasar(elemento) {
		return elementosCercanos.contains(elemento)
	}
	
	method primerElementoAMano() {
		return elementosCercanos.head()
	}
	
	method recibirElemento(elemento) {
		elementosCercanos.add(elemento)
	}
	
	method rotarPosicionCon(persona) {
		posicion = persona.posicion()
	}
	
	method comer(unaComida) {
		if(criterioEleccionComida.cumpleCriterio(unaComida))
			self.agregarComida(unaComida)
	}
	
	method agregarComida(unaComida) {
		comidas.add(unaComida)
	}
	
	method esPipon() {
		return self.algunaComidaIngeridaEsPesada()
	}
	
	method algunaComidaIngeridaEsPesada() {
		return comidas.any{ unaComida => unaComida.esPesada() }
	}
	
	method laEstaPasandoBien() {
		return self.comioAlgo()
	}
	
	method comioAlgo() {
		return !comidas.isEmpty()
	}
	
	method comioCarne() {
		return comidas.any{ unaComida => unaComida.esCarne() }
	}
	
	method cantidadDeElementos() {
		return elementosCercanos.size()
	}
}

object osky inherits Persona {
	override method laEstaPasandoBien() {
		return true
	}
}

object moni inherits Persona {
	override method laEstaPasandoBien() {
		return posicion == "1@1"
	}
}

object facu inherits Persona {
	override method laEstaPasandoBien() {
		return self.comioCarne()
	}
}

object vero inherits Persona {
	override method laEstaPasandoBien() {
		return self.cantidadDeElementos() <= 3
	}
}
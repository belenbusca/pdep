import Tamagotchi.*

class EstadoDeAnimo {
	method contento() = new Contento()
	method triste() = new Triste()
	method hambriento() = hambriento
	method cansado() = cansado
	
	method dormir(unTamagotchi) {
		// No hace nada	
	}
}

object hambriento inherits EstadoDeAnimo {
	
	method comer(unTamagotchi) {
		unTamagotchi.poneteContento()
	}
	
	method jugar(unTamagotchi) {
		unTamagotchi.disminuirNivelFelicidad(4)
	}
	
	method jugarCon(unTamagotchi, otroTamagotchi) {
		
	}
}

class Contento inherits EstadoDeAnimo {
	
	var vecesQueJugo = 0
	
	method comer(unTamagotchi) {
		unTamagotchi.aumentarNivelFelicidad(1)
	}
	
	method jugar(unTamagotchi) {
		unTamagotchi.aumentarNivelFelicidad(2)
		vecesQueJugo ++
		if(vecesQueJugo > 2) unTamagotchi.poneteHambriento()
	}
	
	method jugarCon(unTamagotchi, otroTamagotchi) {
		unTamagotchi.jugar()
		otroTamagotchi.jugar()
		otroTamagotchi.aumentarNivelFelicidad(4)
	}
}

class Triste inherits EstadoDeAnimo {
	
	var tiempoDeInicio = 0
	
	method comer(unTamagotchi) {
		if(self.pasaronMasDeDosMinutos()) {
			unTamagotchi.poneteContento()
		}
	}
	
	method pasaronMasDeDosMinutos() {
		return tiempoDeInicio > 2 // FIXME: Aca deberia ir una operaicon mas compleja con manejo de fechas
	}
	
	method jugar(unTamagotchi) {
		unTamagotchi.poneteContento()
	}
	
	method jugarCon(unTamagotchi, otroTamagotchi) {
		unTamagotchi.poneteContento()
		otroTamagotchi.poneteContento()
	}
}

object cansado inherits EstadoDeAnimo {

	method comer(unTamagotchi) {
		unTamagotchi.disminuirNivelFelicidad(5)
	}
	
	method jugar(unTamagotchi) {
		self.lanzarErrorNoPuedoJugar()
	}
	
	method jugarCon(unTamagotchi, otroTamagotchi) {
		self.lanzarErrorNoPuedoJugar()
	}
	
	method lanzarErrorNoPuedoJugar() {
		throw new Exception(message = "¡No molestes! no quiero jugar")
	}
	
	override method dormir(unTamagotchi) {
		unTamagotchi.poneteContento()
	}

}


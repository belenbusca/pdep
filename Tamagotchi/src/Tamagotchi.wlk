import EstadoDeAnimo.*

class Tamagotchi {
	
	var estadoDeAnimo = new Contento()
	var nivelFelicidad = 0
	
	method comer() {
		estadoDeAnimo.comer(self)
	}
	
	method jugar() {
		estadoDeAnimo.jugar(self)
	}
	
	method jugarCon(otraMascota) {
		estadoDeAnimo.jugarCon(self, otraMascota)
	}
	
	method poneteTriste() {
		estadoDeAnimo = estadoDeAnimo.triste()
	}
	
	method poneteContento() {
		estadoDeAnimo = estadoDeAnimo.contento()
	}
	
	method poneteHambriento() {
		estadoDeAnimo = estadoDeAnimo.hambriento()
	}
	
	method poneteCansado() {
		estadoDeAnimo = estadoDeAnimo.cansado()
	}
	
	method aumentarNivelFelicidad(unaCantidad) {
		nivelFelicidad += unaCantidad
	}
	
	method disminuirNivelFelicidad(unaCantidad) {
		nivelFelicidad -= unaCantidad
	}
}

class Gloton inherits Tamagotchi {
	
	override method comer() {
		self.aumentarNivelFelicidad(5)
		super()
	}
}

class Antisocial inherits Tamagotchi {
	
	override method jugarCon(otraMascota) {
		self.poneteTriste()
	}
}

class Dormilon inherits Tamagotchi {
	
	override method jugar() {
		super()
		if(nivelFelicidad < 10) self.poneteCansado()
	}
}
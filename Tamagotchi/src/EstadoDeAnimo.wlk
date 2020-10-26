import Tamagotchi.*

object estadoDeAnimo {
	
	
}

object hambriento {
	
	method comer(unTamagotchi) {
		unTamagotchi.poneteContento()
	}
	
	method jugarSolo(unTamagotchi) {
		unTamagotchi.disminuirNivelFelicidad(4)
	}
	
	method jugarCon(unTamagotchi, otroTamagotchi) {
		
	}
}

class Contento {
	
	var vecesQueJugo = 0
	
	method comer(unTamagotchi) {
		unTamagotchi.aumentarNivelFelicidad(1)
	}
	
	method jugarSolo(unTamagotchi) {
		unTamagotchi.aumentarNivelFelicidad(2)
		vecesQueJugo ++
		if(vecesQueJugo > 2) unTamagotchi.poneteHambriento()
	}
	
	method jugarCon(unTamagotchi, otroTamagotchi) {
		unTamagotchi.jugarSolo()
		otroTamagotchi.jugarSolo()
		otroTamagotchi.aumentarNivelFelicidad(4)
	}
}


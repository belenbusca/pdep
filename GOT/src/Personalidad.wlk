import Continente.*

object sutil {
	method conspirarContra(conspirador, unaPersona) {
		const casa = poniente.casaMasPobre()
		const miembroDeLaCasaMasPobre = casa.miembros().anyOne()
		
		if(casa.miembrosSolterosYVivos().isEmpty() or !unaPersona.puedeCasarseCon(miembroDeLaCasaMasPobre))
			throw new Exception(message = "Oops! No hay con quien casar al objetivo D:")
		unaPersona.casarseCon(miembroDeLaCasaMasPobre)
	}
}

object miedoso {
	method conspirarContra(conspirador, unaPersona) {
		// no hace nada
	}
}

class Asesino {
	method conspirarContra(conspirador, unaPersona) {
		self.matar(unaPersona)
	}
	
	method matar(unaPersona) {
		unaPersona.morir()
	}
}

object asesinoPrecavido inherits Asesino {
	override method matar(unaPersona) {
		if(unaPersona.estaSolo())
			super(unaPersona)
	}
}

class Disipados {
	const porcentajeADerrochar
	method conspirarContra(conspirador, unaPersona) {
		conspirador.derrocharPatrimonioFamiliar(porcentajeADerrochar)
	}
}
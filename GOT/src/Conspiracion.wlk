class Conspiracion {
	const objetivo
	const complotados = #{}
	var fueEjecutada = false
	
	method ejecutarConspiracion() {
		if(self.sePuedeRealizar()) {
			complotados.forEach{ unComplotado => unComplotado.ejecutarAccionConspirativaContra(objetivo) }
			fueEjecutada = true
		}
	}
	
	method sePuedeRealizar() {
		return objetivo.esPeligroso() && !objetivo.esHodor()
	}
	
	method traidores() {
		return complotados.filter{ unComplotado => objetivo.tieneComoAliadoA(unComplotado) }
	}
	
	method cantidadDeTraidores() {
		return self.traidores().size()
	}
	
	method fueCompletadaConExito() {
		return !objetivo.esPeligroso() && fueEjecutada
	}
}

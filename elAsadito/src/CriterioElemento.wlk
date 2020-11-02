
object sordo {
	
	method contestarPedido(pasador, recibidor, elementoPedido) {
		recibidor.recibirElemento(pasador.primerElementoAMano())
	}
	
}

object darTodosLosElementos {
	
	method contestarPedido(pasador, recibidor, elementoPedido) {
		const elementosAPasar = pasador.elementosCercanos()
		elementosAPasar.forEach{ unElemento => recibidor.recibirElemento(unElemento) }
	}
	
}

object cambioDePosicion {
	
	method contestarPedido(pasador, recibidor, elementoPedido) {
		pasador.rotarPosicionCon(recibidor)
		recibidor.rotarPosicionCon(pasador)
	}
	
}

object pasarElBenditoElemento {
	
	method contestarPedido(pasador, recibidor, elementoPedido) {
		recibidor.recibirElemento(elementoPedido)
	}
	
}

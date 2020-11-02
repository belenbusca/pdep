class Traicion {
	
	const primerVictima
	const victimas = [primerVictima]
	var fechaTentativa = new Date()
	
	method concretasePor(unTraidor, nuevaFamilia, viejaFamilia) {
		victimas.forEach({victima => unTraidor.atacar(victima)})
		unTraidor.abandonarFamilia(viejaFamilia)
		unTraidor.unirseANuevaFamilia(nuevaFamilia)
		unTraidor.convertirseEnSoldad()
	}
 
	method agregarVictima(nuevaVictima) {
		victimas.add(nuevaVictima)
	}
}

class CiudadCostera {
	
	var cantHabitantes
	
	method sumarHabitante() {
		cantHabitantes += 1
	}
	
	method esSaqueablePor(unPirata) {
		return unPirata.nivelEbriedad() >= 50
	}
	
	method esVulnerableA(unBarco) {
		return unBarco.todaLatripulacionPasadaDeGrog() || unBarco.cantidadTripulantes() >= cantHabitantes * 0.4
	}
}

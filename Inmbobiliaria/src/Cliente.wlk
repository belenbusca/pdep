object cliente {
	
	method concretarOperacion(propiedad, empleado) {
		empleado.concretarOperacion(propiedad, self)
	}
	
	method reservar(propiedad, empleado) {
		empleado.reservarPara(self, propiedad)
	}
	
}

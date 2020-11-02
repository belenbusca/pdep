class Animal {
	method patrimonio() {
		return 0
	}
}

object dragon inherits Animal {
	method esPeligroso() {
		return true
	}
}

class Lobo inherits Animal {
	const raza
	method esPeligroso() {
		return raza == "huargo"
	}
}

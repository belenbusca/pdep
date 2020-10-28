
class Pared {
	var property ancho
	var material
	
	method resistencia() {
		return material.multiplicadorResistencia() * ancho
	}
}

object madera {
	const property multiplicadorResistencia = 25
}

object piedra {
	const property multiplicadorResistencia = 50
}

object cerditoObrero {
	method resistencia() = 50
}

class CerditoArmado {
	var armadura
	
	method resistencia() {
		return armadura.resistencia() * 10
	}
}

class Casco {
	var property resistencia
}

class Escudo {
	var property resistencia
}
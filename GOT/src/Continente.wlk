import Casa.*

object poniente {
	const property casas = [lannister, stark, guardiaDeLaNoche]
	
	method casaMasPobre() {
		return casas.min{ casa => casa.patrimonio() }
	}
}

import Elemento.*

class ArbolNavidenio {
	
	const regalos = []
	const tarjetas = []
	const adornos = []
	const elementos = regalos + tarjetas + adornos
	
	method capacidad()
	
	method agregarRegalo(unRegalo) {
		if(!self.quedaEspacioPara(unRegalo))
			throw new Exception( message = "Oops! No queda espacio para agregar un regalo al arbol")
		regalos.add(unRegalo)
	}
	
	method capacidadOcupada() {
		return elementos.sum{ unElemento => unElemento.espacioQueOcupa() }
	}
	
	method capacidadRestante() {
		return self.capacidad() - self.capacidadOcupada()
	}
	
	method quedaEspacioPara(unElemento) {
		return self.capacidadRestante() >= unElemento.espacioQueOcupa()
	}
	
	method beneficiarios() {
		return regalos.map{regalo => regalo.destinatario()} + tarjetas.map{regalo => regalo.destinatario()}
	}
	
	method gastoTotalRegalos() {
		return regalos.sum{ unRegalo => unRegalo.precio() }
	}
	
	method importancia() {
		return adornos.sum{ unAdorno => unAdorno.importancia() }
	}
	
	method cantidadRegalosTeQuierenMucho() {
		return regalos.filter{ regalo => regalo.esRegaloTeQuierenMucho() }.size()
	}
	
	method esPortentoso() {
		return self.cantidadRegalosTeQuierenMucho() > 5 or self.tieneTarjetaConPorLoMenos(1000)
	}
	
	method tieneTarjetaConPorLoMenos(unMonto) {
		return tarjetas.any{ tarjeta => tarjeta.valorAdjunto() >= 1000 }
	}
	
	method adornoMasPesado() {
		return adornos.max{ adorno => adorno.peso() }
	}
}

class Natural inherits ArbolNavidenio {
	const vejez
	const tamanioTronco
	
	override method capacidad() {
		return vejez * tamanioTronco
	}
	
}

class Artificial inherits ArbolNavidenio{
	const cantidadVaras
	
	override method capacidad() {
		return cantidadVaras
	}
}
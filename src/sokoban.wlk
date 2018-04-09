import direcciones.*

object sokoban {
	var posicion = new Position(4, 3)
	var direccion = arriba

	method empuja(unElemento) {
		try
			unElemento.movete(direccion)
		catch e {
			self.retrocede()
		}
	}
	
	method retrocede() {
		direccion.opuesto().move(posicion)
	}
	
	method retrocedeCon(caja) {
		self.retrocede()
		caja.movete(direccion.opuesto())
	}

	method irArriba() {
		direccion = arriba
		self.avanzar()
	}

	method irAbajo() {
		direccion = abajo
		self.avanzar()
	}

	method irIzquierda() {
		direccion = izquierda
		self.avanzar()
	}

	method irDerecha() {
		direccion = derecha
		self.avanzar()
	}
	
	method avanzar() {
		direccion.move(posicion)
	}
	
	method setDireccion(unaDireccion) {
		direccion = unaDireccion
	}
	
	method imagen() = "jugador.png"
	method posicion() = posicion
	method posicion(_posicion) {
		posicion = _posicion
	} 
}
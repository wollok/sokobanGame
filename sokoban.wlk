import wollok.game.*
import direcciones.*

object sokoban {
	var property position = game.at(4, 3)
	var direccion = arriba

	method empuja(unElemento) {
		try
			unElemento.movete(direccion)
		catch e {
			console.println(e)
			self.retrocede()
		}
	}
	
	method retrocede() {
		position = direccion.opuesto().siguiente(position)
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
		position = direccion.siguiente(position)
	}
	
	method setDireccion(unaDireccion) {
		direccion = unaDireccion
	}
	
	method image() = "jugador.png"
	
//	method position() = position
//	method position(_position) {
//		position = _position
//	} 
}
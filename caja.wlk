import wollok.game.*
import sokoban.*

class Caja {
	var property position
	const property llegadas
	
	method movete(direccion) {
		self.validarLugarLibre(direccion)
		position = direccion.siguiente(position)
	}
	
	method validarLugarLibre(direccion) {
		const posAlLado = direccion.siguiente(position)
		const lugarLibre = game.getObjectsIn(posAlLado).all(
			{ obj => obj.puedePisarte(self) }
		)
		if (!lugarLibre) {
			throw new DomainException(message = "Algo traba la caja.", source = sokoban)
		}
	}
	
	method puedePisarte(_) = false
	
	method image() = if (self.estaBienPosicionada()) "caja_ok.png" else "caja.png"
	
	method estaBienPosicionada() = llegadas.any({ llegada => llegada.position() == position })
}
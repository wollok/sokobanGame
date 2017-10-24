
class Llegada {
	var posicion
	
	constructor (_posicion) {
		posicion = _posicion
	}
	
	method movete(direccion) { /* No pasa naranja */ }
	
	method puedePisarte(_) = true
	
	method imagen() = "almacenaje.png"
	method posicion() = posicion
	method posicion(pos) {posicion = pos}
}

class Pared {
	var posicion
	
	constructor(_posicion) {
		posicion = _posicion
	}
	
	method movete(direccion) {
		throw new Exception("No puedes mover las paredes.")
	}
	
	method puedePisarte(_) = false
	
	method imagen() = "muro.png"
	method posicion() = posicion
	method posicion(pos) {posicion = pos}
}
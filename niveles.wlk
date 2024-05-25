import caja.*
import pared.*
import sokoban.*
import llegada.*
import wollok.game.*

object nivel1 {
	method cargar() {
		//	PAREDES
		const ancho = game.width() - 1
		const largo = game.height() - 1
		
		const posicionesParedes = []
		(0 .. ancho).forEach(
			{ n => posicionesParedes.add(new Position(x = n, y = 0)) }
		) // bordeAbajo
		
		(0 .. ancho).forEach(
			{ n => posicionesParedes.add(new Position(x = n, y = largo)) }
		) // bordeArriba 
		
		(0 .. largo).forEach(
			{ n => posicionesParedes.add(new Position(x = 0, y = n)) }
		) // bordeIzq 
		
		(0 .. largo).forEach(
			{ n => posicionesParedes.add(new Position(x = ancho, y = n)) }
		) // bordeDer
		
		
		posicionesParedes.addAll(
			[
				new Position(x = 3, y = 5),
				new Position(x = 4, y = 5),
				new Position(x = 5, y = 5)
			]
		)
		posicionesParedes.addAll(
			[
				new Position(x = 1, y = 2),
				new Position(x = 2, y = 2),
				new Position(x = 6, y = 2),
				new Position(x = 7, y = 2)
			]
		)
		posicionesParedes.addAll(
			[
				new Position(x = 1, y = 1),
				new Position(x = 2, y = 1),
				new Position(x = 6, y = 1),
				new Position(x = 7, y = 1)
			]
		)
		posicionesParedes.forEach({ posicionParedes => self.dibujar(new Pared(position = posicionParedes)) })

		//	LLEGADAS
		const llegadas = [
			new Position(x = 4, y = 4),
			new Position(x = 4, y = 3),
			new Position(x = 4, y = 2),
			new Position(x = 4, y = 1)
		].map({ posicion => self.dibujar(new Llegada(position = posicion)) }) //	CAJAS
		const cajas = [
			new Position(x = 2, y = 4),
			new Position(x = 6, y = 4),
			new Position(x = 4, y = 2),
			new Position(x = 5, y = 2)
		].map({ posicion => self.dibujar(new Caja(position = posicion, llegadas = llegadas)) })
		//	SOKOBAN
		
		game.addVisual(sokoban) //	TECLADO
		
		keyboard.up().onPressDo({ sokoban.irArriba() })
		keyboard.down().onPressDo({ sokoban.irAbajo() })
		keyboard.left().onPressDo({ sokoban.irIzquierda() })
		keyboard.right().onPressDo({ sokoban.irDerecha() })
		keyboard.r().onPressDo({ self.restart() })
		//	COLISIONES.onPressDo({ self.comprobarSiGano(cajas) })
		game.whenCollideDo(sokoban, { elemento => sokoban.empuja(elemento) })
	}
	
	method restart() {
		game.clear()
		self.cargar()
	}
	
	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
	
	method comprobarSiGano(cajas) {
		if (cajas.all({ caja => caja.estaBienPosicionada() }))
			game.say(sokoban, "GANASTE!")
			game.onTick(5000, "gameEnd", { game.stop() })
	}
}
object gameflix {
	
	var property juegos = []
	var property usuarios = [] 
	
	method filtrarPorCategoria(categoria) { 
		return juegos.filter({ juego => juego.categoria().equals(categoria) }) 
	}
	
	method buscar(nombre) {
		var juegoBuscado
		
		try {
			
			juegoBuscado = juegos.find({ juego => juego.nombre().equals(nombre) })
		
		} catch exception : ElementNotFoundException {
			throw new Exception("No existe un juego con ese nombre")
			}
		return juegoBuscado
	}
	
	method recomendar() {
		return juegos.anyOne()
	}
	
	method juegos() = juegos 
	
	method cobrarSuscripcion() {
		usuarios.forEach({ usuario => usuario.cobrarSuscripcion()})
	} 
} 


class Juego {
	
	var nombre
	var precio
	var categoria
	var tipo
	
	constructor(_nombre, _precio, _categoria, _tipo) {
		nombre = _nombre
		precio = _precio
		categoria = _categoria
		tipo = _tipo
	}
	
	method categoria() = categoria
	
	method nombre() = nombre 
	
	method esBarato() = precio < 30 
	
	method afectar(usuario) = tipo.afectar(usuario)
 
}

// tipos de juegos

object violento {
	
	method afectar(usuario) {
		var humorAfectado = usuario.humor() - 10
			usuario.humor(humorAfectado)
	}
}

object moba {
	
	method afectar(usuario) {
		var nuevaGuita = usuario.guita() - 30
		usuario.guita(nuevaGuita)
	}	
}

object terrorifico {
	
	method afectar(usuario) {
		usuario.suscripcion(infantil)
	}
}

object estrategico {
	
	method afectar(usuario) {
		var humorNuevo = usuario.humor() + 5 * 
		usuario.humor(humorNuevo)
	}
	
}



class Usuario {
	
	var suscripcion
	var guita
	var humor
	
	constructor(_suscripcion, _guita, _humor) {
		suscripcion = _suscripcion
		guita = _guita
		humor = _humor
	}
	
	method suscripcion(_suscripcion) {
		suscripcion = _suscripcion
	}
	
	method juegosQuePuedeJugar() {
		return suscripcion.juegosQuePuedeJugar() 
	}
	
	method cobrarSuscripcion() {
		var precioSuscripcion = suscripcion.precio()
		
		if (guita < precioSuscripcion) {
			suscripcion = prueba
		}
		
		else {
			guita -= precioSuscripcion
 		}
 	} 
 	
 	method jugar(juego){
 	
 	if (self.juegosQuePuedeJugar().contains(juego)) {
 		juego.afectar(self)
 		}
 	}
 	
 	method humor() = humor
 	
 	method humor(_humor) {
 		humor = _humor
 	}
 	
 	method guita() = guita
 	
 	method guita(_guita) {
 		guita = _guita
 	}
} 


//Suscripciones 

object premium {
	
	const precio = 50
	
	method precio() = precio
	
	method juegosQuePuedeJugar() {
		return gameflix.juegos()
		}
} 


object base {
	
	const precio = 25
	
	method precio() = precio
	
	method juegosQuePuedeJugar() {
		return gameflix.juegos().filter({ juego => juego.esBarato() })
		}
} 


object infantil { 
	
	const precio = 10 
	
	method precio() = precio
	
	method juegosQuePuedeJugar() {
		return gameflix.filtrarPorCategoria("Infantil")
		} 
} 


object prueba { 
	
	const precio = 0 
	
	method precio() = precio
	
	method juegosQuePuedeJugar() { 
		return gameflix.filtrarPorCategoria("Demo") 
		} 
}
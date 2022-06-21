class Plato {
	var property peso=0
	method valoracion()
	method esAbundante(){return peso>250}	
	method esVegetariano()
}

class Provoleta inherits Plato{
	const property tieneEspecias
	
	override method valoracion(){
		if(self.esEspecial()){return 120}
		else{return 80}
	}
	override method esVegetariano(){return tieneEspecias}
	method esEspecial(){return self.esAbundante() or tieneEspecias}	
}


class HamburguesasDeCarne inherits Plato{
	const property pan
	
	override method peso(){return 250}
	override method esVegetariano(){return false}
	override method valoracion(){return 60 + self.puntosDelPan()}
	method puntosDelPan(){
		if(pan=="industrial"){return 0}
		else if(pan=="casero"){return 20}
		else{return 45}
	}
}

class HamburguesasVegetarianas inherits HamburguesasDeCarne{
	const legumbre 
	
	override method esVegetariano(){return true}
	override method valoracion(){return super() + self.plus()}
	method plus(){return 17.min(2*self.cantDeLetras())}
	method cantDeLetras(){return legumbre.size()}
}

class Parrillada inherits Plato{
	var property cortes=[]
	
	method agregarCorte(unCorte){self.cortes().add(unCorte)}
	override method esVegetariano(){return false}
	override method peso(){return self.cortes().sum{c=>c.peso()}}
	override method valoracion(){return 0.max((15*self.corteConMasCalidad().calidad())-self.cantDeCortes())}
	method corteConMasCalidad(){return self.cortes().max{c=>c.calidad()}}
	method cantDeCortes(){return cortes.size()}
}


class Cortes{
	const property nombre
	const property peso
	const property calidad
}





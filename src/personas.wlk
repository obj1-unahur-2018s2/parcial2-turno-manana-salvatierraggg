
class  Socios {
	const idiomas=#{}
	var property maxActividades=0
	var property edad=0
	const actividadesRealizadas=#{}
	method idiomas(){return idiomas}
	method actividadesRealizadas(){return actividadesRealizadas}
	method cantidadActividadesRealizadas(){return actividadesRealizadas.size()}
	method esAdoradorDelSol(){
		return actividadesRealizadas.all({e=>e.bronzeado()})
	}
	method registrarActividad(tal){
		if (self.cantidadActividadesRealizadas()<maxActividades){
		actividadesRealizadas.add(tal)
		}else{
			self.error("limiteAlcanzado")
		}
	}
	method actividadesEsforzadas(){
		return actividadesRealizadas.filter({e=>e.esfuerzo()})
	}
	
	method aprenderIdioma(tal){self.idiomas().add(tal)}
	method atrae(tal){return null}
	
	
}



class Tranquilo inherits Socios{
	override method atrae(tal){return tal.dias()>=4}
}
class Coherente inherits Socios{
	override method atrae(tal){
		if (self.esAdoradorDelSol())
		return tal.bronzeado()
		return tal.esfuerzo()
	}
}
class Relajado inherits Socios{
	override method atrae(tal){
	return (tal.idiomas().intersection(idiomas).size())>0
	}
}

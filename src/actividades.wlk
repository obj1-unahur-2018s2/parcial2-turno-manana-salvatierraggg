
class Actividades{
	const idiomas=#{}
	method esfuerzo(){return true}
	method dias(){return 1}
	method bronzeado(){return false}
	method idiomas(){return idiomas}
	method recomendada(tal){return null}
}

class Viajes inherits Actividades{
	method agregarIdioma(tal){idiomas.add(tal)}
	method interesante(){return idiomas.size()>=2}
	
	override method recomendada(tal){
		return 
		self.interesante()
		&& tal.atrae(self)
		&& not tal.actividadesRealizadas().contains(self)
	}
}

class Playa inherits Viajes{
	var property largoDeLaPlaya=0
	override method bronzeado(){return true}
	override method esfuerzo(){return largoDeLaPlaya>1200}
	override method dias(){return largoDeLaPlaya/500}
	
}
class ExcursionACiudad inherits Viajes{
	var property atraccionesPorVisitar=0
	
	override method esfuerzo(){return 8>=atraccionesPorVisitar&&atraccionesPorVisitar>=5}
	override method dias(){return atraccionesPorVisitar/2}
	override method interesante(){return super() || atraccionesPorVisitar==5}
	
}
class ExcursionACiudadTropical inherits ExcursionACiudad{
	
	override method esfuerzo(){return 8>=atraccionesPorVisitar&&atraccionesPorVisitar>=5}
	override method dias(){return (atraccionesPorVisitar/2)+1}
	override method bronzeado(){return true}
}

class SalidaDeTrekking inherits Viajes{
	var property kmDeSenderos=0
	var property diasSoleados=0.min(365)
	
	override method esfuerzo(){return kmDeSenderos>80}
	override method dias(){return kmDeSenderos/50}
	override method bronzeado(){return diasSoleados>200 || (diasSoleados>100 && kmDeSenderos>120) }
	override method interesante(){return super()&& diasSoleados>140}
}


class Gimnasia inherits Actividades{
	override method idiomas(){
	return "español"
}
	override recomendada(tal){
		return tal.edad()>=20 && tal.edad()<=30
		
	}
}





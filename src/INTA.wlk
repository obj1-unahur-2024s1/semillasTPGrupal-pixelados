import semillas.*
import parcelas.*

object inta{
	const property parcelas = []
	
	method agregarParcela(parcela){parcelas.add(parcela)}
	method cantidadParcelas() = parcelas.size()
	method plantasTotales() = parcelas.sum({p=>p.cantidadPlantas()})
	method promedioDePlantas() = self.plantasTotales() / self.cantidadParcelas()
	method parcelasConMasDe4()= parcelas.filter({p=>p.cantidadPlantas()>=4})
	//method parcelaMasAutosustentable() = self.parcelasConMasDe4().
}
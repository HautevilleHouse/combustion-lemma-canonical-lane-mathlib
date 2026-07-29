import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure CombustionSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure CombustionAdmittedObject where
  space : CombustionSpace
  closedManifold : Prop
  simplyConnected : Prop
  sphereModel : Type
  sphereTopology : TopologicalSpace sphereModel
  homeomorphicToSphere : Prop
  conclusion : homeomorphicToSphere

def CombustionWitnessClosed (O : CombustionAdmittedObject) : Prop :=
  O.homeomorphicToSphere

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse

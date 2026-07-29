import CombustionLemmaCanonicalLaneLean.CombustionAnalyticFoundation

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure CombustionAdmittedObject where
  manifold : Type u
  thermodynamics : Prop
  chemistry : Prop
  conclusion : thermodynamics ∧ chemistry

structure AdmissibleClass where
  object : CombustionAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
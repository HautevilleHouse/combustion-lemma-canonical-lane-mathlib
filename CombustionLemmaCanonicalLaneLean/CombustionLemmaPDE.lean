import canonicalLaneMathlib.ThermodynamicPackages

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure CombustionPDEPackage where
  timeParameter : Type u
  temperatureField : Type v
  initialCondition : Prop
  diffusionTerm : Prop
  reactionTerm : Prop
  ignitionModel : Prop

structure CombustionPDEEvidence (C : CombustionPDEPackage) where
  initialConditionClosed : C.initialCondition
  diffusionTermClosed : C.diffusionTerm
  reactionTermClosed : C.reactionTerm
  ignitionModelClosed : C.ignitionModel

def CombustionPDEClosed (C : CombustionPDEPackage) : Prop :=
  C.initialCondition ∧ C.diffusionTerm ∧ C.reactionTerm ∧ C.ignitionModel

theorem combustion_pde_closed_from_evidence (C : CombustionPDEPackage)
    (E : CombustionPDEEvidence C) : CombustionPDEClosed C := by
  exact And.intro E.initialConditionClosed
    (And.intro E.diffusionTermClosed
      (And.intro E.reactionTermClosed E.ignitionModelClosed))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse

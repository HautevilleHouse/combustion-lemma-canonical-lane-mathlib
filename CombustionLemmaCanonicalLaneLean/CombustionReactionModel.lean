import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure CombustionReactionModel where
  fuel : Type
  oxidizer : Type
  temperature : Type
  fuelConsumptionRate : Prop
  oxidizerConsumptionRate : Prop
  heatRelease : Prop

structure CombustionReactionEvidence (C : CombustionReactionModel) where
  fuelConsumptionRateClosed : C.fuelConsumptionRate
  oxidizerConsumptionRateClosed : C.oxidizerConsumptionRate
  heatReleaseClosed : C.heatRelease

def CombustionReactionClosed (C : CombustionReactionModel) : Prop :=
  C.fuelConsumptionRate ∧ C.oxidizerConsumptionRate ∧ C.heatRelease

theorem combustion_reaction_closed_from_evidence (C : CombustionReactionModel)
    (E : CombustionReactionEvidence C) : CombustionReactionClosed C := by
  exact And.intro E.fuelConsumptionRateClosed
    (And.intro E.oxidizerConsumptionRateClosed E.heatReleaseClosed)

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
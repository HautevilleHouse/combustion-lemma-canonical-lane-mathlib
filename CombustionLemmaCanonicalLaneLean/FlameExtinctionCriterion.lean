import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure FlameExtinctionCriterionPackage where
  damkohlerNumber : Prop
  lewisNumberEffect : Prop
  heatLossParameter : Prop
  strainExtinctionLimit : Prop
  radicalRecombination : Prop

structure FlameExtinctionCriterionEvidence (F : FlameExtinctionCriterionPackage) where
  damkohlerNumberClosed : F.damkohlerNumber
  lewisNumberEffectClosed : F.lewisNumberEffect
  heatLossParameterClosed : F.heatLossParameter
  strainExtinctionLimitClosed : F.strainExtinctionLimit
  radicalRecombinationClosed : F.radicalRecombination

def FlameExtinctionCriterionClosed (F : FlameExtinctionCriterionPackage) : Prop :=
  F.damkohlerNumber ∧ F.lewisNumberEffect ∧ F.heatLossParameter ∧
  F.strainExtinctionLimit ∧ F.radicalRecombination

theorem flame_extinction_criterion_closed_from_evidence
    (F : FlameExtinctionCriterionPackage)
    (E : FlameExtinctionCriterionEvidence F) : FlameExtinctionCriterionClosed F := by
  exact And.intro E.damkohlerNumberClosed
    (And.intro E.lewisNumberEffectClosed
      (And.intro E.heatLossParameterClosed
        (And.intro E.strainExtinctionLimitClosed E.radicalRecombinationClosed)))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse

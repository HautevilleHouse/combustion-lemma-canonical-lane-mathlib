import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure FlameStabilityAnalysis where
  perturbationMode : Type u
  growthRate : Type v
  neutralStabilityCurve : Prop
  darrieusLandauInstability : Prop
  thermalDiffusiveInstability : Prop
  bodyForceEffect : Prop
  stabilityCriterion : Prop

structure FlameStabilityAnalysisEvidence (S : FlameStabilityAnalysis) where
  neutralStabilityCurveClosed : S.neutralStabilityCurve
  darrieusLandauInstabilityClosed : S.darrieusLandauInstability
  thermalDiffusiveInstabilityClosed : S.thermalDiffusiveInstability
  bodyForceEffectClosed : S.bodyForceEffect
  stabilityCriterionClosed : S.stabilityCriterion

def FlameStabilityAnalysisClosed (S : FlameStabilityAnalysis) : Prop :=
  S.neutralStabilityCurve ∧ S.darrieusLandauInstability ∧
  S.thermalDiffusiveInstability ∧ S.bodyForceEffect ∧ S.stabilityCriterion

theorem flame_stability_analysis_closed_from_evidence
    (S : FlameStabilityAnalysis) (E : FlameStabilityAnalysisEvidence S) :
    FlameStabilityAnalysisClosed S := by
  exact And.intro E.neutralStabilityCurveClosed
    (And.intro E.darrieusLandauInstabilityClosed
      (And.intro E.thermalDiffusiveInstabilityClosed
        (And.intro E.bodyForceEffectClosed E.stabilityCriterionClosed)))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure CombustionStabilityAnalysisPackage where
  flameStabilityCondition : Prop
  perturbationGrowthRate : Prop
  thermoacousticCoupling : Prop
  extinctionLimit : Prop

structure CombustionStabilityAnalysisEvidence (S : CombustionStabilityAnalysisPackage) where
  flameStabilityConditionClosed : S.flameStabilityCondition
  perturbationGrowthRateClosed : S.perturbationGrowthRate
  thermoacousticCouplingClosed : S.thermoacousticCoupling
  extinctionLimitClosed : S.extinctionLimit

def CombustionStabilityAnalysisClosed (S : CombustionStabilityAnalysisPackage) : Prop :=
  S.flameStabilityCondition ∧ S.perturbationGrowthRate ∧
  S.thermoacousticCoupling ∧ S.extinctionLimit

theorem combustion_stability_analysis_closed_from_evidence
    (S : CombustionStabilityAnalysisPackage) (E : CombustionStabilityAnalysisEvidence S) :
    CombustionStabilityAnalysisClosed S := by
  exact And.intro E.flameStabilityConditionClosed
    (And.intro E.perturbationGrowthRateClosed
      (And.intro E.thermoacousticCouplingClosed E.extinctionLimitClosed))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
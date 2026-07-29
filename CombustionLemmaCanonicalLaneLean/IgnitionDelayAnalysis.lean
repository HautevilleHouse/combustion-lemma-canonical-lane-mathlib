import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure IgnitionDelayAnalysisPackage where
  inductionTime : Prop
  criticalTemperature : Prop
  chainBranching : Prop
  thermalRunaway : Prop
  coolFlame : Prop

structure IgnitionDelayAnalysisEvidence (I : IgnitionDelayAnalysisPackage) where
  inductionTimeClosed : I.inductionTime
  criticalTemperatureClosed : I.criticalTemperature
  chainBranchingClosed : I.chainBranching
  thermalRunawayClosed : I.thermalRunaway
  coolFlameClosed : I.coolFlame

def IgnitionDelayAnalysisClosed (I : IgnitionDelayAnalysisPackage) : Prop :=
  I.inductionTime ∧ I.criticalTemperature ∧ I.chainBranching ∧
  I.thermalRunaway ∧ I.coolFlame

theorem ignition_delay_analysis_closed_from_evidence
    (I : IgnitionDelayAnalysisPackage)
    (E : IgnitionDelayAnalysisEvidence I) : IgnitionDelayAnalysisClosed I := by
  exact And.intro E.inductionTimeClosed
    (And.intro E.criticalTemperatureClosed
      (And.intro E.chainBranchingClosed
        (And.intro E.thermalRunawayClosed E.coolFlameClosed)))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse

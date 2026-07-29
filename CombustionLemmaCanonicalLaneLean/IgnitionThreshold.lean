import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure IgnitionThresholdPackage where
  criticalTemperature : Prop
  criticalConcentration : Prop
  heatLossRate : Prop
  autothermalOperation : Prop
  ignitionCriterion : Prop

structure IgnitionThresholdEvidence (I : IgnitionThresholdPackage) where
  criticalTemperatureClosed : I.criticalTemperature
  criticalConcentrationClosed : I.criticalConcentration
  heatLossRateClosed : I.heatLossRate
  autothermalOperationClosed : I.autothermalOperation
  ignitionCriterionClosed : I.ignitionCriterion

def IgnitionThresholdClosed (I : IgnitionThresholdPackage) : Prop :=
  I.criticalTemperature ∧ I.criticalConcentration ∧ I.heatLossRate ∧
  I.autothermalOperation ∧ I.ignitionCriterion

theorem ignition_threshold_closed_from_evidence
    (I : IgnitionThresholdPackage) (E : IgnitionThresholdEvidence I) :
    IgnitionThresholdClosed I := by
  exact And.intro E.criticalTemperatureClosed
    (And.intro E.criticalConcentrationClosed
      (And.intro E.heatLossRateClosed
        (And.intro E.autothermalOperationClosed E.ignitionCriterionClosed)))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
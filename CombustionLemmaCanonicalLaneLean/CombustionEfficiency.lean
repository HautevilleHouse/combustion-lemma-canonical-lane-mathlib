import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure CombustionEfficiencyPackage where
  heatReleaseRate : Prop
  completenessFraction : Prop
  mixingQuality : Prop
  chamberGeometry : Prop
  operatingConditions : Prop
  efficiencyMeasure : Prop

structure CombustionEfficiencyEvidence (C : CombustionEfficiencyPackage) where
  heatReleaseRateClosed : C.heatReleaseRate
  completenessFractionClosed : C.completenessFraction
  mixingQualityClosed : C.mixingQuality
  chamberGeometryClosed : C.chamberGeometry
  operatingConditionsClosed : C.operatingConditions
  efficiencyMeasureClosed : C.efficiencyMeasure

def CombustionEfficiencyClosed (C : CombustionEfficiencyPackage) : Prop :=
  C.heatReleaseRate ∧ C.completenessFraction ∧ C.mixingQuality ∧
  C.chamberGeometry ∧ C.operatingConditions ∧ C.efficiencyMeasure

theorem combustion_efficiency_closed_from_evidence
    (C : CombustionEfficiencyPackage) (E : CombustionEfficiencyEvidence C) :
    CombustionEfficiencyClosed C := by
  exact And.intro E.heatReleaseRateClosed
    (And.intro E.completenessFractionClosed
      (And.intro E.mixingQualityClosed
        (And.intro E.chamberGeometryClosed
          (And.intro E.operatingConditionsClosed E.efficiencyMeasureClosed))))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
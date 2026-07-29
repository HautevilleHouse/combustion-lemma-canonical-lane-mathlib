import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure IgnitionCriteriaPackage where
  minimumIgnitionTemperature : Prop
  criticalDamköhlerNumber : Prop
  ignitionDelay : Prop
  mixtureFlammability : Prop

structure IgnitionCriteriaEvidence (I : IgnitionCriteriaPackage) where
  minimumIgnitionTemperatureClosed : I.minimumIgnitionTemperature
  criticalDamköhlerNumberClosed : I.criticalDamköhlerNumber
  ignitionDelayClosed : I.ignitionDelay
  mixtureFlammabilityClosed : I.mixtureFlammability

def IgnitionCriteriaClosed (I : IgnitionCriteriaPackage) : Prop :=
  I.minimumIgnitionTemperature ∧ I.criticalDamköhlerNumber ∧
  I.ignitionDelay ∧ I.mixtureFlammability

theorem ignition_criteria_closed_from_evidence (I : IgnitionCriteriaPackage)
    (E : IgnitionCriteriaEvidence I) : IgnitionCriteriaClosed I := by
  exact And.intro E.minimumIgnitionTemperatureClosed
    (And.intro E.criticalDamköhlerNumberClosed
      (And.intro E.ignitionDelayClosed E.mixtureFlammabilityClosed))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
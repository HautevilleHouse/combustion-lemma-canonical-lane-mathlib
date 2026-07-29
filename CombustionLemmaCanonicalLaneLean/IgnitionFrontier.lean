import canonicalLaneMathlib.ThermodynamicPackages

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure IgnitionFrontierPackage where
  frontPosition : Type u
  propagationSpeed : Type v
  ignitionThreshold : Prop
  quenchingMechanism : Prop
  frontStability : Prop

structure IgnitionFrontierEvidence (I : IgnitionFrontierPackage) where
  ignitionThresholdClosed : I.ignitionThreshold
  quenchingMechanismClosed : I.quenchingMechanism
  frontStabilityClosed : I.frontStability

def IgnitionFrontierClosed (I : IgnitionFrontierPackage) : Prop :=
  I.ignitionThreshold ∧ I.quenchingMechanism ∧ I.frontStability

theorem ignition_frontier_closed_from_evidence (I : IgnitionFrontierPackage)
    (E : IgnitionFrontierEvidence I) : IgnitionFrontierClosed I := by
  exact And.intro E.ignitionThresholdClosed
    (And.intro E.quenchingMechanismClosed E.frontStabilityClosed)

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure FlameFrontPropagationPackage where
  flameSpeed : Prop
  frontPosition : Prop
  activationEnergy : Prop
  LewisNumber : Prop

structure FlameFrontPropagationEvidence (F : FlameFrontPropagationPackage) where
  flameSpeedClosed : F.flameSpeed
  frontPositionClosed : F.frontPosition
  activationEnergyClosed : F.activationEnergy
  LewisNumberClosed : F.LewisNumber

def FlameFrontPropagationClosed (F : FlameFrontPropagationPackage) : Prop :=
  F.flameSpeed ∧ F.frontPosition ∧ F.activationEnergy ∧ F.LewisNumber

theorem flame_front_propagation_closed_from_evidence
    (F : FlameFrontPropagationPackage) (E : FlameFrontPropagationEvidence F) :
    FlameFrontPropagationClosed F := by
  exact And.intro E.flameSpeedClosed
    (And.intro E.frontPositionClosed
      (And.intro E.activationEnergyClosed E.LewisNumberClosed))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
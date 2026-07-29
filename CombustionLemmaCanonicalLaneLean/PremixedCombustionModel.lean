import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure PremixedCombustionModelPackage where
  equivalenceRatio : Prop
  laminarFlameSpeed : Prop
  flameThickness : Prop
  marksteinLength : Prop
  stretchEffect : Prop

structure PremixedCombustionModelEvidence (P : PremixedCombustionModelPackage) where
  equivalenceRatioClosed : P.equivalenceRatio
  laminarFlameSpeedClosed : P.laminarFlameSpeed
  flameThicknessClosed : P.flameThickness
  marksteinLengthClosed : P.marksteinLength
  stretchEffectClosed : P.stretchEffect

def PremixedCombustionModelClosed (P : PremixedCombustionModelPackage) : Prop :=
  P.equivalenceRatio ∧ P.laminarFlameSpeed ∧ P.flameThickness ∧
  P.marksteinLength ∧ P.stretchEffect

theorem premixed_combustion_model_closed_from_evidence
    (P : PremixedCombustionModelPackage)
    (E : PremixedCombustionModelEvidence P) : PremixedCombustionModelClosed P := by
  exact And.intro E.equivalenceRatioClosed
    (And.intro E.laminarFlameSpeedClosed
      (And.intro E.flameThicknessClosed
        (And.intro E.marksteinLengthClosed E.stretchEffectClosed)))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse

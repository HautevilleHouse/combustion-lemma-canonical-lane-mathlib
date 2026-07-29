import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure CombustionFrontPropagation where
  frontPosition : Type u
  speed : Type v
  laminarSpeed : speed
  turbulentSpeedExcess : speed
  flameStretchFactor : Type w
  propagationEquation : Prop
  curvatureDependence : Prop
  stretchEffect : Prop

structure CombustionFrontPropagationEvidence (P : CombustionFrontPropagation) where
  propagationEquationClosed : P.propagationEquation
  curvatureDependenceClosed : P.curvatureDependence
  stretchEffectClosed : P.stretchEffect

def CombustionFrontPropagationClosed (P : CombustionFrontPropagation) : Prop :=
  P.propagationEquation ∧ P.curvatureDependence ∧ P.stretchEffect

theorem combustion_front_propagation_closed_from_evidence
    (P : CombustionFrontPropagation) (E : CombustionFrontPropagationEvidence P) :
    CombustionFrontPropagationClosed P := by
  exact And.intro E.propagationEquationClosed
    (And.intro E.curvatureDependenceClosed E.stretchEffectClosed)

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
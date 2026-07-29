import CombustionLemmaCanonicalLaneLean.CombustionSolver

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure FlamePropagationPackage {S : CombustionSolverPackage} where
  laminarFlameSpeed : Prop
  stretchEffect : Prop
  instabilityGrowthRate : Prop
  quenchingDistance : Prop
  cellularInstability : Prop
  turbulentFlameSpeed : Prop

structure FlamePropagationEvidence {S : CombustionSolverPackage}
    (P : FlamePropagationPackage S) where
  laminarFlameSpeedClosed : P.laminarFlameSpeed
  stretchEffectClosed : P.stretchEffect
  instabilityGrowthRateClosed : P.instabilityGrowthRate
  quenchingDistanceClosed : P.quenchingDistance
  cellularInstabilityClosed : P.cellularInstability
  turbulentFlameSpeedClosed : P.turbulentFlameSpeed

def FlamePropagationClosed {S : CombustionSolverPackage}
    (P : FlamePropagationPackage S) : Prop :=
  P.laminarFlameSpeed ∧ P.stretchEffect ∧ P.instabilityGrowthRate ∧
  P.quenchingDistance ∧ P.cellularInstability ∧ P.turbulentFlameSpeed

theorem flame_propagation_closed_from_evidence
    {S : CombustionSolverPackage} (P : FlamePropagationPackage S)
    (E : FlamePropagationEvidence P) : FlamePropagationClosed P := by
  exact And.intro E.laminarFlameSpeedClosed
    (And.intro E.stretchEffectClosed
      (And.intro E.instabilityGrowthRateClosed
        (And.intro E.quenchingDistanceClosed
          (And.intro E.cellularInstabilityClosed E.turbulentFlameSpeedClosed))))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
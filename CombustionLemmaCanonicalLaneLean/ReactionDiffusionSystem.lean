import CombustionLemmaCanonicalLaneLean.FlamePropagation

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure ReactionDiffusionSystemPackage {S : CombustionSolverPackage}
    {P : FlamePropagationPackage S} where
  speciesTransportEquations : Prop
  heatEquation : Prop
  arrheniusKinetics : Prop
  diffusionCoefficients : Prop
  boundaryConditions : Prop
  ignitionCriteria : Prop

structure ReactionDiffusionSystemEvidence {S : CombustionSolverPackage}
    {P : FlamePropagationPackage S} (R : ReactionDiffusionSystemPackage P) where
  speciesTransportEquationsClosed : R.speciesTransportEquations
  heatEquationClosed : R.heatEquation
  arrheniusKineticsClosed : R.arrheniusKinetics
  diffusionCoefficientsClosed : R.diffusionCoefficients
  boundaryConditionsClosed : R.boundaryConditions
  ignitionCriteriaClosed : R.ignitionCriteria

def ReactionDiffusionSystemClosed {S : CombustionSolverPackage}
    {P : FlamePropagationPackage S} (R : ReactionDiffusionSystemPackage P) : Prop :=
  R.speciesTransportEquations ∧ R.heatEquation ∧ R.arrheniusKinetics ∧
  R.diffusionCoefficients ∧ R.boundaryConditions ∧ R.ignitionCriteria

theorem reaction_diffusion_system_closed_from_evidence
    {S : CombustionSolverPackage} {P : FlamePropagationPackage S}
    (R : ReactionDiffusionSystemPackage P) (E : ReactionDiffusionSystemEvidence R) :
    ReactionDiffusionSystemClosed R := by
  exact And.intro E.speciesTransportEquationsClosed
    (And.intro E.heatEquationClosed
      (And.intro E.arrheniusKineticsClosed
        (And.intro E.diffusionCoefficientsClosed
          (And.intro E.boundaryConditionsClosed E.ignitionCriteriaClosed))))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
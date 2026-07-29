import CombustionLemmaCanonicalLaneLean.TurbulentCombustion

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure CombustionAnalyticFoundation where
  solver : CombustionSolverPackage
  solverEvidence : CombustionSolverEvidence solver
  propagation : FlamePropagationPackage solver
  propagationEvidence : FlamePropagationEvidence propagation
  reactionDiffusion : ReactionDiffusionSystemPackage propagation
  reactionDiffusionEvidence : ReactionDiffusionSystemEvidence reactionDiffusion
  ignitionExtinction : IgnitionExtinctionPackage reactionDiffusion
  ignitionExtinctionEvidence : IgnitionExtinctionEvidence ignitionExtinction
  turbulentCombustion : TurbulentCombustionPackage ignitionExtinction
  turbulentCombustionEvidence : TurbulentCombustionEvidence turbulentCombustion

def CombustionAnalyticFoundationClosed (A : CombustionAnalyticFoundation) : Prop :=
  CombustionSolverClosed A.solver ∧
  FlamePropagationClosed A.propagation ∧
  ReactionDiffusionSystemClosed A.reactionDiffusion ∧
  IgnitionExtinctionClosed A.ignitionExtinction ∧
  TurbulentCombustionClosed A.turbulentCombustion

theorem combustion_analytic_foundation_closed_from_evidence
    (A : CombustionAnalyticFoundation) : CombustionAnalyticFoundationClosed A := by
  exact And.intro (combustion_solver_closed_from_evidence A.solver A.solverEvidence)
    (And.intro (flame_propagation_closed_from_evidence A.propagation A.propagationEvidence)
      (And.intro (reaction_diffusion_system_closed_from_evidence A.reactionDiffusion A.reactionDiffusionEvidence)
        (And.intro (ignition_extinction_closed_from_evidence A.ignitionExtinction A.ignitionExtinctionEvidence)
          (turbulent_combustion_closed_from_evidence A.turbulentCombustion A.turbulentCombustionEvidence))))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
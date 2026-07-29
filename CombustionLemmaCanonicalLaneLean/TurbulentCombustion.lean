import CombustionLemmaCanonicalLaneLean.IgnitionExtinction

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure TurbulentCombustionPackage {S : CombustionSolverPackage}
    {P : FlamePropagationPackage S} {R : ReactionDiffusionSystemPackage P}
    {I : IgnitionExtinctionPackage R} where
  turbulentBurningVelocity : Prop
  flameWrinkling : Prop
  scalarDissipationRate : Prop
  flameSurfaceDensity : Prop
  eddyBreakupModel : Prop
  turbulentFlameStructure : Prop

structure TurbulentCombustionEvidence {S : CombustionSolverPackage}
    {P : FlamePropagationPackage S} {R : ReactionDiffusionSystemPackage P}
    {I : IgnitionExtinctionPackage R} (T : TurbulentCombustionPackage I) where
  turbulentBurningVelocityClosed : T.turbulentBurningVelocity
  flameWrinklingClosed : T.flameWrinkling
  scalarDissipationRateClosed : T.scalarDissipationRate
  flameSurfaceDensityClosed : T.flameSurfaceDensity
  eddyBreakupModelClosed : T.eddyBreakupModel
  turbulentFlameStructureClosed : T.turbulentFlameStructure

def TurbulentCombustionClosed {S : CombustionSolverPackage}
    {P : FlamePropagationPackage S} {R : ReactionDiffusionSystemPackage P}
    {I : IgnitionExtinctionPackage R} (T : TurbulentCombustionPackage I) : Prop :=
  T.turbulentBurningVelocity ∧ T.flameWrinkling ∧ T.scalarDissipationRate ∧
  T.flameSurfaceDensity ∧ T.eddyBreakupModel ∧ T.turbulentFlameStructure

theorem turbulent_combustion_closed_from_evidence
    {S : CombustionSolverPackage} {P : FlamePropagationPackage S}
    {R : ReactionDiffusionSystemPackage P} {I : IgnitionExtinctionPackage R}
    (T : TurbulentCombustionPackage I) (E : TurbulentCombustionEvidence T) :
    TurbulentCombustionClosed T := by
  exact And.intro E.turbulentBurningVelocityClosed
    (And.intro E.flameWrinklingClosed
      (And.intro E.scalarDissipationRateClosed
        (And.intro E.flameSurfaceDensityClosed
          (And.intro E.eddyBreakupModelClosed E.turbulentFlameStructureClosed))))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
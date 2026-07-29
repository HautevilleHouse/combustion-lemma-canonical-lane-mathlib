import canonicalLaneMathlib.ThermodynamicPackages

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure ExplosionCriteriaPackage where
  criticalTemperature : Type u
  pressureProfile : Type v
  runAwayReactionThreshold : Prop
  detonationTransition : Prop
  safetyMargin : Prop

structure ExplosionCriteriaEvidence (E : ExplosionCriteriaPackage) where
  runAwayReactionThresholdClosed : E.runAwayReactionThreshold
  detonationTransitionClosed : E.detonationTransition
  safetyMarginClosed : E.safetyMargin

def ExplosionCriteriaClosed (E : ExplosionCriteriaPackage) : Prop :=
  E.runAwayReactionThreshold ∧ E.detonationTransition ∧ E.safetyMargin

theorem explosion_criteria_closed_from_evidence (E : ExplosionCriteriaPackage)
    (Ev : ExplosionCriteriaEvidence E) : ExplosionCriteriaClosed E := by
  exact And.intro Ev.runAwayReactionThresholdClosed
    (And.intro Ev.detonationTransitionClosed Ev.safetyMarginClosed)

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse

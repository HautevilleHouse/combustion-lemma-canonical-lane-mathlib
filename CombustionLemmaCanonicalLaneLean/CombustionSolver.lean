import CombustionLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure CombustionSolverPackage where
  reactionType : Type u
  fuelMixture : Type v
  temperatureField : Type w
  flameFront : Prop
  ignitionCondition : Prop
  stoichiometryMatched : Prop
  energyConservation : Prop
  reactionKinetics : Prop
  diffusionTransport : Prop

structure CombustionSolverEvidence (S : CombustionSolverPackage) where
  flameFrontClosed : S.flameFront
  ignitionConditionClosed : S.ignitionCondition
  stoichiometryMatchedClosed : S.stoichiometryMatched
  energyConservationClosed : S.energyConservation
  reactionKineticsClosed : S.reactionKinetics
  diffusionTransportClosed : S.diffusionTransport

def CombustionSolverClosed (S : CombustionSolverPackage) : Prop :=
  S.flameFront ∧ S.ignitionCondition ∧ S.stoichiometryMatched ∧
  S.energyConservation ∧ S.reactionKinetics ∧ S.diffusionTransport

theorem combustion_solver_closed_from_evidence
    (S : CombustionSolverPackage) (E : CombustionSolverEvidence S) :
    CombustionSolverClosed S := by
  exact And.intro E.flameFrontClosed
    (And.intro E.ignitionConditionClosed
      (And.intro E.stoichiometryMatchedClosed
        (And.intro E.energyConservationClosed
          (And.intro E.reactionKineticsClosed E.diffusionTransportClosed))))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
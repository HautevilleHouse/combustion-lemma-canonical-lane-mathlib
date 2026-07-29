import CombustionLemmaCanonicalLaneLean.ReactionDiffusionSystem

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure IgnitionExtinctionPackage {S : CombustionSolverPackage}
    {P : FlamePropagationPackage S} {R : ReactionDiffusionSystemPackage P} where
  autoignitionTemperature : Prop
  minimumIgnitionEnergy : Prop
  flammabilityLimits : Prop
  extinctionStrainRate : Prop
  ignitionDelay : Prop
  extinctionMechanism : Prop

structure IgnitionExtinctionEvidence {S : CombustionSolverPackage}
    {P : FlamePropagationPackage S} {R : ReactionDiffusionSystemPackage P}
    (I : IgnitionExtinctionPackage R) where
  autoignitionTemperatureClosed : I.autoignitionTemperature
  minimumIgnitionEnergyClosed : I.minimumIgnitionEnergy
  flammabilityLimitsClosed : I.flammabilityLimits
  extinctionStrainRateClosed : I.extinctionStrainRate
  ignitionDelayClosed : I.ignitionDelay
  extinctionMechanismClosed : I.extinctionMechanism

def IgnitionExtinctionClosed {S : CombustionSolverPackage}
    {P : FlamePropagationPackage S} {R : ReactionDiffusionSystemPackage P}
    (I : IgnitionExtinctionPackage R) : Prop :=
  I.autoignitionTemperature ∧ I.minimumIgnitionEnergy ∧ I.flammabilityLimits ∧
  I.extinctionStrainRate ∧ I.ignitionDelay ∧ I.extinctionMechanism

theorem ignition_extinction_closed_from_evidence
    {S : CombustionSolverPackage} {P : FlamePropagationPackage S}
    {R : ReactionDiffusionSystemPackage P} (I : IgnitionExtinctionPackage R)
    (E : IgnitionExtinctionEvidence I) : IgnitionExtinctionClosed I := by
  exact And.intro E.autoignitionTemperatureClosed
    (And.intro E.minimumIgnitionEnergyClosed
      (And.intro E.flammabilityLimitsClosed
        (And.intro E.extinctionStrainRateClosed
          (And.intro E.ignitionDelayClosed E.extinctionMechanismClosed))))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
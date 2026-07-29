import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure FlameFrontPDEPackage where
  spatialDomain : Type u
  timeDomain : Type v
  temperatureField : Type w
  speciesField : Type x
  reactionRate : Prop
  activationEnergy : Prop
  heatRelease : Prop

structure FlameFrontPDEEvidence (F : FlameFrontPDEPackage) where
  reactionRateClosed : F.reactionRate
  activationEnergyClosed : F.activationEnergy
  heatReleaseClosed : F.heatRelease

def FlameFrontPDEClosed (F : FlameFrontPDEPackage) : Prop :=
  F.reactionRate ∧ F.activationEnergy ∧ F.heatRelease

theorem flame_front_pde_closed_from_evidence (F : FlameFrontPDEPackage)
    (E : FlameFrontPDEEvidence F) : FlameFrontPDEClosed F := by
  exact And.intro E.reactionRateClosed
    (And.intro E.activationEnergyClosed E.heatReleaseClosed)

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse

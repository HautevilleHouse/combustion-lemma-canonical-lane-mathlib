import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure LaminarFlameSpeedPackage where
  unburntMixtureState : Prop
  flameFrontModel : Prop
  burningVelocityFormula : Prop
  activationEnergyAsymptotics : Prop
  lewisNumberEffect : Prop

structure LaminarFlameSpeedEvidence (L : LaminarFlameSpeedPackage) where
  unburntMixtureStateClosed : L.unburntMixtureState
  flameFrontModelClosed : L.flameFrontModel
  burningVelocityFormulaClosed : L.burningVelocityFormula
  activationEnergyAsymptoticsClosed : L.activationEnergyAsymptotics
  lewisNumberEffectClosed : L.lewisNumberEffect

def LaminarFlameSpeedClosed (L : LaminarFlameSpeedPackage) : Prop :=
  L.unburntMixtureState ∧ L.flameFrontModel ∧ L.burningVelocityFormula ∧
  L.activationEnergyAsymptotics ∧ L.lewisNumberEffect

theorem laminar_flame_speed_closed_from_evidence
    (L : LaminarFlameSpeedPackage) (E : LaminarFlameSpeedEvidence L) :
    LaminarFlameSpeedClosed L := by
  exact And.intro E.unburntMixtureStateClosed
    (And.intro E.flameFrontModelClosed
      (And.intro E.burningVelocityFormulaClosed
        (And.intro E.activationEnergyAsymptoticsClosed E.lewisNumberEffectClosed)))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
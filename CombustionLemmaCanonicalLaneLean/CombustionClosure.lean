import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.BridgeLemmas
import canonicalLaneMathlib.GateLemmas

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

def ConstrainedCombustionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_combustion_endgame (A : AdmissibleClass) :
    ConstrainedCombustionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse

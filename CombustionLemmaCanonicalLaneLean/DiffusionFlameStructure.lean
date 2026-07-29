import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure DiffusionFlameStructurePackage where
  mixtureFraction : Prop
  scalarDissipationRate : Prop
  flameletLibrary : Prop
  strainRate : Prop
  extinctionCondition : Prop

structure DiffusionFlameStructureEvidence (D : DiffusionFlameStructurePackage) where
  mixtureFractionClosed : D.mixtureFraction
  scalarDissipationRateClosed : D.scalarDissipationRate
  flameletLibraryClosed : D.flameletLibrary
  strainRateClosed : D.strainRate
  extinctionConditionClosed : D.extinctionCondition

def DiffusionFlameStructureClosed (D : DiffusionFlameStructurePackage) : Prop :=
  D.mixtureFraction ∧ D.scalarDissipationRate ∧ D.flameletLibrary ∧
  D.strainRate ∧ D.extinctionCondition

theorem diffusion_flame_structure_closed_from_evidence
    (D : DiffusionFlameStructurePackage)
    (E : DiffusionFlameStructureEvidence D) : DiffusionFlameStructureClosed D := by
  exact And.intro E.mixtureFractionClosed
    (And.intro E.scalarDissipationRateClosed
      (And.intro E.flameletLibraryClosed
        (And.intro E.strainRateClosed E.extinctionConditionClosed)))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse

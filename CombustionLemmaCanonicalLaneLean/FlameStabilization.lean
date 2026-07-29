import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure FlameStabilizationPackage where
  flowFieldModel : Prop
  flameHolderGeometry : Prop
  recirculationZone : Prop
  blowoffLimit : Prop
  stabilizationCriterion : Prop

structure FlameStabilizationEvidence (F : FlameStabilizationPackage) where
  flowFieldModelClosed : F.flowFieldModel
  flameHolderGeometryClosed : F.flameHolderGeometry
  recirculationZoneClosed : F.recirculationZone
  blowoffLimitClosed : F.blowoffLimit
  stabilizationCriterionClosed : F.stabilizationCriterion

def FlameStabilizationClosed (F : FlameStabilizationPackage) : Prop :=
  F.flowFieldModel ∧ F.flameHolderGeometry ∧ F.recirculationZone ∧
  F.blowoffLimit ∧ F.stabilizationCriterion

theorem flame_stabilization_closed_from_evidence
    (F : FlameStabilizationPackage) (E : FlameStabilizationEvidence F) :
    FlameStabilizationClosed F := by
  exact And.intro E.flowFieldModelClosed
    (And.intro E.flameHolderGeometryClosed
      (And.intro E.recirculationZoneClosed
        (And.intro E.blowoffLimitClosed E.stabilizationCriterionClosed)))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
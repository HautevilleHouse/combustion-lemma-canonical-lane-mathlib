import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure ReactiveScalarFieldPackage where
  fieldVariable : Type u
  spatialDomain : Type v
  timeInterval : Type w
  boundaryConditions : Prop
  initialCondition : Prop
  reactionDiffusionEquation : Prop
  sourceTerm : Prop

structure ReactiveScalarFieldEvidence (R : ReactiveScalarFieldPackage) where
  boundaryConditionsClosed : R.boundaryConditions
  initialConditionClosed : R.initialCondition
  reactionDiffusionEquationClosed : R.reactionDiffusionEquation
  sourceTermClosed : R.sourceTerm

def ReactiveScalarFieldClosed (R : ReactiveScalarFieldPackage) : Prop :=
  R.boundaryConditions ∧ R.initialCondition ∧ R.reactionDiffusionEquation ∧ R.sourceTerm

theorem reactive_scalar_field_closed_from_evidence
    (R : ReactiveScalarFieldPackage) (E : ReactiveScalarFieldEvidence R) :
    ReactiveScalarFieldClosed R := by
  exact And.intro E.boundaryConditionsClosed
    (And.intro E.initialConditionClosed
      (And.intro E.reactionDiffusionEquationClosed E.sourceTermClosed))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
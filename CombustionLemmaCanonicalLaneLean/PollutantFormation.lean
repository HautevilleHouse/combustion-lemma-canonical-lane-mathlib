import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombustionLemmaCanonicalLaneLean

structure PollutantFormationPackage where
  fuelComposition : Prop
  temperatureHistory : Prop
  residenceTime : Prop
  nitrogenOxideMechanism : Prop
  sootFormationModel : Prop
  coEmissionModel : Prop

structure PollutantFormationEvidence (P : PollutantFormationPackage) where
  fuelCompositionClosed : P.fuelComposition
  temperatureHistoryClosed : P.temperatureHistory
  residenceTimeClosed : P.residenceTime
  nitrogenOxideMechanismClosed : P.nitrogenOxideMechanism
  sootFormationModelClosed : P.sootFormationModel
  coEmissionModelClosed : P.coEmissionModel

def PollutantFormationClosed (P : PollutantFormationPackage) : Prop :=
  P.fuelComposition ∧ P.temperatureHistory ∧ P.residenceTime ∧
  P.nitrogenOxideMechanism ∧ P.sootFormationModel ∧ P.coEmissionModel

theorem pollutant_formation_closed_from_evidence
    (P : PollutantFormationPackage) (E : PollutantFormationEvidence P) :
    PollutantFormationClosed P := by
  exact And.intro E.fuelCompositionClosed
    (And.intro E.temperatureHistoryClosed
      (And.intro E.residenceTimeClosed
        (And.intro E.nitrogenOxideMechanismClosed
          (And.intro E.sootFormationModelClosed E.coEmissionModelClosed))))

end CombustionLemmaCanonicalLaneLean
end HautevilleHouse
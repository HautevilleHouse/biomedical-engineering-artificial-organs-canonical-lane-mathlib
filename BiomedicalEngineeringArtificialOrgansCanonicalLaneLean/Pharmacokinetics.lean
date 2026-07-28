import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringArtificialOrgansCanonicalLaneLean

structure PharmacokineticsPackage where
  absorptionModel : Prop
  distributionVolume : Prop
  eliminationRate : Prop
  clearance : Prop
  halfLife : Prop

def PharmacokineticsClosed (P : PharmacokineticsPackage) : Prop :=
  P.absorptionModel ∧ P.distributionVolume ∧ P.eliminationRate ∧ P.clearance ∧ P.halfLife

structure PharmacokineticsEvidence (P : PharmacokineticsPackage) where
  absorptionModelClosed : P.absorptionModel
  distributionVolumeClosed : P.distributionVolume
  eliminationRateClosed : P.eliminationRate
  clearanceClosed : P.clearance
  halfLifeClosed : P.halfLife

theorem pharmacokinetics_closed_from_evidence (P : PharmacokineticsPackage)
    (E : PharmacokineticsEvidence P) : PharmacokineticsClosed P := by
  exact And.intro E.absorptionModelClosed
    (And.intro E.distributionVolumeClosed
      (And.intro E.eliminationRateClosed
        (And.intro E.clearanceClosed E.halfLifeClosed)))

end BiomedicalEngineeringArtificialOrgansCanonicalLaneLean
end HautevilleHouse
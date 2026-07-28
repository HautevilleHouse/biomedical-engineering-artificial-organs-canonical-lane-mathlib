import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringArtificialOrgansCanonicalLaneLean

structure BiocompatibilityPackage where
  materialType : Type u
  cytotoxicityTest : Prop
  hemocompatibility : Prop
  immuneResponseModel : Prop
  degradationRate : Prop
  surfaceModification : Prop

def BiocompatibilityClosed (B : BiocompatibilityPackage) : Prop :=
  B.cytotoxicityTest ∧ B.hemocompatibility ∧ B.immuneResponseModel ∧ B.degradationRate ∧ B.surfaceModification

structure BiocompatibilityEvidence (B : BiocompatibilityPackage) where
  cytotoxicityTestClosed : B.cytotoxicityTest
  hemocompatibilityClosed : B.hemocompatibility
  immuneResponseModelClosed : B.immuneResponseModel
  degradationRateClosed : B.degradationRate
  surfaceModificationClosed : B.surfaceModification

theorem biocompatibility_closed_from_evidence (B : BiocompatibilityPackage)
    (E : BiocompatibilityEvidence B) : BiocompatibilityClosed B := by
  exact And.intro E.cytotoxicityTestClosed
    (And.intro E.hemocompatibilityClosed
      (And.intro E.immuneResponseModelClosed
        (And.intro E.degradationRateClosed E.surfaceModificationClosed)))

end BiomedicalEngineeringArtificialOrgansCanonicalLaneLean
end HautevilleHouse
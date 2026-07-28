import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiomedicalEngineeringArtificialOrgansCanonicalLaneLean.CompartmentModel
import HautevilleHouse.BiomedicalEngineeringArtificialOrgansCanonicalLaneLean.PharmacokineticPackage

namespace HautevilleHouse
namespace BiomedicalEngineeringArtificialOrgansCanonicalLaneLean

structure ArtificialOrganAdmittedObject where
  organType : String
  hemocompatibility : Prop
  thrombogenicity : Prop
  flowRate : ℝ
  pressureGradient : ℝ
  implantationSuccess : Prop
  conclusion : implantationSuccess

structure AdmissibleClass where
  object : ArtificialOrganAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ArtificialOrganWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiomedicalEngineeringArtificialOrgansCanonicalLaneLean
end HautevilleHouse
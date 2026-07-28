import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiomedicalEngineeringArtificialOrgansCanonicalLaneLean.ArtificialOrganAdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringArtificialOrgansCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end BiomedicalEngineeringArtificialOrgansCanonicalLaneLean
end HautevilleHouse
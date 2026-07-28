import BiomedicalEngineeringArtificialOrgansCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace BiomedicalEngineeringArtificialOrgansCanonicalLaneLean

structure AdmissibleClass where
  object : BioMedAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BioMedWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiomedicalEngineeringArtificialOrgansCanonicalLaneLean
end HautevilleHouse
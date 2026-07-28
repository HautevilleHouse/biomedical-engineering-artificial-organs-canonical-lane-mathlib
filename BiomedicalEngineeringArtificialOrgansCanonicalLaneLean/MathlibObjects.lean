import BiomedicalEngineeringArtificialOrgansCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore

namespace HautevilleHouse
namespace BiomedicalEngineeringArtificialOrgansCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure OrganSystem where
  carrier : Type
  topology : TopologicalSpace carrier

structure BioMedAdmittedObject where
  organSystem : OrganSystem
  compartmentModelValid : Prop
  pharmacokineticInferenceValid : Prop
  diagnosticInferenceValid : Prop
  survivalAnalysisValid : Prop
  conclusion : compartmentModelValid ∧ pharmacokineticInferenceValid ∧ diagnosticInferenceValid ∧ survivalAnalysisValid

def BioMedWitnessClosed (O : BioMedAdmittedObject) : Prop :=
  O.conclusion

end BiomedicalEngineeringArtificialOrgansCanonicalLaneLean
end HautevilleHouse
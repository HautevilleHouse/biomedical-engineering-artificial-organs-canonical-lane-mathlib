import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiomedicalEngineeringArtificialOrgansCanonicalLaneLean.OrganModels

namespace HautevilleHouse
namespace BiomedicalEngineeringArtificialOrgansCanonicalLaneLean

structure PharmacokineticAdmittedObject where
  organSystem : OrganSystem
  drugConcentration : OrganSystem.stateSpace → ℝ
  clearanceRate : ℝ
  distributionVolume : ℝ
  halfLife : ℝ
  therapeuticWindow : Prop
  conclusion : therapeuticWindow

structure PharmacokineticAdmissibleClass where
  object : PharmacokineticAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : PharmacokineticAdmissibleClass) : Prop :=
  A.object.therapeuticWindow

theorem bridge_from_admissible_class (A : PharmacokineticAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : PharmacokineticAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : PharmacokineticAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end BiomedicalEngineeringArtificialOrgansCanonicalLaneLean
end HautevilleHouse
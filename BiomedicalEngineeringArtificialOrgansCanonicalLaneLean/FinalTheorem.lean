import HautevilleHouse.BiomedicalEngineeringArtificialOrgansCanonicalLaneLean.PharmacokineticBridge

namespace HautevilleHouse
namespace BiomedicalEngineeringArtificialOrgansCanonicalLaneLean

def ConstrainedOrganClosure (A : PharmacokineticAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_organ_endgame (A : PharmacokineticAdmissibleClass) :
    ConstrainedOrganClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiomedicalEngineeringArtificialOrgansCanonicalLaneLean
end HautevilleHouse
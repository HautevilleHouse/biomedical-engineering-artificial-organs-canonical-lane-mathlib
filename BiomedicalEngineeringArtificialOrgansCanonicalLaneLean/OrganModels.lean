import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringArtificialOrgansCanonicalLaneLean

structure OrganSystem where
  compartments : Nat
  stateSpace : Type u
  transferRates : stateSpace → stateSpace → Prop
  inputRate : stateSpace → ℝ
  eliminationRate : stateSpace → ℝ
  initialCondition : stateSpace
  parametersAdmissible : Prop

structure OrganSystemEvidence (O : OrganSystem) where
  transferRatesClosed : O.transferRates
  inputRateClosed : O.inputRate
  eliminationRateClosed : O.eliminationRate
  parametersAdmissibleClosed : O.parametersAdmissible

def OrganSystemClosed (O : OrganSystem) : Prop :=
  O.transferRates ∧ O.inputRate ∧ O.eliminationRate ∧ O.parametersAdmissible

theorem organ_system_closed_from_evidence (O : OrganSystem) (E : OrganSystemEvidence O) :
    OrganSystemClosed O := by
  exact And.intro E.transferRatesClosed
    (And.intro E.inputRateClosed
      (And.intro E.eliminationRateClosed E.parametersAdmissibleClosed))

end BiomedicalEngineeringArtificialOrgansCanonicalLaneLean
end HautevilleHouse
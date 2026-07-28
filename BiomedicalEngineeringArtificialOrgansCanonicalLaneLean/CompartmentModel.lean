import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringArtificialOrgansCanonicalLaneLean

structure CompartmentModelPackage where
  numCompartments : Nat
  transferRates : Type u
  initialConcentrations : Type v
  rateEquations : Prop
  conservationLaw : Prop
  steadyStateCondition : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  rateEquationsClosed : C.rateEquations
  conservationLawClosed : C.conservationLaw
  steadyStateConditionClosed : C.steadyStateCondition

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.rateEquations ∧ C.conservationLaw ∧ C.steadyStateCondition

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.rateEquationsClosed (And.intro E.conservationLawClosed E.steadyStateConditionClosed)

end BiomedicalEngineeringArtificialOrgansCanonicalLaneLean
end HautevilleHouse
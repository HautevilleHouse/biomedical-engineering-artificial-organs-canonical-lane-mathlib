import BiomedicalEngineeringArtificialOrgansCanonicalLaneLean.CompartmentModel

namespace HautevilleHouse
namespace BiomedicalEngineeringArtificialOrgansCanonicalLaneLean

structure PharmacokineticInferencePackage {C : CompartmentModelPackage} where
  drugConcentrationData : Type
  bayesianInference : Prop
  posteriorDistribution : Prop
  modelFit : Prop

structure PharmacokineticInferenceEvidence {C : CompartmentModelPackage}
    (P : PharmacokineticInferencePackage C) where
  bayesianInferenceClosed : P.bayesianInference
  posteriorDistributionClosed : P.posteriorDistribution
  modelFitClosed : P.modelFit

def PharmacokineticInferenceClosed {C : CompartmentModelPackage}
    (P : PharmacokineticInferencePackage C) : Prop :=
  P.bayesianInference ∧ P.posteriorDistribution ∧ P.modelFit

theorem pharmacokinetic_inference_closed_from_evidence
    {C : CompartmentModelPackage} (P : PharmacokineticInferencePackage C)
    (E : PharmacokineticInferenceEvidence P) : PharmacokineticInferenceClosed P := by
  exact And.intro E.bayesianInferenceClosed
    (And.intro E.posteriorDistributionClosed E.modelFitClosed)

end BiomedicalEngineeringArtificialOrgansCanonicalLaneLean
end HautevilleHouse
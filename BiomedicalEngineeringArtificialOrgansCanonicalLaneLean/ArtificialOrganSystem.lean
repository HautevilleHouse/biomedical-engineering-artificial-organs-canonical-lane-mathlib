import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiomedicalEngineeringArtificialOrgansCanonicalLaneLean.CompartmentModel
import HautevilleHouse.BiomedicalEngineeringArtificialOrgansCanonicalLaneLean.Pharmacokinetics
import HautevilleHouse.BiomedicalEngineeringArtificialOrgansCanonicalLaneLean.DiagnosticInference
import HautevilleHouse.BiomedicalEngineeringArtificialOrgansCanonicalLaneLean.SurvivalAnalysis

namespace HautevilleHouse
namespace BiomedicalEngineeringArtificialOrgansCanonicalLaneLean

structure ArtificialOrganSystem where
  compartmentModel : CompartmentModel
  pharmacokineticModel : PharmacokineticModel
  diagnosticModel : DiagnosticInferenceModel
  survivalModel : SurvivalAnalysisModel
  integrationValidated : Prop

structure ArtificialOrganSystemEvidence (A : ArtificialOrganSystem) where
  compartmentModelClosed : CompartmentModelClosed A.compartmentModel
  pharmacokineticClosed : PharmacokineticClosed A.pharmacokineticModel
  diagnosticInferenceClosed : DiagnosticInferenceClosed A.diagnosticModel
  survivalAnalysisClosed : SurvivalAnalysisClosed A.survivalModel
  integrationValidatedClosed : A.integrationValidated

def ArtificialOrganSystemClosed (A : ArtificialOrganSystem) : Prop :=
  CompartmentModelClosed A.compartmentModel ∧
  PharmacokineticClosed A.pharmacokineticModel ∧
  DiagnosticInferenceClosed A.diagnosticModel ∧
  SurvivalAnalysisClosed A.survivalModel ∧
  A.integrationValidated

theorem artificial_organ_system_closed_from_evidence (A : ArtificialOrganSystem) (E : ArtificialOrganSystemEvidence A) :
    ArtificialOrganSystemClosed A := by
  exact And.intro E.compartmentModelClosed
    (And.intro E.pharmacokineticClosed
      (And.intro E.diagnosticInferenceClosed
        (And.intro E.survivalAnalysisClosed E.integrationValidatedClosed)))

end BiomedicalEngineeringArtificialOrgansCanonicalLaneLean
end HautevilleHouse
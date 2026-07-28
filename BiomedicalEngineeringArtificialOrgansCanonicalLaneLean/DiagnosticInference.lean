import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringArtificialOrgansCanonicalLaneLean

structure DiagnosticInferencePackage where
  sensorReadings : Type u
  inferenceAlgorithm : Prop
  diagnosticAccuracy : Prop
  falsePositiveRate : Prop
  falseNegativeRate : Prop
  clinicalValidation : Prop

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  D.inferenceAlgorithm ∧ D.diagnosticAccuracy ∧ D.falsePositiveRate ∧ D.falseNegativeRate ∧ D.clinicalValidation

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  inferenceAlgorithmClosed : D.inferenceAlgorithm
  diagnosticAccuracyClosed : D.diagnosticAccuracy
  falsePositiveRateClosed : D.falsePositiveRate
  falseNegativeRateClosed : D.falseNegativeRate
  clinicalValidationClosed : D.clinicalValidation

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferencePackage)
    (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D := by
  exact And.intro E.inferenceAlgorithmClosed
    (And.intro E.diagnosticAccuracyClosed
      (And.intro E.falsePositiveRateClosed
        (And.intro E.falseNegativeRateClosed E.clinicalValidationClosed)))

end BiomedicalEngineeringArtificialOrgansCanonicalLaneLean
end HautevilleHouse
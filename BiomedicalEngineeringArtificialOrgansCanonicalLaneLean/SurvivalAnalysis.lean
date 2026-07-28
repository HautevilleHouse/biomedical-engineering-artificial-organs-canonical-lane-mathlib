import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringArtificialOrgansCanonicalLaneLean

structure SurvivalAnalysisPackage where
  cohortData : Type u
  hazardFunction : Type v
  kaplanMeierEstimator : Prop
  coxRegression : Prop
  survivalProbability : Prop
  riskFactors : Prop

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.kaplanMeierEstimator ∧ S.coxRegression ∧ S.survivalProbability ∧ S.riskFactors

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  kaplanMeierEstimatorClosed : S.kaplanMeierEstimator
  coxRegressionClosed : S.coxRegression
  survivalProbabilityClosed : S.survivalProbability
  riskFactorsClosed : S.riskFactors

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.kaplanMeierEstimatorClosed
    (And.intro E.coxRegressionClosed
      (And.intro E.survivalProbabilityClosed E.riskFactorsClosed))

end BiomedicalEngineeringArtificialOrgansCanonicalLaneLean
end HautevilleHouse
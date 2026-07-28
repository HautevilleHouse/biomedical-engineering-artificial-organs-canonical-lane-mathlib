import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringArtificialOrgansCanonicalLaneLean

structure HemodynamicsPackage where
  bloodFlowModel : Type u
  pressureDistribution : Prop
  shearStressEstimate : Prop
  turbulenceModel : Prop
  pulseWaveVelocity : Prop
  cardiacOutput : Prop

def HemodynamicsClosed (H : HemodynamicsPackage) : Prop :=
  H.bloodFlowModel ∧ H.pressureDistribution ∧ H.shearStressEstimate ∧ H.turbulenceModel ∧ H.pulseWaveVelocity ∧ H.cardiacOutput

structure HemodynamicsEvidence (H : HemodynamicsPackage) where
  bloodFlowModelClosed : H.bloodFlowModel
  pressureDistributionClosed : H.pressureDistribution
  shearStressEstimateClosed : H.shearStressEstimate
  turbulenceModelClosed : H.turbulenceModel
  pulseWaveVelocityClosed : H.pulseWaveVelocity
  cardiacOutputClosed : H.cardiacOutput

theorem hemodynamics_closed_from_evidence (H : HemodynamicsPackage)
    (E : HemodynamicsEvidence H) : HemodynamicsClosed H := by
  exact And.intro E.bloodFlowModelClosed
    (And.intro E.pressureDistributionClosed
      (And.intro E.shearStressEstimateClosed
        (And.intro E.turbulenceModelClosed
          (And.intro E.pulseWaveVelocityClosed E.cardiacOutputClosed))))

end BiomedicalEngineeringArtificialOrgansCanonicalLaneLean
end HautevilleHouse
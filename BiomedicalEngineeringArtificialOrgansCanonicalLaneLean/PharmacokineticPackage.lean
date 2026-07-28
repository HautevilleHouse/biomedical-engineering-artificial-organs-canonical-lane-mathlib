import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiomedicalEngineeringArtificialOrgansCanonicalLaneLean.CompartmentModel

namespace HautevilleHouse
namespace BiomedicalEngineeringArtificialOrgansCanonicalLaneLean

structure PharmacokineticPackage (M : CompartmentModel) where
  halfLife : ℝ
  areaUnderCurve : ℝ
  peakConcentration : ℝ
  timeToPeak : ℝ
  bioavailability : ℝ

structure PharmacokineticEvidence {M : CompartmentModel}
    (PK : PharmacokineticPackage M) where
  halfLifePositive : PK.halfLife > 0
  areaUnderCurvePositive : PK.areaUnderCurve > 0
  peakConcentrationPositive : PK.peakConcentration > 0
  timeToPeakNonnegative : PK.timeToPeak ≥ 0
  bioavailabilityInRange : 0 ≤ PK.bioavailability ∧ PK.bioavailability ≤ 1

def PharmacokineticClosed {M : CompartmentModel}
    (PK : PharmacokineticPackage M) : Prop :=
  PK.halfLife > 0 ∧ PK.areaUnderCurve > 0 ∧ PK.peakConcentration > 0 ∧
  PK.timeToPeak ≥ 0 ∧ 0 ≤ PK.bioavailability ∧ PK.bioavailability ≤ 1

theorem pharmacokinetic_closed_from_evidence {M : CompartmentModel}
    (PK : PharmacokineticPackage M) (E : PharmacokineticEvidence PK) :
    PharmacokineticClosed PK := by
  exact And.intro E.halfLifePositive
    (And.intro E.areaUnderCurvePositive
      (And.intro E.peakConcentrationPositive
        (And.intro E.timeToPeakNonnegative E.bioavailabilityInRange)))

end BiomedicalEngineeringArtificialOrgansCanonicalLaneLean
end HautevilleHouse
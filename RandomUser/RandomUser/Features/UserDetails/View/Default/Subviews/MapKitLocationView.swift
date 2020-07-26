import UIKit
import SnapKit
import CoreLocation
import MapKit

final class MapKitLocationView: UIView {
  
  private func setupView() {
    backgroundColor = .cyan
  }
  
  private func setupConstraints() {
    
  }
  
  func setup(with coordiantes: CLLocationCoordinate2D?,
             street: String,
             city: String,
             state: String) {
    setupView()
    setupConstraints()
  }
}

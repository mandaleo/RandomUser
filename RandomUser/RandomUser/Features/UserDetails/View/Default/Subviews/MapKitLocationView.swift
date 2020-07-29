import UIKit
import SnapKit
import CoreLocation
import MapKit

private enum ViewLayout {
  static let spacing = CGFloat(8)
  static let secondaryFont = RFont.secondary
}

final class MapKitLocationView: UIView {
  
  private var mapView: MKMapView = {
    let view = MKMapView()
    view.showsCompass = false
    view.isRotateEnabled = false
    view.mapType = .mutedStandard
    return view
  }()
  
  private var addressLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.font = ViewLayout.secondaryFont
    return label
  }()
  
  private var mainStack: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = ViewLayout.spacing
    return stack
  }()
  
  private func setupView() {
    mainStack.addArrangedSubview(addressLabel)
    mainStack.addArrangedSubview(mapView)
    addSubview(mainStack)
  }
  
  private func setupConstraints() {
    mainStack.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  func setup(with coordiantes: CLLocationCoordinate2D?,
             street: String,
             city: String,
             state: String) {
    setupView()
    setupConstraints()
    setupAddress(with: street, city: city, state: state)
    centerMap(in: coordiantes)
  }
  
  private func setupAddress(with street: String, city: String, state: String) {
    addressLabel.text = street + ", " + city + ", " + state
  }
  
  private func centerMap(in coordinates: CLLocationCoordinate2D?) {
    guard let coordinates = coordinates else { return }
    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    let dortmunRegion = MKCoordinateRegion(center: coordinates, span: span)
    mapView.setRegion(dortmunRegion, animated: true)
    let annotation = MKPointAnnotation()
    annotation.coordinate = coordinates
    mapView.addAnnotation(annotation)
  }
}

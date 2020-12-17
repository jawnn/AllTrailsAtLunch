import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    private weak var headerView: AllTrailsHeaderView!
    private weak var mapView: GMSMapView!
    private weak var transitionViewLayoutButton: TransitionViewLayoutButton!

    var router: MapViewRouterType!

    override func loadView() {
        super.loadView()
        let headerView = AllTrailsHeaderView(frame: .zero)
        let button = TransitionViewLayoutButton(frame: .zero)

        let camera = GMSCameraPosition.camera(withLatitude: 37.788469, longitude: -122.403848, zoom: 15.0)
        let mapView = GMSMapView(frame: .zero, camera: camera)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews(headerView, mapView, button)

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            mapView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 42)
        ])  

        self.headerView = headerView
        self.mapView = mapView
        self.transitionViewLayoutButton = button
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        transitionViewLayoutButton.addTarget(self, action: #selector(didTapBottomButton), for: .touchUpInside)
    }

    @objc func didTapBottomButton() {
        dismiss(animated: false, completion: nil)
    }

}

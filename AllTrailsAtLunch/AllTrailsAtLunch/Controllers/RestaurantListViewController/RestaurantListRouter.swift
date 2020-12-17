import UIKit

protocol RestaurantListRouterType {
    func toMapViewController()
}

class RestaurantListRouter: RestaurantListRouterType {

    let viewController: RestaurantListViewController

    init(viewController: RestaurantListViewController) {
        self.viewController = viewController
    }

    func toMapViewController() {
        let destinationViewController = MapViewController()
        destinationViewController.modalPresentationStyle = .fullScreen
        viewController.present(destinationViewController, animated: false)
    }

}

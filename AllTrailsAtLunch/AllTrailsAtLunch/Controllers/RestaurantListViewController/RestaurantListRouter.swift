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
        let destinationRouter = MapViewRouter(viewController: destinationViewController)
        destinationViewController.router = destinationRouter
        destinationViewController.modalPresentationStyle = .fullScreen
        viewController.present(destinationViewController, animated: false)
    }

}

import Foundation

protocol RestaurantListModelType {
    var restaurants: [Restaurant] { get set }
    func reloadRestaurantData(completionHandler: @escaping() -> Void)
}

class RestaurantListModel: RestaurantListModelType {
    var restaurants: [Restaurant] = []
    var interactor = RestaurantInteractor()

    func reloadRestaurantData(completionHandler: @escaping() -> Void) {
        interactor.fetchNearByRestaurantsFromCurrentLocation { (restaurants, error) in
            guard let restaurants = restaurants, error == nil else {
                print("Unable to reload Restaurant Data -- ReloadRestaurantData()")
                return
            }
            self.restaurants = restaurants
            completionHandler()
        }
    }
}

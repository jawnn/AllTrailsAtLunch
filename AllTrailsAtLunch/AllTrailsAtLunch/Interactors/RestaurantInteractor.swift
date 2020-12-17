import Foundation
import GooglePlaces

protocol RestaurantInteractorType {

}

class RestaurantInteractor: RestaurantInteractorType {
    private var placesClient = GMSPlacesClient.shared()

    func fetchNearByRestaurantsFromCurrentLocation() {
        let fields: GMSPlaceField = GMSPlaceField(arrayLiteral: .name, .types)
        placesClient.findPlaceLikelihoodsFromCurrentLocation(withPlaceFields: fields, callback: {
            [weak self] (placeLikelihoods, error) in
            guard let strongSelf = self else {
                return
            }

            guard error == nil else {
                print("Current place error: \(error?.localizedDescription)")
                return
            }

            guard let places = placeLikelihoods else {
                return
            }
        })

    }
}

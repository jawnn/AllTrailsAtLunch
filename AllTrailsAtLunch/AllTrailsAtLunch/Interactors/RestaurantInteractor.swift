import Foundation
import GooglePlaces

protocol RestaurantInteractorType {
    func fetchNearByRestaurantsFromCurrentLocation(completionHandler: @escaping ([Restaurant]?, Error?) -> Void)
    func fetchRestaurantPhotos(metaData: [GMSPlacePhotoMetadata], completionHandler: @escaping (UIImage?, Error?) -> Void)
}

class RestaurantInteractor: RestaurantInteractorType {
    private var placesClient = GMSPlacesClient.shared()

    func fetchNearByRestaurantsFromCurrentLocation(completionHandler: @escaping ([Restaurant]?, Error?) -> Void) {
        let fields: GMSPlaceField = [.name, .rating, .userRatingsTotal, .priceLevel, .formattedAddress, .types, .photos]
        placesClient.findPlaceLikelihoodsFromCurrentLocation(withPlaceFields: fields, callback: {
            (placeLikelihoods, error) in
            guard error == nil else {
                print("Current place error: \(String(describing: error?.localizedDescription))")
                return
            }
            guard let places = placeLikelihoods else {
                return
            }

            var restaurants: [Restaurant] = []
            for place in places {
                let googlePlace = place.place
                let restaurant = Restaurant(name: googlePlace.name, formattedAddress: googlePlace.formattedAddress, types: googlePlace.types, rating: googlePlace.rating, userRatingsTotal: googlePlace.userRatingsTotal, priceLevel: googlePlace.priceLevel.rawValue, photos: googlePlace.photos)
                restaurants.append(restaurant)
            }
            DispatchQueue.main.async {
                completionHandler(restaurants, error)
            }

        })
    }

    func fetchRestaurantPhotos(metaData: [GMSPlacePhotoMetadata], completionHandler: @escaping (UIImage?, Error?) -> Void) {
        guard let photoMetadata = metaData.first else {
            return
        }
        placesClient.loadPlacePhoto(photoMetadata, callback: {
            (photo, error) in
            guard error == nil else {
                print("\(String(describing: error?.localizedDescription))")
                return
            }
            completionHandler(photo, error)
        })
    }
}

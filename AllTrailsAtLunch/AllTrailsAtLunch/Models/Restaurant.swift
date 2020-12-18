import GooglePlaces

enum PriceLevel: Int {
    case free
    case inexpensive
    case moderate
    case expensive
    case veryExpensive

    var dollarAmount: String {
        switch self {
        case .free:
            return ""
        case .inexpensive:
            return "$"
        case .moderate:
            return "$$"
        case .expensive:
            return "$$$"
        case .veryExpensive:
            return "$$$$"
        }
    }
}

class Restaurant {
    let name: String
    let formattedAddress: String
    let types: [String]
    let rating: Float
    let priceLevel: Int
    let userRatingsTotal: UInt
    let photos: [GMSPlacePhotoMetadata]

    init(name: String?, formattedAddress: String?, types: [String]?, rating: Float, userRatingsTotal: UInt, priceLevel: Int, photos: [GMSPlacePhotoMetadata]?) {
        self.name = name ?? "n/a"
        self.formattedAddress = formattedAddress ?? "n/a"
        self.types = types ?? []
        self.rating = rating
        self.userRatingsTotal = userRatingsTotal
        self.priceLevel = priceLevel
        self.photos = photos ?? []
    }
}

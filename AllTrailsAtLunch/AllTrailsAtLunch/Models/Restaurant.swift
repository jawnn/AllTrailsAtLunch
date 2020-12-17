class Restaurant {
    let name: String
    let types: [String]
    let rating: Float
    let userRatingsTotal: UInt

    init(name: String?, types: [String]?, rating: Float, userRatingsTotal: UInt) {
        self.name = name ?? "n/a"
        self.types = types ?? []
        self.rating = rating
        self.userRatingsTotal = userRatingsTotal
    }
}

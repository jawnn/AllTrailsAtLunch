import UIKit

protocol RestaurantListPresenterType: UITableViewDataSource {
    func presentFilterButtonAlertController() -> UIAlertController
}

protocol RestaurantListViewType {
    func reloadData()
}

class RestaurantListPresenter: NSObject, RestaurantListPresenterType {

    var model: RestaurantListModelType
    var view: RestaurantListViewType

    init(model: RestaurantListModelType, view: RestaurantListViewType) {
        self.model = model
        self.view = view
        super.init()

        self.model.reloadRestaurantData {
            [weak self] in
            guard let strongSelf = self else {
                print("self was deallocated before restaurant results were returned -- RestaurantList init")
                return
            }
            strongSelf.view.reloadData()
        }
    }

    func presentFilterButtonAlertController() -> UIAlertController {
        let alertController = UIAlertController(title: "Alert Title", message: "Alert Message", preferredStyle: .actionSheet)
        alertController.addAction(
            UIAlertAction(title: "Ratings High to Low", style: .default, handler: {
                [weak self] _ in
                self?.model.restaurants.sort(by: { $0.rating > $1.rating})
                self?.view.reloadData()
            })
        )
        alertController.addAction(
            UIAlertAction(title: "Ratings Low to High", style: .default, handler: {
                [weak self] _ in
                self?.model.restaurants.sort(by: { $0.rating < $1.rating})
                self?.view.reloadData()
            })
        )
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        return alertController
    }

}

// MARK: - RestaurantList TableViewDataSource
extension RestaurantListPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.restaurants.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantTableCell.self)) as? RestaurantTableCell else {
            return UITableViewCell()
        }
        let restaurant = model.restaurants[indexPath.row]
        cell.titleLabel.text = restaurant.name
        cell.ratingView.populateStackView(rating: restaurant.rating, ratingQuantity: restaurant.userRatingsTotal)
        let restaurantDetailText = restaurant.formattedAddress
        let priceLevel = PriceLevel(rawValue: restaurant.priceLevel) ?? .free
        cell.detailsLabel.text = priceLevel == .free ? restaurantDetailText : "\(priceLevel.dollarAmount) * \(restaurantDetailText)"
        return cell
    }
}

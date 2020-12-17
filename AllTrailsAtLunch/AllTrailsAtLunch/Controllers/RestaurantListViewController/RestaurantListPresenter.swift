import UIKit

protocol RestaurantListPresenterType: UITableViewDataSource {

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
        return cell
    }
}

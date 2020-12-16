import UIKit

protocol RestaurantListPresenterType: UITableViewDataSource {

}

protocol RestaurantListViewType {

}

class RestaurantListPresenter: NSObject, RestaurantListPresenterType {

    var view: RestaurantListViewType

    init(view: RestaurantListViewType) {
        self.view = view
    }

}

// MARK: - RestaurantList TableViewDataSource
extension RestaurantListPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 19
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantTableCell.self)) else {
            return UITableViewCell()
        }
        return cell
    }
}

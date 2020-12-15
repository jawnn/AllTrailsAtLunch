import UIKit

class RestaurantListViewController: UIViewController {

    private weak var headerView: AllTrailsHeaderView!

    override func loadView() {
        super.loadView()

        let headerView = AllTrailsHeaderView(frame: .zero)
        view.addSubview(headerView)

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])

        self.headerView = headerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

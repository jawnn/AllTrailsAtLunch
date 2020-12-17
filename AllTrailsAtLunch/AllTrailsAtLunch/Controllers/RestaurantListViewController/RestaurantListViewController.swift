import UIKit
import GooglePlaces

class RestaurantListViewController: UIViewController {

    private weak var headerView: AllTrailsHeaderView!
    private weak var tableView: UITableView!
    private weak var transitionViewLayoutButton: TransitionViewLayoutButton!

    let locationManager = CLLocationManager()
    var presenter: RestaurantListPresenterType!
    var router: RestaurantListRouterType!

    override func loadView() {
        super.loadView()

        let headerView = AllTrailsHeaderView(frame: .zero)
        view.addSubview(headerView)

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        let button = TransitionViewLayoutButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 42)
        ])

        self.headerView = headerView
        self.tableView = tableView
        self.transitionViewLayoutButton = button
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "rootBackgroundGray")
        configureRestaurantTableView()
        configureBottomButton()
        locationManager.requestWhenInUseAuthorization()
    }

    private func configureRestaurantTableView() {
        tableView.backgroundColor = UIColor(named: "rootBackgroundGray")
        tableView.separatorStyle = .none
        tableView.dataSource = presenter
        tableView.delegate = self
        tableView.register(RestaurantTableCell.self, forCellReuseIdentifier: String(describing: RestaurantTableCell.self))
    }

    private func configureBottomButton() {
        transitionViewLayoutButton.addTarget(self, action: #selector(didTapBottomButton), for: .touchUpInside)
    }

    @objc func didTapBottomButton() {
        router.toMapViewController()
    }

}

extension RestaurantListViewController: UITableViewDelegate {

}

extension RestaurantListViewController: RestaurantListViewType {
    func reloadData() {
        tableView.reloadData()
    }
}

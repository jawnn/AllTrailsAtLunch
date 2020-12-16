import UIKit

class RestaurantListViewController: UIViewController {

    private weak var headerView: AllTrailsHeaderView!
    private weak var tableView: UITableView!
    private weak var transitionViewLayoutButton: UIButton!

    override func loadView() {
        super.loadView()

        let headerView = AllTrailsHeaderView(frame: .zero)
        view.addSubview(headerView)
      
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        let button = UIButton(frame: .zero)
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

        configureRestaurantTableView()
        configureBottomButton()
    }

    private func configureRestaurantTableView() {
        tableView.backgroundColor = UIColor(named: "backgroundGray")
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.register(RestaurantTableCell.self, forCellReuseIdentifier: String(describing: RestaurantTableCell.self))
    }

    private func configureBottomButton() {
        transitionViewLayoutButton.backgroundColor = UIColor(named: "allTrailsGreen")
        transitionViewLayoutButton.layer.cornerRadius = 10
        transitionViewLayoutButton.setImage(UIImage(systemName: "mappin.and.ellipse"), for: .normal)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .semibold)]
        let buttonTitle = NSAttributedString(string: "Map", attributes: attributes)
        transitionViewLayoutButton.setAttributedTitle(buttonTitle, for: .normal)
        transitionViewLayoutButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12)
        transitionViewLayoutButton.imageView?.tintColor = .white
        transitionViewLayoutButton.setTitleColor(.white, for: .normal)
    }

}

extension RestaurantListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantTableCell.self)) as? RestaurantTableCell else {
            return UITableViewCell()
        }
        return cell
    }
}

import UIKit

class RestaurantListViewController: UIViewController {

    private weak var tableView: UITableView!
    private weak var transitionViewLayoutButton: UIButton!

    override func loadView() {
        super.loadView()

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 42)
        ])

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

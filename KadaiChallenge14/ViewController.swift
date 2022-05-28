//
//  ViewController.swift
//  KadaiChallenge14
//
//  Created by 澤田世那 on 2022/05/17.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var itemList: [CheckItem] = [
        .init(name: "りんご", isCheck: false),
        .init(name: "みかん", isCheck: true),
        .init(name: "バナナ", isCheck: false),
        .init(name: "パイナップル", isCheck: true)
    ]

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemTableViewCell.nib, forCellReuseIdentifier: ItemTableViewCell.identifier)
    }

    @IBAction func addButton(_ sender: Any) {
        let secondVC = AddItemViewController.instatiate(
            didSave: { [weak self] name in
                self?.itemList.append(name)
                self?.dismiss(animated: true)
                self?.tableView.reloadData()
            },
            didCancel: { [weak self] in
                self?.dismiss(animated: true)
            }
        )

        let nav = UINavigationController(rootViewController: secondVC)
        present(nav, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier,
                                                 for: indexPath)
        // swiftlint:disable:next force_cast
        as! ItemTableViewCell
        cell.configure(item: itemList[indexPath.row])
        return cell
    }
}

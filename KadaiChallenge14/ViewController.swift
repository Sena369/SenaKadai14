//
//  ViewController.swift
//  KadaiChallenge14
//
//  Created by 澤田世那 on 2022/05/17.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let itemList = [(name: "りんご", isCheck: false),
                             (name: "みかん", isCheck: true),
                             (name: "バナナ", isCheck: false),
                             (name: "パイナップル", isCheck: true)
                            ]

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemTableViewCell.nib, forCellReuseIdentifier: ItemTableViewCell.identifier)
    }

    @IBAction func addButton(_ sender: Any) {
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier,
                                                 for: indexPath)
        // swiftlint:disable:next force_cast
        as! ItemTableViewCell
        cell.configure(text: itemList[indexPath.row].name,
                       isCheck: itemList[indexPath.row].isCheck)
        return cell
    }
}

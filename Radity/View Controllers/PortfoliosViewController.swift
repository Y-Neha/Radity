//
//  PortfoliosViewController.swift
//  Radity
//
//  Created by Neha Yadav on 23/12/19.
//  Copyright © 2019 Neha Yadav. All rights reserved.
//

import UIKit

struct Country: Hashable {
    let name: String
    let identifier = UUID()
}

enum Section: CaseIterable {
    case main
}

class PortfoliosViewController: UIViewController {
    let tableview = ViewBuilder.tableView()
    let indentifier = "cell"
    var countries: [Country] = []
    private lazy var dataSource = makeDataSource()
    private typealias countryDataSource = UITableViewDiffableDataSource<Section, Country>
    private typealias countrySnapshot = NSDiffableDataSourceSnapshot<Section, Country>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()
        setupCountryArray()
    }
    
    func setupTableview() {
        view.addSubview(tableview)
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: indentifier)
        tableview.dataSource = dataSource
        tableview.fill(parent: view)
    }
    
    func setupCountryArray() {
        let countryNames = ["Afghanistan",
                            "Albania",
                            "Algeria",
                            "Andorra",
                            "Angola",
                            "Antigua and Barbuda",
                            "Argentina",
                            "Armenia",
                            "Australia",
                            "Austria",
                            "Azerbaijan",
                            "Bahamas",
                            "Bahrain",
                            "Bangladesh",
                            "Barbados",
                            "Belarus"]
        for name in countryNames {
            countries.append(Country(name: name))
        }
        update(with: countries)
    }
}

extension PortfoliosViewController {
    private func makeDataSource() -> countryDataSource {
        let reuseIdentifier = indentifier
        return UITableViewDiffableDataSource(tableView: tableview) { (tableview, indexpath, country) -> UITableViewCell? in
            let cell = tableview.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexpath)
            cell.textLabel?.text = country.name
            return cell
        }
    }
    
    func update(with list: [Country], animate: Bool = true) {
        var snapshot = countrySnapshot()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(list, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: animate)
    }
}

extension PortfoliosViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

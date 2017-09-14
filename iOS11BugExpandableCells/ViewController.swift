//
//  ViewController.swift
//  iOS11BugExpandableCells
//
//  Created by Leopold Roitel on 17-09-14.
//  Copyright © 2017 Leopold Roitel. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var sections: [SectionType] = [
        .section1, .section2, .section3
    ]
    
    var sectionsOpened: [SectionType: Bool] = [
        .section1: false,
        .section2: false,
        .section3: false
    ]
    
    func section1Expand() {
        self.toggleSection(section: .section1)
    }
    
    func section2Expand() {
        self.toggleSection(section: .section2)
    }
    
    func section3Expand() {
        self.toggleSection(section: .section3)
    }
    
    func toggleSection(section: SectionType) {
        self.sectionsOpened[section] = !self.sectionsOpened[section]!
        
        let sectionIndex = self.sections.index(of: section)!
        self.tableView.reloadSections([sectionIndex], with: .automatic)
        self.tableView.scrollToRow(at: IndexPath(row: 0, section: sectionIndex), at: .top, animated: true)
    }
    
    enum SectionType {
        case section1
        case section2
        case section3
    }
    
    var stringDatasource: [String] = [
        "Apple just introduced the iPhone X",
        "HELLO WORLD I LIKE POTATOES",
        "SDAKDASKKASDKSD DSKSDKDI  DASJSADJD SDASJSADJJ DSJDS DSJJSDA DSAJJSD AJDAS ADSJDAS J ADS JDSA SDJADJS JSJD JDAJDSJAD WHY DO YOU DO THAT TO ME iOS 11"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.register(headerFooterViewType: StandardHeaderView.self)
        self.tableView.register(cellType: ExpandableCell.self)
        
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.tableView.tableFooterView = UIView()
        self.title = "iOS 11 Expandable bug"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = sections[section]
        guard let headerView: StandardHeaderView = tableView.dequeueReusableHeaderFooterView() else {
            fatalError()
        }
        
        switch section {
        case .section1:
            headerView.configWith(title: "BoboSection", isOpen: sectionsOpened[section]!, selector: self.section1Expand)
        case .section2:
            headerView.configWith(title: "BoboSection", isOpen: sectionsOpened[section]!, selector: self.section2Expand)
        case .section3:
            headerView.configWith(title: "BoboSection", isOpen: sectionsOpened[section]!, selector: self.section3Expand)
        }
        
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return stringDatasource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ExpandableCell = tableView.dequeueReusableCell()
        cell.titleLabel.text = stringDatasource[indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
         let section = sections[indexPath.section]
        
        if self.sectionsOpened[section]! {
            return UITableViewAutomaticDimension
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return StandardHeaderView.HEADER_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}

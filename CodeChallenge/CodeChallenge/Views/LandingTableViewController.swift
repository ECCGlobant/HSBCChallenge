//
//  LandingTableViewController.swift
//  CodeChallenge
//
//  Created by Emmanuel Casanas Cruz on 7/8/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

public class LandingTableViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var appCollectionView: UICollectionView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var currentRole: UILabel!
    
    let viewModel = UserViewModel()
    var isEmpty = false
    override public func viewDidLoad() {
        super.viewDidLoad()
        tableView.accessibilityIdentifier = CellIdentifier.assistiveTable
        appCollectionView.accessibilityIdentifier = CellIdentifier.assistiveCollection
        appCollectionView.isAccessibilityElement = true
        viewModel.delegate = self
        viewModel.getInformation()
        
    }
    
    //Mark: - TableView
    
    override public func numberOfSections(in tableView: UITableView) -> Int {
        return  viewModel.isEmpty ? 0 : 1
    }

    // MARK: - Collection view data source

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  viewModel.isEmpty  ? 0 : 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return   viewModel.isEmpty  ? 0 : viewModel.jobs.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.value, for: indexPath) as! AppCellCollectionViewCell
        cell.isAccessibilityElement = true
        cell.accessibilityIdentifier = CellIdentifier.assistiveCell
        let job = viewModel.jobs[indexPath.row]
        cell.configure(with: job)
       
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: SegueID.nameSegue, sender: viewModel.jobs[indexPath.row])
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.selectedJob = (sender as! Job)
        }
    }
    
    override public func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        let segue = UnwindScaleSegue(identifier: unwindSegue.identifier, source: unwindSegue.source, destination: unwindSegue.destination)
        segue.perform()
    }

}

extension LandingTableViewController :viewModelDelegate {
    func didLoadInfoSucces() {
        viewModel.setupView(self)
    }
    
    func didLoadInfoFailed() {
        viewModel.showEmptyScreen(self)
    }
    
}


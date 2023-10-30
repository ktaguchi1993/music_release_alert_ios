//
//  NewReleaseViewController.swift
//  MusicRelease
//
//  Created by ktaguchi on 2023/10/20.
//

import UIKit
import RxSwift

final class NewReleaseViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: NewReleasePresenterProtocol!
    
    var model = [NewReleaseModel]()
    
    let cellReuseId = "newReleaseTableViewCell"
    let disposeBag = DisposeBag()
    
    public func inject(presenter: NewReleasePresenterProtocol) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildUI()
        setSubscribe()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func buildUI() {
        tableView.register(UINib(nibName: R.nib.newReleaseTableViewCell.name, bundle: nil), forCellReuseIdentifier: cellReuseId)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.load()
    }
}

private extension NewReleaseViewController {
    func setSubscribe() {
        presenter.viewReloadData
            .subscribe( onNext: { model in
                self.model = model
                self.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
}

extension NewReleaseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if model.isEmpty {
            return 1
        }
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if model.isEmpty {
            return NewReleaseTableViewCell()
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as? NewReleaseTableViewCell {
            let cellModel = model[indexPath.row]
            cell.setContent(model: cellModel)
            return cell
        } else {
            return NewReleaseTableViewCell()
        }
    }
}

extension NewReleaseViewController {
    static func make() -> NewReleaseViewController {
        let vc = R.storyboard.newRelease.instantiateInitialViewController()!
        
        return vc
    }
}

//
//  ViewController.swift
//  MusicRelease
//
//  Created by ktaguchi on 2023/10/19.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet private weak var newReleaseCheckButton: UIButton!
    
    let disposeBag = DisposeBag()
    
    var presenter: HomePresenterProtocol!
    
    public func inject(presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubscribe()
    }
    
    private func setSubscribe() {
        newReleaseCheckButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.presenter.showNewRelease()
            }).disposed(by: disposeBag)
    }


}


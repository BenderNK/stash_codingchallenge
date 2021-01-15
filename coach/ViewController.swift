//
//  ViewController.swift
//  coach
//
//  Created by Turker Nessa on 1/13/21.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let serialScheduler = SerialDispatchQueueScheduler(internalSerialQueueName: "com.stash.codechallenge.coach")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
        let xxx = AchievementsLocalDataManager()
        xxx.fetchAchievements()
            .subscribe(on: serialScheduler)
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: { vvv in
                print(vvv)
            }).disposed(by: disposeBag)
        */
    }
}


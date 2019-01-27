//
//  HomeViewPresenter.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 27/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import RxSwift


protocol HomeView: BaseView {
    func showShowsSuccess(shows:[Shows]);
}
class HomeViewPresenter: BasePresenter {
    private let disposeBag: DisposeBag
    private let showsRepository: ShowsRepository
    
    
    init(showsRepository: ShowsRepository) {
        self.showsRepository = showsRepository
        self.disposeBag = DisposeBag()
    }
    func getView() -> HomeView?{
        return view as? HomeView
    }    
    func loadByTitle(title:String){
        let param=ShowSearchParam(title: title);
        self.showsRepository.showSearch(params: param).subscribe(onNext: { shows in
            self.getView()?.showShowsSuccess(shows: shows.shows);
        }).disposed(by: disposeBag)
    }
}

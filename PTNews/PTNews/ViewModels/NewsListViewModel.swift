//
//  NewsListViewModel.swift
//  PTNews
//
//  Created by Luiz Durães on 05/02/2020.
//  Copyright © 2020 Luiz Durães. All rights reserved.
//

import Foundation

class NewsListViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var allNews: [NewsViewModel] = []

    let resource = Resource<[NewsViewModel]>(endpoint: APPConstants.Endpoint.allNews.rawValue) { (data) -> [NewsViewModel]? in
        do {
            let model = try JSONDecoder().decode([NewsViewModel].self, from: data)
            return model
        } catch {
            print("[ERR] NewsListViewModel >> \(error)")
            return nil
        }
    }

    func fetchAllNews() {
        isLoading = true

        HttpProvider.shared.fetch(resource: resource) { (result) in
            if let resultListViewModel = result {
                self.allNews = resultListViewModel
            }

            self.isLoading = false
        }
    }
}

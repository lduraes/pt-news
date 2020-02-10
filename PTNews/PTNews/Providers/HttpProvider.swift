//
//  HttpProvider.swift
//  PTNews
//
//  Created by Luiz Durães on 05/02/2020.
//  Copyright © 2020 Luiz Durães. All rights reserved.
//

import Foundation

struct Resource<T> {
    let endpoint: String
    let parse: (Data) -> T?
}

protocol HttpProviderProtocol {
    func fetch<T>(resource: Resource<T>, completionHandler: @escaping (T?) -> Void)
}

struct HttpProvider: HttpProviderProtocol {
    static let shared = HttpProvider()

    fileprivate init() { }

    func fetch<T>(resource: Resource<T>, completionHandler: @escaping (T?) -> Void) {
        guard let url = URL(string: "\(APPConstants.Url)\(resource.endpoint)") else {
            print("[ERR] HttpProvider >> Unable to load url")
            return
        }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let data = data, error == nil {
                DispatchQueue.main.async {
                    completionHandler(resource.parse(data))
                }
            } else {
                print("[ERR] HttpProvider >> \(String(describing: error))")
                completionHandler(nil)
            }
        }.resume()
    }
}

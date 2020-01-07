//
//  JSONDecoder+Extension.swift
//  Radity
//
//  Created by Neha Yadav on 07/01/20.
//  Copyright © 2020 Neha Yadav. All rights reserved.
//

import Foundation


extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, fromUrl url: String, completionHandler: @escaping (T) -> Void) {
        
        guard let url = URL(string: url)  else {
            fatalError("Invalid URL")
        }
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                let downloadedData = try self.decode(type, from: data)
                DispatchQueue.main.async {
                    completionHandler(downloadedData)
                }
            } catch let err {
                print(err.localizedDescription)
            }
        }
    }
}

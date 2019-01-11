//
//  retrievedData.swift
//  task
//
//  Created by Mostafa Diaa on 1/10/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import Foundation

struct store: Decodable {
    let name: String
    let id :String
    let image:String
    let backImage: String
    let points: Int
}

struct gifts: Decodable {
    let name, store: String
    let points: Int
}

struct responseData: Decodable {
    let stores: [store]
    let gifts: [gifts]
}

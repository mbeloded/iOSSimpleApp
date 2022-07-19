//
//  MainCell.swift
//  TestApp
//
//  Created by Michael Beloded on 14.07.2022.
//

import Foundation

struct MainCell: Codable {
    let name: NameObj
    let picture: PictureObj
    let location: LocationObj
}

//"name":{"title":"Miss","first":"Lya","last":"Faure"}
struct NameObj: Codable {
    let title: String
}

//{"street":{"number":9543,"name":"Rue Desaix"},"city":"Champigny-sur-Marne","state":"Aude","country":"France","postcode":18767,"coordinates":{"latitude":"83.5839","longitude":"83.1377"},"timezone":{"offset":"+7:00","description":"Bangkok, Hanoi, Jakarta"}}
struct LocationObj: Codable {
    let city: String
    let state: String
    let country: String
}

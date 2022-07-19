//
//  MainItem.swift
//  TestApp
//
//  Created by Michael Beloded on 19.07.2022.
//

import Foundation

/*
 results":[
       {
          "gender":"male",
          "name":{
             "title":"Mr",
             "first":"Miloduh",
             "last":"Kuzmovich"
          },
          "location":{
             "street":{
                "number":1309,
                "name":"Generala Shapovala"
             },
             "city":"Burin",
             "state":"Kiyivska",
             "country":"Ukraine",
             "postcode":85262,
             "coordinates":{
                "latitude":"74.1307",
                "longitude":"-69.1247"
             },
             "timezone":{
                "offset":"+10:00",
                "description":"Eastern Australia, Guam, Vladivostok"
             }
          },
          "email":"miloduh.kuzmovich@example.com",
          "login":{
             "uuid":"97f2f26d-1bc2-48fd-90af-e8c047a71c32",
             "username":"purplezebra928",
             "password":"44444444",
             "salt":"eSWkI0Zv",
             "md5":"e9aaf6dbf9204baf16eff61a27267810",
             "sha1":"a038c9174be821dc0bf72914e23c07c6ed313fdf",
             "sha256":"ac3a39742e7ff691209f440e3851e3993cc8d2888cca4d57327831ef723fc6e9"
          },
          "dob":{
             "date":"1976-02-07T02:33:41.569Z",
             "age":46
          },
          "registered":{
             "date":"2017-07-14T18:19:05.950Z",
             "age":5
          },
          "phone":"(068) L64-0821",
          "cell":"(097) Q42-1819",
          "id":{
             "name":"",
             "value":null
          },
          "picture":{
             "large":"https://randomuser.me/api/portraits/men/1.jpg",
             "medium":"https://randomuser.me/api/portraits/med/men/1.jpg",
             "thumbnail":"https://randomuser.me/api/portraits/thumb/men/1.jpg"
          },
          "nat":"UA"
       }
 */

struct MainItems: Codable {
    let results: [MainItem]
}

struct MainItem: Codable {
    
    let name: NameObj
    let picture: PictureObj
    let location: LocationObj
}

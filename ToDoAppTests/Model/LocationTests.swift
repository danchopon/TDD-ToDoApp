//
//  LocationTests.swift
//  ToDoAppTests
//
//  Created by Daniyar Erkinov on 8/27/19.
//  Copyright © 2019 danchopon.com. All rights reserved.
//

import XCTest
import CoreLocation
@testable import ToDoApp

class LocationTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testInitSetsName() {
        let location = Location(name: "Foo")
        
        XCTAssertEqual(location.name, "Foo")
    }
    
    func testInitSetCoordinates() {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        
        let location = Location(name: "Foo", coordinate: coordinate)
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
    }
    
    func testCanBeCreatedFromPlistDictionary() {
        let coordinate = CLLocationCoordinate2D(latitude: 10.0, longitude: 10.0)
        let location = Location(name: "Foo", coordinate: coordinate)
        
        let dict: [String: Any] = ["name": "Foo",
                                   "latitude": 10.0,
                                   "longitude": 10.0]
        
        let createdLocation = Location(dict: dict)
        
        XCTAssertEqual(location, createdLocation)
    }
    
    func testCanBeSericalizedIntoDictionary() {
        let coordinate = CLLocationCoordinate2D(latitude: 10.0, longitude: 10.0)
        let location = Location(name: "Foo", coordinate: coordinate)
        
        let generatedLocation = Location(dict: location.dict)
        
        XCTAssertEqual(location, generatedLocation)
    }
    
}

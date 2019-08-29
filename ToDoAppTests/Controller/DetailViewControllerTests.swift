//
//  DetailViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Daniyar Erkinov on 8/28/19.
//  Copyright © 2019 danchopon.com. All rights reserved.
//

import XCTest
@testable import ToDoApp
import CoreLocation

class DetailViewControllerTests: XCTestCase {
    
    var sut: DetailViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as? DetailViewController
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        
    }
    
    func testHasTitleLabel() {
        XCTAssertNotNil(sut.titleLabel)
        XCTAssertTrue(sut.titleLabel.isDescendant(of: sut.view))
    }
    
    func testHasDescriptionLabel() {
        XCTAssertNotNil(sut.descriptionLabel)
        XCTAssertTrue(sut.descriptionLabel.isDescendant(of: sut.view))
    }
    
    func testHasDateLabel() {
        XCTAssertNotNil(sut.dateLabel)
        XCTAssertTrue(sut.dateLabel.isDescendant(of: sut.view))
    }
    
    func testHasMapView() {
        XCTAssertNotNil(sut.mapView)
        XCTAssertTrue(sut.mapView.isDescendant(of: sut.view))
    }
    
    func testHasLocationLabel() {
        XCTAssertNotNil(sut.locationLabel)
        XCTAssertTrue(sut.locationLabel.isDescendant(of: sut.view))
    }
    
    private func setupTaskAndAppearenceTransition() {
        let coordinate = CLLocationCoordinate2D(latitude: 42.84992229, longitude: 74.59026664)
        let location = Location(name: "Baz", coordinate: coordinate)
        let date = Date(timeIntervalSince1970: 1546300800)
        let task = Task(title: "Foo", description: "Bar", date: date, location: location)
        sut.task = task
        
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
    }
    
    func testSettingTaskSetsTitleLabel() {
        setupTaskAndAppearenceTransition()
        XCTAssertEqual(sut.titleLabel.text, "Foo")
    }
    
    func testSettingTaskSetsDescriptionLabel() {
        setupTaskAndAppearenceTransition()
        XCTAssertEqual(sut.descriptionLabel.text, "Bar")
    }
    
    func testSettingTaskSetsLocationLabel() {
        setupTaskAndAppearenceTransition()
        XCTAssertEqual(sut.locationLabel.text, "Baz")
    }
    
    func testSettingTaskSetsDateLabel() {
        setupTaskAndAppearenceTransition()
        XCTAssertEqual(sut.dateLabel.text, "01.01.19")
    }
    
    func testSettingTaskSetsMapView() {
        setupTaskAndAppearenceTransition()
        XCTAssertEqual(sut.mapView.centerCoordinate.latitude, 42.84992229, accuracy: 0.001)
        XCTAssertEqual(sut.mapView.centerCoordinate.longitude, 74.59026664, accuracy: 0.001)
    }

}

//
//  HomeVCTests.swift
//  AppESTests
//
//  Created by Fernando Moreira on 04/12/23.
//

import XCTest
@testable import AppES

class HomeVCE2ETests: XCTestCase {
    
    var homeVC: HomeVC!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        homeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        homeVC.loadViewIfNeeded()
    }
    
    override func tearDown() {
        homeVC = nil
        super.tearDown()
    }
    
    func testOnTapStartButton() {
        // Given
        let btn = homeVC.startButton ?? UIButton()
        
        // When
        homeVC.onTapStartButton(btn)
        
        // Then
        XCTAssertNotNil(homeVC.startButton, "Start button should not be nil")
        XCTAssertNotNil(homeVC.navigationController?.topViewController is QuizVC, "Navigation should push QuizVC")
    }
    
    func testViewWillAppear() {
        // Given
        let userDefaults = UserDefaults.standard
        let originalValue = userDefaults.integer(forKey: "maiorPontuacao")
        userDefaults.set(1000000, forKey: "maiorPontuacao")
        
        // When
        homeVC.viewWillAppear(false)
        
        // Then
        XCTAssertEqual(homeVC.maiorPontuacaoLabel.text, "R$ 1.000.000,00", "Label should display formatted currency")
        XCTAssertEqual(homeVC.maiorPontuacaoLabel.textColor, .systemYellow, "Label text color should be systemYellow")
        userDefaults.set(originalValue, forKey: "maiorPontuacao")
    }
    
}


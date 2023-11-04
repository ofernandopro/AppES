//
//  HomeVCTests.swift
//  AppESTests
//
//  Created by Fernando Moreira on 03/11/23.
//

import XCTest
@testable import AppES

class HomeVCTests: XCTestCase {
    var homeVC: HomeVC!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        homeVC.loadViewIfNeeded()
    }

    override func tearDown() {
        homeVC = nil
        super.tearDown()
    }
    
    func testGetMaiorPontuacaoForPositiveValue() {
        // Given
        let maiorPontuacaoSalva: Int = 50000
        
        // When
        let result = homeVC.getMaiorPontuacao(maiorPontuacaoSalva: maiorPontuacaoSalva)
        
        // Then
        XCTAssertEqual(result, "R$ 50.000,00")
    }
    
    func testGetMaiorPontuacaoForZero() {
        // Given
        let maiorPontuacaoSalva: Int = 0
        
        // When
        let result = homeVC.getMaiorPontuacao(maiorPontuacaoSalva: maiorPontuacaoSalva)
        
        // Then
        XCTAssertEqual(result, "R$ 0,00")
    }
    
    func testGetMaiorPontuacaoForNegativeValue() {
        // Given
        let maiorPontuacaoSalva: Int = -500
        
        // When
        let result = homeVC.getMaiorPontuacao(maiorPontuacaoSalva: maiorPontuacaoSalva)
        
        // Then
        XCTAssertEqual(result, "R$ 0,00")
    }
    
}

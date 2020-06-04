//
//  PrestoQ_AssignmentTests.swift
//  PrestoQ_AssignmentTests
//
//  Created by Arun Kumar on 6/2/20.
//  Copyright © 2020 Arun Kumar. All rights reserved.
//

import XCTest
@testable import PrestoQ_Assignment

class PrestoQ_AssignmentTests: XCTestCase {
    private var viewModel: ManagerSpecialsViewModel!
    private enum SetupErrors: Error {
        case urlNotFound, dataCastingFailure, decodeFailure
    }

    override func setUpWithError() throws {
        let decoder = JSONDecoder()
        let testBundle = Bundle(for: type(of: self))
        guard let url = testBundle.url(forResource: "response", withExtension: "json") else { throw SetupErrors.urlNotFound }
        guard let data = try? Data(contentsOf: url) else { throw SetupErrors.dataCastingFailure }
        guard let products = try? decoder.decode(Products.self, from: data) else { throw SetupErrors.decodeFailure }
        viewModel = ManagerSpecialsViewModel(with: products)
    }
    
    func testViewModel() {
        XCTAssert(viewModel != nil)
    }
    
    func testRowViewModelCount() {
        XCTAssert(viewModel.rowViewModel.count > 0)
    }

    func testManagerSpecialCount() {
        for row in viewModel.rowViewModel {
            XCTAssert(row.managerSpecials.count > 0)
        }
    }
    
    func testManagerSpecialData() {
        for row in viewModel.rowViewModel {
            for special in row.managerSpecials {
                XCTAssert(!special.imageUrl.isEmpty)
                XCTAssert(!special.displayName.isEmpty)
                XCTAssert(!special.originalPrice.isEmpty)
                XCTAssert(!special.price.isEmpty)
            }
        }
    }
}

//
//  BoxOfficeTests.swift
//  BoxOfficeTests
//
//  Created by 권태호 on 14/02/2024.
//

import XCTest
@testable import BoxOffice

final class BoxOfficeTests: XCTestCase {
    
    var sut: LoadData!

    override func setUpWithError() throws {
        sut = LoadData()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_제이슨파일에서_데이터_가져오기_성공() {
        //given
        let testBundle = Bundle(for: type(of: self))
        
        //when
        let movie = sut.loadData(from: testBundle)
        
        //then
        let expectedCount: Int = 10
        XCTAssertNotNil(movie, "Movie 객체가 정상적으로 로드되지 않았습니다.")
        XCTAssertEqual(movie?.boxOfficeResult.dailyBoxOfficeList.count, expectedCount)
    }
}

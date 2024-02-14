////
////  BoxOfficeTest.swift
////  BoxOfficeTest
////
////  Created by yujaehong on 2/13/24.
////
//
//import XCTest
//@testable import BoxOffice
//
//final class BoxOfficeParsingTest: XCTestCase {
//    
//    var sut: Data!
//    
//    override func setUpWithError() throws {
//        let fileLocation = Bundle.main.url(forResource: "BoxOfficeSample", withExtension: "json")!
//        XCTAssertNoThrow(
//            sut = try Data(contentsOf: fileLocation)
//        )
//    }
//    
//    override func tearDownWithError() throws {
//        sut = nil
//    }
//    
////    func testExample() throws {
////    }
////    
////    func testPerformanceExample() throws {
////        // This is an example of a performance test case.
////        measure {
////            // Put the code you want to measure the time of here.
////        }
////    }
//    
////    func test_JSONParsing() {
////        let bundle = Bundle(for: type(of: self))
////        guard let url = bundle.url(forResource: "BoxOfficeSample", withExtension: "json"),
////              let jsonData = try? Data(contentsOf: url) else {
////            XCTFail("JSON데이터를 읽을 수 없습니다.")
////            return
////        }
////        
////        let decoder = JSONDecoder()
////        do {
////            let boxOfficeModel = try decoder.decode(BoxOfficeModel.self, from: jsonData)
////            
////            XCTAssertNotNil(boxOfficeModel)
////            XCTAssertNotNil(boxOfficeModel.boxOfficeResult)
////            XCTAssertGreaterThan(boxOfficeModel.boxOfficeResult.dailyBoxOfficeList.count, 0)
////            
////        } catch {
////            XCTFail("JSON데이터 decode실패: \(error)")
////        }
////    }
//    
////    func test_dddd() throws {
////        // given
////        let data: Data = sut
////        
////        // when
////        let decodedData = try JSONDecoder().decode(BoxOfficeModel.self, from: data)
////        let boxOfficeList = decodedData.boxOfficeResult.dailyBoxOfficeList
////        
////        // then
////        XCTAssertFalse(boxOfficeList.isEmpty)
////    }
//    
//    
//}

import Foundation


struct MovieInfoResponse: Codable {
    private let movieInfoResult: MovieInfoResult
}

struct MovieInfoResult: Codable {
    private let movieInfo: MovieInfo
}

struct MovieInfo: Codable {
    private let movieCode, movieName, movieNameEnglish, movieNmOg: String
    private let showTm, prdtYear, openDt, prdtStatNm: String
    private let typeName: String
    private let nations: [Nation]
    private let genres: [Genre]
    private let directors: [Director]
    private let actors: [Actor]
    private let showTypes: [ShowType]
    private let companys: [Company]
    private let audits: [Audit]
    private let staffs: [Staff]

    private enum CodingKeys: String, CodingKey {
        case movieCode = "movieCd"
        case movieName = "movieNm"
        case movieNameEnglish = "movieNmEn"
        case typeName = "typeNm"
        case movieNmOg, showTm, prdtYear, openDt, prdtStatNm, nations, genres, directors, actors, showTypes, companys, audits, staffs
    }
}

// MARK: - Actor
struct Actor: Codable {
    private let peopleName, peopleNameEnglish, cast, castEnglish: String
    
    private enum CodingKeys: String, CodingKey {
        case peopleName = "peopleNm"
        case peopleNameEnglish = "peopleNmEn"
        case castEnglish = "caseEN"
        case cast
    }
}

// MARK: - Audit
struct Audit: Codable {
    let auditNo, watchGradeNm: String
}

// MARK: - Company
struct Company: Codable {
    let companyCode, companyName, companyNameEnglish, companyPartName: String

    enum CodingKeys: String, CodingKey {
        case companyCode = "companyCd"
        case companyName = "companyNm"
        case companyNameEnglish = "companyNmEn"
        case companyPartName = "companyPartNm"
        
    }
}

// MARK: - Director
struct Director: Codable {
    let peopleName, personNameEnglish: String
    
    enum CodingKeys: String, CodingKey {
        case peopleName = "peopleNm"
        case personNameEnglish = "peopleNmEn"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let genreName: String
    
    enum CodingKeys: String, CodingKey {
        case genreName = "genreNm"
    }
}

// MARK: - Nation
struct Nation: Codable {
    let nationName: String
    
    enum CodingKeys: String, CodingKey {
        case nationName = "nationNm"
    }
}

// MARK: - ShowType
struct ShowType: Codable {
    let showTypeGroupName, showTypeName: String
    enum CodingKeys: String, CodingKey {
        case showTypeGroupName = "showTypeGroupNm"
        case showTypeName = "showTypeNm"
    }
}

// MARK: - Staff
struct Staff: Codable {
    let peopleName, peopleNameEnglish, staffRoleName: String
    
    enum CodingKeys: String, CodingKey {
        case peopleName = "peopleNm"
        case peopleNameEnglish = "peopleNmEn"
        case staffRoleName = "staffRoleNm"
    }
}

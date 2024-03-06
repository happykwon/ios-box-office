//
//  NavigationControllerViewController.swift
//  BoxOffice
//
//  Created by 권태호 on 06/03/2024.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = configureTitle() // 여기서 날짜 기반 타이틀 설정
    }

    func configureTitle() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd" // 월을 올바르게 표시하기 위해 MM 사용
        return formatter.string(from: Date())
    }
}

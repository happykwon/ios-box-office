import Foundation

//extension Date {
//    static var yesterday: Date {
//       let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()
//       return yesterday
//   }
//    
//}

extension Date {
    static var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()
    }
    
    static var todayStringFormatter: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: Date())
    }
    
    static func formattedString(for date: Date, withFormat format: String = "yyyyMMdd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}

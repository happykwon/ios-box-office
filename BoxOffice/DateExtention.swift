import Foundation

extension Date {
    static var yesterday: Date {
       let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()
       return yesterday
   }
    
}

//
//  Date+Ext.swift
//  Recipe Management
//
//  Created by Haider Muhammed on 27/12/2023.
//

import Foundation

extension Date {
    
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    // Checking the date is today
    var isTody: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    func fetchWeek(_ date: Date = .init()) -> [WeekDay] {
        let calendar = Calendar.current
        let startOfDate = calendar.startOfDay(for: date)
        
        var week = [WeekDay]()
        let weekForDate = calendar.dateInterval(of: .weekOfMonth, for: startOfDate)
        guard let startOfeek = weekForDate?.start else {
            return []
        }
        
        // Get full week
        (0..<7).forEach { index in
            if let weekDay = calendar.date(byAdding: .day, value: index, to: startOfeek) {
                week.append(.init(date: weekDay))
            }
        }
        
        return week
    }
}

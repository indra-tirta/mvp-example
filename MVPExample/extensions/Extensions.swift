//
//  Extensions.swift
//  MVPExample
//
//  Created by Indra Tirta Nugraha on 20/09/20.
//  Copyright © 2020 Indra Tirta Nugraha. All rights reserved.
//

import Foundation

extension Int {
    var dateFormat: Date {
        let timeStamp = Double(self)
        
        return Date(timeIntervalSince1970: timeStamp)
    }
}

extension Date {
    
    init(dateString: String) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        self = dateFormatter.date(from: dateString) ?? Date()
    }
    
    init(dateTimeString: String) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        self = dateFormatter.date(from: dateTimeString) ?? Date()
    }
    
    var timeStamp: Int {
        return Int(self.timeIntervalSince1970)
    }
    
    var dayCount: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: self)
    }
    
    var monthAndYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM y"
        return dateFormatter.string(from: self)
    }
    
    var customFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM y"
        return dateFormatter.string(from: self)
    }
    
    var dbFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-dd"
        
        return dateFormatter.string(from: self)
    }
    
    var dateTimeFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-dd HH:mm:ss"
        
        return dateFormatter.string(from: self)
    }
    
    var detailFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        
        return dateFormatter.string(from: self)
    }
    
    var dayOfWeek: Int {
        let weekday = Calendar.current.component(.weekday, from: self)
        return weekday
    }
    
    var startOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 0, to: sunday)
    }
    
    var endOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 6, to: sunday)
    }
    
    func isInSameMonth(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .month)
    }
    
    func isInSameYear(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .year)
    }
    
    func isInSameDay(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .day)
    }
}

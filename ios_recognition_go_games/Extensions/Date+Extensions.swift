//
//  Date+Extension.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 04.03.2023.
//

import Foundation

extension Date {
    func convertDateToString() -> String{

        let year = String(describing: self).components(separatedBy: " ")[0].components(separatedBy: "-")[0]
        var month = String(describing: self).components(separatedBy: " ")[0].components(separatedBy: "-")[1]
        let day = String(describing: self).components(separatedBy: " ")[0].components(separatedBy: "-")[2]

        switch month {
        case "01":
            month = "Jan"
        case "02":
            month = "Feb"
        case "03":
            month = "Mar"
        case "04":
            month = "Apr"
        case "05":
            month = "May"
        case "06":
            month = "Jun"
        case "07":
            month = "Jul"
        case "08":
            month = "Aug"
        case "09":
            month = "Sep"
        case "10":
            month = "Oct"
        case "11":
            month = "Nov"
        case "12":
            month = "Dec"
        default:
            month = "Jan"
        }
        
        return day + " " + month + " " + year
    }
}

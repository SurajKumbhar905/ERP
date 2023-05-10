//
//  DummyData.swift
//  ERP
//
//  Created by Suraj on 19/03/23.
//

import Foundation
import UIKit


class DummyData{
    
    static var Instance = DummyData()
    
     let cardMainTitle : [String] = ["Project" , "Clients" , "Monthly Revenue" , "Employee"]
     let cardValue : [String] = ["112" , "44" , "$1,20,000" , "250"]
    
     let newAddValue : [String] = ["+3" , "+2" , "+$10" ,"+5"]
    
    let projectName : [String] = ["Self-Scan" , "AMS" , "EMS" , "Reatail" , "Hatch" , "Image Prosessing" , "Headless" , "AR-VR" , "Gluv"]
    let busenessUnit : [String] = ["Art" , "Retail" , "Technology" , "Telecom" ,"TechEd" ]
    let businessHead : [String] = ["Suraj Kumbhar" , "Sanket Prabu" , "Aniket Bane" , "Amit kavatkar"]
    let employeeData : [String] = ["Suraj Kumbhar" , "Sanket Prabu" , "Aniket Bane" , "Amit kavatkar" , "Sanket Dhuri" , "Prathamesh Bhuravane" , "Vaishnavi Achrekar" ,"Purva Pawar"]
    let status : [String] = ["Billable" , "Non-Billable"]
    
    let months : [String] = ["January" , "February" , "March" , "April" , "May" , "June" , "Augest" ,"Septembar" ,"Octobar" , "Novembar" ,"Decembar"]
    
    let teamSize : [String] = ["1" , "2" , "3" , "4" ,"5" , "6" , "7" , "8" , "9" , "10"]
    
    let currency : [String] = ["EUR €" , "USD $" ,"INR ₹"]
    
    func cardCount() ->Int{
        return cardMainTitle.count
    }
    
    func busenessUnitCount () -> Int{
        return busenessUnit.count
    }
    
    func businessHeadCount() -> Int {
        return businessHead.count
    }
    
    func statusCount() -> Int{
        return status.count
    }
    
    func monthCount() -> Int{
        return months.count
    }
    
    func teamSizeCount() -> Int {
        return teamSize.count
    }
    
    func currencyCount() -> Int {
        return currency.count
    }
}


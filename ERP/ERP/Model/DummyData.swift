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
    
    
    func cardCount() ->Int{
        return cardMainTitle.count
    }
}


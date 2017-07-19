//
//  TargetViewController.swift
//  AlphaMe_1.0
//
//  Created by Kevin W on 7/18/17.
//  Copyright © 2017 Kevin W. All rights reserved.
//

import Foundation
import UIKit
class TargetViewController:UIViewController{
    var total=0
    
    @IBAction func backPressed(_ sender: Any) {
        retrieve()
        UserDefaults.standard.synchronize()
    }
    
    
    
    
    @IBOutlet weak var totalLabel: UILabel!
    
    
    
    @IBAction func blackPressed(_ sender: Any) {
        
        total=total+1
        totalLabel.text="\(total)"
        
    }
    
    
    
    @IBAction func nosePressed(_ sender: Any) {
        
        total=total+2
        
        totalLabel.text="\(total)"
    }
    
    
    
    
    func retrieve(){    // func to retrieve data from the targetViewController and using that data to modify permanent vairables
        dismiss(animated: true, completion: nil)
        let totalDivided = (total/100)*100
        total = total-(totalDivided)
        
        var numTotal = UserDefaults.standard.object(forKey: "numTotal") as! Int
        numTotal =  numTotal+total
        var evolveNumTotal = numTotal
        numTotal = numTotal-((numTotal/100)*100)
        
        
        let currentEvolve = (evolveNumTotal)/100
        var evolve = UserDefaults.standard.object(forKey: "evolveTotal") as! Int
        evolve=evolve+currentEvolve
        if(evolve>=9){
            evolve=0
        }
        
        
        
        var progressBarTotal = UserDefaults.standard.object(forKey: "progressBarTotal") as! Float
        let progressBarFloat = Float(numTotal)
        let progressBar = progressBarFloat/100
        progressBarTotal =  progressBarTotal+progressBar
        
        
        
        
        
        
        UserDefaults.standard.set(evolve, forKey: "evolveTotal")
        UserDefaults.standard.set(progressBar, forKey: "progressBarTotal")
        UserDefaults.standard.set(numTotal, forKey: "numTotal")
        
        
    }
    
    
}

//
//  scoreviewcontroller.swift
//  asterisk
//
//  Created by t450sMAC on 2019/5/12.
//  Copyright © 2019 t450sMAC. All rights reserved.
//

import UIKit

class scoreviewcontroller: UIViewController {
    

    
    var fuckuapple:String?
    var hanashi=["恭喜你！你趕快辭職去搖飲料吧！飲料店需要你","還可以啦","爛"]
    @IBOutlet var judgelabel: UILabel!
    @IBOutlet var scorelabel: UILabel!
    override func viewDidLoad() {
            
            super.viewDidLoad()
        if let fuckuapple=fuckuapple{
            scorelabel.text=fuckuapple
        }
        if let ff=fuckuapple,let judge=Int(ff){
            if judge>=8{
                judgelabel.text=hanashi[0]
            }
            else if judge<8 && judge>=4{
                judgelabel.text=hanashi[1]
            }
            else{
                judgelabel.text=hanashi[2]
            }
        }
        let wow=UserDefaults.standard.string(forKey: "highscore")
        if wow==nil{
            UserDefaults.standard.set(fuckuapple,forKey: "highscore")
        }
        else{
            if let wow0=wow, let wowint=Int(wow0), let fuckuapple0=fuckuapple, let hs=Int(fuckuapple0){
                if wowint<hs{
                    UserDefaults.standard.set(fuckuapple,forKey: "highscore")
                }
            }
        }
        
        }
    
            
    
        
}

        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


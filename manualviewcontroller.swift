//
//  manualviewcontroller.swift
//  asterisk
//
//  Created by t450sMAC on 2019/5/13.
//  Copyright © 2019 t450sMAC. All rights reserved.
//

import UIKit

class manualviewcontroller: UIViewController {

    @IBOutlet var manuallabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let path="manual.txt"
        let data=try? NSString(contentsOfFile: path, encoding:String.Encoding.utf8.rawValue )
        if let data=data{
            manuallabel.text=data as String
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  gameviewcontrollerViewController.swift
//  asterisk
//
//  Created by t450sMAC on 2019/5/10.
//  Copyright © 2019 t450sMAC. All rights reserved.
//

import UIKit

class gameviewcontrollerViewController: UIViewController {
    
    
    @IBOutlet var tapi: UIImageView!
    @IBOutlet var drinklabel: UILabel!
    @IBOutlet var drink: UIImageView!
    @IBOutlet var wow: UILabel!
    @IBOutlet var profit: UILabel!
    @IBOutlet var timelabel: UILabel!
    @IBOutlet var plusanimation: UILabel!
    @IBOutlet var drinkbutton: UIButton!
    @IBOutlet var bubbutton: UIButton!
    @IBOutlet var enterbutton: UIButton!
    @IBOutlet var judgementbutton: UIButton!
    
    class Drinkclass{
        let drink_array: Array<String>
        let tapioka_array:Array<String>
        var score:Int=0
        var nowdrink:String
        var havebub:String=""
        init(nowdrink:String) {
            self.drink_array=["可可亞","紅茶","奶茶","牛奶"]
            self.tapioka_array=["","珍珠"]
            self.nowdrink=nowdrink
        }
    }
    var angryDrinkclass=Drinkclass(nowdrink: "")
    var timer:Timer?
    var sec:Int=20
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let r1=Int.random(in: 0...3)
        let r2=Int.random(in: 0...1)
        drinklabel.text=angryDrinkclass.tapioka_array[r2] + angryDrinkclass.drink_array[r1]
        timelabel.text=String(sec)
        timer=Timer.scheduledTimer(withTimeInterval: 1, repeats: true){(_)in
            self.sec-=1
            self.timelabel.text=String(self.sec)
            if self.sec<=0{
                self.timer?.invalidate()
  
            
                let alert=UIAlertController(title: "時間到！",message:"玩得不錯", preferredStyle:.alert)
                let action=UIAlertAction(title: "OK", style: .default, handler: { action in
                })
            alert.addAction(action)
            self.present(alert,animated:true, completion:nil)
            self.drinkbutton.isEnabled=false
            self.bubbutton.isEnabled=false
            self.enterbutton.isEnabled=false
            self.judgementbutton.isHidden=false
                
            }
        }
        
        // Do any additional setup after loading the view.
    }
   

    @IBAction func wd(_ sender: Any) {
        let controller=UIAlertController(title:
            "選一種飲料", message: "快選", preferredStyle:
            .actionSheet)
        
        for name in angryDrinkclass.drink_array {
            let action = UIAlertAction(title: name, style: .default, handler:{(UIAlertAction) in self.changelabel(_name: name) } )
                print(action.title)
            
            controller.addAction(action)
        }
        
        let cancelaction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        controller.addAction(cancelaction)
        
        present(controller,animated: true,completion: nil)
    }
    
    @IBAction func bub(_ sender: Any) {
        let controller=UIAlertController(title:
            "要珍珠嗎？", message: "快選", preferredStyle:
            .actionSheet)
        let names=["要","不要"]
        for name in names{
            let action = UIAlertAction(title: name, style: .default, handler:{(UIAlertAction) in self.tapiornot(_name: name) } )
                print(action.title)
            
            controller.addAction(action)
        }
        let cancelaction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        controller.addAction(cancelaction)
        
        present(controller,animated: true,completion: nil)
    }
    @IBAction func send(_ sender: Any) {
        if wow.text==drinklabel.text{
            angryDrinkclass.score+=1
            plusanimation.text="+1"
        }
        else{
            angryDrinkclass.score-=1
            plusanimation.text="-1"
        }
        profit.text=String(angryDrinkclass.score)
        let r1=Int.random(in: 0...3)
        let r2=Int.random(in: 0...1)
        drinklabel.text=angryDrinkclass.tapioka_array[r2] + angryDrinkclass.drink_array[r1]
        drink.image=UIImage(named: "cup")
        tapi.isHidden=true
        wow.text=""
        angryDrinkclass.havebub=""
        angryDrinkclass.nowdrink=""
        
        plusanimation.alpha=1
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.8, delay: 0, animations: {
            self.plusanimation.alpha=0
            if self.plusanimation.text=="-1"{self.plusanimation.textColor=UIColor.red}
            else{
                self.plusanimation.textColor=UIColor.blue
            }
        })
        
    }
    
    @IBAction func scorepagebutton(_ sender: Any) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "scoreview"){
            present(controller,animated: true,completion: nil)
        }
    }
    func changelabel(_name:String ){
        let _drinkname=String(_name)
        angryDrinkclass.nowdrink=_drinkname
        wow.text=angryDrinkclass.havebub+angryDrinkclass.nowdrink

        
        drink.image=UIImage(named: _drinkname)
    }
   
    func tapiornot(_name:String){
        let _tapi=String(_name)
        if _tapi=="要"  {
            tapi.isHidden=false
            angryDrinkclass.havebub="珍珠"
        
        }
        else{
            tapi.isHidden=true
            angryDrinkclass.havebub=""
        }
        wow.text=angryDrinkclass.havebub+angryDrinkclass.nowdrink
       
        
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        let controller=segue.destination as? scoreviewcontroller
        var _role=[String(angryDrinkclass.score)]
        controller?.fuckuapple=_role[0]
        
    }
}

//
//  ViewController.swift
//  Calculator
//
//  Created by Нуридин Сафаралиев on 8/11/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var buttons: [UIButton]!
    
    
    @IBOutlet weak var result: UILabel!
    var numberFromScreen: Double = 0
    var firstNum: Double = 0
    var mathSign: Bool = false
    var operation: Int = 0
    
    @IBAction func digets(_ sender: UIButton) {
        if mathSign == true{
            
            result.text = String(sender.tag)
            mathSign = false
            
        } else {
            if result.text == "0"{
                result.text?.removeFirst()
                result.text! += String(sender.tag)
            } else {
                result.text! += String(sender.tag)

            }
              
        }
        
        numberFromScreen = Double(result.text!)!
    }
    
    
    @IBAction func Buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10   && sender.tag != 15 {
            if result.text != "X" && result.text != "-" && result.text != "+" && result.text != "/" && result.text != "=" {
                firstNum = Double(result.text!)!
            }

            if sender.tag == 11 {
                result.text = "/"
            }
            else if sender.tag == 12 {
                result.text = "X"
            }
            else if sender.tag == 13 {
                result.text = "-"
            }
            else if sender.tag == 14 {
                result.text = "+"
            }
            
            operation = sender.tag
            mathSign = true
            
        }
        else if sender.tag == 15 {
            if operation == 11 {
                if (firstNum / numberFromScreen) - Double(Int(firstNum / numberFromScreen)) == 0 {
                result.text = String(Int(firstNum / numberFromScreen ))
                } else {
                    result.text = String(firstNum / numberFromScreen )
                }
            }
            else if operation == 12 {
                if (firstNum * numberFromScreen) - Double(Int(firstNum * numberFromScreen)) == 0 {
                result.text = String(Int(firstNum * numberFromScreen ))
                } else {
                    result.text = String(firstNum * numberFromScreen )
                }
            }
            else if operation == 13 {
                if (firstNum - numberFromScreen) - Double(Int(firstNum - numberFromScreen)) == 0 {
                result.text = String(Int(firstNum - numberFromScreen ))
                } else {
                    result.text = String(firstNum - numberFromScreen )
                }
            }
            else if operation == 14 {
                if (firstNum + numberFromScreen) - Double(Int(firstNum + numberFromScreen)) == 0 {
                result.text = String(Int(firstNum + numberFromScreen ))
                } else {
                    result.text = String(firstNum + numberFromScreen )
                }
                
            }
        }
        else if sender.tag == 10 {
                result.text = "0"
                firstNum = 0
                numberFromScreen = 0
                operation = 0
            }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in buttons {
            if button.tag == 10{
                button.roundtopLeftCorner(radius: 20)
            }
            if button.tag == 11{
                button.roundTopRightCorner(radius: 20)
            }
            if button.tag == 0{
                button.roundBottomLeftCorner(radius: 20)
            }
            if button.tag == 15{
                button.roundBottomRightCorner(radius: 20)
            }
        }
        
    }


}

extension UIButton {
    func roundTopRightCorner(radius: CGFloat) {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: .topRight,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func roundtopLeftCorner(radius: CGFloat) {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: .topLeft,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func roundBottomLeftCorner(radius: CGFloat) {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: .bottomLeft,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func roundBottomRightCorner(radius: CGFloat) {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: .bottomRight,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}


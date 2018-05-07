//
//  InterfaceManager.swift
//  Deals
//
//  Created by DSS10 on 1/11/16.
//  Copyright © 2016 Dihardja Software Solutions. All rights reserved.
//

import Foundation
import UIKit

let TheInterfaceManager = InterfaceManager.sharedInstance

class InterfaceManager: NSObject {
    class var sharedInstance: InterfaceManager {
        struct Static {
            static let instance: InterfaceManager = InterfaceManager()
        }
        return Static.instance
    }
    
    func getDateStringFromDate(_ date:Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: date)
    }
    
    func getDateAndTimeStringFromDate(_ startDate:Date,endDate:Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy  HH:mm - "
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "HH:mm"
        return "\(dateFormatter.string(from: startDate))\(dateFormatter2.string(from: endDate))"
    }
    
    func populateDateFromString(_ dateString:String)->Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let parsedDate = formatter.date(from: dateString) {
            return parsedDate
        }
        // you can handle as you wish
        return Date()
    }
    
    func deviceHeight ()-> CGFloat{
        return UIScreen.main.bounds.size.height
    }
    
    func deviceWidth () -> CGFloat{
        return UIScreen.main.bounds.size.width
    }
    
    func isIphone6 () -> Bool{
        if deviceHeight() == 667{
            return true
        }
        return false
    }
    
    func isIphone6Plus () -> Bool{
        if deviceHeight() == 736{
            return true
        }
        return false
    }
    
    func isIphone5 () -> Bool{
        if deviceHeight() == 568{
            return true
        }
        return false
    }
    
    func isIphone4 () -> Bool{
        if deviceHeight() == 480{
            return true
        }
        return false
    }
    
    func baseGreenColor()->UIColor{
        return colorWithHexString("#4AAB62")
    }
    
    func boldFont()->UIFont{
        return UIFont(name: "Roboto-Regular", size: 14)!
    }

    func regularFont()->UIFont{
        return UIFont(name: "Roboto-Regular", size: 14)!
    }
    
    func getColorOfTheDealPercentage(_ percentage:Int)->UIColor{
        if percentage >= 50 {
            return colorWithHexString("#D0021B")
        }else if percentage >= 25{
            return colorWithHexString("#F5A623")
        }else{
            return colorWithHexString("#7ED321")
        }
    }
    
    func getImageDashOfTheDealPercentage(_ percentage:Int)->UIImage{
        if percentage >= 50 {
            return UIImage(named: "LineDashRed")!;
        }else if percentage >= 25{
            return UIImage(named: "LineDashOrange")!;
        }else{
            return UIImage(named: "LineDashGreen")!;
        }
    }
    
    func colorWithHexString (_ hex:String) -> UIColor {
        
        var cString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
    func aspectScaledImageSizeForImageView(_ iv:UIImageView,im:UIImage)->CGSize{
        let x = iv.frame.size.width;
        let y = iv.frame.size.height;
        var a = im.size.width;
        var b = im.size.height;
        
        if ( x == a && y == b ) {           // image fits exactly, no scaling required
            // return iv.frame.size;
        }
        else if ( x > a && y > b ) {         // image fits completely within the imageview frame
            if ( x-a > y-b ) {              // image height is limiting factor, scale by height
                a = y/b * a;
                b = y;
            } else {
                b = x/a * b;                // image width is limiting factor, scale by width
                a = x;
            }
        }
        else if ( x < a && y < b ) {        // image is wider and taller than image view
            if ( a - x > b - y ) {          // height is limiting factor, scale by height
                a = y/b * a;
                b = y;
            } else {                        // width is limiting factor, scale by width
                b = x/a * b;
                a = x;
            }
        }
        else if ( x < a && y > b ) {        // image is wider than view, scale by width
            b = x/a * b;
            a = x;
        }
        else if ( x > a && y < b ) {        // image is taller than view, scale by height
            a = y/b * a;
            b = y;
        }
        else if ( x == a ) {
            a = y/b * a;
            b = y;
        } else if ( y == b ) {
            b = x/a * b;
            a = x;
        }
        return CGSize(width: a,height: b);
    }
    
    func isIpad()->Bool{
      if(UIDevice.current.userInterfaceIdiom == .pad){
            return true
        }
        return false
    }
    
    func isValidEmail(_ testStr:String) -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
}


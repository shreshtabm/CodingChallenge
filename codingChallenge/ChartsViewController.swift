//
//  ChartsViewController.swift
//  codingChallenge
//
//  Created by shreshta bm on 1/5/16.
//  Copyright © 2016 shreshta bm. All rights reserved.
//

import UIKit
import Charts
public var names:[String] = [String]()
public var values : [Double] = [Double]()
class ChartsViewController: UIViewController {

    @IBOutlet weak var piechart: PieChartView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       /* names.append("aaa")
        values.append(23.2)
        
        names.append("bbb")
        values.append(32.2)
        
        names.append("ccc")
        values.append(23.2)*/
        let request = NSMutableURLRequest(URL: NSURL(string: "https://www.thesoloconnection.com/demo/")!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        let bodyData = "method=chart"
       
        request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding);
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            
            if(data != nil)
            {  let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as! NSDictionary
                //print(json)
                
                let data = json["data"] as! NSDictionary
                names.removeAll()
                values.removeAll()
                for index in 0...10
                {
                    
                    if data[String(index)] != nil
                    {
                        let single = data[String(index)] as! NSDictionary
                        let name = single["fullname"] as! String
                        let amt = single["amount"] as! Double
                        names.append(name)
                        values.append(amt)
                        
                    }
                }
                
                self.setChart(names, values: values)

            }
           
            print(users)
        })
        task.resume()
        
        
        setChart(names, values: values)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
            
        }
        
        let pieChartDataSet = PieChartDataSet(yVals: dataEntries ,label: "Data")
        let pieChartData = PieChartData(xVals: dataPoints, dataSet: pieChartDataSet)
        piechart.data = pieChartData
        
        var colors: [UIColor] = []
        
        for i in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
        
      /*
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Units Sold")
        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
        lineChartView.data = lineChartData*/
        
    }


}

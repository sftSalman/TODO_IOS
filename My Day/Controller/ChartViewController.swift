//
//  ChartViewController.swift
//  My Day
//
//  Created by Salman Farshi on 19/9/20.
//  Copyright © 2020 Salman Farshi. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController {

    @IBOutlet weak var pieChart: PieChartView!
    var done = PieChartDataEntry(value: 7.0)
    var notDone = PieChartDataEntry(value: 3.0)
    var result = [PieChartDataEntry]()
//    let formatter = NumberFormatter()
//    formatter.numberStyle = .PercentStyle
//    formatter.maximumFractionDigits = 1
//    formatter.multiplier = 1.0
//    pieChartData.dataSet?.valueFormatter = formatter
    
    
    override func viewWillAppear(_ animated: Bool) {
//        pieChart.animate(xAxisDuration: 2.0)
//        pieChart.animate(yAxisDuration: 1.0)
        title = "My Day"
    pieChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Day"
        done.label = "Done"
        notDone.label = "Not Done "
        result = [done, notDone]
        pieChart.animate(xAxisDuration: 2.0)
        
            
        updateChartData()
        
    }
    
    func updateChartData() {
        
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 1
        formatter.multiplier = 1.0
        
        let chartDataSet = PieChartDataSet(entries: result, label: nil)
        pieChart.data?.setValueFormatter(formatter as? IValueFormatter as! IValueFormatter)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        
        
        let colors = [UIColor(named:"done"), UIColor(named:"Color")]
        chartDataSet.colors = colors as! [NSUIColor]
       
        
        pieChart.data = chartData
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

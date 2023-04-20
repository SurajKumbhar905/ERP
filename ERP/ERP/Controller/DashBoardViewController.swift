//
//  DashBoardViewController.swift
//  ERP
//
//  Created by Suraj on 18/03/23.
//

import UIKit
import Charts

class DashBoardViewController: BaseViewController, ChartViewDelegate {
    

    @IBOutlet var segmentController: UISegmentedControl!
    @IBOutlet var DashBoardView: UIView!
    @IBOutlet var chartView: UIView!
    
    @IBOutlet var chartFilterView: UIView!
    @IBOutlet var chartFilterLabel: UILabel!
    @IBOutlet var chartFilterTable: UITableView!
    
    @IBOutlet var chartFaltertableHeight: NSLayoutConstraint!
    
    var Barchart = BarChartView()
    var pieChart = PieChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chartView.dropShadow(color: UIColor.black)
        Barchart.delegate = self
        pieChart.delegate = self
        
        CreateBarChart(chartView.frame)
        
        CreatePieChart(chartView.frame)
    
        Barchart.isHidden = true
        
        chartFilterView.layer.cornerRadius = 4
        chartFilterView.clipsToBounds = true
        chartView.backgroundColor = UIColor.cardBackGroundClor.filterCard
        
        
        
        chartFilterTable.register(FilterTableViewCell.self, forCellReuseIdentifier: "FilterTableViewCell")
        chartFilterTable.register(UINib(nibName: "FilterTableViewCell", bundle: nil),forCellReuseIdentifier: "FilterTableViewCell")
       
        
        
        let filterChartTap = UITapGestureRecognizer(target: self, action: #selector(self.businessUnitTapHandel(_:)))
        chartFilterView.addGestureRecognizer(filterChartTap)
        chartFaltertableHeight.constant = 0
        
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        print("dashboard")
        navigationItem.title = ""
        setUpNavigationForDashBoard()
       
    }
    
    
    func setUpNavigationForDashBoard(){
        self.navigationController?.navigationBar.isHidden = true
        DashBoardView.addSubview(profileViewDashBoard())
    }
    
    
    
    
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        
        switch segmentController.selectedSegmentIndex {
            
        case 0:
            Barchart.isHidden = true
            pieChart.isHidden = false
            pieChart.animate(yAxisDuration: 0.5)
            pieChart.animate(xAxisDuration: 0.5)
            chartFilterView.isHidden = false
            
        case 1:
            
            Barchart.isHidden = false
            pieChart.isHidden = true
            Barchart.animate(xAxisDuration: 0.5)
            Barchart.animate(yAxisDuration: 0.5)
            chartFilterView.isHidden = true
            chartFaltertableHeight.constant = 0
        case 2:
           print("gsd")
        default :
            print("bj")
        }
        
    }
    
    
    @objc func businessUnitTapHandel(_ sender: UITapGestureRecognizer? = nil) {
        

        UIView.animate(withDuration: 0.4, animations: {
            if self.chartFaltertableHeight.constant == 150
            {
                self.chartFaltertableHeight.constant = 0
            }else
            {
                self.chartFaltertableHeight.constant = 150
            }

            self.view.layoutIfNeeded()

            })
        
    }
    
}

extension DashBoardViewController: UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return DummyData.Instance.cardCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let card = collectionView.dequeueReusableCell(withReuseIdentifier: "MainScreenCell", for: indexPath) as! DashBoardCollectionViewCell
        
        card.addAttibute(indexPath: indexPath)
        card.shadowDecorate()
        
        return card
    }
    
    
   
}

extension DashBoardViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DummyData.Instance.monthCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as! FilterTableViewCell
        
        cell.cellLabel.text = DummyData.Instance.months[indexPath.row]
        cell.cellLabel.font = UIFont.systemFont(ofSize: 12)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        
        UIView.animate(withDuration: 0.4, animations: {
            self.chartFilterLabel.text = DummyData.Instance.months[indexPath.row]
            self.chartFaltertableHeight.constant = 0
            self.view.layoutIfNeeded()
        })
        
    }
    
    
}


extension DashBoardViewController {
    
    func CreatePieChart(_ frame: CGRect){
        
        let months = ["revenue", " Balance"]
        let unitsSold = [20.0, 30.0]

        
        var entries = [ChartDataEntry]()
               for i in 0..<2 {
                   entries.append(ChartDataEntry(x: Double(i), y: Double(i)))
               }
        
        
//        let dataset = PieChartDataSet(entries: entries, label: "Cost")
//        let data = PieChartData(dataSet:  dataset)
        
//        pieChart.data = data
//        self.paiRevenueChart.addSubview(pieChart)
        
        
        let players = ["Ozil", "Ramsey"]
        let goals = [6, 8]
        
        var dataEntries: [ChartDataEntry] = []
          for i in 0..<players.count {
              let dataEntry = PieChartDataEntry(value: Double(goals[i]), label: players[i], data: players[i] as AnyObject)
            dataEntries.append(dataEntry)
          }
          // 2. Set ChartDataSet
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "Paid")
        pieChartDataSet.colors = [UIColor.text.textColorLevel2, UIColor.cardBackGroundClor.mainCard]
        
          // 3. Set ChartData
        
          let pieChartData = PieChartData(dataSet: pieChartDataSet)
       
          let format = NumberFormatter()
        format.numberStyle = .none
          let formatter = DefaultValueFormatter(formatter: format)
          pieChartData.setValueFormatter(formatter)
       
          // 4. Assign it to the chart’s data
          pieChart.data = pieChartData
        
        
        pieChart.animate(yAxisDuration: 1.0)
        
        pieChart.backgroundColor = .green
        pieChart.layer.cornerRadius = 10
        pieChart.clipsToBounds = true
        self.chartView.addSubview(pieChart)
        
        pieChart.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            pieChart.topAnchor.constraint(equalTo: charView.topAnchor +  10),
            pieChart.topAnchor.constraint(equalTo: chartView.topAnchor, constant: 30),
//            pieChart.bottomAnchor.constraint(equalTo: charView.bottomAnchor),
            pieChart.leadingAnchor.constraint(equalTo: chartView.leadingAnchor, constant: 10),
//            pieChart.leadingAnchor.constraint(equalTo: charView.leadingAnchor),
//            pieChart.trailingAnchor.constraint(equalTo: charView.trailingAnchor)
            pieChart.bottomAnchor.constraint(equalTo: chartView.bottomAnchor, constant: -20),
            pieChart.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -115)
        ])
        
        
        
    }
    
    
    
    func CreateBarChart(_ frame: CGRect){
        
        let months = ["Jan", "Feb", "Mar", "Apr", "May"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0]
        let unitsBought = [10.0, 14.0, 60.0, 13.0, 2.0]
        
//        Barchart.frame = CGRect(x: frame.origin.x, y: frame.origin.y + 10 , width: charView.bounds.width, height: charView.bounds.height)
//        Barchart.backgroundColor = .red
//        var entries = [BarChartDataEntry]()
//        for i in 0..<10 {
//            entries.append(BarChartDataEntry(x: Double(i), y: Double(i)))
//        }
        
        
        
//        Barchart.backgroundColor = .red
        var dataEntries: [BarChartDataEntry] = []
        var dataEntries1: [BarChartDataEntry] = []

        for i in 0..<months.count {
            
            

                let dataEntry = BarChartDataEntry(x: Double(i) , y: unitsSold[i])
                    dataEntries.append(dataEntry)

                    let dataEntry1 = BarChartDataEntry(x: Double(i) , y: unitsBought[i])
                    dataEntries1.append(dataEntry1)

                    //stack barchart
                    //let dataEntry = BarChartDataEntry(x: Double(i), yValues:  [self.unitsSold[i],self.unitsBought[i]], label: "groupChart")
        }
        
        
//        let set =  BarChartDataSet(entries: entries, label: "Cost")
//        set.colors =  [UIColor.AppColor.DarkPurpleColor]
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Unit sold")
        chartDataSet.colors = [UIColor.text.textColorLevel3]
//        chartDataSet.colors = [UIColor.red]
        let chartDataSet1 = BarChartDataSet(entries: dataEntries1, label: "Unit Bought")
        chartDataSet1.colors = [UIColor.text.textColorLevel2]
//        chartDataSet1.colors = [UIColor.green]
        let datasets : [BarChartDataSet] =  [chartDataSet, chartDataSet1]
        
        
        let data = BarChartData(dataSets: datasets)
        
        let groupSpace = 0.3
                let barSpace = 0.05
                let barWidth = 0.3
                // (0.3 + 0.05) * 2 + 0.3 = 1.00 -> interval per "group"

                let groupCount = months.count
                let startYear = 0
        data.barWidth = barWidth;
        Barchart.xAxis.axisMinimum = Double(startYear)
         let gg = data.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
        print("Groupspace: \(gg)")
        Barchart.xAxis.axisMaximum = Double(startYear) + gg * Double(groupCount)
        data.groupBars(fromX: Double(startYear), groupSpace: groupSpace, barSpace: barSpace)
        Barchart.notifyDataSetChanged()
        
        Barchart.data = data
        
        Barchart.xAxis.drawGridLinesEnabled = false
        Barchart.leftAxis.drawAxisLineEnabled = false
        Barchart.rightAxis.drawAxisLineEnabled = false
        Barchart.doubleTapToZoomEnabled = false
        Barchart.pinchZoomEnabled = false
        Barchart.scaleXEnabled = false
        Barchart.scaleYEnabled = false
        
        
        Barchart.animate(xAxisDuration: 1.0)
        Barchart.animate(yAxisDuration: 1.0)
        
        self.chartView.addSubview(Barchart)
        
        Barchart.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            Barchart.topAnchor.constraint(equalTo: chartView.topAnchor),
            Barchart.bottomAnchor.constraint(equalTo: chartView.bottomAnchor),
            Barchart.leadingAnchor.constraint(equalTo: chartView.leadingAnchor),
            Barchart.trailingAnchor.constraint(equalTo: chartView.trailingAnchor)
        ])
        
    }
}


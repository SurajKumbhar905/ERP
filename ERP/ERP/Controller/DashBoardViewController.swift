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
    var lineChart = LineChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        addShadow(view: chartView)
        

        
        Barchart.delegate = self
        pieChart.delegate = self
        
        CreateBarChart(chartView.frame)
        
        CreatePieChart(chartView.frame)
        CreateLineChart()
    
        Barchart.isHidden = true
        lineChart.isHidden = true
        
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
            lineChart.isHidden = true
            pieChart.animate(yAxisDuration: 0.5)
            pieChart.animate(xAxisDuration: 0.5)
            chartFilterView.isHidden = false
            
        case 1:
            
            Barchart.isHidden = false
            pieChart.isHidden = true
            lineChart.isHidden = true
            Barchart.animate(xAxisDuration: 0.5)
            Barchart.animate(yAxisDuration: 0.5)
            chartFilterView.isHidden = true
            chartFaltertableHeight.constant = 0
        case 2:
            Barchart.isHidden = true
            pieChart.isHidden = true
            lineChart.isHidden = false
            lineChart.animate(xAxisDuration: 0.5)
            lineChart.animate(yAxisDuration: 0.5)
            chartFilterView.isHidden = true
            chartFaltertableHeight.constant = 0
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
//        card.shadowDecorate()
        card.shadow()
        
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
        pieChartDataSet.colors = [UIColor(hexString: "#5C5562"), UIColor(hexString: "#7F7884")]
        
          // 3. Set ChartData
        
          let pieChartData = PieChartData(dataSet: pieChartDataSet)
       
          let format = NumberFormatter()
        format.numberStyle = .none
          let formatter = DefaultValueFormatter(formatter: format)
          pieChartData.setValueFormatter(formatter)
       
          // 4. Assign it to the chart’s data
          pieChart.data = pieChartData
        
        
        pieChart.animate(yAxisDuration: 1.0)
        
        pieChart.backgroundColor = UIColor.white.withAlphaComponent(0.7)
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
        chartDataSet.colors = [UIColor(hexString: "#7F7884")]
//        chartDataSet.colors = [UIColor.red]
        let chartDataSet1 = BarChartDataSet(entries: dataEntries1, label: "Unit Bought")
        chartDataSet1.colors = [UIColor(hexString: "#5C5562")]
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
        
        let legend = Barchart.legend
                    legend.enabled = true
                    legend.horizontalAlignment = .right
                    legend.verticalAlignment = .top
                    legend.orientation = .vertical
                    legend.drawInside = true
                    legend.yOffset = 10.0;
                    legend.xOffset = 10.0;
                    legend.yEntrySpace = 0.0;
        
        
        
        
        let xaxis = Barchart.xAxis
//                    xaxis.valueFormatter = axisFormatDelegate
                    xaxis.drawGridLinesEnabled = true
                    xaxis.labelPosition = .bottom
                    xaxis.centerAxisLabelsEnabled = true
                    xaxis.valueFormatter = IndexAxisValueFormatter(values:months)
                    xaxis.granularity = 1


                    let leftAxisFormatter = NumberFormatter()
                    leftAxisFormatter.maximumFractionDigits = 1

                    let yaxis = Barchart.leftAxis
                    yaxis.spaceTop = 0.35
                    yaxis.axisMinimum = 0
                    yaxis.drawGridLinesEnabled = false

                    Barchart.rightAxis.enabled = false
        
        
        Barchart.xAxis.drawGridLinesEnabled = false
        Barchart.xAxis.labelPosition = .bottom
//        Barchart.xAxis.valueFormatter = axisFormatDelegate

//        Barchart.
        
        Barchart.rightAxis.drawLabelsEnabled = false
//        Barchart.leftAxis.drawAxisLineEnabled = false
        Barchart.rightAxis.drawAxisLineEnabled = false
        Barchart.doubleTapToZoomEnabled = true
        Barchart.pinchZoomEnabled = true
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
    
    
    func CreateLineChart(){
        
//        var unitsSold2 = [2.5 , 4.5 ,4.0 , 10.0, 18.4 ,14.0 , 8.0 , 6.0,20.0, 4.0, 6.0, 3.0, 12.0 , 35.0 , 12.0 ,34.0 , 12.0, 8.4 ,50.0 , 21.0]
//        var unitsBought2 = [ 2.0 ,3.0, 12.0 , 18.0 , 12.0 ,7.0 , 12.0, 4.4,10.0, 14.0, 60.0, 13.0, 2.0 ,3.0, 12.0 , 15.0 , 12.0 ,34.0 , 12.0, 4.4]
//
//        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "July" , "Aug" , "Sep" , "Oct" , "Nov" , "Dec"]
//        lineChart.frame = CGRect(x: frame.origin.x - 16, y: frame.origin.y - 490,
//        width: frame.width, height: frame.height - 50)
        
        
        let months = ["Jan", "Feb", "Mar", "Apr", "May"]
        let unitsSold2 = [20.0, 4.0, 15.0, 10.0, 6.0]
        let unitsBought2 = [10.0, 14.0, 60.0, 13.0, 2.0]
        
        var dataEntries: [ChartDataEntry] = []
        var dataEntries1: [ChartDataEntry] = []
       
//        let dataEntry = BarChartDataEntry(x: Double(i) , y: unitsSold2[i])
//                 dataEntries.append(dataEntry)
//        let dataEntry1 = BarChartDataEntry(x: Double(i) , y: unitsBought2[i])
//                dataEntries1.append(dataEntry1)
//                }
            
            
            for i in 0..<months.count {
                
                

                    let dataEntry = BarChartDataEntry(x: Double(i) , y: unitsSold2[i])
                        dataEntries.append(dataEntry)

                        let dataEntry1 = BarChartDataEntry(x: Double(i) , y: unitsBought2[i])
                        dataEntries1.append(dataEntry1)

                        //stack barchart
                        //let dataEntry = BarChartDataEntry(x: Double(i), yValues:  [self.unitsSold[i],self.unitsBought[i]], label: "groupChart")
            }
            
        let  chartDataSet = LineChartDataSet(entries: dataEntries, label: "Income")
            chartDataSet.colors = [UIColor(hexString: "#7F7884")]
        let chartDataSet1 = LineChartDataSet(entries: dataEntries1, label: "OutCome")
            chartDataSet1.colors = [UIColor(hexString: "#5C5562")]
                chartDataSet.drawCirclesEnabled = false
                chartDataSet1.drawCirclesEnabled = false
                chartDataSet1.drawValuesEnabled = false
                chartDataSet.drawValuesEnabled = false
                chartDataSet.mode = .cubicBezier
                chartDataSet1.mode = .cubicBezier
                chartDataSet.lineWidth = 2
                chartDataSet1.lineWidth = 2
        let datasets : [LineChartDataSet] =  [chartDataSet, chartDataSet1]
        let data = LineChartData(dataSets: datasets)
        let groupSpace = 0.3
        let barSpace = 0.05
        let barWidth = 0.3
        let groupCount = months.count
        let startYear = 0
//                lineChart.borderLineWidth = 3.0
//
//                lineChart.xAxis.axisMinimum = Double(startYear)
                lineChart.notifyDataSetChanged()
                lineChart.data = data
//                lineChart.xAxis.drawGridLinesEnabled = false
//                lineChart.leftAxis.drawAxisLineEnabled = false
//                lineChart.rightAxis.drawAxisLineEnabled = false
//                lineChart.doubleTapToZoomEnabled = false
//                lineChart.pinchZoomEnabled = false
//                lineChart.scaleXEnabled = false
//                lineChart.scaleYEnabled = false
////        self.salesOverviewView.addSubview(lineChart)
//        lineChart.rightAxis.drawLabelsEnabled = false
//        lineChart.xAxis.labelPosition = .bottom
//
        
        
        
        
//        let legend = lineChart.legend
//                    legend.enabled = true
//                    legend.horizontalAlignment = .right
//                    legend.verticalAlignment = .top
//                    legend.orientation = .vertical
//                    legend.drawInside = true
//                    legend.yOffset = 10.0;
//                    legend.xOffset = 10.0;
//                    legend.yEntrySpace = 0.0;
        
        
        
        
        let xaxis = lineChart.xAxis
//                    xaxis.valueFormatter = axisFormatDelegate
                    xaxis.drawGridLinesEnabled = true
                    xaxis.labelPosition = .bottom
                    xaxis.centerAxisLabelsEnabled = true
                    xaxis.valueFormatter = IndexAxisValueFormatter(values:months)
                    xaxis.granularity = 1


                    let leftAxisFormatter = NumberFormatter()
                    leftAxisFormatter.maximumFractionDigits = 1

                    let yaxis = lineChart.leftAxis
                    yaxis.spaceTop = 0
                    yaxis.axisMinimum = 0
                    yaxis.drawGridLinesEnabled = false

                    lineChart.rightAxis.enabled = false
        
        
        lineChart.xAxis.drawGridLinesEnabled = false
        lineChart.xAxis.labelPosition = .bottom
//        Barchart.xAxis.valueFormatter = axisFormatDelegate

//        Barchart.
        
        lineChart.rightAxis.drawLabelsEnabled = false
//        Barchart.leftAxis.drawAxisLineEnabled = false
        lineChart.rightAxis.drawAxisLineEnabled = false
        lineChart.doubleTapToZoomEnabled = true
        lineChart.pinchZoomEnabled = true
        lineChart.scaleXEnabled = false
        lineChart.scaleYEnabled = false
        
        
        
        
        
        
        
        
        
        self.chartView.addSubview(lineChart)
        
        lineChart.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineChart.topAnchor.constraint(equalTo: chartView.topAnchor),
            lineChart.bottomAnchor.constraint(equalTo: chartView.bottomAnchor),
            lineChart.leadingAnchor.constraint(equalTo: chartView.leadingAnchor),
            lineChart.trailingAnchor.constraint(equalTo: chartView.trailingAnchor)
        ])

    }
}


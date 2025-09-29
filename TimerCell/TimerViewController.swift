//
//  TimerViewController.swift
//  TimerCell
//
//  Created by Koushik Reddy Kambham on 9/25/25.
//
import UIKit

class TimerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TimerViewModelDelegate {
    
    var timerTitle: UILabel!
    var tableView: UITableView!
    
    var viewModel : TimerViewModelProtocol!
    
//    var timers : [TimerModel] = Array(repeating: TimerModel(), count: 40)
//    var timer : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = TimerViewModel()
        setupUI()
        setupTableView()
        viewModel.setDelegate(self)
        viewModel.startTimer()
        
    }
    
    
    func setupUI() {
        view.backgroundColor = .systemGreen
        title = "Timer"
        
        timerTitle = UILabel()
        timerTitle.translatesAutoresizingMaskIntoConstraints = false
        timerTitle.font = .systemFont(ofSize: 36, weight: .bold)
        timerTitle.textAlignment = .center
        view.addSubview(timerTitle)
        
        NSLayoutConstraint.activate([
            timerTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            timerTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    //tableview
    func setupTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TimerTableView.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: timerTitle.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    //test
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getTimerCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TimerTableView else {
            return UITableViewCell()
        }
//        cell.configure(with: timers[indexPath.row])
        cell.configure(with: viewModel.getTimer(at: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        timers[indexPath.row].isPaused = timers[indexPath.row].isPaused ? false : true
//        tableView.reloadRows(at: [indexPath], with: .automatic)
        viewModel.togglePause(for: indexPath.row)
    }
    
    func timersDidUpdate() {
        guard let visibleRows = tableView.indexPathsForVisibleRows else { return }
        
        for indexPath in visibleRows {
            if viewModel.timers[indexPath.row].isPaused {
                viewModel.timers[indexPath.row].count += 1
            }
        }
        
        tableView.reloadRows(at: visibleRows, with: .none)
    }

    
//   func timersDidUpdate() {
//        guard let visibleRows = tableView.indexPathsForVisibleRows , !visibleRows.isEmpty else { return }
//        for indexPath in visibleRows {
//            print(visibleRows)
//            if let cell = tableView.cellForRow(at: indexPath) as? TimerTableView {
//                cell.configure(with: viewModel.getTimer(at: indexPath.row))
//            }
//        }
//        for i in 0..<timers.count {
//            if timers[i].isPaused{
//                timers[i].count += 1
//            }
//        }
//        tableView.reloadData()
//    }
}

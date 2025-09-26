//
//  TimerViewModel.swift
//  TimerCell
//
//  Created by Koushik Reddy Kambham on 9/25/25.
//
import UIKit

protocol TimerViewModelDelegate: AnyObject {
    func timersDidUpdate()
}

protocol TimerViewModelProtocol: AnyObject {
    var timers: [TimerModel] { get set }
    var delegate: TimerViewModelDelegate? { get set }
    func startTimer()
    func getTimerCount() -> Int
    func getTimer(at index: Int) -> TimerModel
    func togglePause(for index: Int)
    func setDelegate(_ delegate: TimerViewModelDelegate)
}

class TimerViewModel: TimerViewModelProtocol {
    
    var timers : [TimerModel] = Array(repeating: TimerModel(), count: 40)
    var timer : Timer!
    weak var delegate: TimerViewModelDelegate?
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    func getTimerCount() -> Int {
        return timers.count
    }
    
    func getTimer(at index: Int) -> TimerModel {
        return timers[index]
    }
    
    func togglePause(for index: Int) {
        timers[index].isPaused.toggle()
//        delegate?.timersDidUpdate()
    }
    
    func setDelegate(_ delegate: TimerViewModelDelegate) {
        self.delegate = delegate
    }
    
//    @objc func fireTimer() {
//        for i in 0..<timers.count {
//            if timers[i].isPaused{
//                timers[i].count += 1
//                DispatchQueue.main.async {
//                    self.delegate?.timersDidUpdate()
//                }
//            }
//        }
//        DispatchQueue.main.async {
//            self.delegate?.timersDidUpdate()
//        }
//    }
    
    @objc func fireTimer() {
            // Just notify controller every tick
            DispatchQueue.main.async {
                self.delegate?.timersDidUpdate()
            }
        }
}

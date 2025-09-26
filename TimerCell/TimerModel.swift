//
//  Timer.swift
//  TimerCell
//
//  Created by Koushik Reddy Kambham on 9/25/25.
//

struct TimerModel: Comparable {
    var count : Int = 0
    var isPaused: Bool = true
    
    static func < (lhs: TimerModel, rhs: TimerModel) -> Bool {
        return lhs.count < rhs.count
    }
}

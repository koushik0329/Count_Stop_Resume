//
//  TimerTableView.swift
//  TimerCell
//
//  Created by Koushik Reddy Kambham on 9/25/25.
//

import UIKit

class TimerTableView: UITableViewCell {
    
    let timerLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.textAlignment = .center
        contentView.addSubview(timerLabel)
        
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure(with timer: TimerModel) {
        timerLabel.text = "\(timer.count)"
        
        if !timer.isPaused {
            contentView.backgroundColor = .systemGray
            timerLabel.textColor = .white
        }
        else {
            contentView.backgroundColor = .systemGreen
            timerLabel.textColor = .white
        }
    }
}

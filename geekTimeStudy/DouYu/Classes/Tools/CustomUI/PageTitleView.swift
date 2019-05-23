//
//  PageTitleView.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/20.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

private let kNormalColor: (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
private let kSelectedColor: (CGFloat, CGFloat, CGFloat) = (255, 128, 0)

protocol PageTitleViewDelegate: class {
    func pageTitleView(titleView: PageTitleView, selectedIndex: Int)
}

let kScrollLineHeight:CGFloat = 2
let kBottomLineHeight:CGFloat = 0.5

class PageTitleView: UIView {
    // MARK: - 定义属性
    fileprivate var titles: [String]
    fileprivate var titleLabels: [UILabel] = [UILabel]()
    fileprivate var currentIndex: Int = 0
    weak var delegate: PageTitleViewDelegate?
    
    // MARK: - 懒加载属性(其他地方会用到，例如scrollview和scrollLine，但是bottomLine就不需要懒加载)
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    fileprivate lazy var scrollLine: UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor(r: kSelectedColor.0, g: kSelectedColor.1, b: kSelectedColor.2)
        return scrollLine
    }()
    
    
    
// MARK: - 自定义构造函数
    init(frame: CGRect,titles: [String]) {
        self.titles = titles
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - 设置UI界面
extension PageTitleView {
    fileprivate func setupUI() {
        addSubview(scrollView)
        scrollView.frame = bounds
        setupTitleLabels()
        setupBottomMenuAndScrollLine()
    }
    
    private func setupTitleLabels() {
        let labelY:CGFloat = 0
        let labelHeight:CGFloat = frame.height - kScrollLineHeight
        let labelWidth:CGFloat = bounds.width / CGFloat(titles.count)
        
        for (index,title) in titles.enumerated() {
            let label = UILabel()
            label.tag = index
            label.text = title
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
            label.textAlignment = .center
            
            label.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(titleLabelClicked(tap:)))
            label.addGestureRecognizer(tapGesture)
            
            let labelX:CGFloat = CGFloat(index) * labelWidth
            label.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
                
            scrollView.addSubview(label)
            titleLabels.append(label)
        }
    }
    
    private func setupBottomMenuAndScrollLine() {
        let bottomLine = UIView(frame: CGRect(x: 0, y: frame.height - kBottomLineHeight, width: frame.width, height: kBottomLineHeight))
        bottomLine.backgroundColor = UIColor(r: kSelectedColor.0, g: kSelectedColor.1, b: kSelectedColor.2)
        addSubview(bottomLine)
        
        guard let firstLabel = titleLabels.first else {
            return
        }
        firstLabel.textColor = UIColor(r: kSelectedColor.0, g: kSelectedColor.1, b: kSelectedColor.2)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y:kTitleViewHeight - kScrollLineHeight , width: firstLabel.frame.width, height: kScrollLineHeight)
        scrollView.addSubview(scrollLine)
    }
}

// MARK: - label的点击
extension PageTitleView {
    @objc fileprivate func titleLabelClicked(tap:UITapGestureRecognizer)  {
        guard let currentLabel = tap.view as? UILabel else {return }
        if tap.view?.tag == currentIndex {
            return
        }
        currentLabel.textColor = UIColor(r: kSelectedColor.0, g: kSelectedColor.1, b: kSelectedColor.2)
        
        let oldLabel = titleLabels[currentIndex]
        oldLabel.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
        currentIndex = currentLabel.tag
        
        let scrollLineX = CGFloat(currentIndex) * scrollLine.frame.width
        UIView.animate(withDuration: 0.15) {
            self.scrollLine.frame.origin.x = scrollLineX
        }
        delegate?.pageTitleView(titleView: self, selectedIndex: currentIndex)
    }
}

extension PageTitleView {
    func setTitleWithProcess(process:CGFloat, sourceIndex:Int, targetIndex:Int) {
        let targetLabel = titleLabels[targetIndex]
        let sourceLabel = titleLabels[sourceIndex]
        
        let totalMoveX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = totalMoveX * process
        scrollLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        
        let colorDelta = (kSelectedColor.0 - kNormalColor.0, kSelectedColor.1 - kNormalColor.1, kSelectedColor.2 - kNormalColor.2)
        targetLabel.textColor = UIColor(r: kNormalColor.0 + colorDelta.0 * process, g: kNormalColor.1 + colorDelta.1 * process, b: kNormalColor.2 + colorDelta.2 * process)
        sourceLabel.textColor = UIColor(r: kSelectedColor.0 - colorDelta.0, g: kSelectedColor.1 - colorDelta.1 * process, b: kSelectedColor.2 * process - colorDelta.2 * process)
        currentIndex = targetIndex
    }
}

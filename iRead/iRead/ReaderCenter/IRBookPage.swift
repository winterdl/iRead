//
//  IRBookPage.swift
//  iRead
//
//  Created by zzyong on 2020/9/28.
//  Copyright © 2020 zzyong. All rights reserved.
//

import UIKit

class IRBookPage: NSObject {
    
    lazy var range = NSMakeRange(0, 0)
    var content: NSAttributedString?
    var pageIdx: Int = 0
    var chapterIdx: Int = 0
    
    class func bookPage(withPageIdx pageIdx: Int, chapterIdx: Int) -> IRBookPage {
        let page = IRBookPage()
        page.pageIdx = pageIdx
        page.chapterIdx = chapterIdx
        return page
    }
    
    func updateTextColor(_ textColor: UIColor) {

        guard let content = self.content else { return }
        let mutableContent: NSMutableAttributedString = content.mutableCopy() as! NSMutableAttributedString
        let tempContent = mutableContent.mutableCopy() as! NSMutableAttributedString
        tempContent.enumerateAttributes(in: NSMakeRange(0, tempContent.length), options: [.longestEffectiveRangeNotRequired]) { (value: [NSAttributedString.Key : Any], range, stop) in
            if !value.keys.contains(.link) {
                mutableContent.addAttribute(.foregroundColor, value: textColor, range: range)
            }
        }
        self.content = mutableContent
    }
}

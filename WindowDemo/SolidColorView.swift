//
//  SolidColorView.swift
//  Base
//
//  Created by Tom Rogers on 06/02/2018.
//  Copyright © 2018 Tom Rogers. All rights reserved.
//

import Cocoa

class SolidColorView: NSView {
  
  var drawingFill = NSColor.green
  
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
      
      let box = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
      drawingFill.setFill()
      box.fill()
      
    }
    
}

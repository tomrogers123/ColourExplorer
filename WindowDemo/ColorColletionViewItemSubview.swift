//
//  ColorColletionViewItemSubview.swift
//  Base
//
//  Created by Tom Rogers on 17/03/2018.
//  Copyright © 2018 Tom Rogers. All rights reserved.
//

import Cocoa

class ColorColletionViewItemSubview: NSView {
  
  var colorToDrawWith: NSColor!
  
  override func draw(_ dirtyRect: NSRect) {
    colorToDrawWith.setFill()
    bounds.fill()
  }
    
}

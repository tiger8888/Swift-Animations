//
//  CustomCell.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/6.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

// MARK: extension UITableView

extension UITableView {

    func dequeueAndLoadContentReusableCellFromAdapter(adapter: CellDataAdapter, indexPath: NSIndexPath) -> CustomCell {
        
        let cell         = self.dequeueReusableCellWithIdentifier(adapter.cellReuseIdentifier!) as! CustomCell
        cell.indexPath   = indexPath
        cell.dataAdapter = adapter
        cell.data        = adapter.data
        cell.loadContent()
        
        return cell
    }
    
    func dequeueAndLoadContentReusableCellFromAdapter(adapter: CellDataAdapter, indexPath: NSIndexPath, controller: UIViewController) -> CustomCell {
        
        let cell         = self.dequeueReusableCellWithIdentifier(adapter.cellReuseIdentifier!) as! CustomCell
        cell.indexPath   = indexPath
        cell.dataAdapter = adapter
        cell.data        = adapter.data
        cell.controller  = controller
        cell.loadContent()
        
        return cell
    }
    
    func selectedEventWithIndexPath(indexPath : NSIndexPath) {
        
        let cell = self.cellForRowAtIndexPath(indexPath) as! CustomCell
        
        // Make sure the cell is kind of CustomCell.
        guard cell.isKindOfClass(CustomCell.classForCoder()) == true else {
        
            return
        }
        
        cell.selectedEvent()
    }
}

// MARK: protocol CustomCellDelegate

protocol CustomCellDelegate : class {
    
    /**
     CustomCell's event.
     
     - parameter cell:  CustomCell type class.
     - parameter event: Event data.
     */
    func customCell(cell: CustomCell?, event: AnyObject?)
}

// MARK: CustomCell

class CustomCell: UITableViewCell {
    
    weak var delegate    : CustomCellDelegate?
    weak var dataAdapter : CellDataAdapter?
    weak var data        : AnyObject?
    weak var indexPath   : NSIndexPath?
    weak var tableView   : UITableView?
    weak var controller  : UIViewController?
    var      display     : Bool?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell()
        self.buildSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Setup cell, override by subclass.
     */
    func setupCell() {
        
        self.selectionStyle = .None
    }
    
    /**
     Build subview, override by subclass.
     */
    func buildSubview() {}
    
    /**
     Load content, override by subclass.
     */
    func loadContent() {}
    
    /**
     Selected event, you should use this method in 'tableView:didSelectRowAtIndexPath:' to make it effective.
     */
    func selectedEvent() {}
    
    /**
     Create the CustomCell type data adapter.
     
     - parameter reuseIdentifier: The reuseIdentifier.
     - parameter data:            The data.
     - parameter cellHeight:      The cell's height.
     - parameter type:            The cell's type.
     
     - returns: The cellDataAdapter.
     */
    class func Adapter(reuseIdentifier: String? = nil, data: AnyObject? = nil, cellHeight: CGFloat? = 0, type: Int? = nil) -> CellDataAdapter {
    
        let identifier = (reuseIdentifier == nil ? String(self.classForCoder()) : reuseIdentifier)
        
        return CellDataAdapter.init(cellReuseIdentifier: identifier, data: data, cellHeight: cellHeight, cellType: type)
    }
    
    /**
     Register cell to tableView with cell reuse identifier.
     
     - parameter tableView:           UITableView.
     - parameter cellReuseIdentifier: Cell reuse identifier.
     */
    class func RegisterTo(tableView: UITableView, cellReuseIdentifier: String? = nil) {
        
        tableView.registerClass(self.classForCoder(), forCellReuseIdentifier: (cellReuseIdentifier != nil) ? cellReuseIdentifier! : String(self.classForCoder()))
    }
}

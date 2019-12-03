//
//  Paginator.swift
//  reddift
//
//  Created by sonson on 2015/04/14.
//  Copyright (c) 2015年 sonson. All rights reserved.
//

import Foundation

/**
Paginator object for paiging listing object.
*/
public struct Paginator {
	let after: String
	let before: String
    let modhash: String
    
    public init() {
        self.after = ""
        self.before = ""
        self.modhash = ""
    }
	
    public init(after: String, before: String, modhash: String) {
		self.after = after
		self.before = before
        self.modhash = modhash
	}
	
	public var isVacant: Bool {
		if (!after.isEmpty) || (!before.isEmpty) {
			return false
		}
		return true
	}
    
    /**
    Generate dictionary to add query parameters to URL.
	If paginator is vacant, returns vacant dictionary as [String:String].
    
    - returns: Dictionary object for paging.
    */
    public var parameterDictionary: [String: String] {
        get {
            var dict: [String: String] = [:]
            if !after.isEmpty {
                dict["after"] = after
            }
            if !before.isEmpty {
                dict["before"] = before
            }
            return dict
        }
    }
    
    public func dictionaryByAdding(parameters dict: [String: String]) -> [String: String] {
        var newDict = dict
        if !after.isEmpty {
            newDict["after"] = after
        }
        if !before.isEmpty {
            newDict["before"] = before
        }
        return newDict
    }
}

//
//  ResultExtension.swift
//  BeirutAirport
//
//  Created by Vortex on 11/17/19.
//  Copyright © 2019 Mahmoud Fathy. All rights reserved.
//

import Foundation

extension Result where Success == Void {
    static var success: Result {
        return .success(())
    }
}

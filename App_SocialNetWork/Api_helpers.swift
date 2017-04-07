//
//  Api_helpers.swift
//  App_GaritosMadrid
//
//  Created by cice on 10/3/17.
//  Copyright © 2017 cice. All rights reserved.
//

import Foundation
import UIKit

func muestraAlert(_ titleData: String, _ messageData: String, _ titleAction: String) -> UIAlertController{
    let alert = UIAlertController(title: titleData, message: messageData, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: titleAction, style: .default, handler: nil))
    
    return alert
}





//
//  ConfigurationHandler.swift
//  TestingMultipleAssets
//
//  Created by Backlin,Gene on 11/13/17.
//  Copyright © 2017 Backlin,Gene. All rights reserved.
//

import UIKit

public class ConfigurationHandler: NSObject {
    private static let CONFIG_PLIST = "CONFIG_PLIST"

    public let configuration: Configuration?
    
    public override init() {
        guard
            let filename = Bundle.main.infoDictionary?[ConfigurationHandler.CONFIG_PLIST] as? String,
            let configURL = Bundle.main.url(forResource: filename, withExtension: "plist"),
            let data = try? Data(contentsOf: configURL)
            else {
                configuration = nil
                super.init()
                return
        }
        let decoder = PropertyListDecoder()
        configuration = try? decoder.decode(Configuration.self, from: data)
        super.init()
    }
}

//
//  AppLogger.swift
//  CrashTest
//
//  Created by Serhii Molodets on 24.03.2025.
//


import Foundation
import Coralogix

class AppLogger: @unchecked Sendable {
    
    static let shared = AppLogger()
    private var coralogixRum: CoralogixRum!
    private init() {}
    
    // cxtp_t5i7cLrYMzu59NqyAvvQpZjI7t9moE
    
    // cxtp_IMbHuBypglAA9QXotbhPqJ6JnAtlKi // first trial
    
    // cxtp_EqPgCz27qnrOzvW3XLu8jM4mWkUszS
    
    // second trial cxtp_NuPhHPQNKsi29BqR2ACyIaDKpbD9SY
    
    // second source map cxtp_pCkaXil7wTFR56X3V1h13aYTEtgw9C
    
    private struct Keys {
        static let appVersion   = "APP_VERSION"
    }
    
    private struct Values {
        static let application      = "dazn_qa_app2"
    }
    
    func setConfig() {
        let domain = CoralogixDomain.EU2
        let options = CoralogixExporterOptions(coralogixDomain: domain,
                                               userContext: nil,
                                               environment: "qa",
                                               application: "dazn_qa_app",
                                               version: "1.0.0",
                                               publicKey: "cxtp_NuPhHPQNKsi29BqR2ACyIaDKpbD9SY",
                                               ignoreUrls: [],
                                               ignoreErrors: [],
                                               customDomainUrl: "",
                                               labels: ["String" : (Any).self],
                                               debug: true)
        
        coralogixRum = CoralogixRum(options: options)
        let userContext = UserContext(userId: "1234",
                                      userName: "Daffy Duck",
                                      userEmail: "daffy.duck@coralogix.com",
                                      userMetadata: ["age": "18", "profession" : "duck"])
        coralogixRum.setUserContext(userContext: userContext)
        
        coralogixRum.setLabels(labels: ["item3" : "playstation 4", "itemPrice" : 400])
        
        print("Coralogix in app is configured succesfull")
    }
    
    func info(_ message: String) {
        coralogixRum.log(severity: .info, message: message)
    }
    
    func warn(_ message: String) {
        coralogixRum.log(severity: .warn, message: message)
    }
    
    func error(_ error: Error) {
        coralogixRum.log(severity: .error, message: error.localizedDescription)
    }
    
}

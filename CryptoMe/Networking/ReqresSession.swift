//
//  ReqresSession.swift
//  CryptoMe
//
//  Created by Alimov Islom on 06/07/21.
//

import Moya
import Reqres

class ReqresSession: Session {
    static let shared: ReqresSession = {
        let configuration = ReqresSession()//ReqresSession(configuration: Reqres.defaultSessionConfiguration())
        return configuration
    }()
}

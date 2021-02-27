//
//  ContentView.swift
//  Shared
//
//  Created by Dal Rupnik on 11/13/20.
//

import iAd
import AdSupport
import AppTrackingTransparency
import SwiftUI

struct ContentView: View {
    var idfa : String? {
        return ASIdentifierManager.shared().advertisingIdentifier.uuidString
    }
    
    var idfv : String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    var attStatus : String {
        return String(ATTrackingManager.trackingAuthorizationStatus.rawValue)
    }
    
    var body: some View {
        VStack {
            Text("ATT")
            .padding()
            Text(attStatus)
            
            Text("IDFA")
            .padding()
            Text(idfa ?? "Unavailable")
            .padding()
            
            Text("IDFV")
            .padding()
            Text(idfv ?? "Unavailable")
            .padding()
            
            Button(action: {
                ATTrackingManager.requestTrackingAuthorization { status in
                    print("Whatever")
                }
            }) {
                Text("Request to track")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

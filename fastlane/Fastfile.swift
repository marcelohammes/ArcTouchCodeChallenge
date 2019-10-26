// This file contains the fastlane.tools configuration
// You can find the documentation at https://docs.fastlane.tools
//
// For a list of all available actions, check out
//
//     https://docs.fastlane.tools/actions
//

import Foundation

class Fastfile: LaneFile {
	func crashlyticsLane() {
	desc("Submit a new Beta Build to Crashlytics.")
		
        incrementBuildNumber()
        
        let version = getVersionNumber(xcodeproj: "ArcTouchCodeChallenge.xcodeproj")
        
        gym(scheme: "ArcTouchCodeChallenge", exportMethod: "development")
        
        let emails = "marcelo.hammes@me.com"
        
        crashlytics(
            apiToken: "64b583a4adb1673507152ff9c511ee9bf8dfc386",
            buildSecret: "1c830720c9c12122f07f78ad6770431b1cff9c591079429cf74fc73393528ba9",
            emails: emails,
            notifications: true
        )
	}
    
    func testLane() {
        desc("Submit a new Beta Build to Crashlytics.")
        // add actions here: https://docs.fastlane.tools/actions
        scan(scheme: "ArcTouchCodeChallenge")
    }
}

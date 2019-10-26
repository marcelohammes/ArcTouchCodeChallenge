# ArcTouchCodeChallenge
# Special build instructions

- Before run the project, open the terminal, access the project's folder and run 'pod install'. This command will download all third-party libraries to the project.
- If desire, open the file './fastlane/Fastfile.swift' to customize the lanes to deploy the app to Crashlytics.
- If desire, change the Team and Provisiong Profile to run in real devices or deploy the app from XCode.


# THIRD-PARTY LIBRARIES

All the third-party libraries are in Podfile, there are:

    - Alamofire: This library is used to call requests to APIs.
    - RealmSwift: Realm is a local database. I used to persist the favorites movies.
    - ObjectMapper: ObjectMapper is a library to parse JSON to swift objects.
    - AlamofireObjectMapper: This library helps ObjectMapper to integrate with Alamofire.
    - Kingfisher: This library manages and download images from URL and cache it.
    - SnapKit: A library to help make views from code. Snapkit makes layout constraints easily.
    - R.swift: This library organize assets and resources and helps to access it.
    - JGProgressHUD: A component to make spinners and loaders more beautiful.
    - Toast-Swift: A component to show Toasts. Used to show messages like erros and feedbacks to the user.
    - IGListKit: A optimized collection view, developed by Instagram, and helps to update only cells that had changed. I used this library in the movies list.
    - Reusable: A little library to helps the use of reusables for tableviews and collectionviews.
    - Cosmos: A component to show the movie rating with stars images inside of movie details.
    - Fabric: Used to track events and monitore the app uses.
    - Crashlytics: Used to get crashes and deploy app to testers.
    - SwiftLint: A library to force rules to clean code.


# DECISIONS EXPLANATION:

I decided to use IGListKit for gain performance in movies list.

At the beginning I thought about using Reactive Programming, but I did a research and it seems that IGListKit is not friendly with this paradigm. I thought the pros of IGListKit was major than RxSwift or ReactiveSwift.

I prefered to use views made by code to get a better performance. Another point is to work with a multiple developers in a same project (Manage conflicts on Interface Builder files is terrible).
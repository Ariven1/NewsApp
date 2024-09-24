# NewsApp

MVVM Architecture
App is using MVVM Architecture and decomposition.

PersistentStorage
- I am creating to coredata stack using Singleton Design Pattern, This helps in keeping the code separate from AppDelegate which helps us avoid accessing Life cycle method.
- We are storing the bookmarks to coredata.

HttpUtility
- Using Generic & Decodable to create a reusable GET and POST methods.

LazyImageView
- It download the images on background thread which allows smooth scrolling of tableView.
- It also uses NSCache to store the image in cache to avoid repeated download of image which minimizing users internet usage.

Common
- Avoided using hardcoded String wherever possible and everything is managed in this Common.swift file

Unit Test
- Written unit test cases for NewsAPI and Coredata

App Functionality
- Landing screen will show a list of news
- On top right of landing screen you have category selection option, default is business
- On click of each news you will be navigated to Details screen, where you can read the complete news along with you can Bookmark the news for later reading.
- On Details screen if the news content is big the screen will enable scrolling dynamically to support the big content.
- No third party library used.

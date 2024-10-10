# RecipeApp
A sample application demonstrating the core usage of MVVM, SwiftUI, Swift, Swift Concurrency (using try await and async), and more. The app renders a list of recipes fetched from an external endpoint containing a JSON file.

# Version
0.1

# Steps to Run the App
To launch the project, simply open the app file. The application will display a list of recipes retrieved from the following endpoint: https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json

# Focus Areas: 
Reliability: The code is designed for scalability and maintainability.

Performance: Swift concurrency is used for async processes, replacing closures with task groups, async, and await for cleaner, more readable code that mimics synchronous behavior and reduces nesting.

Error Handling: Basic error handling is implemented with try/catch for network-related issues.

UI: Built with SwiftUI and the MVVM pattern, the app features declarative syntax, real-time previews, reusable components, automatic device support, and responsive animations.

# Time Spent: 
I dedicated a total of 5 hours to developing this project with small breaks of 10-15min in-between hours, including time spent testing the application on my devices. Additionally, I allocated 2.5 hours to recreating the project using Swift and the older multi-threaded closure syntax for comparison (optional, not a requirement). The results demonstrated a clear performance improvement when using the SwiftUI framework, in addition to the numerous other advantages it offers, such as eliminating the need for storyboards.

# Trade-offs:
From a developer with majority of his experience developing in Swift (UIKit or AppKit) rather than SwiftUI I definitely encounter some trade-offs when using SwiftUI:

1. Complexity vs. Simplicity
Swift is more complex on its own, requireing more manual setup.

2. Control vs Convenience:
SwiftUI provides convenienice and easier UI code but does have limitations handling very low specific and low-level customizations.

3. Compatibility:
Swift works on older versions of iOS and macOS
SwiftUI is only available on newer OS versions (iOS 13, maxOS 10.15+), limiting support for older devices

Overall I still push a case for SwiftUI and projects being modernized to use it as it will only keep evolving and providing more features to faciliate app development.

# Weakest Part of the Project?
Every project has areas that could be improved, and in this case, I believe the weakest part might be the MVVM code pattern. While it works as intended, there is room for optimization, particularly in terms of using SwiftUI, scalability, and user experience. I am aware of this and have plans to address it in future iterations.

# External Code and Dependencies?
None

# Additional Information:
Iterating my excitement about the opportunity, once again, on working with the latest Apple development provides to developers, I hope other developers get the same motivation I get every time I start a new small sample project to showcase their abilities and thought process. I'm confident I can bring value to any team and would love to contribute to more projects at a larger scale.


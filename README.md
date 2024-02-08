1) Instructions to build and run.

This repo is based on an iOS project and the source code can help you to build iPhone/iPad (with some extra configuration) applications. 

**Open Xcode:**

Launch Xcode by clicking on its icon in the Applications folder or by searching for it in Spotlight.
**Open Your Project:**

Once Xcode is open, either open your project by selecting "Open another project..." from the welcome screen or choose "File" > "Open..." from the menu bar and navigate to your project directory.
**Choose the Target Device:**

After opening your project, you need to choose the target device for your app. This can be an iOS simulator or a physical iOS device connected to your Mac.
To select a simulator, click on the active scheme button in the Xcode toolbar (it looks like a device name or "Generic iOS Device"). Then, choose a simulator device from the list.
To run the app on a physical device, ensure that the device is connected to your Mac via a USB cable and unlocked. The device should appear in the active scheme dropdown menu.
**Configure Build Settings (if necessary):**

Review and configure project settings if needed. This includes the deployment target, build configurations, code signing settings, and other project-specific configurations.
**Resolve Dependencies (if applicable):**

If your project relies on third-party libraries or dependencies managed by CocoaPods, Carthage, or Swift Package Manager, ensure they are correctly integrated into your project.
Use the appropriate commands (pod installs for CocoaPods, Carthage update for Carthage, or swift package update for Swift Package Manager) to update and install dependencies if necessary.

**Build and Run:**

Once you've selected the target device and configured your project settings, you're ready to build and run your app.
Click on the "Run" button (a triangle icon) in the Xcode toolbar, or select "Product" > "Run" from the menu bar. Xcode will compile your project and launch the app on the selected device or simulator.
If prompted, unlock your device and trust the connected computer to proceed with app installation and debugging.
**Test Your App:**

Interact with your app in the simulator or on the device to ensure it functions as expected.
Use Xcode's debugging tools, such as breakpoints, the debugger console, and the inspector, to troubleshoot any issues.
**Deploy Your App (Optional):**

If you're ready to distribute your app, configure its signing and provisioning profiles in Xcode's project settings.
Archive your project by selecting "Product" > "Archive" from the menu bar. Follow the prompts to create an archive of your app.
Use Xcode's Organizer window to validate and distribute your app for ad hoc distribution, App Store submission, or testing with TestFlight.
**Keep Your Project Updated:**

Regularly update Xcode and your project dependencies to take advantage of the latest features, bug fixes, and security updates.
By following these steps, you can successfully build and run your already-created iOS project using Xcode.

Architecture overview and tech stack choices rationale.
Architecture is simple i am using MVVM at the moment for the app and to store data on the server I am using Firebase and for Authentication I am using Firebase Auth.

Things you would change if you had more time.
I will put more checks and I probably will use realtime integration with AI to generate Quizzes.

# Configuring Your App to Use Alternate App Icons

Add alternate app icons to your app, and let people choose which icon to display.

## Overview

The sample code project demonstrates how to configure your app so that people can change the icon that appears on the Home screen, in Spotlight, and elsewhere in the system.

People select an alternate icon in the app interface from a collection that you provide.

## Add Icon Assets for the Alternate Icons

For each alternate app icon, the project requires multiple image files that vary in size. The project organizes these files through icon assets under the asset catalog.

The system picks the correct icon image for the current context and target device from the set of options under each icon asset. This ensures that the appearance of the alternate icon remains consistent.

For information on configuring app icons in the asset catalog, see [Configuring Your App Icon](https://developer.apple.com/documentation/xcode/configuring-your-app-icon).

For design guidance, see [Human Interface Guidelines > App Icon](https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/app-icon).

## Configure the Asset Catalog Compiler

The system gathers information about the app's icons from the app's information property list file under the top-level key [`CFBundleIcons`](https://developer.apple.com/documentation/bundleresources/information_property_list/cfbundleicons). Xcode adds entries to this file for the icons the project specifies through build settings under Asset Catalog Compiler - Options.

For each icon asset that the project specifies by name in the build setting Alternate App Icon Sets, Xcode adds an entry under the key [`CFBundleAlternateIcons`](https://developer.apple.com/documentation/bundleresources/information_property_list/cfbundleicons/cfbundlealternateicons).

Xcode enters the name of the primary app icon asset specified in the build setting Primary App Icon Set Name under the key [`CFBundlePrimaryIcon`](https://developer.apple.com/documentation/bundleresources/information_property_list/cfbundleicons/cfbundleprimaryicon). This setting is also available through the App Icons and Launch Images section of the General pane.

For more information on build settings, see [Build Settings Reference](https://developer.apple.com/documentation/xcode/build-settings-reference).

## Change the App's Icon

When people select an alternate icon in the app interface, the app calls [`setAlternateIconName(_:completionHandler:)`](https://developer.apple.com/documentation/uikit/uiapplication/2806818-setalternateiconname) with the name of the new icon. This tells the system to display the new icon for this app. The system automatically displays an alert notifying people of the change. Passing `nil` displays the app's primary icon.

``` swift
UIApplication.shared.setAlternateIconName(iconName) { (error) in
    if let error = error {
        print("Failed request to update the app’s icon: \(error)")
    }
}
```
[View in Source](x-source-tag://setAlternateAppIcon)

The current icon's name is available through the property [`alternateIconName`](https://developer.apple.com/documentation/uikit/uiapplication/2806808-alternateiconname).

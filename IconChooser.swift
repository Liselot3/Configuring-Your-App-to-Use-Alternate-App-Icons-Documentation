/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying the selected icon and a collection of alternate icons from which you can make a selection.
*/

import SwiftUI

struct IconChooser: View {
    @EnvironmentObject var model: Model

    var body: some View {
        let columns = [
            GridItem(),
            GridItem(),
            GridItem()
        ]

        VStack {
            HStack {
                Text("Select an icon:")
                    .font(.title)
                IconImage(icon: model.appIcon)
                    .frame(maxHeight: 100)
            }
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(Icon.allCases) { icon in
                        Button {
                            model.setAlternateAppIcon(icon: icon)
                        } label: {
                            IconImage(icon: icon)
                        }
                    }
                }
            }
        }
    }
}

struct IconChooser_Previews: PreviewProvider {
    static var previews: some View {
        IconChooser()
            .environmentObject(Model())
    }
}

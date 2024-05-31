//
//  ContentView.swift
//  CustomSheets_May2024
//
//  Created by mac on 31/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var isShowingMediumModal = false
    @State var isShowingLargeModal = false
    @State var isShowingFractionalModal = false
    @State var isShowingCustomHeightModal = false
    @State var isShowingMultipleHeightModal = false
    @State var isShowingDynamicDetent = false
    
    var body: some View {
        List {
            Button("Medium Modal") {
                isShowingMediumModal.toggle()
            }
            Button("Large Modal") {
                isShowingLargeModal.toggle()
            }
            Button("Fractional Modal") {
                isShowingFractionalModal.toggle()
            }
            Button("Custom Height Modal") {
                isShowingCustomHeightModal.toggle()
            }
            Button("Multiple Height Modal") {
                isShowingMultipleHeightModal.toggle()
            }
            Button("Dynamic Height Modal") {
                isShowingDynamicDetent.toggle()
            }
        }
        .sheet(isPresented: $isShowingMediumModal, content: {
            ModalView()
            // this gives us a modal that takes up about half the height of the screen
                .presentationDetents([.medium])
        })
        .sheet(isPresented: $isShowingLargeModal, content: {
            ModalView()
            // this gives us a modal that takes the same amount of space as an unmodified sheet
                .presentationDetents([.large])
        })
        .sheet(isPresented: $isShowingFractionalModal, content: {
            ModalView()
            // this gives us a modal that takes up 20% of the screens height
                .presentationDetents([.fraction(0.2)])
        })
        .sheet(isPresented: $isShowingCustomHeightModal, content: {
            ModalView()
            // this gives us a modal that takes up exactly 100 pixels of height
                .presentationDetents([.height(100)])
        })
        .sheet(isPresented: $isShowingMultipleHeightModal, content: {
            ModalView()
            // This gives us a modal that starts at 100 pixels tall
            // and displays a grab bar at the top of the modal.
            // The grab bar will allow the user to pull the modal up to the medium height,
            // and then up to the full height or back down.
            // Passing multiple size options is great for accessibility and usability of a partial modal
                .presentationDetents([.height(100), .medium, .large])
        })
        .sheet(isPresented: $isShowingDynamicDetent, content: {
            ModalView()
            // This is a custom option,
            // be sure to check out the code block below this section to learn more
                .presentationDetents([.dynamicDetent])
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

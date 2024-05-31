//
//  ModalView.swift
//  CustomSheets_May2024
//
//  Created by mac on 31/05/24.
//

import SwiftUI

import SwiftUI

struct ModalView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.ignoresSafeArea(edges: .all)
                
                ScrollView {
                    Text("Hello from the modal view!")
                        .bold()
                        .foregroundStyle(.white)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .tint(.white)
                })
            }
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}

struct DynamicDetentHeight: CustomPresentationDetent {
    static func height(in context: Context) -> CGFloat? {
        switch context.dynamicTypeSize {
        case .accessibility1:
            return 120
        case .accessibility2:
            return 140
        case .accessibility3:
            return 160
        case .accessibility4:
            return 180
        case .accessibility5:
            return 200
        default:
            return 100
        }
    }
}

extension PresentationDetent {
    static let dynamicDetent = Self.custom(DynamicDetentHeight.self)
}

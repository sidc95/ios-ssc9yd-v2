//
//  IconLabelStyle.swift
//  Bucket List SSC9YD
//
//  Created by Sid on 11/4/22.
//

import SwiftUI

struct IconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
            configuration.title

        }
    }
}

extension LabelStyle where Self == IconLabelStyle {
    static var styleIcon: Self { Self() }
}

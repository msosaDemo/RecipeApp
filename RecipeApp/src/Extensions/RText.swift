//
//  Label.swift
//  Weather
//
//  Created by Mauricio Pimienta on 9/19/24.
//

import SwiftUI

struct RTextModifiers {
    
    struct Header: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(Font.REGULAR)
                .bold()
                .foregroundColor(Color.RGrayColor)
                .shadow(radius: 5)
        }
    }
    
    struct Small: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(Font.SMALL)
                .foregroundColor(Color.RGrayColor)
        }
    }
    
    struct Regular: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(Font.REGULAR)
                .bold()
                .foregroundColor(Color.RGrayColor)
        }
    }
    
    struct Large: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(Font.LARGE)
                .bold()
                .foregroundColor(Color.RGrayColor)
        }
    }
    
    struct Splash: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(Font.SPLASH)
                .bold()
                .foregroundColor(Color.white)
                .shadow(radius: 5)
        }
    }
}

extension Text {
    
    func RTextHeader() -> some View {
        self.modifier(RTextModifiers.Header())
    }
    
    func RTextSmall() -> some View {
        self.modifier(RTextModifiers.Small())
    }
    
    func RTextRegular() -> some View {
        self.modifier(RTextModifiers.Regular())
    }
    
    func RTextLarge() -> some View {
        self.modifier(RTextModifiers.Large())
    }
    
    func RTextSplash() -> some View {
        self.modifier(RTextModifiers.Splash())
    }
    
}

extension Font {
    static let SMALL = Font.custom("Avenir-Light", size: 14)
    static let REGULAR = Font.custom("Avenir", size: 18)
    static let LARGE = Font.custom("Avenir-Bold", size: 24)
    static let SPLASH = Font.custom("Avenir", size: 32)
    
}

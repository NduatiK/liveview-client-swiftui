//
//  NavigationLink.swift
//  LiveViewNative
//
//  Created by Shadowfacts on 6/13/22.
//

import SwiftUI
import Combine

/// A control users can tap to navigate to another live view.
///
/// This only has an effect if the ``LiveSessionConfiguration`` was configured with navigation enabled.
///
/// ```html
/// <NavigationLink destination={"/products/#{@product.id}"}>
///     <Text>More Information</Text>
/// </NavigationLink>
/// ```
///
/// ## Attributes
/// - ``destination``
/// - ``disabled``
@_documentation(visibility: public)
@available(iOS 16.0, *)
struct NavigationLink<R: RootRegistry>: View {
    @ObservedElement private var element: ElementNode
    @LiveContext<R> private var context
    
    /// The URL of the destination live view, relative to the current live view's URL.
    @_documentation(visibility: public)
    @Attribute("destination") private var destination: String
    /// Whether the link is disabled.
    @_documentation(visibility: public)
    @Attribute("disabled") private var disabled: Bool
    
    var url: URL {
        URL(string: destination, relativeTo: context.coordinator.url)!.appending(path: "").absoluteURL
    }
    
    @ViewBuilder
    public var body: some View {
        SwiftUI.NavigationLink(
            value: LiveNavigationEntry(
                url: url,
                coordinator: LiveViewCoordinator(session: context.coordinator.session, url: url)
            )
        ) {
            context.buildChildren(of: element)
        }
        .disabled(disabled)
    }
}

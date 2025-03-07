//
//  LiveSessionConfiguration.swift
//  LiveViewNative
//
//  Created by Shadowfacts on 3/30/22.
//

import SwiftUI

/// An object that configures the behavior of a ``LiveSessionCoordinator``.
public struct LiveSessionConfiguration {
    /// A closure that is invoked by the coordinator to get the parameters that should be sent to the server when the live view connects.
    ///
    /// The closure receives the URL of the live view being connected to. If live navigation is performed, it will be invoked multiple times with different URLs.
    ///
    /// By default, no connection params are provided.
    public var connectParams: ((URL) -> [String: Any])? = nil
    
    /// The URL session the coordinator will use for performing HTTP and socket requests. By default, this is the shared session.
    public var urlSession: URLSession = .shared
    
    /// The transition used when the live view changes connects.
    public var transition: AnyTransition?
    
    /// Constructs a default, empty configuration.
    public init() {
    }
    
    public init(
        connectParams: ((URL) -> [String: Any])? = nil,
        urlSession: URLSession = .shared,
        transition: AnyTransition? = nil
    ) {
        self.connectParams = connectParams
        self.urlSession = urlSession
        self.transition = transition
    }
}

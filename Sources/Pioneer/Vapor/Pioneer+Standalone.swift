//
//  Pioneer+Standalone.swift
//  pioneer
//
//  Created by d-exclaimation on 00:02.
//

import struct Vapor.Middlewares
import class Vapor.Application
import class Vapor.CORSMiddleware
import class Vapor.ErrorMiddleware
import enum Vapor.PathComponent
import enum Vapor.HTTPMethod
import enum Vapor.HTTPBodyStreamStrategy

extension Pioneer {

    /// Create an instance of Vapor server to run Pioneer
    /// - Parameters:
    ///   - middleware: The Vapor Middleware to be used
    ///   - port: Port number for the server
    ///   - host: Hostname for the server
    ///   - env: Environment mode ("development", "production", "testing")
    ///   - cors: CORS Configuration for the standalone server
    internal func vaporServer(
        middleware: VaporGraphQLMiddleware,
        port: Int = 4000, 
        host: String = "127.0.0.1", 
        env: String = "development",
        cors: CORSMiddleware.Configuration? = nil
    ) throws {
        let app = try Application(
            .specified(port: port, host: host, env: env)
        )

        defer {
            app.shutdown()
        }

        app.logger = .init(label: "pioneer-graphql")
        app.middleware.use(middleware)

        if let cors = cors {
            app.middleware.use(CORSMiddleware(configuration: cors), at: .beginning)
        }

        try app.run()
    }

    /// Create and run a standalone server with Pioneer
    /// - Parameters:
    ///   - port: Port number for the server
    ///   - host: Hostname for the server
    ///   - env: Environment mode ("development", "production", "testing")
    ///   - path: The path components where GraphQL should be operated
    ///   - body: The body streaming strategy
    ///   - context: HTTP context builder
    ///   - websocketContext: WebSocket context builder
    ///   - websocketGuard: WebSocket connection guard
    ///   - cors: CORS Configuration for the standalone server
    public func standaloneServer(
        port: Int = 4000, 
        host: String = "127.0.0.1", 
        env: String = "development",
        at path: PathComponent = "graphql",
        body: HTTPBodyStreamStrategy = .collect, 
        context: @escaping VaporHTTPContext,
        websocketContext: @escaping VaporWebSocketContext,
        websocketGuard: @escaping VaporWebSocketGuard = { _, _ in },
        cors: CORSMiddleware.Configuration? = nil
    ) throws {
        try vaporServer(
            middleware: vaporMiddleware(
                body: body, 
                at: path, 
                context: context, 
                websocketContext: websocketContext, 
                websocketGuard: websocketGuard
            ),
            port: port,
            host: host,
            env: env,
            cors: cors
        )
    }

    /// Create and run a standalone server with Pioneer
    /// - Parameters:
    ///   - port: Port number for the server
    ///   - host: Hostname for the server
    ///   - env: Environment mode ("development", "production", "testing")
    ///   - path: The path components where GraphQL should be operated
    ///   - body: The body streaming strategy
    ///   - context: HTTP context builder
    ///   - websocketGuard: WebSocket connection guard
    ///   - cors: CORS Configuration for the standalone server
    public func standaloneServer(
        port: Int = 4000, 
        host: String = "127.0.0.1", 
        env: String = "development",
        at path: PathComponent = "graphql",
        body: HTTPBodyStreamStrategy = .collect, 
        context: @escaping VaporHTTPContext,
        websocketGuard: @escaping VaporWebSocketGuard = { _, _ in },
        cors: CORSMiddleware.Configuration? = nil
    ) throws {
        try vaporServer(
            middleware: vaporMiddleware(
                body: body, 
                at: path, 
                context: context, 
                websocketGuard: websocketGuard
            ),
            port: port,
            host: host,
            env: env,
            cors: cors
        )
    }

    /// Create and run a standalone server with Pioneer
    /// - Parameters:
    ///   - port: Port number for the server
    ///   - host: Hostname for the server
    ///   - env: Environment mode ("development", "production", "testing")
    ///   - path: The path components where GraphQL should be operated
    ///   - body: The body streaming strategy
    ///   - websocketGuard: WebSocket connection guard
    ///   - cors: CORS Configuration for the standalone server
    public func standaloneServer(
        port: Int = 4000, 
        host: String = "127.0.0.1", 
        env: String = "development",
        at path: PathComponent = "graphql",
        body: HTTPBodyStreamStrategy = .collect, 
        websocketGuard: @escaping VaporWebSocketGuard = { _, _ in },
        cors: CORSMiddleware.Configuration? = nil
    ) throws where Context == Void {
        try vaporServer(
            middleware: vaporMiddleware(
                body: body, 
                at: path, 
                websocketGuard: websocketGuard
            ),
            port: port,
            host: host,
            env: env,
            cors: cors
        )
    }

    /// Create and run a standalone server with Pioneer
    /// - Parameters:
    ///   - port: Port number for the server
    ///   - host: Hostname for the server
    ///   - env: Environment mode ("development", "production", "testing")
    ///   - path: The path components where GraphQL should be operated
    ///   - body: The body streaming strategy
    ///   - context: HTTP context builder
    ///   - websocketContext: WebSocket context builder
    ///   - websocketGuard: WebSocket connection guard
    ///   - cors: CORS Configuration for the standalone server
    public func standaloneServer(
        port: Int = 4000, 
        host: String = "127.0.0.1", 
        env: String = "development",
        at path: [PathComponent],
        body: HTTPBodyStreamStrategy = .collect, 
        context: @escaping VaporHTTPContext,
        websocketContext: @escaping VaporWebSocketContext,
        websocketGuard: @escaping VaporWebSocketGuard = { _, _ in },
        cors: CORSMiddleware.Configuration? = nil
    ) throws {
        try vaporServer(
            middleware: vaporMiddleware(
                body: body, 
                at: path, 
                context: context, 
                websocketContext: websocketContext, 
                websocketGuard: websocketGuard
            ),
            port: port,
            host: host,
            env: env,
            cors: cors
        )
    }

    /// Create and run a standalone server with Pioneer
    /// - Parameters:
    ///   - port: Port number for the server
    ///   - host: Hostname for the server
    ///   - env: Environment mode ("development", "production", "testing")
    ///   - path: The path components where GraphQL should be operated
    ///   - body: The body streaming strategy
    ///   - context: HTTP context builder
    ///   - websocketGuard: WebSocket connection guard
    ///   - cors: CORS Configuration for the standalone server
    public func standaloneServer(
        port: Int = 4000, 
        host: String = "127.0.0.1", 
        env: String = "development",
        at path: [PathComponent],
        body: HTTPBodyStreamStrategy = .collect, 
        context: @escaping VaporHTTPContext,
        websocketGuard: @escaping VaporWebSocketGuard = { _, _ in },
        cors: CORSMiddleware.Configuration? = nil
    ) throws {
        try vaporServer(
            middleware: vaporMiddleware(
                body: body, 
                at: path, 
                context: context, 
                websocketGuard: websocketGuard
            ),
            port: port,
            host: host,
            env: env,
            cors: cors
        )
    }

    /// Create and run a standalone server with Pioneer
    /// - Parameters:
    ///   - port: Port number for the server
    ///   - host: Hostname for the server
    ///   - env: Environment mode ("development", "production", "testing")
    ///   - path: The path components where GraphQL should be operated
    ///   - body: The body streaming strategy
    ///   - websocketGuard: WebSocket connection guard
    ///   - cors: CORS Configuration for the standalone server
    public func standaloneServer(
        port: Int = 4000, 
        host: String = "127.0.0.1", 
        env: String = "development",
        at path: [PathComponent],
        body: HTTPBodyStreamStrategy = .collect, 
        websocketGuard: @escaping VaporWebSocketGuard = { _, _ in },
        cors: CORSMiddleware.Configuration? = nil
    ) throws where Context == Void {
        try vaporServer(
            middleware: vaporMiddleware(
                body: body, 
                at: path, 
                websocketGuard: websocketGuard
            ),
            port: port,
            host: host,
            env: env,
            cors: cors
        )
    }
}
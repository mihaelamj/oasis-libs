//
//  CommandLineToolTests.swift
//
//
//  Created by Mihaela MJ on 03.04.2024..
//

import XCTest
@testable import CommandLineTool

final class CommandLineToolTests: XCTestCase {
    
    func testHelpCommand() {
        // Setup
        let args = ["--help"]
        
        // Capture the output
        
        // Act
        CommandLineTool.run(withArguments: args)
        
        // Assert
        // Verify that `printUsage` was called. This might require you to mock the output to capture the print statements.
    }
    
    func testGenerateIntWithNoArguments() {
        // Setup
        let args = ["int"]
        
        // Capture the output
        
        // Act
        CommandLineTool.run(withArguments: args)
        
        // Assert
        // Verify that an integer was printed. This requires capturing the output.
    }
    
    func testGenerateStringsWithCount() {
        // Setup
        let args = ["string[3]"]
        
        // Capture the output
        
        // Act
        CommandLineTool.run(withArguments: args)
        
        // Assert
        // Verify that three strings separated by commas were printed. This also requires output capture.
    }
    
    func testUnsupportedCommand() {
        // Setup
        let args = ["unsupported"]
        
        // Capture the output
        
        // Act
        CommandLineTool.run(withArguments: args)
        
        // Assert
        // Verify that the usage instructions were printed, indicating an unsupported command.
    }
    
    // Additional tests can follow a similar structure, adjusting `args` and the assertions accordingly.
}

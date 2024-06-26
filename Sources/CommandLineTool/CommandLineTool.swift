//
//  CommandLineTool.swift
//
//
//  Created by Mihaela MJ on 24.03.2024..
//

import Foundation
import ArgumentParser
import StuffGenerator

struct CommandLineTool {
    
    /// Runs the command line tool, processing the arguments provided.
    /// - Parameter args: An optional array of strings representing the arguments. If `nil`, defaults to `CommandLine.arguments.dropFirst()`.
    static func run(withArguments args: [String]? = nil) {
        let arguments = args ?? Array(CommandLine.arguments.dropFirst())
        
        // If no arguments or help is requested, print usage instructions.
        if arguments.isEmpty || arguments.contains("--help") {
            printUsage()
            return
        }
        
        // Process each argument
        for arg in arguments {
            let (command, count) = ArgumentParser.parseCLIArgument(arg)
            
            switch command {
            case .int:
                processIntCommand(count: count)
            case .string:
                processStringCommand(count: count)
            default:
                print("Unsupported command: \(arg)")
                printUsage()
            }
        }
    }

    /// Processes the 'int' command, generating and printing integers.
    /// - Parameter count: The optional count of integers to generate.
    private static func processIntCommand(count: Int?) {
        if let count = count {
            let numbers = StuffGenerator.generateInts(count: count)
            print(numbers)
        } else {
            let number = StuffGenerator.generateInt()
            print(number)
        }
    }
    
    /// Processes the 'string' command, generating and printing strings.
    /// - Parameter count: The optional count of strings to generate.
    private static func processStringCommand(count: Int?) {
        if let count = count {
            let strings = StuffGenerator.generateStrings(count: count)
            print(strings.joined(separator: ", "))
        } else {
            let string = StuffGenerator.generateString()
            print(string)
        }
    }
    
    /// Prints usage instructions for the tool.
    private static func printUsage() {
        let usage = """
        Usage:
          --help                  Show this help message.
          --server                Start the web server.
          int                     Generate a random integer.
          int[x]                  Generate an array of x random integers.
          string                  Generate a random string.
          string[x]               Generate an array of x random strings.
        
        Examples:
          CommandLineTool int
          CommandLineTool int[5]
          CommandLineTool string
          CommandLineTool string[3]
          CommandLineTool --server  Starts the web server.
        
        Use --server to start the web server, or provide commands to generate random integers or strings.
        """
        print(usage)
    }
}

/**
 // Entry point for the command-line tool
 CommandLineTool.run()
 ```
 ### Running the CommandLineTool

 ```bsh
 .build/debug/YourSwiftPackage --help
 .build/debug/YourSwiftPackage int[10] string[5]
 ```
 
 -- yml -my.yml
 
 /int[1000] /page:3
 */

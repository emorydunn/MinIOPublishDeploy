//
//  MinIOPublishDeploy.swift
//
//
//  Created by Emory Dunn on 6/27/20.
//

import Foundation
import Publish
import ShellOut
import Files

public extension DeploymentMethod {
    
    /// Deploy a website to a specified S3 Bucket
    /// - Parameters:
    /// - Parameters:
    ///   - alias: Alias of the MinIO host
    ///   - path: Path to upload files to
    ///   - mcBinary: Path to the `mc` binary
    static func minio(_ alias: String, path: String, pathToMCBinary binPath: String = "/usr/local/bin/mc")  -> Self {
        
        Self(name: "MinIO \(alias)") { context in
            let deploymentFolder = try! context.createDeploymentFolder(withPrefix: "minio-") { _ in }
            
            do {
                try shellOut(
                    to: "\(binPath) mirror --remove --overwrite -q -no-color . \(alias)\(path)",
                    at: deploymentFolder.path
                )
                try deploymentFolder.empty()
            } catch let error as ShellOutError {
                throw PublishingError(infoMessage: error.message)
            } catch {
                throw error
            }
            
        }
        
    }
}


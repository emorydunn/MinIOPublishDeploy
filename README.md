# MinIOPublishDeploy

A deployment method for [Publish](https://github.com/JohnSundell/Publish) to upload files to a MinIO server. 

## Installation

The plugin used the `mc` client and requires your server be configured. 

Download the [client](https://min.io/download) and see [configuration instructions](https://docs.min.io/docs/minio-client-quickstart-guide.html).  


## Usage

```swift
import MinIOPublishDeploy

...
try Website().publish(using: [
    ...
    .minio("host-alias", path: "/sites/data/example.com/"),
])
```
By default the plugin assumes the binary is located at `/usr/local/bin/mc`, but can be customized with `binPath`. 

The plugin mirrors the output directory to the remote location with the following options: 

- `mirror` 
- `--remove` 
- `--overwrite` 
- `-q` 
- `-no-color`

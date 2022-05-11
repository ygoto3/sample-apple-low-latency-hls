# sample-apple-low-latency-hls

A sample Apple low-latency HLS environment using Go.

# Requirements

- macOS
- [Apple's HTTP Live Streaming Tools](https://developer.apple.com/download/all/?q=hls)
    - tsrecompressor
    - mediastreamsegmenter
    - ll-hls-origin-example.go
        - should be in /usr/local/share/hlstools after installation
- Go
    - to run ll-hls-origin-example.go
- openssl
    - to create a self-signed certificate

# Run

Go to the repository directory and copy `ll-hls-origin-example.go` there.

```sh
$ cd path_to_sample-apple-low-latency-hls
$ cp /usr/local/share/hlstools/ll-hls-origin-example.go .
```

Create a self-signed certificate if you need.

```sh
$ ./package_0_cert.sh
```

Answer questions from openssl on running `package_0_cert.sh`.  Example answers are below:

```sh
Country Name (2 letter code) [XX]:JP
State or Province Name (full name) []:Tokyo
Locality Name (eg, city) [Default City]:Shibuya
Organization Name (eg, company) [Default Company Ltd]:ExampleCompany
Organizational Unit Name (eg, section) []:
Common Name (eg, your name or your server's hostname) []:example.com
Email Address []:
 
Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
```

Files are to be generated in `./certs`.

- `certs/server.crt`
- `certs/server.csr`
- `certs/server.key`

Import the self-signed certificate in your Keychain. If you followed the example answers for `package_0_cert.sh`, you can follow the steps below:

1. Open `certs/server.crt` in Finder to install to the OS.
1. In Keychain Access, Select Default Keychains "login" -> Name "example.com" -> Trust -> When using this certificate: -> "Always Trust"

Add your server's hostname to `/etc/hosts`.  If you followed the example answers for `package_0_cert.sh`, you can run the command below:

```sh
$ sudo echo "127.0.0.1       example.com" >> /etc/hosts
```

Run the commands below in each terminal:

1. `./package_1_segmenter.sh`
1. `./package_2_segmenter.sh`
1. `./package_3_segmenter.sh`
1. `./package_4_segmenter.sh`
1. `./package_5_feed.sh`
1. `./package_6_origin.sh`

Go to

- [https://hls-js.netlify.app/demo/](https://hls-js.netlify.app/demo/?src=https%3A%2F%2Fexample.com%2Fplaylist.m3u8)

Enter "https://example.com/playlist.m3u8" in the custom URL input box if you followed the example answers for `package_0_cert.sh`.

Then your low-latency HLS video will be played via your webcam.

cp playlist.m3u8 package/playlist.m3u8
go run ll-hls-origin-example.go -certdir $PWD/certs -dir $PWD/package -http :443


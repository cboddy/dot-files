function FindProxyForURL(url, host) {
    isp = "PROXY ip_address:port; DIRECT";
    tor = "SOCKS 127.0.0.1:9050";
    if (shExpMatch(host,"*.onion")) {
        return tor;
    }
    return "DIRECT";
}


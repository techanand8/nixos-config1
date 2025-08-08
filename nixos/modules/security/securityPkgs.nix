{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    burpsuite
    wireshark
    # nmap
    zmap
    # Static Analysis
    jadx # Dex to Java decompiler
    apktool # APK decompiler
    bytecode-viewer
    dex2jar # APK to JAR converter
    # Network Analysis
    mitmproxy
    tcpdump
    # Dynamic Analysis

    frida-tools
    # Reverse Engineering
    radare2
    ghidra
    cutter
    # Utility Tools
    #jq
    xxd
    binwalk
    sqlite
    openssl
    #nmap
    metasploit

    #sandbox
    firejail
    bubblewrap
  ];
}

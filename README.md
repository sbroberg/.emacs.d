# .emacs.d
My emacs configuration
## Prerequisites:

For OSX:

1.  Install clang-format:

    `brew install clang-format`

2.  Install [rtags](https://github.com/Andersbakken/rtags):
3.  
        cd ~
        git clone https://github.com/Andersbakken/rtags.git
        cd rtags
        mkdir build
        cd build
        cmake ..
        make
        make install

3.  Set up rtags as a service.  Create the file (replacing /Users/stebro with your home dir):  ~/Library/LaunchAgents/com.andersbakken.rtags.agent.plist as:

        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
          <dict>
            <key>Label</key>
            <string>com.andersbakken.rtags.agent</string>
            <key>ProgramArguments</key>
            <array>
              <string>sh</string>
              <string>-c</string>
              <string>/usr/local/bin/rdm -v --launchd --inactivity-timeout 300 --log-file ~/Library/Logs/rtags.launchd.log</string>
            </array>
            <key>Sockets</key>
            <dict>
              <key>Listener</key>
              <dict>
            <key>SockPathName</key>
            <string>/Users/stebro/.rdm</string>
              </dict>
            </dict>
          </dict>
        </plist>

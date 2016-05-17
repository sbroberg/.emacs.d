# .emacs.d
My emacs configuration

Features include:

* cmake-ide: works automaticallly to configure other modes to work correctly when dealing with files in cmake projects.  Enables correct class/function navigation features for rtags, code completion with company, etc.

* company: auto-complete used in a variety of contexts.  Default mapping is <tab>

* yasnippet: similar to company, but instantiates templates from a library when tabbing off keywords.  e.g., type "switch" in a c/c++ file & hit <tab> - will expand to a switch statement with placeholders.  Tab between the placeholders & type actual values.

* flycheck: interactive syntax checker.  Works by default with a variety of languages; set up here to use rtags for the c++ validation (more sophistacted results than using the default c++ checker provided with flycheck).

* rtags: A service-based tool that compiles your c/cpp with clang and provides results to a number of other emacs modes.  Has features that don't even exist in graphical IDEs.  Browse the key bindings in a c++ file to see all the features, but the major stuff:

  * All symbol navigation/reference understanding overloading (!)n
  * M-. : jump to definition (jumps to declaration if already at defition)
  * M-, : list all references to that symbol (using helm to filter results)
  * <Apple>-<arrow> : Move back & forward through your jumping via M-. (mapped in smb-options.el)
  * rtags-compile-file : compiles current file only
  * rtags-preprocess-file : runs preprocessor on file or REGION (!)
  * rtags-rename-symbol : Does what it says on the tin.  Project-wide replace.
  * rtags-display-summary : tooltip showing definition & header comments
  * rtags-print-class-hierarchy : Shows descendants of class(es) in current buffer

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

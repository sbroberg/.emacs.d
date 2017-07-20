# .emacs.d
My emacs configuration

## Major Features

* cmake-ide: works automaticallly to configure other modes to work correctly when dealing with files in cmake projects.  Enables correct class/function navigation features for rtags, code completion with company, etc.

* company: auto-complete used in a variety of contexts.  Default mapping is <tab>

* yasnippet: similar to company, but instantiates templates from a library when tabbing off keywords.  e.g., type "switch" in a c/c++ file & hit <tab> - will expand to a switch statement with placeholders.  Tab between the placeholders & type actual values.

* flycheck: interactive syntax checker.  Works by default with a variety of languages; set up here to use rtags for the c++ validation (more sophistacted results than using the default c++ checker provided with flycheck).  For other languages, you may need to install an external tool to do the checking.  For example, there are at least three checkers that work with Python that use pylint, pflakes, or pycompile.  You need one of these in your path for these checkers to work.

* rtags: A service-based tool that compiles your c/cpp with clang and provides results to a number of other emacs modes.  Has features that don't even exist in graphical IDEs.  Browse the key bindings in a c++ file to see all the features, but the major stuff:

  * All symbol navigation/reference understanding overloading (!)n
  * rtags-reparse-file fixes most errors that might occur if rtags starts acting weird (usually due to a series of edits & undos that confuse its database)
  * M-. : jump to definition (jumps to declaration if already at defition)
  * M-, : list all references to that symbol (using helm to filter results)
  * \<Apple\>-\<arrow\> : Move back & forward through your jumping via M-. (mapped in smb-options.el)
  * rtags-compile-file : compiles current file only
  * rtags-preprocess-file : runs preprocessor on file or REGION (!)
  * rtags-rename-symbol : Does what it says on the tin.  Project-wide replace.
  * rtags-display-summary : tooltip showing definition & header comments
  * rtags-print-class-hierarchy : Shows descendants of class(es) in current buffer
  * rtags-create-doxygen-comment : creates a doxygen template for a function in a header

  * NOTE: some functions may be broken, such as rtags-make-member

* projectile: project-centric searching and navigation; some overlap with rtags

* helm: A replacement for dealing with browsable lists produced by many modes.  Basic idea is that you can type regexp directly in the buffer, or space-separated search conditions (where each item is and-ed with the others).  Replaces the idea of tab-completion in find-file; instead would use space instead of tab (and tab once you see that the item you want is at the top).  Many online promotional videos praising its functions.

* helm-swoop: like M-x occur, only with dynamic reduction of scope.  When using interactive search (C-s), M-i converts your searching into a swoop session.

* magit: git interface.  Pretty good.

* clang-format: Format your code with clang, using M-i.  Current config auto-formats code on save.

## Minor Features

* comment-dwim: repeately hit M-; to toggle through commenting/uncommenting modes.

* ws-butler: cleans up whitespace issues as you type

* iedit: Hit C-; on a symbol, will then allow you to interactively change all uses of it within the current function.

* volatile-highlights: briefly colors changes after cut/pastes/undo

* helm-ag: use the better grep tool ag with helm

## Prerequisites:

For OSX:

1.  Install clang-format:

    `brew install clang-format`

2.  Install [rtags](https://github.com/Andersbakken/rtags):
3.  
        cd ~
        git clone https://github.com/Andersbakken/rtags.git --recursive
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

4.  Install silver-searcher

    `brew install ag`

For Linux:

1.  Install misc tools
        sudo apt install silversearcher-ag
        
1.  Get the necessary libraries for rtags:

        sudo apt install llvm
        sudo apt install clang
        sudo apt install cmake
        sudo apt install libclang-dev
        sudo apt install zlib-dev
        sudo apt install libssl-dev

2.  Build rtags:
        cd ~
        git clone https://github.com/Andersbakken/rtags.git --recursive
        cd rtags
        mkdir build
        cd build
        cmake ..
        make
        make install

#!/usr/bin/expect
spawn expressvpn activate
expect "code:"
send "$env(ACTIVATION_CODE)\r"
expect "" { send "12\r" }
expect {
        "(y/N)"  {send "n\r"}
}
#expect eof


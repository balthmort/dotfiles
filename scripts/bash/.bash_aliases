export TERM=xterm-256color
# old wifi list command
alias wifi_old="sudo iwlist wlp3s0 scan | grep -i '\(ssid\|addre\|freque\|quality\)'"
# new wifi list command
alias wifi="sudo iwlist wlp3s0 scan | grep -i -e ssid -e addre -e ghz -e quality | sed 's/.*\(ress\|ency\|ID\): \?//g; s/.*uality=//g; s/ Signal level=//g' | tr '\n' ' ' | sed 's/\" /\"\n/g' | grep '\".*\"'"
# diconnects from actual wifi
alias wifidis="nmcli con down id \$(nmcli connection show --active | grep wlp3s0 | awk '{print \$1}')"
# reconnect to current wifi connection
function wifire {
_con=$(nmcli connection show --active | grep wlp3s0 | awk '{print $1}')
nmcli connection down id $_con
nmcli connection up id $_con
_con=
}
# go to hd mode
alias hd="xrandr --output eDP-1-1 --mode 1360x768"
# go to fullhd mode
alias fullhd="xrandr --output eDP-1-1 --mode 1920x1080"

# turns off wifi card
alias wifioff="nmcli radio wifi off"
# turns on wifi card
alias wifion="nmcli radio wifi on"
# connects to vpn
alias vpnon="nmcli con up id rubcovsk"
# disconnects from vpn
alias vpnoff="nmcli con down id rubcovsk"
# connects to vpn
alias svaon="nmcli con up id svarog"
# disconnects from vpn
alias svaoff="nmcli con down id svarog"
# home vnc
alias vnc="ssh -L 5905:localhost:5900 pc@outer x11vnc"
# work server vnc
alias vncfpfilko="ssh -L 5906:localhost:5900 fpfilko@fpfilko.local.czechglobe.cz x11vnc"
# fix unbreakable space in cpp file
alias cppfix="sed -i 's/\xc2\xa0/ /g'"

alias bak="cd ~/muni/6sem/bak/mywork/workdir"
alias svoc="cd ~/muni/6sem/bak/svoc/workdir"

# obsolete, use czf instead
function known_hosts_remove {
    if [ "x$1" != x ]; then
        sed -i "$1d" .ssh/known_hosts
    fi
}
 

if [ -f ~/.bash_aliases_cz ]; then
    . ~/.bash_aliases_cz
fi


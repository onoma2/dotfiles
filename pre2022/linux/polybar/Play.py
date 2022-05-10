import os

try :
    val = os.popen('playerctl status').read()
except :
    val = '0'
    pass;

if val == "Playing\n" :
    print("%{F#DFE1E8}%{F-}")
elif val == "Connection to player failed: No players found":
    print("no player")
else :
    print("")

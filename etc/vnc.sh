#!/bin/bash

sudo xrandr --addmode VIRTUAL1 1024x768

x0vncserver -display :0 -passwordfile ~/.vnc/passwd

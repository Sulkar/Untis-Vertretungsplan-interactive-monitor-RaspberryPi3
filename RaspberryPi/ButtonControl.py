import os
from gpiozero import Button
from signal import pause
from subprocess import check_call

# Function: use subprocess to reboot system
def reboot():
    check_call(['sudo', 'reboot'])

# Functions: xdotool for simulating ArrowKey presses
def arrowLeft():
    os.system("xdotool key Left")
def arrowRight():
    os.system("xdotool key Right")
def arrowUp():
    os.system("xdotool key Up")
def arrowDown():
    os.system("xdotool key Down")

# Function: Button presses
def ArrowKeyPressed(tempButton):
    if tempButton == "left":
        arrowLeft()
    elif tempButton == "right":
        arrowRight()
    elif tempButton == "up":
        arrowUp()
    elif tempButton == "down":
        arrowDown()

# define the 4 buttons and add a hold_time to one button for rebooting
buttonLeft = Button(4, hold_time=3)
buttonRight = Button(17)
buttonUp = Button(27)
buttonDown = Button(22)

# define gpiozero button presses -> lambda is used to pass parameters to the functions
buttonLeft.when_pressed = lambda : ArrowKeyPressed("left")
buttonLeft.when_held = reboot # button is pressed for 3 seconds -> call reboot function
buttonRight.when_pressed = lambda : ArrowKeyPressed("right")
buttonUp.when_pressed = lambda : ArrowKeyPressed("up")
buttonDown.when_pressed = lambda : ArrowKeyPressed("down")

pause()

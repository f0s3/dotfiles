import subprocess as shell

def execute(command):
  return shell.run(command, stdout=shell.PIPE, shell=True).stdout.decode("utf8")

def getTouchpadState():
  touchpadInverted = int(execute("synclient -l | grep 'TouchpadOff' | grep -o '.\{1\}$'"))
  newTouchpadState = 0
  if touchpadInverted == 0:
    newTouchpadState = 1
  elif touchpadInverted == 1:
    newTouchpadState = 0
  return newTouchpadState

def getTrackPointState():
  return int(execute("xinput list-props 'TPPS/2 IBM TrackPoint' | grep 'Device Enabled' | grep -o '.\{1\}$'"))

def toggleTouchpad():
  if getTouchpadState() == 0:
    execute("synclient TouchpadOff=0")
  else:
    execute("synclient TouchpadOff=1")

def toggleTrackPoint():
  if getTrackPointState() == 0:
    execute("xinput set-prop 'TPPS/2 IBM TrackPoint' 'Device Enabled' 1")
  else:
    execute("xinput set-prop 'TPPS/2 IBM TrackPoint' 'Device Enabled' 0")

if (getTouchpadState() == 1 and getTrackPointState() == 1):
  toggleTouchpad()
elif (getTouchpadState() == 0 and getTrackPointState() == 1):
  toggleTouchpad()
  toggleTrackPoint()
elif getTouchpadState() == 1 and getTrackPointState() == 0:
  toggleTrackPoint()
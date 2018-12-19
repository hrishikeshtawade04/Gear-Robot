# Gear Robot
</p>
<p align="center">
<img src="/youbot.jpg">
</p>
</p>

# Overview

This project utilizes V-REP, MATLAB and KUKA YOUBOT to simulate an AGV with a 6 DOF robotic arm for the gear picking application.

# Dependencies

- V-REP PRO EDU V3.5.0 rev4 [LINK](http://www.coppeliarobotics.com/downloads.html)
- MATLAB R2018b [LINK](https://www.mathworks.com/downloads/)

# Simulation instructions

## Running FK and IK code.
- The code named 'ForwardAndInverseKinematicsValidation.m' contains simulating FK and IK of YOUBOT and its validation.
- Open the 'Vrep_Demonstration.ttt' file in vrep.
- The open 'ForwardAndInverseKinematicsValidation.m'file in MATLAB.
- Press the play button in VREP.
- Press the run button in MATLAB.
- The robot will now move quickly to 2 different orientations.

>[NOTE:IF the robot doesn't move or there is any error then follow the instructions on this [LINK](https://www.youtube.com/watch?v=piI5wYEXUms) and replace the following files with the ones in your PC]
- remoteApi.dll
- remApi.m
- remoteApiProto.m
- simpleTest.m

## Running Demonstration code.
- Close the previous code and VREP environment or just press the stop button and the robot should now have gone to its initial position.
- Open the code 'FinalDemonstration.m'.
- Press the play button in VREP.
- Press RUN button in MATLAB.
- Now the robot will pick up the block on its platform and will move forward and rotate the arm and will place the block on the platform.

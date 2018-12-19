clc;
clear;
vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
vrep.simxFinish(-1); % just in case, close all opened connections
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);
if (clientID > -1 )
   disp("Connected");
   [returnCode,joint_0]=vrep.simxGetObjectHandle(clientID,'youBotArmJoint0',vrep.simx_opmode_blocking);
   [returnCode,joint_1]=vrep.simxGetObjectHandle(clientID,'youBotArmJoint1',vrep.simx_opmode_blocking);
   [returnCode,joint_2]=vrep.simxGetObjectHandle(clientID,'youBotArmJoint2',vrep.simx_opmode_blocking);
   [returnCode,joint_3]=vrep.simxGetObjectHandle(clientID,'youBotArmJoint3',vrep.simx_opmode_blocking);
   [returnCode,joint_4]=vrep.simxGetObjectHandle(clientID,'youBotArmJoint4',vrep.simx_opmode_blocking);
   [returnCode,gripper1]=vrep.simxGetObjectHandle(clientID,'youBotGripperJoint1',vrep.simx_opmode_blocking);
   [returnCode,gripper2]=vrep.simxGetObjectHandle(clientID,'youBotGripperJoint2',vrep.simx_opmode_blocking);
   [returnCode,wheel1]=vrep.simxGetObjectHandle(clientID,'rollingJoint_fr',vrep.simx_opmode_blocking);
   [returnCode,wheel2]=vrep.simxGetObjectHandle(clientID,'rollingJoint_fl',vrep.simx_opmode_blocking);
   [returnCode,wheel3]=vrep.simxGetObjectHandle(clientID,'rollingJoint_rr',vrep.simx_opmode_blocking);
   [returnCode,wheel4]=vrep.simxGetObjectHandle(clientID,'rollingJoint_rl',vrep.simx_opmode_blocking);
   i =0;
   % Get to postion to grab box
   while (i < 1000)
       i = i+1;
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_0,deg2rad(4),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_1,deg2rad(40),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_2,deg2rad(45),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_3,deg2rad(80),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_4,deg2rad(0),vrep.simx_opmode_oneshot);
   end
   
   i = 0;
   %Grab box
   while(i < 100)
       i = i+1;
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_0,deg2rad(3),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_1,deg2rad(40),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_2,deg2rad(45),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_3,deg2rad(80),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_4,deg2rad(0),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,gripper2,0.5,vrep.simx_opmode_oneshot); 
   end
   
   i = 0;
   % Pick up box
   while(i < 1000)
       i = i+1;
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_0,deg2rad(3),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_1,deg2rad(10),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_2,deg2rad(45),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_3,deg2rad(80),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_4,deg2rad(0),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,gripper2,0.5,vrep.simx_opmode_oneshot); 
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel1,0,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel2,0,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel3,0,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel4,0,vrep.simx_opmode_oneshot);
   end   
   % go ahead
   i = 0;
   while(i < 2500)
       i = i+1;
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_0,deg2rad(3),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_1,deg2rad(10),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_2,deg2rad(45),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_3,deg2rad(80),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_4,deg2rad(0),vrep.simx_opmode_oneshot);
        
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,gripper2,0.5,vrep.simx_opmode_oneshot); 
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel1,4.5,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel2,4.5,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel3,4.5,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel4,4.5,vrep.simx_opmode_oneshot);
   end 
   %stop
   i = 0   
   while(i < 1000)
       i = i+1;
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_0,deg2rad(20),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_1,deg2rad(10),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_2,deg2rad(40),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_3,deg2rad(10),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_4,deg2rad(0),vrep.simx_opmode_oneshot);
        
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,gripper2,0.5,vrep.simx_opmode_oneshot); 
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel1,0,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel2,0,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel3,0,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel4,0,vrep.simx_opmode_oneshot);
   end 
   %rotate
   i = 0;    
   while(i < 100)
       i = i+1;
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_0,deg2rad(50),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_1,deg2rad(50),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_2,deg2rad(50),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_3,deg2rad(10),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_4,deg2rad(0),vrep.simx_opmode_oneshot);
        
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,gripper2,0.5,vrep.simx_opmode_oneshot); 
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel1,0,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel2,0,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel3,0,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel4,0,vrep.simx_opmode_oneshot);
   end 
   
   i = 0;    
   while(i < 1000)
       i = i+1;
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_0,deg2rad(80),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_1,deg2rad(70),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_2,deg2rad(50),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_3,deg2rad(10),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_4,deg2rad(0),vrep.simx_opmode_oneshot);
        
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,gripper2,0.5,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,gripper1,0,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel1,0,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel2,0,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel3,0,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel4,0,vrep.simx_opmode_oneshot);
   end 
   
   i = 0;    
   while(1)
       i = i+1;
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_0,deg2rad(80),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_1,deg2rad(70),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_2,deg2rad(50),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_3,deg2rad(10),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointPosition(clientID,joint_4,deg2rad(0),vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,gripper1,0,vrep.simx_opmode_oneshot); 
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,gripper2,0,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,gripper1,0,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel1,0,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel2,0,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel3,0,vrep.simx_opmode_oneshot);
       [returnCode]=vrep.simxSetJointTargetVelocity(clientID,wheel4,0,vrep.simx_opmode_oneshot);
   end 
   vrep.simxFinish(-1);
end
vrep.delete();

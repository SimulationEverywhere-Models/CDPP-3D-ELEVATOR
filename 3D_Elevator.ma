[top]
components : 3delevator

[3delevator]
type : cell
dim : (100,80)
delay : inertial
defaultDelayTime : 100
border : wrapped

neighbors : 3delevator(-1,-1)       3delevator(-1,0)    3delevator(-1,1)
neighbors : 3delevator(0,-1)  		3delevator(0,0)  	3delevator(0,1)
neighbors : 3delevator(1,-1)        3delevator(1,0)     3delevator(1,1)

localtransition : elevator 

initialValue : 0
initialCellsValue : 3D_Elevator.val

%Cell Values: 	0: wall		51 ... 143: elevator		10: intersection
%Direction: 	1: up		2: down 	3: right		


% notes: 11: upward moving elevator (Y+)		12: downward moving elevator (Y-)
% notes: 13: right moving elevator (X+)			14: left moving elevator (X-)
% notes: 15: Depthgoing  elevator (Z+)			14: depthcomming elevator (Z-)

%Rules
[elevator]

% I am elevator moving up and I bump to ceiling, I turn to left 
%rule : {2 + (0,0)} 100 { (0,0)=51 or (0,0)=61 or (0,0)=71 or (0,0)=81 or (0,0)=91 or (0,0)=101 or (0,0)=111 or (0,0)=121 or (0,0)=131 or (0,0)=141 and ((-1,0)=0 or cellpos(0)=0)} 
% I am elevator moving down and I bump to the floor, I turn to left 
%rule : {1 + (0,0)} 100 { (0,0)=52 or (0,0)=62 or (0,0)=72 or (0,0)=82 or (0,0)=92 or (0,0)=102 or (0,0)=112 or (0,0)=122 or (0,0)=132 or (0,0)=142 and ((1,0)=0 or cellpos(0)=99)} 

% I am downward intersection cell and left of me is a moving right elevator cell, I become a downward or right moving elevator cell
rule : {(0,-1) - round(uniform(0,1))} 100 {((0,-1)=53 or (0,-1)=63 or (0,-1)=73 or (0,-1)=83 or (0,-1)=93 or (0,-1)=103 or (0,-1)=113 or (0,-1)=123 or (0,-1)=133 or (0,-1)=143) and (cellpos(0)=0 or cellpos(0)=50) and (cellpos(1)=20 or cellpos(1)=60)} 
% I am bottom downward intersection cell and left of me is a moving right elevator cell, I become a right moving elevator cell
rule : {(0,-1)} 100 {((0,-1)=53 or (0,-1)=63 or (0,-1)=73 or (0,-1)=83 or (0,-1)=93 or (0,-1)=103 or (0,-1)=113 or (0,-1)=123 or (0,-1)=133 or (0,-1)=143) and (cellpos(0)=99) and (cellpos(1)=20 or cellpos(1)=60)} 
% I am bottom downward intersection cell and above me is a downward moving elevator cell, I become a right moving elevator cell
rule : {(-1,0) + 1} 100 {((-1,0)=52 or (-1,0)=62 or (-1,0)=72 or (-1,0)=82 or (-1,0)=92 or (-1,0)=102 or (-1,0)=112 or (-1,0)=122 or (-1,0)=132 or (-1,0)=142) and (cellpos(0)=99) and (cellpos(1)=20 or cellpos(1)=60)} 
% I am downward intersection cell and above me is a downward moving elevator cell, I become a downward or right moving elevator cell
rule : {(-1,0) + round(uniform(0,1))} 100 {((-1,0)=52 or (-1,0)=62 or (-1,0)=72 or (-1,0)=82 or (-1,0)=92 or (-1,0)=102 or (-1,0)=112 or (-1,0)=122 or (-1,0)=132 or (-1,0)=142) and (cellpos(0)=50) and (cellpos(1)=20 or cellpos(1)=60)} 

% I am upward intersection cell and bellow me is a upward elevator cell, I become an upward or right moving elevator cell
rule : {(1,0) + if(round(uniform(0, 1))=0,0,2)} 100 {((1,0)=51 or (1,0)=61 or (1,0)=71 or (1,0)=81 or (1,0)=91 or (1,0)=101 or (1,0)=111 or (1,0)=121 or (1,0)=131 or (1,0)=141) and cellpos(0)=50 and (cellpos(1)=0 or cellpos(1)=40)} 
% I am top upward intersection cell and bellow me is an upward elevator cell, I become a right moving elevator cell
rule : {(1,0) + 2} 100 {((1,0)=51 or (1,0)=61 or (1,0)=71 or (1,0)=81 or (1,0)=91 or (1,0)=101 or (1,0)=111 or (1,0)=121 or (1,0)=131 or (1,0)=141) and cellpos(0)=0 and (cellpos(1)=0 or cellpos(1)=40)} 
% I am top upward intersection cell and left of me is a right moving elevator cell, I become a right moving elevator cell
rule : {(0,-1)} 100 {((0,-1)=53 or (0,-1)=63 or (0,-1)=73 or (0,-1)=83 or (0,-1)=93 or (0,-1)=103 or (0,-1)=113 or (0,-1)=123 or (0,-1)=133 or (0,-1)=143) and cellpos(0)=0 and (cellpos(1)=0 or cellpos(1)=40)} 
% I am upward intersection cell and left of me is a moving right elevator cell, I become an upward or right moving elevator cell
rule : {(0,-1) - if(round(uniform(0, 1))=0,0,2)} 100 {((0,-1)=53 or (0,-1)=63 or (0,-1)=73 or (0,-1)=83 or (0,-1)=93 or (0,-1)=103 or (0,-1)=113 or (0,-1)=123 or (0,-1)=133 or (0,-1)=143) and (cellpos(0)=50 or cellpos(0)=99) and (cellpos(1)=0 or cellpos(1)=40)} 


% I am empty cell and bellow me is a moving up elevator cell, I become moving up elevator
rule : {(1,0)} 100 { (1,0)=51 or (1,0)=61 or (1,0)=71 or (1,0)=81 or (1,0)=91 or (1,0)=101 or (1,0)=111 or (1,0)=121 or (1,0)=131 or (1,0)=141}% and (0,0)=20 } %for now don't check if I'm empty
% I am empty cell and above me is a moving down elevator cell, I become moving down elevator
rule : {(-1,0)} 100 { (-1,0)=52 or (-1,0)=62 or (-1,0)=72 or (-1,0)=82 or (-1,0)=92 or (-1,0)=102 or (-1,0)=112 or (-1,0)=122 or (-1,0)=132 or (-1,0)=142}% and (0,0)=20 } %for now don't check if I'm empty
% I am empty cell and left of me is a right moving elevator cell, I become right moving elevator
rule : {(0,-1)} 100 { (0,-1)=53 or (0,-1)=63 or (0,-1)=73 or (0,-1)=83 or (0,-1)=93 or (0,-1)=103 or (0,-1)=113 or (0,-1)=123 or (0,-1)=133 or (0,-1)=143}% and (0,0)=20 } %for now don't check if I'm empty

% I am elevator moving up and I find empty space, I disappear
rule : 20 100 { (0,0)=51 or (0,0)=61 or (0,0)=71 or (0,0)=81 or (0,0)=91 or (0,0)=101 or (0,0)=111 or (0,0)=121 or (0,0)=131 or (0,0)=141}% and (-1,0)=20 } 
% I am elevator moving down and I find empty space and there is no right going elevator at the intersection, if so I yeild else I disappear
rule : 20 100 { (0,0)=52 or (0,0)=62 or (0,0)=72 or (0,0)=82 or (0,0)=92 or (0,0)=102 or (0,0)=112 or (0,0)=122 or (0,0)=132 or (0,0)=142 and (1,-1)!=53 and (1,-1)!=63 and (1,-1)!=73 and (1,-1)!=83 and (1,-1)!=93 and (1,-1)!=103 and (1,-1)!=113 and (1,-1)!=123 and (1,-1)!=133 and (1,-1)!=143 } 
% I am elevator moving right and I find empty space and there is no upward going elevator at the intersection, if so I yeild else I disappear
rule : 20 100 { (0,0)=53 or (0,0)=63 or (0,0)=73 or (0,0)=83 or (0,0)=93 or (0,0)=103 or (0,0)=113 or (0,0)=123 or (0,0)=133 or (0,0)=143 and (1,1)!=51 and (1,1)!=61 and (1,1)!=71 and (1,1)!=81 and (1,1)!=91 and (1,1)!=101 and (1,1)!=111 and (1,1)!=121 and (1,1)!=131 and (1,1)!=141 }


rule : {(0,0)} 100 { t }


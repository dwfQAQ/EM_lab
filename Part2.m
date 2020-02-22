%------Electromagnetic Characterisation of a Short-Stroke Ferromagnetic Actuaror:Part B----%
Eelec31=ones(6,1);
m=1;
for x = [-4.9 -4.7 -4.5 -4 -3 0]
   
%----A.Prepare the Model File----%
addpath(genpath('F:\femm42'));
openfemm();
opendocument('femm_template.fem'); 
%the zip includes a FEMMM template file which contains a library of material including copper, 
%electrical steel and Air, along with predefined circuits, Winding_1 and Winding_2
mi_saveas('temp.fem');                         
%----B.Add Nodes-----%
load('coil1p.mat');
mi_addnode(coil1p(:,1),coil1p(:,2));
for i=1:length(coil1p) %select the points in coil1p, and set group number
    mi_selectnode(coil1p(i,1), coil1p(i,2));
    %mi_selectnode(x,y), x,y are the cordinate of the points
    mi_setnodeprop('<coil1p>', coil1p(1,3));
    %mi setnodeprop("propname",groupno) Set the selected nodes to have the nodal property
    %"propname" and group number groupno. Third column of the form is the default group
    mi_clearselected(); %clear the selection
end
load('coil2p.mat');
mi_addnode(coil2p(:,1),coil2p(:,2));
for i=1:length(coil2p)
    mi_selectnode(coil2p(i,1),coil2p(i,2));
    mi_setnodeprop('<coil2p>', coil2p(1,3));
    mi_clearselected();
end
load('coil3p.mat');
mi_addnode(coil3p(:,1),coil3p(:,2));
for i=1:length(coil3p)
    mi_selectnode(coil3p(i,1),coil3p(i,2));
    mi_setnodeprop('<coil3p>', coil3p(1,3));
    mi_clearselected();
end
load('coil4p.mat');
mi_addnode(coil4p(:,1),coil4p(:,2));
for i=1:length(coil4p)
    mi_selectnode(coil4p(i,1),coil4p(i,2));
    mi_setnodeprop('<coil4p>', coil4p(1,3));
    mi_clearselected();
end
load('corep.mat');
mi_addnode(corep(:,1),corep(:,2));
for i=1:length(corep)
    mi_selectnode(corep(i,1),corep(i,2));
    mi_setnodeprop('<corep>',corep(1,3));
    mi_clearselected();
end
load('moverp.mat');
mi_addnode(moverp(:,1),moverp(:,2));
for i=1:length(moverp)
    mi_selectnode(moverp(i,1),moverp(i,2));
    mi_setnodeprop('<moverp>',moverp(1,3));
    mi_clearselected();
end
%----C.Add the Line Segment----%
for i=1:length(coil1p)-1
    mi_addsegment(coil1p(i,1),coil1p(i,2),coil1p(i+1,1),coil1p(i+1,2)); 
    %Add a new line segment from node closest to (x1,y1) to node closest to (x2,y2) 
    mi_selectsegment((coil1p(i,1)+coil1p(i+1,1))/2,(coil1p(i,2)+coil1p(i+1,2))/2); 
    %Select the line segment closest to (x,y),apparently the mid-point is the best choice
    mi_setsegmentprop('<coil1p>',0,1,0,coil1p(1,3));
    %mi_setsegmentprop("propname",elementsize,automesh,hide,group)
    %--local element size along segment no greater than elementsize
    %--automesh:0=mesher defers to the element constraint defined by elementsize
    %1=mesher automaticlly choose mesh size along the selected segment
    %--hide:0=no hidden in post processor, 1=hidden in post processor
    mi_clearselected();
end
mi_addsegment(coil1p(1,1),coil1p(1,2),coil1p(4,1),coil1p(4,2));% connect the first and last points
mi_selectsegment((coil1p(1,1)+coil1p(4,1))/2,(coil1p(1,2)+coil1p(4,2))/2);
mi_setsegmentprop('<coil1p>',0,1,0,coil1p(1,3));
mi_clearselected();

for i=1:length(coil2p)-1
    mi_addsegment(coil2p(i,1),coil2p(i,2),coil2p(i+1,1),coil2p(i+1,2));
    mi_selectsegment((coil2p(i,1)+coil2p(i+1,1))/2,(coil2p(i,2)+coil2p(i+1,2))/2);
    mi_setsegmentprop('<coil2p>',0,1,0,coil2p(1,3));
    mi_clearselected();
end
mi_addsegment(coil2p(1,1),coil2p(1,2),coil2p(4,1),coil2p(4,2));
mi_selectsegment((coil2p(1,1)+coil2p(4,1))/2,(coil2p(1,2)+coil2p(4,2))/2);
mi_setsegmentprop('<coil2p>',0,1,0,coil2p(1,3));
mi_clearselected();

for i=1:length(coil3p)-1
    mi_addsegment(coil3p(i,1),coil3p(i,2),coil3p(i+1,1),coil3p(i+1,2));
    mi_selectsegment((coil3p(i,1)+coil3p(i+1,1))/2,(coil3p(i,2)+coil3p(i+1,2))/2);
    mi_setsegmentprop('<coil3p>',0,1,0,coil3p(1,3));
    mi_clearselected();
end
mi_addsegment(coil3p(1,1),coil3p(1,2),coil3p(4,1),coil3p(4,2));
mi_selectsegment((coil3p(1,1)+coil3p(4,1))/2,(coil3p(1,2)+coil3p(4,2))/2);
mi_setsegmentprop('<coil3p>',0,1,0,coil3p(1,3));
mi_clearselected();

for i=1:length(coil4p)-1
    mi_addsegment(coil4p(i,1),coil4p(i,2),coil4p(i+1,1),coil4p(i+1,2));
    mi_selectsegment((coil4p(i,1)+coil4p(i+1,1))/2,(coil4p(i,2)+coil4p(i+1,2))/2);
    mi_setsegmentprop('<coil4p>',0,1,0,coil4p(1,3));
    mi_clearselected();
end
mi_addsegment(coil4p(1,1),coil4p(1,2),coil4p(4,1),coil4p(4,2));
mi_selectsegment((coil4p(1,1)+coil4p(4,1))/2,(coil4p(1,2)+coil4p(4,2))/2);
mi_setsegmentprop('<coil4p>',0,1,0,coil4p(1,3));
mi_clearselected();

for i=1:length(corep)-1
    mi_addsegment(corep(i,1),corep(i,2),corep(i+1,1),corep(i+1,2));
    mi_selectsegment((corep(i,1)+corep(i+1,1))/2,(corep(i,2)+corep(i+1,2))/2);
    mi_setsegmentprop('<corep>',0,1,0,corep(1,3));
    mi_clearselected();
end
mi_addsegment(corep(1,1),corep(1,2),corep(12,1),corep(12,2));
mi_selectsegment((corep(1,1)+corep(12,1))/2,(corep(1,2)+corep(12,2))/2);
mi_setsegmentprop('<corep>',0,1,0,corep(1,3));
mi_clearselected();

for i=1:length(moverp)-1
    mi_addsegment(moverp(i,1),moverp(i,2),moverp(i+1,1),moverp(i+1,2));
    mi_selectsegment((moverp(i,1)+moverp(i+1,1))/2,(moverp(i,2)+moverp(i+1,2))/2);
    mi_setsegmentprop('<moverp>',0,1,0,moverp(1,3));
    mi_clearselected();
end
mi_addsegment(moverp(1,1),moverp(1,2),moverp(4,1),moverp(4,2));
mi_selectsegment((moverp(1,1)+moverp(4,1))/2,(moverp(1,2)+moverp(4,2))/2);
mi_setsegmentprop('<moverp>',0,1,0,moverp(1,3));
mi_clearselected();
%----D.Create an Emulated Open Boundary----%
mi_makeABC();
%----F.Assign Material and Circuit Properties----%
mi_addblocklabel(60,0); %set armature block
mi_selectlabel(60,0);
mi_setblockprop('core_linear',1,0,'armature',0,2,0);
mi_clearselected();
mi_addblocklabel(10,0); %set core block
mi_selectlabel(10,0);
mi_setblockprop('core_linear',1,0,'core',0,1,0);
mi_clearselected();
mi_addblocklabel(45,-65); %set winding_1 block
mi_selectlabel(45,-65);
mi_setblockprop('copper',1,0,'winding_1',0,3,100);
mi_clearselected();
mi_addblocklabel(45,-30); 
mi_selectlabel(45,-30);
mi_setblockprop('copper',1,0,'winding_1',0,4,-100);
mi_clearselected();
mi_addblocklabel(45,65); %set winding_2 block
mi_selectlabel(45,65);
mi_setblockprop('copper',1,0,'winding_2',0,6,-100);
mi_clearselected();
mi_addblocklabel(45,30); 
mi_selectlabel(45,30);
mi_setblockprop('copper',1,0,'winding_2',0,5,100);
mi_clearselected();
mi_addblocklabel(-10,0); %set air block
mi_selectlabel(-10,0);
mi_setblockprop('air',1,0,'<None>',0,7,0);
mi_clearselected();
%----F.Check the Problem Definition and Excitation----%
mi_probdef(0,'millimeters','planar',1E-8);
%mi_probdef(frequency,units,type,precision,(depth),(minangle),(acsolver)
%--frequency:0Hz
%--length unit:"millimeters"
%--Problem type:"planar" for a 2-D  planar problem
%--precision:1E-8,requiring the RMS of the residual to be less than 10^(-8)
%--depth:20mm,into-page-length
%--minangle:30,minimum angle sent to the mesh generator
%--acsolver:solver type to be used for AC problems

%----G.Mesh the Model----%
% smartmesh(0); %turn off smartmesh(),which can improve the quality of the mesh within the problem geometry
% mi_createmesh();
% smartmesh(1);
% mi_createmesh();

%----refine the mesh density in the variable air gap----%
mi_selectsegment((corep(11,1)+corep(10,1))/2,(corep(11,2)+corep(10,2))/2);
mi_setsegmentprop('<None>',0.5,0,0,1);
mi_clearselected();
mi_selectsegment((moverp(4,1)+moverp(1,1))/2,(moverp(4,2)+moverp(1,2))/2);
mi_setsegmentprop('<None>',0.5,0,0,2);
mi_clearselected();


%----Armature Motion----%
mi_selectgroup(2);
mi_movetranslate(x,0);
mi_createmesh();

%----Winding Resistance----%
mi_setcurrent('winding_1',10); 
%sets the current in the circuit specified by ¡¯CircName¡¯ to i.
mi_setcurrent('winding_2',10);
mi_createmesh();
%----H.Analyse the Model----%
mi_analyse(); %runs fkern to solve the problem.
%For a visible window, either specify no value for flag or specify 0. 
%For a minimized window, flag should be set to 1.
mi_loadsolution(); 
%loads and displays the solution corresponding to the current geometry.
%load the solution in to the post-processor,

%----Extract circuit properties----%

% CP_05(m,:)=mo_getcircuitproperties('winding_1');
% m = m+1;


% CP(2,1:3)=mo_getcircuitproperties('winding_2');

%CP(1), CP(2) and CP(3) are the current,I applied voltage,V and flux linkage 
% %----Measure the cross section----%
% mo_groupselectblock(6); 
% A = mo_blockintegral(5); %Block cross-section area,on the page
% mo_clearblock();
% %----Measure the Volumn----%
% mo_groupselectblock(5);
% mo_groupselectblock(6);
% V = mo_blockintegral(10); %Block volume
% mo_clearblock();
%----calculate the resistance of the winding----%
% l=V/A;
% R=(100*l)/(58*(1E6)*((0.6*A)/100));
%----psi I----%
mo_groupselectblock(7);
mo_groupselectblock(6);
mo_groupselectblock(5);
mo_groupselectblock(4);
mo_groupselectblock(3);
mo_groupselectblock(2);
mo_groupselectblock(1);
Eelec31(m) = mo_blockintegral(17)/2;
mo_clearblock();
m=m+1;
end
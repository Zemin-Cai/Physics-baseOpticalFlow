
%Code to read appropriate frames from the multi-tif files from PCO-camera, 
%apply 2-D filter, find Temperature, and trace temperature in time for a given point 

clear all
close all


minframe=1;    %Tunnel start occurs at (around) this frame number
maxframe=13;    %Tunnel un-start occurs at (around) this frame number
step=1;

%
i=1;
while i<=maxframe
    if i<20
        imagefile=strcat('I_norm_0mask_',num2str(i),'.dat');
    elseif (i>=10) && (i<100)
        imagefile=strcat('saturn1 0',num2str(i),'.jpg');
    elseif (i>=100) && (i<1000)
        imagefile=char(strcat({'saturn1'},{' '},{num2str(i)},{'.jpg'}));
    else
        imagefile=char(strcat({'saturn1'},{' '},{num2str(i)},{'.jpg'}));   
    end
        
    %Im1 =imread(imagefile);
    Im1 =load(imagefile);

    j=i+step;
    if j<20
        imagefile=strcat('I_norm_0mask_',num2str(j),'.dat');
    elseif (j>=10) && (j<100)
        imagefile=strcat('saturn1 0',num2str(j),'.jpg');
    elseif (j>=100) && (j<1000)
        imagefile=char(strcat({'saturn1'},{' '},{num2str(j)},{'.jpg'}));
    else
        imagefile=char(strcat({'saturn1'},{' '},{num2str(j)},{'.jpg'}));   
    end
    
    %Im2=imread(imagefile);
    Im2 =load(imagefile);
    
    
    [ux, uy] = Flow_Diagnostics_Run_fun(Im1,Im2);
    
    name_output_ux=char(strcat({'ux_0mask_'},{num2str(i)},{'.dat'}));
    dlmwrite(name_output_ux,ux);
    name_output_uy=char(strcat({'uy_0mask_'},{num2str(i)},{'.dat'}));    
    dlmwrite(name_output_uy,uy);
     
    i=i+1;

end



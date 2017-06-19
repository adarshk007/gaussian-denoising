image = imread('baboon256.tif');
p=input('noise percentage');
w = imnoise(image,'Gaussian',0,p);
windowneed=input('window size');
if(windowneed==3 && p==0.05)
     calval=[0.000161 0.012353 0.000161;0.012353 0.949948 0.012353;0.000161 0.012353 0.000161];
elseif(windowneed==3 && p==0.1)
     calval=[0.00324 0.050442 0.00324;0.050442 0.785272 0.050442;0.00324 0.050442 0.00324];
elseif(windowneed==3 && p==0.2)
     calval=[0.017288 0.096907 0.017288;0.096907 0.543219 0.096907;0.017288 0.096907 0.017288];
elseif(windowneed==5 && p==0.05)     
     calval=[0,0,0,0,0;0,0.000161,0.012353,0.000161,0;0,0.012353,0.949948,0.012353,0;0,0.000161,0.012353,0.000161,0;0,0,0,0,0];
elseif(windowneed==5 && p==0.1)
     calval=[0,0,0.000001,0,0;0,0.00324,0.050442,0.00324,0;0.000001,0.050442,0.785269,0.050442,0.000001;0,0.00324,0.050442,0.00324,0;0,0,0.000001,0,0];
elseif(windowneed==5 && p==0.2)
     calval=[0,0.000052,0.000293,0.000052,0;0.000052,0.01726,0.096753,0.01726,0.000052;0.000293,0.096753,0.542356,0.096753,0.000293;0.000052,0.01726,0.096753,0.01726,0.000052;0,0.000052,0.000293,0.000052,0];
elseif(windowneed==7 && p==0.05)
     calval=[0 0 0 0 0 0 0;0 0 0 0 0 0 0;0 0 0.000161 0.012353 0.000161 0 0;0 0 0.012353 0.949948 0.012353 0 0;0 0 0.000161 0.012353 0.000161 0 0;0 0 0 0 0 0 0;0 0 0 0 0 0 0];
elseif(windowneed==7 && p==0.1)
     calval=[0 0 0 0 0 0 0;0 0 0 0.000001 0 0 0;0 0 0.00324 0.050442 0.00324 0 0;0 0.000001 0.050442 0.785269 0.050442 0.000001 0;0 0 0.00324 0.050442 0.00324 0 0;0 0 0 0.000001 0 0 0;0 0 0 0 0 0 0];
elseif(windowneed==7 && p==0.2)
     calval=[0 0 0 0 0 0 0;0 0 0.000052 0.000293 0.000052 0 0;0 0.000052 0.01726 0.096753 0.01726 0.000052 0;0 0.000293 0.096753 0.542356 0.096753 0.000293 0;0 0.000052 0.01726 0.096753 0.01726 0.000052 0;0 0 0.000052 0.000293 0.000052 0 0;0 0 0 0 0 0 0];
end
if(windowneed==3)
   d=0;
     badlo=zeros(size(w)+2);
    
         for x=1:size(w,1)
             for y=1:size(w,2)
                badlo(x+1,y+1)=w(x,y);
            end
         end
 test=zeros(size(w));       
  for i= 1:size(badlo,1)-2
     for j=1:size(badlo,2)-2
         for x=1:3
            for y=1:3
                d=d+badlo(i+x-1,j+y-1)*calval(x,y);
            end
         end
    pea=sum(calval);
    tik=sum(pea);
    test(i,j)=d/tik;
        d=0;
        
     end
  end
%%for 5
elseif(windowneed==5)
 
d=0;
    badlo=zeros(size(w)+4);
    
        for x=1:size(w,1)
            for y=1:size(w,2)
                badlo(x+2,y+2)=w(x,y);
            end
        end
test=zeros(size(w));       
for i= 1:size(badlo,1)-4
    for j=1:size(badlo,2)-4
        for x=1:5
            for y=1:5
                d=d+badlo(i+x-1,j+y-1)*calval(x,y);
            end
        end
    pea=sum(calval);
    tik=sum(pea);    
    test(i,j)=d/tik;
        d=0;
        
    end
end
%%for 7
elseif(windowneed==7)
d=0;
    badlo=zeros(size(w)+6);
    
        for x=1:size(w,1)
            for y=1:size(w,2)
                badlo(x+3,y+3)=w(x,y);
            end
        end
test=zeros(size(w));       
for i= 1:size(badlo,1)-6
    for j=1:size(badlo,2)-6
        for x=1:7
            for y=1:7
                d=d+badlo(i+x-1,j+y-1)*calval(x,y);
            end
        end
    pea=sum(calval);
    tik=sum(pea);    
    test(i,j)=d/tik;
        d=0;
        
    end
 end
end


test=uint8(test);
figure,imshow(test);
PSNR(im2double(image),im2double(test));
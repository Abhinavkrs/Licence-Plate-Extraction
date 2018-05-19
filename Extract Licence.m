clc;
clear all;

a = imread('C:\Users\Abhinav\OneDrive\5th Sem\DSP\Project\12.jpg');
figure (1)
imshow(a);

a = rgb2gray(a);
[r c p] = size(a);
b = a(r/3:r,1:c);
figure (2)
imshow(b)

[r c p] = size(b);
out = zeros(r,c);

for i = 1:r
    for j = 1:c         
      if b(i,j)>150
            Out(i,j) = 1;
        else
            Out(i,j) = 0;
        end
    end
end
figure (3)
imshow(Out,[]);

BW3 = imfill(Out,'holes');
figure (4)
imshow(BW3);
BW3 = medfilt2(BW3,[3 3]);
BW3 = medfilt2(BW3,[3 3]);
BW3 = medfilt2(BW3,[3 3]);
BW3 = medfilt2(BW3,[5 5]);
BW3 = medfilt2(BW3,[5 5]);
BW3 = bwfill(BW3,'holes');
figure (5)
imshow(BW3,[]);

[L num] = bwlabel(BW3);
STATS = regionprops(L,'all');

cc = [];
removed = 0;
for i = 1:num
dd = STATS(i).Area;
cc(i)= dd;

if (dd < 50000)
          	L(L==i) = 0;
			removed = removed + 1;
            num = num-1;
		end
end

[L2 num2] = bwlabel(L);
STATS = regionprops(L2,'All');

[r c]=size(L2)
Out=zeros(r,c);
B=STATS.BoundingBox;
B
Xmin=B(2);
Xmax=B(2)+B(4);

Ymin=B(1);
Ymax=B(1)+B(3);

LP=[];
LP=b(Xmin+25:Xmax-20,Ymin+10:Ymax-10);
figure (6)
imshow(LP)

a = LP;
[r c p]=size(a);
if p==3
    a=rgb2gray(a);
end
aaa=a;
for i=1:r
    for j=1:c
        dd=a(i,j);
        if dd >125
        Out(i,j)=255;        
    else
        Out(i,j)=0;
    end
        
    end
end
a=Out;
b=im2bw(a);
c=imcomplement(b);
[L num]=bwlabel(c);
STATS = regionprops(L,'all');
removed=0;
[L1 num1]=bwlabel(L);
[L2 num2]=bwlabel(L1);
num1
num2

STATS = regionprops(L1,'Area');
Data=[];
for i=1:num2
	Data1=STATS(i).Area;
		
	Data=[Data Data1];
		
end
Data2=-sort(-Data);
Data2
        
Data3=Data2(1:10);
Data3        
AreaData=min(Data3);
removed=0;
for i=1:num
dd=STATS(i).Area;
if dd < AreaData
  	L(L==i)=0;
	removed = removed + 1;
    num=num-1;
else
end
end
 [L2 num2]=bwlabel(L);
 
stats1 = regionprops(L2, 'Image'); % get image features
C = [];

for j=1:1:(num2)
    c = stats1(j);
    C{j} = [c.Image]; 
    EE = imresize(C{j}, [45 24]);
    figure (6+j)
    imshow(C{j});

    EE=imcomplement(EE);
    C{j}=EE;
    [r c]=size(EE);
    dd=zeros(r,c);

end
Len=length(C);

LEN=length(C);
load DataBase;
RECOG=[];
Dlen=540;
k=1;
for i=1:LEN
    
    Test=C{i};    
    for j=1:Dlen
   		Test2=DataBase{j};
		X(j)=corr2(Test,Test2);
    end
    [Res INDEX]=max(X);
    RECOG(k)=INDEX;
    k=k+1;  
end
Len=length(RECOG);
Output=[];
for i=1:Len
    
a = RECOG(i);
		
	if (a>=1)&(a<=15)
		Output=[Output '0'];
        
    elseif (a>=16)&(a<=30)
		Output=[Output '1'];
        
    elseif (a>=31)&(a<=45)
		Output=[Output '2'];
        
    elseif (a>=46)&(a<=60)
        output=[Output '3'];
            
    elseif (a>=61)&(a<=75)
		Output=[Output '4'];
        
    elseif (a>=76)&(a<=90)
		Output=[Output '5'];
        
    elseif  (a>=91)&(a<=105)
		Output=[Output '6'];
        
    elseif  (a>=106)&(a<=120)
		Output=[Output '7'];
		
	elseif (a>=121)&(a<=135)
		Output=[Output '8'];
        
    elseif  (a>=136)&(a<=150)
		Output=[Output '9'];
        
    elseif  (a>=151)&(a<=165)
		Output=[Output 'A'];
		
	elseif  (a>=166)&(a<=180)
		Output=[Output 'B'];
        
    elseif  (a>=181)&(a<=195) 
		Output=[Output 'C'];
		
	elseif  (a>=196)&(a<=210)
		Output=[Output 'D'];
        
	elseif  (a>=211)&(a<=225)
		Output=[Output 'E'];
        
    elseif  (a>=226)&(a<=240)
		Output=[Output 'F'];
        
    elseif  (a>=241)&(a<=255)
		Output=[Output 'G']; 
        
    elseif  (a>=256)&(a<=270)
		Output=[Output 'H']; 
        
    elseif  (a>=271)&(a<=285)
		Output=[Output 'I']; 
        
    elseif  (a>=286)&(a<=300)
		Output=[Output 'J']; 
        
    elseif  (a>=301)&(a<=315)
		Output=[Output 'K']; 
        
    elseif  (a>=316)&(a<=330)
		Output=[Output 'L']; 
        
    elseif  (a>=331)&(a<=345)
		Output=[Output 'M'];
        
    elseif  (a>=346)&(a<=360)
		Output=[Output 'N'];
        
    elseif  (a>=361)&(a<=375)
		Output=[Output 'O']; 
        
    elseif  (a>=376)&(a<=390)
		Output=[Output 'P']; 
        
    elseif  (a>=391)&(a<=405)
		Output=[Output 'Q']; 
        
    elseif  (a>=406)&(a<=420)
		Output=[Output 'R']; 
        
    elseif  (a>=421)&(a<=435)
		Output=[Output 'S'];
        
    elseif  (a>=436)&(a<=450)
		Output=[Output 'T']; 
        
    elseif  (a>=451)&(a<=465)
		Output=[Output 'U']; 
        
    elseif  (a>=466)&(a<=480)
		Output=[Output 'V']; 
        
    elseif  (a>=481)&(a<=495)
		Output=[Output 'W']; 
        
    elseif  (a>=496)&(a<=510)
		Output=[Output 'X']; 
        
    elseif  (a>=511)&(a<=525)
		Output=[Output 'Y']; 
        
    elseif  (a>=526)&(a<=540)
		Output=[Output 'Z'];
    end

end

if(length(Output)>4)
        msgbox(sprintf('Number Plate Extraction successful.\nExtracted Number plate:- %s',Output),'Extraction Success');
end
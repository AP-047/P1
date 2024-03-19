% Capture three overlapping images of a planar object
image1 = imread('img1.jpg');
image2 = imread('img2.jpg');
image3 = imread('img3.jpg');

%all stiching process by calling function imagestich.m & geokor_matlab.m:
%stitching img1 and img2:
ResultImageY12 = customImageStitch(image1, image2);

% imshow(ImageX12)

%stitching ImageX12 and opt3:
ResultImageY32 = imagestitch(ResultImageY12, image3);
imshow(ResultImageY32);
%% load Image from web

URL = 'https://i.imgur.com/TvwD0.gif' 
filename = 'TV.gif'
urlwrite(URL,filename) 

% read image 
[X,map] = imread(filename);
X = imresize3(squeeze(X),[261 386 340]);

% Write video
v = VideoWriter('pumpkin');
open(v);

for k = 1:size(X,3)
   imshow(squeeze(X(:,:,k)),map,'Border','tight')
   colormap(hot(70))
   frame = getframe(gcf);
   writeVideo(v,frame);
end

close(v);

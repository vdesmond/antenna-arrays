%% Init
N=10;
points=1000;
[X,Y,Z] = beamform(N,1,points);

%% Surf Plot
f = figure; % Bring up new figure                    
f.WindowState = 'maximized';
s = surf(X,Y,Z, 'FaceAlpha',0.8, 'EdgeColor', 'none');

light               % add a light
lighting gouraud    % preferred lighting for a curved surface
axis equal off     % set axis equal and remove axis
view(40,30)         % set viewpoint
camzoom(1.1)        % zoom into scene

%% Initialize video
myVideo = VideoWriter(append('freq_antenna_',num2str(N))); %open video file
myVideo.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
myVideo.Quality = 100;
open(myVideo)

%% Animate (frequency)
num_d = 100;
dists = linspace(1,10,num_d);

for ii = 1:num_d   %
    [X,Y,Z] = beamform(N,dists(ii),points);
    % replace surface X, Y, Z values
    s.XData = X;    
    s.YData = Y;    
    s.ZData = Z;   
    pause(0.5)     % pause to control animation speed

    frame = getframe(gcf); %get frame
    writeVideo(myVideo, frame);
end

close(myVideo);
close(f);

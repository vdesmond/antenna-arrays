%% Init
N=2;
points=1000;
[X,Y,Z] = beamform(N,1,points);

%% Surf Plot
f = figure; % Bring up new figure                    
f.WindowState = 'maximized';
s = surf(X,Y,Z, 'FaceAlpha',0.8, 'EdgeColor', 'none');

light               % add a light
lighting gouraud    % preferred lighting for a curved surface
axis equal off      % set axis equal and remove axis
view(40,30)         % set viewpoint
camzoom(1.1)        % zoom into scene

%% Simulate beamforming of N antennas
for ii = 2:10   %
    [X,Y,Z] = beamform(ii,1,points);
    % replace surface X, Y, Z values
    s.XData = X;    
    s.YData = Y;    
    s.ZData = Z;  

    filename = append(num2str(ii),".eps");
    exportgraphics(f,filename,'Resolution',300)
end

close(f);

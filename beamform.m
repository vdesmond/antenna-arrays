function [X,Y,Z] = beamform(N, k, points)

    % finding lambda and d
    c=3e8;
    l=c/1e9;
    d=k*l/2;
    % initialization
    dx = zeros(N,points,points);
    r=zeros(points,points);
    [theta,phi] = meshgrid(linspace(-pi/2,pi/2,points),linspace(0,2*pi,points));
    
    % equation
    for n=1:N
        dx(n,:,:)=(n-1)*d*cos(theta);
        expon = exp(-1i*2*pi*(dx(n,:,:)/l));
        r=r+squeeze(expon(1,:,:));
    end
    
    r=real(r);
    [X,Y,Z] = sph2cart(phi,theta,r);    % transformation from spherical to cartesian
end
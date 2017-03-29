% Load data file and define important parameters
load('dt_file1.mat');
Ts = 1/Fs;
xsize = size(x);
nSamples = xsize(1,2);
sampletimes = 0:Ts:Ts*(nSamples-1);
% Create an array of 'continuous' times, ct
cf = 441000;
cTs = 1/cf;
ct = 0:cTs:sampletimes(nSamples);
csize = size(ct);
ncSamples = size(1,2);
% Create an array of ideally interpolated x-values
xInterpolated = zeros(1,ncSamples);
for n1 = 1:ncSamples
    xinterp = 0;
    for n2 = 1:nSamples
        xinterp = xinterp + x(1,n2)*sinc((ct(1,n1)-n2*Ts)/Ts);
    end
    xInterpolated(n1) = xinterp;
end
plot(ct,xInterpolated);
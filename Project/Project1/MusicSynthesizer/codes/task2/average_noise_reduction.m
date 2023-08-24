function out=average_noise_reduction(realwave)
raw_len=size(realwave,1);
n=10;
s=round(raw_len/n)+1;
L=(s*n);
resampled=resample(realwave,L,raw_len);
%subplot(3,2,3);
%plot(resampled);
smpls=reshape(resampled,s,n);
avg=mean(smpls,2);
avrg_stretch=repmat(avg,1,n);
avrg_flatten=reshape(avrg_stretch,L,1);
out=resample(avrg_flatten, raw_len,L);
end

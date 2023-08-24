function H=harmonic_analysis(w,P_1,eps)
P=P_1(10:floor(length(P_1)/4))*10000;
plot(w/(2*pi),P_1');
H=randn(2,5);

[P_m,argmax]=max(P);
f_m=get_freq(w,argmax);

w_m=w(argmax);
H(1,1)=f_m;
H(2,1)=0.0;
base=0;

[peaks,locs]=findpeaks(P);
L_p=length(peaks);
for i=300:L_p
    disp("peaks");
    disp(peaks)
    disp("locs");
    disp(locs);
    disp("get_freq(w,i)=");
    disp(get_freq(w,i));
    if (multiple(f_m,get_freq(w,i),eps)==1)
        disp(i)
        base=get_freq(w,i);
        disp("base");
        disp(base);
        disp("i=");
        disp(i);
        break;
    end
end

n=2;
for j=i:L_p
    if(multiple(get_freq(w,j),base,eps)==1)
        if n<6
            H(1,n)=get_freq(w,j);
            H(2,n)=peaks(j);
            n=n+1;
        end
    end
end

%H(2,:)=H(2,:)/(sum(H(2,:)));
disp("base:");
disp(base);
end

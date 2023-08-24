%inverse zigzag
%convert an zigzagged row vector W^2x1  (64x1)
%back to its original block format WxW  (8x8)
function A=izigzag(z)
%the length of z implies the siz of the original square matrix.
%the length = 1+2+...+(W)+...+2+1=2*(1+W-1)*(W-1)/2+1=W*(W-1)+1=W^2-W+1
%solve this equation: length(z)=W^2-W+1 you get the original size.
%w^2-w+(1-L)=0 -->
%w=\frac{1}{2}\cdot 1 + \sqrt{1-4(1-L)}=\frac{1}{2}(1+\sqrt{4L-3})
W=round(1/2*(1+sqrt(4*length(z)-3)));
A=zeros(W,W);

%recover upper triangle region
will_flip=0;
z_id=uint8(1);
for k=2:1:2*W
    will_flip=mod(k,2);
    if will_flip   %from top right to bottom left
        for i=max(1,k-W):1:min(k-1,W)
            j=k-i;
            A(i,j)=z(z_id);
            z_id=z_id+1;
        end
    else
        for i=min(k-1,W):-1:max(1,k-W)
            j=k-i; 
            A(i,j)=z(z_id);
            z_id=z_id+1;
        end
    end
end
end
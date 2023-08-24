function lin = zigzag(P)
    [w, h] = size(P);
    assert(w == h, "输入的矩阵的形状有误，不是方阵！");
    z2id = zigzagid(w);
    Pc = reshape(P', 1, w * h);
    lin = Pc(z2id);
end

function idx = zigzagid(n)
    idx = zeros(n * n, 1);
    pos = [1, 1, 0];  % 起始位置，方向0右，1下，2左下，3右上
    for cnt = 1 : n * n
        idx(cnt) = n * (pos(1) - 1) + pos(2);
        switch pos(3)
            case 0
                pos(2) = pos(2) + 1;
                if(pos(1) == 1)
                    pos(3) = 2;
                else
                    pos(3) = 3;
                end
             case 1
                 pos(1) = pos(1) + 1;
                 if(pos(2) == 1)
                     pos(3) = 3;
                 else
                    pos(3) = 2;
                 end
             case 2 
                pos(1) = pos(1) + 1;
                pos(2) = pos(2) - 1;
                if (pos(1) == n)
                    pos(3) = 0;
                elseif(pos(2) == 1) 
                    pos(3) = 1;
                end
             case 3 
                pos(1) = pos(1) - 1;
                pos(2) = pos(2) + 1;
                if (pos(1) == 1)
                    pos(3) = 0;
                elseif(pos(2) == n) 
                    pos(3) = 1;
                end
        end
    end
end


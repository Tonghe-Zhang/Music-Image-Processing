
function y=f_alter(natural,alt)

    name=natural+0.5*alt;
    
    if (natural==3) 
        if (alt==1)
            name=4;
        end
    end
    if (natural ==4)
        if  (alt==-1)
            name=3;
        end
    end
    %convert to the relative place w.r.t the C
    if name==1
        y=0;
    elseif name==1.5
        y=1;
    elseif name==2
        y=2;
    elseif name==2.5
        y=3;
    elseif name==3    %!!
        y=4;
    elseif name==4    %!!
        y=5;
    elseif name==4.5
        y=6;
    elseif name==5
        y=7;
    elseif name==5.5
        y=8;
    elseif name==6
        y=9;
    elseif name==6.5
        y=10;
    elseif name==7
        y=11;
    else 
        disp("Erro: in f_alter, undefined name==");
        disp(name);
    end
    
end

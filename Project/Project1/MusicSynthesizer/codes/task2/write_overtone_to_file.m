function write_overtone_to_file(H,file_name)

harm_ID=fopen(file_name,"a+");

H_1=[pitch2formal(H(1,:));H];
pitch=H_1(2,1);
H_1(2,1)=H_1(1,1);
H_1(1,1)=pitch;

for i=1:3
    fprintf(harm_ID,"%s\t",H_1(i,:));
    fprintf(harm_ID,"\t");
end
fprintf(harm_ID,"\n");

fclose(harm_ID);
end
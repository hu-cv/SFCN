function results=run_SFCN(seq, res_path, bSaveImage)
%% Copyright (C) Qi Xu .
%% All rights reserved.
%% Date: 09/2024
%%
close all
s_frames = seq.s_frames;
para=paraConfig_SFCN(seq.name);
seq.init_rect
rect=seq.init_rect;
p = [rect(1)+rect(3)/2, rect(2)+rect(4)/2, rect(3), rect(4), 0];
sz = para.psize;
param0 = [p(1), p(2), p(3)/sz(1) , p(5), p(4)/p(3), 0]; %param0 = [px, py, sc, th,ratio,phi];
param0 = affparam2mat(param0);
opt = para.opt;
opt.psize=para.psize;
queue = zeros(1, 10);
n_sample = opt.numsample;
param = [];
param.est = param0';
img_color = imread(s_frames{1});
if size(img_color,3)==3
    img	= double(rgb2gray(img_color));
else
    img	= double(img_color);
end

fy=[-1 0 1];
fx=fy';
Iy=imfilter(img,fy,'replicate');
Ix=imfilter(img,fx,'replicate');
Gxy=sqrt(Ix.^2+Iy.^2);
alphaxy = atan2(Iy,Ix);
alphaxy(alphaxy < 0) = alphaxy(alphaxy < 0) + 2*pi;
img= alphaxy*Gxy;
patchsize = [8 8];
patchnum(1) = length(patchsize(1)/2 : 1: (sz(1)-patchsize(1)/2));
patchnum(2) = length(patchsize(2)/2 : 1: (sz(2)-patchsize(2)/2));
Fisize = 120;
para.pars.K = Fisizeones(1,2);
neg = sampleNeg(img, param.est', opt.psize, 20, opt, 8);
FiNeg = zeros(64,patchnum(1)*patchnum(2));
for i = 1:size(neg,2)
    FiNeg = FiNeg + affineTrainNeg(reshape(neg(:,i),[48 48]), patchsize, patchnum, Fisize);
end
FiNeg = FiNeg/size(neg,2);
image = warpimg(img, param0, opt.psize);
[FioS, patcho] = designDSD(image, patchsize, patchnum, Fisize, FiNeg, para);
image2 = FioS'*image;
[FioC, patcho] = designOSD(image2, patchsize, patchnum, Fisize, para);
num=seq.endFrame-seq.startFrame+1;
alpha_p = zeros(Fisize, prod(patchnum), num);
res = zeros(num, 6);
duration = 0;
res(1,:) = param.est';
qq = zeros(1, 10);
fff = 2;
for f = 2:seq.len
    disp(['# ' num2str(f)]);
    img_color = imread(s_frames{f});
    if size(img_color,3)==3
        img	= double(rgb2gray(img_color));
    else
        img	= double(img_color);
    end
    img = double(fhog(single(img)/255, para.cell_size, para.features.hog_orientations));
    [wimgs Y param] = affineSample(img, sz, opt, param);
    patch = affinePatch(wimgs, patchsize, patchnum);
    if f==2
        xo = bsxfun(@minus,patcho,mean(patcho));
        S1 = FioS'*xo;
        S= FioC'*S1;
        alpha_qq = S;
         qq = [qq(2:end), alpha_qq];
    end 
    sim = zeros(10,n_sample);
    for i = 1:n_sample
        x = bsxfun(@minus,patch(:,:,i),mean(patch(:,:,i)));
        S1 = FioS'*x;
        S= FioC'*S1;
        alpha_p(:,:,i) = S;
        p = S;
        p = reshape(p, 1, numel(p));
        p  = p./(sqrt(sum(p.^2))+eps);
        for j = 1: 10
            q = qq(j);
            q = reshape(q, 1, numel(q));
            q = q./(sqrt(sum(q.^2))+eps);
            sim(j,i) = p*q';
        end
    end
    likelihood = sim;
    [v_max,id_max] = max(likelihood);
    [v_min,id_min] = min(likelihood);
    p_t = v_max;
    queue = [queue(2:end), v_min];
    param.est = affparam2mat(param.param(:,id_max));
    res(f,:) = param.est';
    FCE = (p_t - p_min)^2/ mean(sum((queue - p_t).^2));
    fff = fff +1;
    if fff/10 > 1
        if FCE >= 0.7
            alp = alpha_p(:,:,id_max);
            alp(abs(p)<median(abs(p))) = 0;
            alpha_qq(abs(p)>median(abs(p))) = 0.95*alpha_qq(abs(p)>median(abs(p)))+0.05*alp(abs(p)>median(abs(p)));
            neg = sampleNeg(img, param.est', opt.psize, 20, opt, 8);
            FiNeg = zeros(36,Fisize);
            for i = 1:size(neg,2)
                FiNeg = FiNeg + affineTrainNeg(reshape(neg(:,i),[32 32]), patchsize, patchnum, Fisize);
            end
            FiNeg = FiNeg/size(neg,2);
            [FioS, patcho] = designDSD(image, patchsize, patchnum, Fisize, FiNeg, para);
            image2 = FioS'*image;
            [FioC, patcho] = designOSD(image2, patchsize, patchnum, Fisize, para);
            fff = 0;
        else
            [FioS, patcho] = designDSD(image, patchsize, patchnum, Fisize, FiNeg, para);
            image2 = FioS'*image;
            [FioC, patcho] = designOSD(image2, patchsize, patchnum, Fisize, para);
            fff = 0;
        end
    end
    
    bSaveImage = 1;
    if bSaveImage
        imshow(img_color);
        numStr = sprintf('#%03d', f);
        text(10,20,numStr,'Color','r', 'FontWeight','bold', 'FontSize',20);
        color = [ 1 0 0 ];
        [ center corners ] = drawbox(para.psize, res(f,:), 'Color', color, 'LineWidth', 2.5);
        axis off;
        drawnow;
    end
end
results.type = 'ivtAff';
results.res = res;
results.tmplsize = para.psize;
results.fps=(seq.len-1)/duration;


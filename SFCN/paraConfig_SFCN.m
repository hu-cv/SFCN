function para=paraConfig_SFCN(title)

para.opt = struct('numsample', 250, 'affsig', [4,4,0,0,0,0]);
para.scale = [0.98,0.985,0.99,0.995,1.0,1.005,1.01,1.015,1.02];
para.SC_param.mode = 2;
para.SC_param.lambda = 0.01;
para.SC_param.pos = 'ture'; 
para.patch_size = 16;
para.step_size = 8;
para.psize = [48, 48];
para.normalWidth = 240;
para.normalHeight = 120;
para.pars.K        = [];                    
para.pars.max_iter = 50;	 
para.pars.lambda   = 0.1;  
para.pars.gamma    = 0.1;  
para.features.hog_orientations = 9;
para.cell_size = 4;
param.L = 3;   
param.numIteration = 30;
param.errorFlag = 0; % 
param.preserveDCAtom = 0;
param.InitializationMethod =  'DataElements';
param.displayProgress = 1;




# SFCN
Hi! You are welcome to visit here! This repository will be used to release the code of a novel tracking method called the Sparse Filters-based Convolutional Network (SFCN), which has been proposed in our paper entitled "Learning Sparse Filters-based Convolutional Networks Without Offline Training for Robust Visual Tracking" submitted to IEEE Transactions on Circuits and Systems for Video Technology (TCSVT). **NOTE that once our manuscript is accepted by TCSVT, we will release the code immediately**. 

Different from existing methods, SFCN is a fully feed-forward convolutional network that does not need offline training. The only learning step involves the convolution kernels, which are composed of sparse filters directly acquired online from image patches of tracking targets via sparse dictionary learning. Furthermore, the proposed SFCN has a lightweight structure that can achieve fast online tracking and mainly involves two convolutional layers that learn effective generic features by exploiting discriminative information and hierarchical layout information. Specifically, the first convolutional layer learns a set of discriminative sparse filters, which are then used to encode the discriminative information between foreground and background of the target region. The second convolutional layer learns a set of over-complete sparse filters, which are then used to encode the hierarchical layout information among the local patches inside each target candidate region. Moreover, to alleviate the problem of tracking drift, the sparse filters and target templates are updated online via a dynamic model updating strategy. We used five large-scale benchmark datasets including OTB 50/100, TC128, UAV123, and LaSOT to empirically evaluate the proposed method, and the experimental results show that the proposed method performs favorably against existing generic feature-based trackers, deep trackers without offline training, and several state-of-the-art (SOTA) deep trackers with offline training in terms of accuracy and robustness.

# Experimental Datasets
* **Online Tracking Benchmark (OTB)** [1][2]. (http://cvlab.hanyang.ac.kr/tracker_benchmark/index.html). The OTB100 dataset contains 100 fully sequences annotated by 11 challenging factors, including background clutter (BC), deformation (DEF), illumination variation (IV), low resolution (LR), motion blur (MB),fast motion (FM), out-of-plane rotation (OPR), occlusion (OCC), in-plane rotation (IPR), out-of-view (OV) and scale variation (SV) issues. 

* **Temple Color (TC128)** [3]. (http://www.dabi.temple.edu/~hbling/data/TColor-128/TColor-128.html). The TC128 dataset contains 128 fully sequences annotated by 11 challenging factors, including background clutter (BC), deformation (DEF), illumination variation (IV), low resolution (LR), motion blur (MB),fast motion (FM), out-of-plane rotation (OPR), occlusion (OCC), in-plane rotation (IPR), out-of-view (OV) and scale variation (SV) issues.

* **Unmanned Aerial Vehicle tracking benchmark (UAV123)** [4]. (https://cemse.kaust.edu.sa/ivul/uav123). The UAV123 dataset is a tracking benchmark for lowaltitude unmanned aerial vehicle (UAV) target tracking, and each sequence is annotated by 12 attributes, including aspect ratio change, background clutter, camera motion, fast motion, full occlusion, illumination variation, low resolution, out-ofview, partial occlusion, similar object, scale variation, and viewpoint change. 

* **Large-scale Single Object Tracking (LaSOT)** [5]. (https://cis.temple.edu/lasot). The LaSOT dataset is a long-term tracking benchmark that aims to provide a large set of videos for training and assessing deep trackers. The dataset is split into training and testing subsets. Specifically, the training subset contains 1,120 sequences with 2.83M frames, and the testing subset consists of 150 sequences with 350K frames. Besides, each sequence in LaSOT is annotated by 14 attributes, including illumination variation, full occlusion, partial occlusion, deformation, motion blur, fast motion, scale variation, camera motion, rotation, background clutter, low resolution, viewpoint change, out-of-view and aspect ratio change.





References:

[1] Yi Wu, Jongwoo Lim, Ming-Hsuan Yang: Online Object Tracking: A Benchmark. CVPR 2013: 2411-2418. https://doi.org/10.1109/CVPR.2013.312

[2] Yi Wu, Jongwoo Lim, Ming-Hsuan Yang: Object Tracking Benchmark. IEEE Trans. Pattern Anal. Mach. Intell. 37(9): 1834-1848 (2015). https://doi.org/10.1109/TPAMI.2014.2388226

[3] Pengpeng Liang, Erik Blasch, Haibin Ling: Encoding Color Information for Visual Tracking: Algorithms and Benchmark. IEEE Trans. Image Process. 24(12): 5630-5644 (2015). https://doi:10.1109/tip.2015.2482905

[4] Matthias Mueller, Neil Smith, Bernard Ghanem: A Benchmark and Simulator for UAV Tracking. ECCV (1) 2016: 445-461. https://doi.org/10.1007/978-3-319-46448-0_27

[5] Heng Fan, Liting Lin, Fan Yang, Peng Chu, Ge Deng, Sijia Yu, Hexin Bai, Yong Xu, Chunyuan Liao, Haibin Ling: LaSOT: A High-Quality Benchmark for Large-Scale Single Object Tracking. CVPR 2019: 5374-5383. https://doi:10.1109/cvpr.2019.00552


# Experimental Results

* **Results: Different attributes-based success plots of OPE for the OTB100 dataset (Figure 3).** 
![image text](https://github.com/hu-cv/SFCN/blob/main/Experimental%20results/Figure3.png)

* **Results: Different attributes-based success plots of OPE for the TC128 dataset (Figure 5).** 
![image text](https://github.com/hu-cv/SFCN/blob/main/Experimental%20results/Figure5.png)

* **Results: Different attributes-based success plots of OPE for the UAV123 dataset (Figure 7).** 
![image text](https://github.com/hu-cv/SFCN/blob/main/Experimental%20results/Figure7.png)

* **Results: Different attributes-based success plots of OPE for the LaSOT dataset (Figure 9).** 
![image text](https://github.com/hu-cv/SFCN/blob/main/Experimental%20results/Figure9.png)

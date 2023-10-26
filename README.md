# SFCN
Hi! You are welcome to visit here! This repository will be used to release the code of a novel tracking method called the Sparse Filters-based Convolutional Network (SFCN), which has been proposed in our paper entitled "Learning Sparse Filters-based Convolutional Networks Without Offline Training for Robust Visual Tracking" submitted to IEEE Transactions on Circuits and Systems for Video Technology (TCSVT). **NOTE that once our manuscript is accepted by TCSVT, we will release the code immediately**. 

Different from existing methods, SFCN is a fully feed-forward convolutional network that does not need offline training. The only learning step involves the convolution kernels, which are composed of sparse filters directly acquired online from image patches of tracking targets via sparse dictionary learning. Furthermore, the proposed SFCN has a lightweight structure that can achieve fast online tracking and mainly involves two convolutional layers that learn effective generic features by exploiting discriminative information and hierarchical layout information. Specifically, the first convolutional layer learns a set of discriminative sparse filters, which are then used to encode the discriminative information between foreground and background of the target region. The second convolutional layer learns a set of over-complete sparse filters, which are then used to encode the hierarchical layout information among the local patches inside each target candidate region. Moreover, to alleviate the problem of tracking drift, the sparse filters and target templates are updated online via a dynamic model updating strategy. We used five large-scale benchmark datasets including OTB 50/100, TC128, UAV123, and LaSOT to empirically evaluate the proposed method, and the experimental results show that the proposed method performs favorably against existing generic feature-based trackers, deep trackers without offline training, and several state-of-the-art (SOTA) deep trackers with offline training in terms of accuracy and robustness.

# Experimental Datasets
* **Online Tracking Benchmark (OTB)** [1][2]. (http://cvlab.hanyang.ac.kr/tracker_benchmark/index.html). The OTB100 dataset contains 100 fully sequences annotated by 11 challenging factors, including background clutter (BC), deformation (DEF), illumination variation (IV), low resolution (LR), motion blur (MB),fast motion (FM), out-of-plane rotation (OPR), occlusion (OCC), in-plane rotation (IPR), out-of-view (OV) and scale variation (SV) issues. 

* **Temple Color (TC128)** [3]. (http://www.dabi.temple.edu/~hbling/data/TColor-128/TColor-128.html). The TC128 dataset contains 128 fully sequences annotated by 11 challenging factors, including background clutter (BC), deformation (DEF), illumination variation (IV), low resolution (LR), motion blur (MB),fast motion (FM), out-of-plane rotation (OPR), occlusion (OCC), in-plane rotation (IPR), out-of-view (OV) and scale variation (SV) issues.

* **Unmanned Aerial Vehicle tracking benchmark (UAV123)** [4]. (https://cemse.kaust.edu.sa/ivul/uav123). The UAV123 dataset is a tracking benchmark for lowaltitude unmanned aerial vehicle (UAV) target tracking, and each sequence is annotated by 12 attributes, including aspect ratio change, background clutter, camera motion, fast motion, full occlusion, illumination variation, low resolution, out-ofview, partial occlusion, similar object, scale variation, and viewpoint change. 

* **Large-scale Single Object Tracking (LaSOT)** [5]. (https://cis.temple.edu/lasot). The LaSOT dataset is a long-term tracking benchmark that aims to provide a large set of videos for training and assessing deep trackers. The dataset is split into training and testing subsets. Specifically, the training subset contains 1,120 sequences with 2.83M frames, and the testing subset consists of 150 sequences with 350K frames. Besides, each sequence in LaSOT is annotated by 14 attributes, including illumination variation, full occlusion, partial occlusion, deformation, motion blur, fast motion, scale variation, camera motion, rotation, background clutter, low resolution, viewpoint change, out-of-view and aspect ratio change.





References:

[1]Yi Wu, Jongwoo Lim, Ming-Hsuan Yang (2013) Online Object Tracking:A Benchmark. In: Proceedings of the IEEE conference on computer vision and pattern recognition, pp 2411-2418
https://doi.org/10.1109/CVPR.2013.312

[2]Yi Wu, Jongwoo Lim, Ming-Hsuan Yang (2015) Object Tracking Benchmark.
IEEE Trans. Pattern Anal. Mach. Intell. 37(9): 1834-1848
https://doi.org/10.1109/TPAMI.2014.2388226

[3]P. Liang, E. Blasch, and H. Ling, “Encoding color information
for visual tracking: Algorithms and benchmark,” IEEE Transactions
on Image Processing, vol. 24, no. 12, pp. 5630–5644, Dec. 2015.
https://doi:10.1109/tip.2015.2482905

[4] M. Mueller, N. Smith, and B. Ghanem, “A benchmark and simulator
for UAV tracking,”Computer Vision – ECCV 2016, pp. 445–461, 2016.
https://doi:10.1007/978-3-319-46448-0 27

[5] H. Fan et al., “LaSOT: A high-quality benchmark for large-scale single
object tracking,” 2019 IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR), Jun. 2019. 
https://doi:10.1109/cvpr.2019.00552


# Experimental Results

* **Results: Different attributes-based success plots of OPE for the OTB100 dataset (Figure 3).** 
![image text](https://github.com/hu-cv/SFCN/blob/main/Experimental%20results/Figure3.png)

* **Results: Different attributes-based success plots of OPE for the TC128 dataset (Figure 5).** 
![image text](https://github.com/hu-cv/SFCN/blob/main/Experimental%20results/Figure5.png)

* **Results: Different attributes-based success plots of OPE for the UAV123 dataset (Figure 7).** 
![image text](https://github.com/hu-cv/SFCN/blob/main/Experimental%20results/Figure7.png)

* **Results: Different attributes-based success plots of OPE for the LaSOT dataset (Figure 9).** 
![image text](https://github.com/hu-cv/SFCN/blob/main/Experimental%20results/Figure9.png)

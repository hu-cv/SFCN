# SFCN
Hi! You are welcome to visit here!
This repository will be used to release the code of a novel tracking method called the Sparse Filters-based Convolutional Network (SFCN). Different from existing methods, SFCN is a fully feed-forward convolutional network that does not need offline training. The only learning step involves the convolution kernels, which are composed of sparse filters directly acquired online from image patches of tracking targets via sparse dictionary learning. Furthermore, the proposed SFCN has a lightweight structure that can achieve fast online tracking and mainly involves two convolutional layers that learn effective generic features by exploiting discriminative information and hierarchical layout information. Specifically, the first convolutional layer learns a set of discriminative sparse filters, which are then used to encode the discriminative information between foreground and background of the target region. The second convolutional layer learns a set of over-complete sparse filters, which are then used to encode the hierarchical layout information among the local patches inside each target candidate region. Moreover, to alleviate the problem of tracking drift, the sparse filters and target templates are updated online via a dynamic model updating strategy. We used five large-scale benchmark datasets including OTB 50/100, TC128, UAV123, and LaSOT to empirically evaluate the proposed method, and the experimental results show that the proposed method performs favorably against existing generic featurebased trackers, deep trackers without offline training, and several state-of-the-art (SOTA) deep trackers with offline training in terms of accuracy and robustness.

# Experimental Datasets
* **Online Tracking Benchmark (OTB)** [1][2]. (http://cvlab.hanyang.ac.kr/tracker_benchmark/index.html). The OTB100 dataset contains 100 fully sequences annotated by 11 challenging factors, including background clutter (BC), deformation (DEF), illumination variation (IV), low resolution (LR), motion blur (MB),fast motion (FM), out-of-plane rotation (OPR), occlusion (OCC), in-plane rotation (IPR), out-of-view (OV) and scale variation (SV) issues. 


References:

[1]Yi Wu, Jongwoo Lim, Ming-Hsuan Yang (2013) Online Object Tracking:A Benchmark. In: Proceedings of the IEEE conference on computer vision and pattern recognition, pp 2411-2418
https://doi.org/10.1109/CVPR.2013.312

[2]Yi Wu, Jongwoo Lim, Ming-Hsuan Yang (2015) Object Tracking Benchmark.
IEEE Trans. Pattern Anal. Mach. Intell. 37(9): 1834-1848
https://doi.org/10.1109/TPAMI.2014.2388226


* **Comparison Results** 



# Comparison Results

* **CST** is a global appearance model which adopts the circular shifts of target to refine and reduce the number of samples.
Paper: Tianzhu Zhang, Adel Bibi, Bernard Ghanem (2016) In Defense of Sparse Tracking: Circulant Sparse Tracker. In: Proceedings of the IEEE conference on computer vision and pattern recognition, pp 3880-3888. https://doi.org/10.1109/CVPR.2016.421

* **RSLT** is a low-rank representation based global appearance model that incorporates spatio-temporal structural constraints into objective function.
Paper：Sajid Javed, Arif Mahmood, Jorge Dias, Naoufel Werghi (2020) Robust Structural Low-Rank Tracking. IEEE Trans. Image Process. 29: 4390-4405. https://doi.org/10.1109/TIP.2020.2972102

* **ASLA** is a local sparse appearance model where the dictionary is encoded by local patches extracted from target areas.
Paper: Xu Jia, Huchuan Lu, Ming-Hsuan Yang (2012) Visual tracking via adaptive structural local sparse appearance model. In: Proceedings of the IEEE conference on computer vision and pattern recognition, pp 1822-1829. https://doi.org/10.1109/CVPR.2012.6247880

* **LSAM** is an improved local appearance model that explicitly exploits stable patches, valid patches and invalid patches to deeply explore the appearance characteristics of local patches.
Paper：Ke Nai, Zhiyong Li, Guiji Li, Shanquan Wang (2018) Robust Object Tracking via Local Sparse Appearance Model. IEEE Trans. Image Process. 27(10): 4958-4970. https://doi.org/10.1109/TIP.2018.2848465

* **NDDL** is an enhanced local sparse appearance model where local patches are acquired according to the temporal and spatial local correlation of objects.
Paper：HongyanWang, Helei Qiu, Wenshu Li (2020) Nonconvex dictionary learning based visual tracking method. Signal Process. 172: 107535. https://doi.org/10.1016/j.sigpro.2020.107535

* **MSRT** is a joint sparse appearance model that jointly exploits the shared and feature-specific properties of different features by decomposing multiple sparsity patterns.
Paper：Xiangyuan Lan, Shengping Zhang, Pong C. Yuen, Rama Chellappa (2018) Learning Common and Feature-Specific Patterns: A Novel Multiple-Sparse-
Representation-Based Tracker. IEEE Trans. Image Process. 27(4): 2022-2037. https://doi.org/10.1109/TIP.2017.2777183

* **MJDL** is a multitask based joint sparse appearance model that utilizes a multitask learning approach to learn multiple linear sparse representations instead of separately learning the multiple dictionaries.
Paper：Heng Fan, Jinhai Xiang (2017) Robust Visual Tracking With Multitask Joint Dictionary Learning. IEEE Trans. Circuits Syst. Video Technol. 27(5): 1018-1030.
https://doi.org/10.1109/TCSVT.2016.2515738

* **SST** is a structural sparse appearance model which attempts to incorporate the properties of the local, global and joint sparse representations.

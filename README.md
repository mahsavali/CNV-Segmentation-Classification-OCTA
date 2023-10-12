# CNV-Net: Segmentation, Classification and Activity Score Measurement of Choroidal Neovascularization (CNV) using Optical Coherence Tomography Angiography (OCTA)
To the best of our knowledge, this work is the first attempt for automatic calculation of the activity criteria for CNV lesions in OCTA images. We propose a two-stage algorithm to first segment the CNV mask and then to assign the activity criteria to each lesion. en-face images of the outer retina and choroid are used for this purpose. In the segmentation stage, the area containing the CNV the outer retina en-face (CNV mask) is determined using DL method. By multiplying the CNV mask in the original image (CNV ROI), the unwanted noisy surrounded area is suppressed but the background of the vessels, necessary for the feature extraction in the next step, is yet maintained. Additionally, the dark halo mask and peripheral Vessel Termini mask are segmented using classical image processing techniques from outer retina en-face and choroidal en-face, respectively. These three masks are then fed into DL-based classification stage for automatic assignment of the five activity criteria to each CNV lesion. For this purpose, the presence or absence of each activity criteria are identified by individual binary DL classification model. Due to limited amount of data, transfer learning (TL) technique with pre-trained models are utilized. The network is then tailored by re-training a limited number of parameters of the network using the limited available data.

## Related Research
[Link to the Research Paper](https://www.mdpi.com/2075-4418/13/7/1309)


# CNV-Net: Segmentation, Classification and Activity Score Measurement of Choroidal Neovascularization (CNV) using Optical Coherence Tomography Angiography (OCTA)

# Research Summary
The study discusses previous AI studies related to age-related macular degeneration (AMD), particularly those analyzing OCTA images. While these studies have shown promise, the current research focuses on addressing some of their limitations.

The current study aimed to develop an AI-based algorithm for the segmentation and classification of Choroidal Neovascularization (CNV) activity in Optical Coherence Tomography Angiography (OCTA) images. The algorithm consists of two main components: 1) a modified U-Net network for CNV segmentation, and 2) five binary classification networks for assessing specific CNV activity criteria using Deep Learning models, incorporating transfer learning.
![Alt Text](https://www.mdpi.com/diagnostics/diagnostics-13-01309/article_deploy/html/images/diagnostics-13-01309-g002.png)
## Methodology & Results
The goal of the segmentation task is to pinpoint the exact location of the Choroidal Neovascularization (CNV) lesion in outer retinal en-face images. To achieve this, the U-net algorithm was modified, a well-known model for segmenting medical images, with encoder and decoder routes. The SEG-CNV architecture, is a redesigned version of the original U-net. The original format had around 30 million parameters, which led to overfitting issues with small datasets. In SEG-CNV, the number of parameters was reduced to approximately 1.6 million, specifically tailored for grayscale input images of 128 × 128 pixels.

The output of the SEG-CNV model is a white pixel on a black background, representing the CNV lesion (CNV mask in Figure 3). Since detailed information from the CNV's internal structure is needed in the classification stage, the predicted mask is then multiplied by the outer retinal en-face image. This multiplication results in a Choroidal Neovascularization Region of Interest (CNV ROI), which serves as the final output of the segmentation process (CNV ROI in bellow Figure ).

![Image URL](https://www.mdpi.com/diagnostics/diagnostics-13-01309/article_deploy/html/images/diagnostics-13-01309-g004.png)

The segmentation network achieved an average Dice coefficient of 0.90 across all images, with a minimum individual image performance of 0.61. Individual classifiers for the five activity criteria showed accuracies ranging from 0.81 to 0.86.

## Conclusion
The proposed AI algorithm represents a novel attempt to automatically calculate the activity criteria for CNV lesions in OCTA images. It involves segmenting CNV masks, identifying activity criteria, and using Deep Learning for classification. The method allows for the objective and repeatable assessment of CNV features.

However, the study acknowledges certain limitations, including a small sample size and the cross-sectional design. To enhance future research, the authors suggest enlarging the training dataset and exploring multi-classification algorithms. Additionally, they mention the need for further validation and analysis of CNV lesions in OCTA images for the diagnosis and treatment of neovascular AMD.
## Related Research
[Link to the Research Paper](https://www.mdpi.com/2075-4418/13/7/1309)


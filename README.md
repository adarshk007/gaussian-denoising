# gaussian-denoising
denoising experiments in MATLAB.
1) addition of noise---Inoisy = imnoise(I,'gaussian',0,v); % Gaussian Noise

2) For Gaussian noise, you will vary ‘v’ to generate three noise levels. The noise levels are 5%, 10% and 20% of the highest pixel value (1 if you are operating in ‘double’). Therefore v will be 0.05, 0.1 and 0.2.

3) Now we have to denoise the noisy image using mean filtering and median filtering. We have to apply the appropriate filter depending on the type of noise.

4) For calculating the weights of the Gaussian mask, use http://dev.theomader.com/gaussian-kernel-calculator/

5)the code for PSNR is also attached---for calculating PSNR value.

6)noise ratio (SSIM) between the original (clean) image and your denoised images.

******USE INBUILT MATLAB FUNCTIONS FOR IMAGE FILTERING IF U WANT.******

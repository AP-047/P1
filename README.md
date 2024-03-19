# Projective Transformation and Image Stitching

## Introduction
This project demonstrates the application of projective transformation (Homography) to geometrically rectify and stitch images together, creating a panoramic image mosaic using MATLAB. It encompasses the entire workflow from image acquisition to the final visualization of stitched images.

## Features
- **Image Acquisition**: Captures overlapping images of a planar object.
- **Correspondence Analysis**: Identifies corresponding points between image pairs using interactive point selection.
- **Homography Computation**: Implements a custom function to estimate the 2D homography matrix via singular value decomposition (SVD).
- **Projective Rectification**: Utilizes the `geokor.m` function for adapting images based on computed homography, facilitating seamless image stitching.
- **Visualization**: Generates and displays the panoramic image mosaic.

## Technologies
- **MATLAB**: For all computational tasks, including image processing and matrix operations.
- **Custom MATLAB Functions**: `customImageStitch` for stitching images and estimating homography.

## Setup
The repository includes MATLAB scripts essential for executing the project:
1. `customImageStitch.m` - Main function for stitching images.
2. `geokor_matlab.m` - Auxiliary function for projective rectification.

# Projective Transformation and Image Stitching

## Introduction
This MATLAB-based project demonstrates the application of projective transformation (Homography) to geometrically rectify and stitch images together, creating a panoramic image mosaic. It encompasses the entire workflow from image acquisition to the final visualization of stitched images.

## Features
- **Image Acquisition**: Captures overlapping images of a planar object.
- **Correspondence Analysis**: Identifies corresponding points between image pairs using interactive point selection.
- **Homography Computation**: Implements a custom function to estimate the 2D homography matrix via singular value decomposition (SVD).
- **Projective Rectification**: Utilizes the `geokor.m` function for adapting images based on computed homography, facilitating seamless image stitching.
- **Visualization**: Generates and displays the panoramic image mosaic.

## Technologies
- **MATLAB**: For all computational tasks, including image processing and matrix operations.
- **Custom MATLAB Functions**: `customImageStitch` for stitching images and estimating homography.

## Getting Started
The repository includes MATLAB scripts essential for executing the project:
1. `customImageStitch.m` - Main function for stitching images.
2. `geokor_matlab.m` - Auxiliary function for projective rectification.

## Usage
- Ensure you have MATLAB installed.
- Run the `customImageStitch.m` with your selected images as inputs to create the panoramic image.

## Contributions
This project welcomes contributions and suggestions. Please feel free to fork the repository and submit pull requests.

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.

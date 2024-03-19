function ResultImageY = customImageStitch(img1, img2)

    % Select four corresponding image points between img1 and img2
    imshow(img1);
    [x1_custom, y1_custom] = ginput(4);
    imshow(img2);
    [x2_custom, y2_custom] = ginput(4);

    % Create a matrix of corresponding points
    A_custom = [x1_custom, y1_custom];
    B_custom = [x2_custom, y2_custom];

    % Condition the matrices
    % Compute mean coordinates for both sets of points
    mean_A_custom = mean(A_custom);
    mean_B_custom = mean(B_custom);

    % Translate coordinates by subtracting the mean values
    A_centered_custom = A_custom - mean_A_custom;
    B_centered_custom = B_custom - mean_B_custom;

    % Scale coordinates to have unit average distance from the origin
    scale_A_custom = mean(abs(A_centered_custom));
    scale_B_custom = mean(abs(B_centered_custom));

    % Transformation matrix formation
    T1_custom = [(1/scale_A_custom(1)) 0 0;0 (1/scale_A_custom(2)) 0;0 0 1]*[1 0 -mean_A_custom(1);0 1 -mean_A_custom(2);0 0 1];
    T2_custom = [(1/scale_B_custom(1)) 0 0;0 (1/scale_B_custom(2)) 0;0 0 1]*[1 0 -mean_B_custom(1);0 1 -mean_B_custom(2);0 0 1];

    % Transform source and destination coordinates x' = Tx
    A_p_custom = zeros(4, 3);
    B_p_custom = zeros(4, 3);

    for i = 1:4
        A_p_custom(i,:) = T1_custom*[A_custom(i,1); A_custom(i,2); 1];
        B_p_custom(i,:) = T2_custom*[B_custom(i,1); B_custom(i,2); 1];
    end

    % Form A matrix
    A_matrix_custom = zeros(8, 9);
    for i = 1:4
        A_matrix_custom(2*i-1:2*i, :) = [-A_p_custom(i,1) -A_p_custom(i,2) -A_p_custom(i,3),0 0 0, B_p_custom(i,1)*A_p_custom(i,1) B_p_custom(i,1)*A_p_custom(i,2) B_p_custom(i,1)*A_p_custom(i,3);
        0 0 0,-A_p_custom(i,1) -A_p_custom(i,2) -A_p_custom(i,3),  B_p_custom(i,2)*A_p_custom(i,1) B_p_custom(i,2)*A_p_custom(i,2) B_p_custom(i,2)*A_p_custom(i,3)]; 
    end

    % Apply SVD
    [U_custom, S_custom, V_custom] = svd(A_matrix_custom);

    % Create the H matrix
    H_custom = reshape(V_custom(:, end), 3, 3).';

    % De-condition matrices
    H_decond_custom = inv(T2_custom)*H_custom*T1_custom;

    % Question 4
    ResultImageY = geokor_matlab(H_decond_custom, img1, img2);
end

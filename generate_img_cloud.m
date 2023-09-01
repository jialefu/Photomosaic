function img_cloud = generate_img_cloud(bg_path, images, main_color,rate)

bar = waitbar(0, '画家正在准备画笔...');

bg_img = imread(bg_path);
new_size = round(rate * size(bg_img,[1,2]));
bg_resize = imresize(bg_img, new_size);
imshow(bg_resize)

width = size(images, 2);
img_cloud = uint8(zeros(width * new_size(1), width * new_size(2), 3));
for i = 1 : new_size(1)
    for j = 1 : new_size(2)
        % 找到和当前像素点最接近的图片
        dist2 = sum((double(squeeze(bg_resize(i,j,:)))' - main_color).^2, 2);
        [~,img_index] = min(dist2);
        img_this_pix = squeeze(images(img_index,:,:,:));
        img_cloud((i - 1) * width + 1 : i * width, (j - 1) * width + 1 : j * width, :) = img_this_pix;
    end
    str=['正在努力画图中...', num2str(100 * i / new_size(1),'%4.2f'), '%'];
    waitbar(i / new_size(1), bar, str)
end

close(bar);
end
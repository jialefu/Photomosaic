function images = read_images(path, width)

bar = waitbar(0, '读取数据中...'); % 进度条

img_paths = dir(path);
img_paths([1,2]) = [];

images = zeros(length(img_paths), width, width, 3);
images = uint8(images);

for j=1:length(img_paths)
    try
        img_path = fullfile(path, img_paths(j).name);
        img = imread(img_path);
        img_resized = imresize(img,[width width]);
        images(j,:,:,:) = img_resized;
        
        str=['努力计算中...    ', num2str(100 * j / length(img_paths),'%4.2f'), '%'];
        waitbar(j / length(img_paths), bar, str)
    catch
        continue
    end
    
end

close(bar);
end
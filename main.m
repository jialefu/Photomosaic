clear;clc
close all

width = 128;

file_name = strcat("data/images", num2str(width), ".mat");
if exist(file_name, 'file')
    load(file_name);
else
    images = read_images("images", width);
    save(file_name, "images");
end

main_color = get_main_color(images);

bg_path = "target.jpg";

img_cloud = generate_img_cloud(bg_path, images, main_color);

imwrite(img_cloud,'results\result.jpg',0.2);
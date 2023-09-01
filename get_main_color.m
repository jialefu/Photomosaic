function main_color = get_main_color(images)

main_color = squeeze(mean(images,[2,3])); % 这里就是简单求了一下平均值

end
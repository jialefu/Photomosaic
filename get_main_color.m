function main_color = get_main_color(images)

main_color = squeeze(mean(images,[2,3])); % ������Ǽ�����һ��ƽ��ֵ

end
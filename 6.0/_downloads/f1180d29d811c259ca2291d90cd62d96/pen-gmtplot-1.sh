gmt begin rail-trail png,pdf
gmt basemap -R0/10/0/4 -Jx1c -B+n
# 繪製黑色線段
gmt plot -W5p,black << EOF
1 2
9 2
EOF
# 使用相同的數據點繪製稍細的白色線段
gmt plot -W4p,white,20_20 << EOF
1 2
9 2
EOF
gmt end
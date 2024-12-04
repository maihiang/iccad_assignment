#!/bin/bash
# 创建一个空数组存储延迟
declare -A delays
# 创建一个空数组存储ip
declare -A ips
# 创建一个空数组存储ping成功的域名
declare -a success
# 创建一个空数组存储ping失败的域名
declare -a fail
# 遍历所有参数
for domain in "$@"; do
    # 初始化延迟时间
    total_delay=0
    
    # 第一次ping
    result=$(ping -c 1 -w 1 $domain)

    # 判断是否ping成功
    if [ $? -eq 0 ]; then
        # 获取ping的延迟
        delay=$(echo "$result" | awk -F 'time=' '/time=/ {print $2}' | awk '{print $1}')
        total_delay=$(echo $total_delay+$delay | bc)

        # 循环4次
        for i in {1..4}; do
            # 第2-5次ping
            result=$(ping -c 1 -w 1 $domain)
            # 累计延迟
            delay=$(echo "$result" | awk -F 'time=' '/time=/ {print $2}' | awk '{print $1}')
            total_delay=$(echo $total_delay+$delay | bc)
        done

        # 计算平均延迟
        delay=$(echo "scale=3;$total_delay/5" | bc)

        # 存储延迟
        delays[$domain]=$delay

        # 存储ping成功的域名
        success+=($domain)
    else
        # 存储ping失败的域名
        fail+=($domain)
    fi

    # 存储所有域名的ip
    ips[$domain]=$(ping -c 1 -w 1 $domain | grep "PING" | awk '{print $3}' | awk -F '(' '{print $2}' | awk -F ')' '{print $1}')

    # echo "$domain(${ips[$domain]}) 延迟: ${delays[$domain]} ms"
done

# 对ping成功的域名按照延迟排序
{
for success_domain in "${success[@]}"; do
    echo "$success_domain @ ${ips[$success_domain]} @ ${delays[$success_domain]} ms"
done
} | sort -k 5 -n

echo -e "\n"

# 输出ping失败的域名
{
for fial_domain in "${fail[@]}"; do
    echo "$fial_domain @ ${ips[$fial_domain]} is unreachable"
done
} | sort -k 3 -n
#!/bin/bash
# ===============================================================
# RX580 Linux Stability Fix - Tune Script
# Autor: Sílvio Henrique (Silvada)
# Versão: 1.0
# ===============================================================

sleep 5
GPU_PATH="/sys/class/drm/card0/device"
POWER_CAP_MW="110000000"  # 110W

# Força controle manual
echo "manual" > $GPU_PATH/power_dpm_force_performance_level

# Define limite de potência (powercap)
HWMON_PATH=$(find $GPU_PATH -name power1_cap | head -n 1)
if [ -n "$HWMON_PATH" ]; then
    echo $POWER_CAP_MW > "$HWMON_PATH"
fi

# Força estado de memória alto
echo "3" > $GPU_PATH/pp_dpm_mclk

echo "✅ RX580 tuning applied: PowerCap=${POWER_CAP_MW}uW"

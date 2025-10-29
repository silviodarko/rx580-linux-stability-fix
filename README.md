# 🧩 RX580 Linux Stability Fix

**Autor:** Sílvio Henrique (Silvada)  
**Versão:** 1.0  
**Licença:** MIT  

Guia e scripts para **estabilizar a AMD Radeon RX 580 (especialmente a 2048SP)** em distribuições Linux.  

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Stable-success.svg)]()
[![Made with ❤️ in Linux](https://img.shields.io/badge/Made%20with%20❤️-Linux-blue.svg)]()

Este projeto nasceu da experiência prática e investigação técnica sobre desligamentos, instabilidades e bugs gráficos em ambientes com Wayland, GNOME e drivers `amdgpu`.

---

## 🚀 Recursos
- Serviço `systemd` que aplica ajustes automáticos no boot.  
- Controle manual de DPM e PowerCap via `sysfs`.  
- Ajustes persistentes para reduzir consumo e estabilizar FPS.  
- Relatório técnico detalhado com causas e soluções.

---

## ⚙️ Instalação
```bash
git clone https://github.com/silviodarko/rx580-linux-stability-fix.git
cd rx580-linux-stability-fix/scripts
sudo cp tune_rx580.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/tune_rx580.sh
sudo cp rx580-tune.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now rx580-tune.service
```

---

## 🧠 Requisitos
- Kernel Linux com suporte ao `amdgpu`;
- Parâmetro GRUB:  
  `amdgpu.ppfeaturemask=0xffffffff amdgpu.dc=0`  
- Python3 (para monitoramento opcional).

---

## 🧾 Créditos
Desenvolvido por **Sílvio Henrique (Silvada)** 🦾  
Com o apoio técnico da comunidade Linux BR.  
Se este projeto te ajudou, ⭐ deixa uma estrela no repositório!

---

## 🧰 Licença
Este projeto é licenciado sob a [MIT License](LICENSE).

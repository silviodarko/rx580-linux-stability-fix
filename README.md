# 🧪 RX580 Linux Stability Fix

**Autor:** Sílvio Henrique (Silvada)  
**Versão:** 1.1  
**Licença:** MIT  

Guia e scripts para **estabilizar a AMD Radeon RX 580 (especialmente a 2048SP)** em distribuições Linux.  

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Stable-success.svg)]()
[![Made with ❤️ in Linux](https://img.shields.io/badge/Made%20with%20%E2%9D%A4%EF%B8%8F-Linux-blue.svg)]()

Este projeto nasceu da experiência prática e investigação técnica sobre desligamentos, instabilidades e bugs gráficos em ambientes com Wayland, GNOME e drivers `amdgpu`.

---

## 🚀 Recursos
- Serviço `systemd` que aplica ajustes automáticos no boot;  
- Controle manual de DPM e PowerCap via `sysfs`;  
- Ajustes persistentes para reduzir consumo e estabilizar FPS;  
- Parâmetros otimizados de kernel para FSync/ESync;  
- Compatibilidade com **Debian**, **Fedora/Nobara**, **Arch/CachyOS**;  
- Suporte a **CoreCtrl** com permissões automáticas via **Polkit**;  
- Redução de picos de energia e travamentos em jogos AAA.

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

## 🧩 FSync / ESync Fix (2025 Update)

### 🔧 Ajuste no GRUB
Edite:
```bash
sudo nano /etc/default/grub
```

Adicione:
```bash
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash amdgpu.ppfeaturemask=0xffffffff amdgpu.dc=0"
```

Atualize:
```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo reboot
```

---

### ⚙️ CoreCtrl (Controle de voltagem e potência)
```bash
sudo apt install corectrl -y
```

Crie a regra:
```bash
sudo nano /etc/polkit-1/rules.d/90-corectrl.rules
```

Cole:
```js
polkit.addRule(function(action, subject) {
  if ((action.id == "org.corectrl.helper.init" ||
       action.id == "org.corectrl.helperkiller.init") &&
      subject.local == true &&
      subject.active == true &&
      subject.isInGroup("riquelab")) {
      return polkit.Result.YES;
  }
});
```

---

### 🧠 Configurações no CoreCtrl
- Vá em **Performance → GPU → Advanced Mode**  
- **P-State 7 Voltage:** 1000–1070 mV  
- **Power Limit:** 110 W  
- **Performance Mode:** manual  

💡 Essas configs eliminam desligamentos e estabilizam o FSync/ESync em jogos.

---

## 🧠 Requisitos
- Kernel Linux com suporte ao `amdgpu`;  
- Parâmetro GRUB:  
  `amdgpu.ppfeaturemask=0xffffffff amdgpu.dc=0`  
- Python3 (para monitoramento opcional);  
- Pacote `corectrl` (opcional, para controle fino de energia).

---

## 🧾 Créditos
Desenvolvido por **Sílvio Henrique (Silvada)** 🧫  
Com o apoio técnico da comunidade Linux BR.  
Se este projeto te ajudou, ⭐ deixa uma estrela no repositório!

---

## 🧰 Licença
Este projeto é licenciado sob a [MIT License](LICENSE).

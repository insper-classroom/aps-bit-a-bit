[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/tgRCPRor)


## APS D: Lógica Sequencial
### Vídeo da RAM8 na FPGA:
* https://youtu.be/aUttmNczBd0

### Vídeo do Program Counter na FPGA:
* https://youtu.be/e1TlqQitpmw

### Vídeo explicativo do FFJK, FFT e Counterdown:
* https://youtu.be/OFnzTAkuaPU

## APS C: Unidade Lógica Aritmética
### Vídeo do conceito B:
* https://youtu.be/6MlTXM271xs

### Vídeo do conceito A:
* https://youtu.be/Z11oyoC3WEI

## APS B: Lógica Combinacional
### Video da FPGA funcionando com os dígitos Hexadecimais:
* https://youtu.be/6QXyKhrzQrE

```
export SIM=ghdl
pip3 install -r requirements.txt
cd b_logComb
SIM=ghdl pytest -s
```

## Rodando apenas um teste

Para executar apenas um teste você pode passar o nome deles usando `-k` 

```
SIM=ghdl pytest -k and16
```

Apenas o `and16` sera testado.

## Dica

Digite no terminal uma única vez para habilitar o uso do simulador ghdl

```bash
echo 'export SIM=ghdl' >> $HOME/elementos.sh
```

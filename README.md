# Workshop: Sistemas Embarcados com RISC-V

Este repositório reúne todo o material necessário para executar exemplos de sistemas embarcados baseados em RISC-V usando Docker. Aqui você encontrará scripts, containers e ferramentas para compilar, simular e executar código em RISC-V.

---

## Índice

1. [Pré-requisitos](#pré-requisitos)  
2. [Instalação e Setup](#instalação-e-setup)  
3. [Variáveis de Ambiente](#variáveis-de-ambiente)  
4. [Estrutura do Repositório](#estrutura-do-repositório)  
5. [Execução de Exemplos](#execução-de-exemplos)  
6. [Extensões Recomendadas para VSCode](#extensões-recomendadas-para-vscode)  
7. [Suporte e Dúvidas](#suporte-e-dúvidas)  

---

## Pré-requisitos

Antes de iniciar, verifique se você possui:

- **Conhecimentos básicos em**:
  - Docker  
  - Shell Script (Bash)  
  - Linguagem C  
  - Git  

- **Ferramentas instaladas**:
  - Docker Engine (versão compatível com Linux/Mac/Windows)  
  - Make  
  - Git  

- **Opcional, mas recomendado**:
  - VSCode (ou outro editor de sua preferência)  
  - Extensões de C/C++ e suporte a RISC-V (ver [Extensões Recomendadas](#extensões-recomendadas-para-vscode))  

---

## Instalação e Setup

### 1. Construir a Imagem Docker

Dentro do diretório `docker/`, existe um `Makefile` com dois alvos principais:

- **`dk_build`**: constrói a imagem Docker.  
- **`dk_run`**: executa um contêiner interativo a partir da imagem construída.  

Para criar a imagem, execute:

```bash
make dk_build -C docker
````

> **Observação:**
>
> * O arquivo `Dockerfile` está em `docker/Dockerfile`.
> * A imagem resultante contém um ambiente Linux mínimo com dependências para o workshop.

---

### 2. Iniciar o Contêiner Docker

Após a imagem ser construída, inicie um contêiner interativo:

```bash
make dk_run -C docker
```

Este comando abrirá um shell dentro do contêiner, permitindo executar os passos seguintes diretamente no ambiente isolado.

---

### 3. Instalar as Ferramentas RISC-V

Dentro do contêiner Docker, faça:

```bash
chmod +x install-tools.sh
./install-tools.sh
```

* O script `install-tools.sh` instalará:

  * **RISC-V GNU Toolchain** (bare-metal, multilib)
  * **Spike** (simulador de instruções RISC-V)
  * **RISC-V Proxy Kernel (riscv-pk)**

> **Atenção:**
>
> * A compilação da GNU Toolchain pode levar várias horas, dependendo dos recursos do seu host.
> * Todos os binários serão instalados em `/workspace/riscv-tools/main` por padrão.

---

## Variáveis de Ambiente

Após a instalação, é necessário configurar as variáveis de ambiente para que as ferramentas RISC-V fiquem disponíveis no `PATH`.

1. **Fonte do script de configuração**:

   Dentro do contêiner, execute:

   ```bash
   source config.sh
   ```

2. **Conteúdo de `config.sh`**:

   ```bash
   # Diretório onde as ferramentas foram instaladas
   export RISCV=/workspace/riscv-tools/main
   export PATH="$RISCV/bin:$PATH"
   ```

3. **Verificação**:

   Para confirmar que as ferramentas estão corretamente no `PATH`, rode:

   ```bash
   riscv64-unknown-elf-gcc --version
   spike -h
   qemu-system-riscv64 --version
   ```

   Todas as versões devem ser exibidas sem erros.

---

## Estrutura do Repositório

```
.
├── docker/
│   ├── Dockerfile          # Descrição da imagem/container
│   └── Makefile            # Alvos: dk_build, dk_run, dk_run_eyes
│
├── riscv-tools/
│   ├── install-tools.sh    # Script de instalação das ferramentas RISC-V
│   └── (outros arquivos)   # Logs e artefatos de compilação
│
├── workspace/
│   ├── toolchain/          # Exemplo de uso toolchain RISC-V Hello World RISC-V
│   ├── spike/              # Exemplo de simulação usando Spike ("hello, world")
│   └── ...                 # Outros exemplos do uso das ferramentas
│
├── config.sh               # Configura as variáveis de ambiente RISC-V
└── README.md               # Este arquivo
```

* **`docker/`**: contém tudo que diz respeito ao container (Dockerfile, Makefile).
* **`riscv-tools/`**: pasta onde as ferramentas RISC-V são instaladas.
* **`workspace/`**: diretórios com exemplos práticos que demonstram o uso das ferramentas instaladas.
* **`config.sh`**: script para ajustar as variáveis de ambiente necessárias ao workshop.

---

## Execução de Exemplos

Dentro do contêiner Docker e com todas as ferramentas instaladas (e variáveis carregadas via `source config.sh`), navegue até o diretório `workspace/` e escolha um exemplo para executar:

```bash
cd workspace/b-toolchain
make     # Compila o exemplo (adaptar conforme o Makefile de cada exemplo)
make sim # Executa no simulador Spike com Proxy Kernel
```

Cada subdiretório em `workspace/` possui seu próprio `Makefile`. Inspecione o Makefile para maiores informações sobre possível configuração, compilação e execução.

---

## Extensões Recomendadas para VSCode

Para melhorar a experiência de desenvolvimento e depuração em VSCode, instale as seguintes extensões:

* **[Venus (RISC-V Assembly Simulator)](https://marketplace.visualstudio.com/items?itemName=hm.riscv-venus)**
  Permite simular e depurar código assembly RISC-V diretamente no editor.

* **C/C++ (ms-vscode.cpptools)**
  Fornece IntelliSense, realce de sintaxe e depuração para C/C++.

* **(Opcional) Any RISC-V Syntax Highlight Extension**
  Caso exista extensão para realce de assembly RISC-V, considere instalá-la para facilitar a leitura do código.

---

## Cocumentação oficial dos projetos RISC-V

* [riscv-gnu-toolchain](https://github.com/riscv/riscv-gnu-toolchain)
* [riscv-isa-sim (Spike)](https://github.com/riscv-software-src/riscv-isa-sim)
* [riscv-pk](https://github.com/riscv-software-src/riscv-pk)
* [QEMU para RISC-V](https://www.qemu.org/)

---
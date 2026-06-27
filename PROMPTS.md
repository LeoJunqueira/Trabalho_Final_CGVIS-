### TODOS OS COMMITS ESTÃO EM ORDEM DE CRONOLÓGICA (ANTIGO -> RECENTE)

Todas implementação de IA está citada aqui, o que não foi citado não foi usada IA para *Criar código*



### 1 - Foi importado o modelo do Crash e suas texturas. - LEONARDO


### 2 - Atualizacao de cenario, como pilares, agua, texturas, etc. - ISASC

  - Uso de IA (Gemini) para descobrir **como fazer um objeto ficar transparente**:
    
    Enviei um trecho do código e fiz um PROMPT:
    
      "COMO SIMULAR ÁGUA? eu quero fazer uma agua estatica mesmo, como se fosse um objeto"

  
### 3 - Foi feito o bugfix enviado pelo professor. - LEONARDO


### 4 - Foram inseridos o Ripper eo Aku - Falta resolver a textura - LEONARDO


### 5 - Merge pull request #1 from LeoJunqueira/Insercao-de-modelos - LEONARDO


### 6 - Foram adicionados controles de movimento no Crash e alterados os comandos de controle da câmera. - LEONARDO
  - Uso de IA (Gemini) para **Movimentação Relativa à Câmera**;
  "Como fazer a movimentação WASD do meu personagem (Crash) ser relativa à direção para onde a câmera está olhando, ignorando o eixo Y para que ele não voe ao andar para frente?"

### 7 - Merge pull request #2 from LeoJunqueira/Controles-Crash-and-Camera - LEONARDO

### 8 - Implementado o salto do Crash - LEONARDO

  - Uso de IA (Gemini) para **Física (Gravidade e Pulos)**;
    "Como aplicar gravidade contínua baseada em delta_t e uma força de pulo no eixo Y do personagem?"

### 9 - Merge pull request #3 from LeoJunqueira/crash_jump - LEONARDO


### 10 - Ajustes na iluminação das tochas, teto e paredes externas/internas - ISASC

  - Uso de IA (Gemini) para **Fontes pontuais de luz nos pilares de Fogo**;
    
    Enviei um trecho do código e fiz esses PROMPTs:
    
      "Quero colocar fontes de luz pontuais nos 'FOGO' que estão em cima dos pilares de Tochas",
    
      "Onde aumento o tamanho da luz? para sobrepor a esfera"
    
  - Uso de IA (Gemini) para **Transformar as esferas em cima do pilar de fogo em vidro fosco colorido**;
    
    Enviei um trecho do código e fiz um PROMPT:
    
      "QUERO TRASFORMAR as esferas em vidro fosco colorido alaranjado como fogo"
    

### 11 - Cenário iluminação, paredes e teto - ISASC

  **- O MESMO COMMIT QUE O ANTERIOR, ACABEI DANDO COMMIT DUPLO SEM PERCEBER!**


### 12 - Foi inserido o sistema de colisão, o movimento das caixas e do Ripper Roo. - LEONARDO

  - Uso de IA (Gemini) para **Sistema de Colisões, Animação Dinâmica das Caixas de TNT**;
  "Como criar uma função matemática para detecção de colisão?"
  "Como animar um fluxo contínuo de caixas caindo de uma cachoeira e flutuando no rio sem criar dezenas de instâncias separadas? Quero usar fmod e o tempo do jogo para sincronizar os movimentos em um ciclo de fases."

### 13 - Merge pull request #5 from LeoJunqueira/colisão - LEONARDO


### 14 - Inserida a camera em primeira pessoa. - LEONARDO
  Sistema de Câmeras (1ª pessoa)
  - Uso de IA (Gemini) para **Sistema de Câmeras (1ª pessoa)**;
  "Como implementar um sistema de câmeras onde eu possa alternar entre uma câmera de terceira pessoa (que orbita o personagem) e uma de primeira pessoa pressionando a tecla 'C', mantendo também uma opção de câmera livre?"

### 15 - Merge pull request #6 from LeoJunqueira/develop - LEONARDO


### 16 - Adiciona mecanica de mortal no pulo, correcao de texturas e novos assets - ISASC

  - **- O MESMO COMMIT QUE O PROXIMO, ACABEI DANDO COMMIT DUPLO SEM PERCEBER!**

### 17 - Melhorias visuais, Caixas Explosivas agora matam Player e Boss - ISASC

  - Uso de IA (Gemini) para **Mecânica de giro enquanto pula**;
    
    Enviei um trecho do código e fiz um PROMPT:
    
      "quero fazer o crash girar quando pula"

  - Uso de IA (Gemini) para **Caixas Sumirem após colisão no topo**;
    
    Enviei um trecho do código e fiz um PROMPT:
    
      "quero que as caixas sumam 3 segundos depois de receber hit no topo"

  - Uso de IA (Gemini) para **Morte por explosão**;
    
    Enviei um trecho do código e fiz um PROMPT:
    
      "quero que quando as caixas explosivas desapareçam o crash morra se ele estiver em uma
    
       plataforma a direita ou a esquerda da caixa"
    
  - Uso de IA (Gemini) para **Direcionamento para onde o Ripper Roo olha enquanto pula**;
    
    Enviei um trecho do código e fiz um PROMPT:
    
      "quero que o ripper roo tmbm fique virado em direção a cada pulo dele"

  - Uso de IA (Claude) para **Morte do Player ao encostar no Boss**;
    
    Enviei o arquivo main para a IA e fiz os seguintes PROMPTs:
    
      "Quero que quando o ripper roo encoste no crash o crash morra",
    
      "agora quero que ele morra tambem para a explosao da caixa",
    
      "quero que pegue o ripper por questao de proximidade, uma distancia de uma plataforma"

### 18 - Aku Aku com curva de Bezier - LEONARDO

  - Uso de IA (Gemini) para **Curva de Bézier Cúbica (Aku Aku)**;
  "Gere a fórmula matemática para calcular a interpolação de uma Curva de Bézier Cúbica com 4 pontos de controle. Quero aplicar isso para fazer um objeto (máscara) flutuar orbitando a cabeça do personagem principal."

### 19 - Merge pull request #8 from LeoJunqueira/develop - LEONARDO


### 20 - Aku Aku com curva de Bezier - LEONARDO


### 21 - Inserido Game states - LEONARDO
  
  - Uso de IA (Gemini) para **Máquina de Estados e Interface**;
  "Como estruturar o loop principal do meu jogo OpenGL com uma Máquina de Estados Finitos (Menu, Playing, Game Over, Victory) congelando a física fora do estado 'Playing'? "

### 22 - Merge pull request #9 from LeoJunqueira/gamestate - LEONARDO


### 23 - Texto centralizado - LEONARDO
  
  - Uso de IA (Gemini) para **Máquina de Estados e Interface**;
  "Como centralizar textos na tela matematicamente e implementar tempo de invulnerabilidade, piscando ao tomar dano?"

### 24 - Merge pull request #10 from LeoJunqueira/centralizado - LEONARDO

### 25 - Foi separado o teste de colisão.

  - Uso de IA (Gemini) para **Teste de Colisão**;
  "Como criar uma função matemática para detecção de colisão AABB em 3D e como separar corretamente a declaração dessa estrutura e das funções em arquivos collisions.cpp e collisions.h para que o main.cpp as consuma?"


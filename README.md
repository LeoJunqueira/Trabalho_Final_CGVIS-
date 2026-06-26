# Computação Gráfica e Visualização I (INF01047) - INF/UFRGS

## Descrição

  O trabalho consiste em um pequeno jogo em 3D, desenvolvido em C++ com OpenGL a partir de um código baase dado pelo professor da disciplina.
  O jogo é uma cópia simples de uma fase de **Crash Bandicoot 1 de Playstation 1**, o player controla o personagem **Crash**, que se move por um
cenário composto por plataformas em um rio de frente uma cachoeira evitando cair na água e ser pego pelo chefão de fase **Ripper Roo**, que salta
continuamente entre plataformas seguindo uma rota pré-determinada.

  O cenário que o player tem interação seriam as plataformas, caixas explosivas (3 segundos após serem atingidas no topo explodem matando tanto o 
crash como o Boss se estiverem perto) que se deslocam pelo cenário, água (morre ao cair) e o prórpio Boss Ripper Roo, tudo usando o método de 
colisão simples baseado em **AABB**.
  O jogo possui uma máquina de estados com quatro fases — **Menu**, **Jogando**, **Game Over** e **Vitória**, e um HUD que exibe os pontos de vida
(HP) de ambos os personagens durante a partida.

  O cenário não interaativo seria o resto, sendo os pilares, tochas, cachoeira, paredes, iluminação dinâmica por pontos de luz simulado nas tochas,
Aku-Aku (a mascará) voando em torno do player através de uma **curva de Bézier cúbica**, etc.

  As Malhas poligonais complexas utilizadas no game são: 
  - O player (Crash)
  - O Boss (Ripper Roo)
  - A máscara (Aku-Aku)
  - Os Pilares
  - Esferas

  O restante foram usadas Cubos simples que foram alterados após transformações geométricas (ex: plataforma, pilar das tochas, etc).

## Contribuição - Isasc Ventura

- Modelagem e posicionamento dos objetos estáticos do cenário como pilares, plataformas, tochas, caixas de TNT (que passaram a se mexer após implementação do Leonardo),
  cachoeira, etc;
- Implementaço da iluminação das tochas;
- Correcção de textura do Ripper Roo e aplicaçãon das texturas do Jogo (Exceto as do Crash e Aku-Aku);
- Implementação da colisão entre o Crash e Ripper Roo (incluindo sua "morte" com respawn no centro do cenário);
- Implementação da colisão entre o Crash e a água (incluindo sua "morte" com respawn no centro do cenário);
- Lógica de explosão das caixas de TNT, incluindo o dano causado ao Ripper Roo e ao Crash quando próximos da explosão 3 segundos após a colisão;
- Ajustes como o posicionamento da câmera em primeira e em terceira pessoa, incluindo a remoção do desenho domodelo do Crash durante a primeira pessoa (para evitar
  sobreposição com a câmera);
- Implementação do Giro ("mortal") do Crash.

## Contribuição - Leonardo Junqueira

- XXXXXXXXXXXXXXXXXXXXXX


## Uso de ferramentas de IA no desenvolvimento (Claude/Gemini)

 A ferramenta foi usada como apoio para implementar o sistema de iluminação das tochas, a lógica de colisão entre o Ripper Roo e o Crash, o comportamento de explosão
das caixas de TNT após a colisão do Crash com elas, e a lógica de dano/morte do Ripper Roo e do Crash quando atingidos pela explosão.

 A IA foi útil principalmente para acelerar a escrita de trechos de lógica matemática e de controle de estado (como os temporizadores das explosões e os testes 
de colisão AABB), servindo como um ponto de partida que depois precisou ser ajustado manualmente para se encaixar nas variáveis e na estrutura específicas do código. 
Por outro lado, a ferramenta nem sempre compreendeu corretamente o contexto geométrico do cenário (posições das plataformas, escala dos objetos, sistema de coordenadas da câmera),
de modo que sugestões relacionadas a posicionamento e colisão, muitas vezes foi necessária a correção manual repetida até o comportamento ficar visualmente correto dentro do jogo.


## Funcionamento da aplicação

**Tela de menu inicial:**

<img width="1919" height="1017" alt="image" src="https://github.com/user-attachments/assets/bb3ac764-8ded-4b97-b1ae-6add56e5094f" />

**Gameplay — Crash no cenário, com HUD de vida e Ripper Roo ao fundo:**

<img width="1920" height="1009" alt="image" src="https://github.com/user-attachments/assets/84f34f5f-bd81-4fc3-9fb9-46f4e30e9522" />


**Tela de Vitória:**

<img width="1917" height="1007" alt="image" src="https://github.com/user-attachments/assets/66e9492e-6ef6-44e5-ac9d-cccec5c5287f" />


**Tela de Derrota:**

<img width="1918" height="1008" alt="image" src="https://github.com/user-attachments/assets/e725ea2c-69f8-45cc-96bf-f9eb935768a7" />


**Câmera em Primeira Pessoa:**

<img width="1911" height="1009" alt="image" src="https://github.com/user-attachments/assets/3cb0074d-522f-45f1-ac64-a0c13d02a5c2" />


### Controles

| Tecla / Ação | Função |
|---|---|
| **W / A / S / D** | Move o Crash pelo cenário (relativo à direção da câmera) |
| **Espaço** | Faz o Crash saltar (somente quando está no chão) |
| **Mouse (mover)** | Rotaciona a câmera (em primeira pessoa, sempre; em terceira pessoa, apenas com o botão esquerdo pressionado) |
| **Botão esquerdo do mouse (arrastar)** | Rotaciona a câmera em terceira pessoa |
| **Setas (↑ ↓ ← →)** | Movem livremente a câmera em terceira pessoa (modo câmera livre) |
| **C** | Alterna entre câmera em terceira pessoa e em primeira pessoa |
| **Enter** | Inicia o jogo (no menu) ou reinicia a partida (após Game Over ou Vitória) |
| **P** | Ativa projeção em perspectiva |
| **O** | Ativa projeção ortográfica |
| **Esc** | Fecha a aplicação |




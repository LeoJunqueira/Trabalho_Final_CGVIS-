# Especificação da Implementação

> [!CAUTION]
> - Você <ins>**não pode utilizar ferramentas de IA para escrever esta
>   especificação**</ins>

## Integrantes da dupla

- **Aluno 1 - Nome**: <mark>`Isasc Ventura`</mark>
- **Aluno 1 - Cartão UFRGS**: <mark>`00303938`</mark>

- **Aluno 2 - Nome**: <mark>`Leonardo Junqueira`</mark>
- **Aluno 2 - Cartão UFRGS**: <mark>`00242318`</mark>

## Detalhes do que será implementado

- **Título do trabalho**: <mark>`Chefão Ripper Roo - Crash Bandicoot`</mark>
- **Parágrafo curto descrevendo o que será implementado**: <mark>`A Fase de um Chefão (Ripper Roo) do Crash Bandicoot 1`</mark>

## Especificação visual

### Vídeo - Link

> [!IMPORTANT]
> - Coloque aqui um link para um vídeo que mostre a aplicação gráfica
>   de referência que você vai implementar. **Sua implementação deverá
>   ser o mais parecido possível com o que é mostrado no vídeo (mais
>   detalhes abaixo).**
> - **Você não pode escolher como referência: (1) algum trabalho realizado
>   por outros alunos desta disciplina, em semestres anteriores. (2) Minecraft.**
> - Por exemplo, você pode colocar um vídeo de um jogo que você gosta,
>   e seu trabalho final será uma re-implementação do jogo.
> - O vídeo pode ser um link para YouTube, Google Drive, ou arquivo mp4 dentro
>   do próprio repositório. Mas, garanta que qualquer um tenha
>   permissão de acesso ao vídeo através deste link.

<mark>`https://www.youtube.com/watch?v=1OKB8gobKCw`</mark>

### Vídeo - Timestamp

> [!IMPORTANT]
> - Coloque aqui um **intervalo de ~30 segundos** do vídeo acima, que
>   será a base de comparação para avaliar se o seu trabalho final
>   conseguiu ou não reproduzir a referência.

- **Timestamp inicial**: <mark>`25:38`</mark>
- **Timestamp final**: <mark>`26:26`</mark>

### Imagens

> [!IMPORTANT]
> - Coloque aqui **três imagens** capturadas do vídeo acima, que você
>   irá usar como ilustração para as explicações que vêm abaixo.

<img width="1283" height="633" alt="image" src="https://github.com/user-attachments/assets/afab1538-a7db-4a1b-ac83-b917cbd98245" />
<img width="1291" height="636" alt="image" src="https://github.com/user-attachments/assets/f5740ff0-7383-4163-b7f0-6dfcc353b577" />
<img width="1297" height="701" alt="image" src="https://github.com/user-attachments/assets/fdd90d12-b4d6-4387-bf1f-370933639b8c" />




## Especificação textual

Para cada um dos requisitos abaixo (detalhados no [Enunciado do Trabalho final - Moodle](https://moodle.ufrgs.br/mod/assign/view.php?id=6018620)), escreva um parágrafo **curto** explicando como este requisito será atendido, apontando itens específicos do vídeo/imagens que você incluiu acima que atendem estes requisitos.

### Malhas poligonais complexas
<mark>`Crash (player), Ripper Roo (inimigo), Akuku (mascará que segue o player), talvez algum objeto do cenário`</mark>

### Transformações geométricas controladas pelo usuário
<mark>`Crash (Player)`</mark>

### Diferentes tipos de câmeras
<mark>`Terceira pessoa (padrão do game) e Primeira pessoa`</mark>

### Instâncias de objetos
<mark>`Plataformas, Pilares de fogo, Colunas e Caixas Explosivas`</mark>

### Testes de intersecção
<mark>`Plataformas, Água, Caixas explosivas, Chefão (Ripper Roo) e Paredes invisíveis que delimitam o cenário`</mark>

### Modelos de Iluminação em todos os objetos
<mark>`Fonte de luz Pontual em cada tocha do cenário, juntamente com a "fonte de luz natural"`</mark>

### Mapeamento de texturas em todos os objetos
<mark>`Cenário, personagens (tanto player, akuku [máscara] e inimigo) e Caixas explosivas`</mark>

### Movimentação com curva Bézier cúbica
<mark>`O movimento que o Akuku (máscara) faz entorno do player`</mark>

### Animações baseadas no tempo ($\Delta t$)
<mark>`Caixas explosivas e o Ripper Roo (chefão)`</mark>

## Limitações esperadas

> [!IMPORTANT]
> - Coloque aqui uma lista de detalhes visuais ou de interação que
>   aparecem no vídeo e/ou imagens acima, mas que você **não pretende
>   implementar** ou que você **irá implementar parcialmente**.
> - Para cada item, **explique por que** não será implementado ou por
>   que será implementado parcialmente.

<mark>`
Não sabemos se conseguiremos implementar a água como aparece no game
A sombra embaixo do player
A chama da Tocha
Espuma da água
Distorção visual causada pelo fogo no cenário
`</mark>

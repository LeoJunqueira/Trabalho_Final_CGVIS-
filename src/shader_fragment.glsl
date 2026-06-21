#version 330 core

// Atributos de fragmentos recebidos como entrada ("in") pelo Fragment Shader.
in vec4 position_world;
in vec4 normal;

// Posição do vértice atual no sistema de coordenadas local do modelo.
in vec4 position_model;

// Coordenadas de textura obtidas do arquivo OBJ (se existirem!)
in vec2 texcoords;

// Vetores que calculamos no Vertex Shader
in vec4 v_ToLightTorch1;
in vec4 v_ToLightTorch2;
in vec4 v_ToLightTorch3;
in vec4 v_ToLightTorch4;
in vec4 v_ToLightTorch5;
in vec4 v_ToLightTorch6; 

// Cor da luz emitida pela tocha (laranja/amarelo) vinda do C++
uniform vec3 u_TorchColor;

// Matrizes computadas no código C++ e enviadas para a GPU
uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

// Identificador que define qual objeto está sendo desenhado no momento
#define SPHERE 0
#define BUNNY   1
#define PLANE   2
#define CRASH   3
#define CUBE    4
#define PILAR   5
#define PILAR_TOCHA  6
#define CAIXA_EXPLOSIVA 7
#define WATER 8
#define RIPPER_ROO_BODY 9
#define RIPPER_ROO_EYES 10
#define AKU_AKU 11
uniform int object_id;

// Parâmetros da axis-aligned bounding box (AABB) do modelo
uniform vec4 bbox_min;
uniform vec4 bbox_max;

// Variáveis para acesso das imagens de textura
uniform sampler2D TextureImage0;
uniform sampler2D TextureImage1;
uniform sampler2D TextureImage2;
uniform sampler2D TextureImage3;
uniform sampler2D TextureImage4;
uniform sampler2D TextureImage5;
uniform sampler2D TextureImage6;
uniform sampler2D TextureImage7;
uniform sampler2D TextureImage8;
uniform sampler2D TextureImage9;
uniform sampler2D TextureImage10;
uniform sampler2D TextureImage11;
uniform sampler2D TextureImage12;
uniform sampler2D TextureImage13;
uniform sampler2D TextureImage14;
uniform sampler2D TextureImage15;

// O valor de saída ("out") de um Fragment Shader é a cor final do fragmento.
out vec4 color;

// Constantes
#define M_PI   3.14159265358979323846
#define M_PI_2 1.57079632679489661923

void main()
{
    // Obtemos a posição da câmera utilizando a inversa da matriz que define o
    // sistema de coordenadas da câmera.
    vec4 origin = vec4(0.0, 0.0, 0.0, 1.0);
    vec4 camera_position = inverse(view) * origin;

    vec4 p = position_world;

    // Normal do fragmento atual, interpolada pelo rasterizador a partir das normais de cada vértice.
    vec4 n = normalize(normal);

    // Vetor que define o sentido da fonte de luz em relação ao ponto atual.
    vec4 l = normalize(vec4(1.0,1.0,0.0,0.0));

    // Vetor que define o sentido da câmera em relação ao ponto atual.
    vec4 v = normalize(camera_position - p);

    // Coordenadas de textura U e V
    float U = 0.0;
    float V = 0.0;

    // Coeficiente de refletância difusa e propriedades de materiais
    vec3 Kd0 = vec3(1.0, 1.0, 1.0);
    vec3 Ka = vec3(0.2, 0.2, 0.2);
    vec3 Kd = vec3(1.0, 1.0, 1.0);
    vec3 Ks = vec3(0.0, 0.0, 0.0);
    float q = 1.0;
    
    // Alpha default = 100% opaco
    float alpha_output = 1.0;

    // -------------------------------------------------------------------------
    // DEFINIÇÃO DE CORES, TEXTURAS E PROPRIEDADES DE MATERIAL (CORRIGIDO)
    // -------------------------------------------------------------------------
    if ( object_id == SPHERE )
    {
        vec4 bbox_center = (bbox_min + bbox_max) / 2.0;
        vec4 d = position_model - bbox_center;

        float rho   = length(d);
        float theta = atan(d.x,d.z);
        float phi   = asin(d.y / rho);

        U = (theta + M_PI) / 2.0 / M_PI;
        V = (phi + M_PI_2) / M_PI;

        alpha_output = 0.7; 
        Kd0 = vec3(0.9, 0.4, 0.1); 
        q = 8.0; 
        Ks = vec3(1.0, 0.6, 0.2); 
    }
    else if ( object_id == BUNNY )
    {
        float minx = bbox_min.x;
        float maxx = bbox_max.x;
        float miny = bbox_min.y;
        float maxy = bbox_max.y;

        U = (position_model.x - minx) / (maxx - minx);
        V = (position_model.y - miny) / (maxy - miny);

        Kd0 = texture(TextureImage0, vec2(U,V)).rgb;
    }
    else if ( object_id == PLANE )
    {
        U = texcoords.x;
        V = texcoords.y;
        Kd0 = texture(TextureImage1, vec2(U,V)).rgb;
    }
    else if ( object_id == CRASH )
    {
        U = texcoords.x;
        V = texcoords.y;
        Kd0 = texture(TextureImage2, vec2(U,V)).rgb; // Usa color_pallete.png
    }
    else if (object_id == PILAR)
    {
        U = texcoords.x;
        V = texcoords.y;
        Kd0 = texture(TextureImage15, vec2(U,V)).rgb; // Usa concreto.png
    }
    else if (object_id == PILAR_TOCHA)
    {
        U = texcoords.x;
        V = texcoords.y;
        Kd0 = texture(TextureImage14, vec2(U,V)).rgb; // Usa concreto.png
    }
    else if ( object_id == CUBE)
    {
        U = texcoords.x;
        V = texcoords.y;
        Kd0 = texture(TextureImage5, vec2(U,V)).rgb; // Usa concreto.png
    }
    else if ( object_id == RIPPER_ROO_BODY ) 
    {
        U = texcoords.x;
        V = texcoords.y;
        Kd0 = texture(TextureImage6, vec2(U,V)).rgb; // Usa Colores_diffuse.png
        Ka = vec3(1.0, 1.0, 1.0); 
        Kd = vec3(1.0, 1.0, 1.0);
        Ks = vec3(0.0, 0.0, 0.0); 
        q = 1.0;
    }
    else if ( object_id == RIPPER_ROO_EYES ) 
    {
        U = texcoords.x;
        V = texcoords.y;
        Kd0 = texture(TextureImage7, vec2(U,V)).rgb; // Usa TexOjos_diffuse.png
        Ka = vec3(1.0, 1.0, 1.0); 
        Kd = vec3(1.0, 1.0, 1.0);
        Ks = vec3(0.0, 0.0, 0.0); 
        q = 1.0;
    }
    else if ( object_id == AKU_AKU ) 
    {
        U = texcoords.x;
        V = texcoords.y;
        Kd0 = texture(TextureImage8, vec2(U,V)).rgb; // Usa lambert1_baseColor.png
        Ka = vec3(0.2, 0.2, 0.2);
        Kd = vec3(1.0, 1.0, 1.0);
        Ks = vec3(0.1, 0.1, 0.1); 
        q = 10.0;
    }
    else if ( object_id == CAIXA_EXPLOSIVA )
    {
        U = texcoords.x;
        V = texcoords.y;
        Kd0 = texture(TextureImage12, vec2(U,V)).rgb; // CORRIGIDO: caixaTNT.png está no índice 12!
    }
    else if ( object_id == WATER )
    {
        Kd0 = vec3(0.0f, 0.4f, 0.6f); 
        alpha_output = 0.5;
    }

    // Equação de Iluminação Direcional Global (Desativada a pedido)
    float lambert = max(0,dot(n,l));

    // -------------------------------------------------------------------------
    // CÁLCULO DE ILUMINAÇÃO DAS TOCHAS (POINT LIGHTS COM TRANSLUCIDEZ)
    // -------------------------------------------------------------------------
    vec3 total_torch_lighting = vec3(0.0);
    vec3 N_normalized = normalize(normal.xyz);

    // ---- CÁLCULO TOCHA 1 ----
    float d1 = length(v_ToLightTorch1.xyz); 
    vec3 L1 = normalize(v_ToLightTorch1.xyz);
    float dot_nl1;
    if (object_id == SPHERE) {
        dot_nl1 = dot(N_normalized, L1) * 0.5 + 0.5; // Iluminação que atravessa o vidro
        dot_nl1 = pow(dot_nl1, 2.0);
    } else {
        dot_nl1 = max(dot(N_normalized, L1), 0.0);
    }
    vec3 diffuse1 = Kd0 * u_TorchColor * dot_nl1;
    float attenuation1 = 1.0 / ((0.5 * d1) * (0.05 * d1) + 0.1); 
    total_torch_lighting += diffuse1 * attenuation1;

    // ---- CÁLCULO TOCHA 2 ----
    float d2 = length(v_ToLightTorch2.xyz); 
    vec3 L2 = normalize(v_ToLightTorch2.xyz);
    float dot_nl2;
    if (object_id == SPHERE) {
        dot_nl2 = dot(N_normalized, L2) * 0.5 + 0.5;
        dot_nl2 = pow(dot_nl2, 2.0);
    } else {
        dot_nl2 = max(dot(N_normalized, L2), 0.0);
    }
    vec3 diffuse2 = Kd0 * u_TorchColor * dot_nl2;
    float attenuation2 = 1.0 / ((0.5 * d2) * (0.05 * d2) + 0.1); 
    total_torch_lighting += diffuse2 * attenuation2;

    // ---- CÁLCULO TOCHA 3 ----
    float d3 = length(v_ToLightTorch3.xyz); 
    vec3 L3 = normalize(v_ToLightTorch3.xyz);
    float dot_nl3;
    if (object_id == SPHERE) {
        dot_nl3 = dot(N_normalized, L3) * 0.5 + 0.5;
        dot_nl3 = pow(dot_nl3, 2.0);
    } else {
        dot_nl3 = max(dot(N_normalized, L3), 0.0);
    }
    vec3 diffuse3 = Kd0 * u_TorchColor * dot_nl3;
    float attenuation3 = 1.0 / ((0.5 * d3) * (0.05 * d3) + 0.1); 
    total_torch_lighting += diffuse3 * attenuation3;

    // ---- CÁLCULO TOCHA 4 ----
    float d4 = length(v_ToLightTorch4.xyz); 
    vec3 L4 = normalize(v_ToLightTorch4.xyz);
    float dot_nl4;
    if (object_id == SPHERE) {
        dot_nl4 = dot(N_normalized, L4) * 0.5 + 0.5;
        dot_nl4 = pow(dot_nl4, 2.0);
    } else {
        dot_nl4 = max(dot(N_normalized, L4), 0.0);
    }
    vec3 diffuse4 = Kd0 * u_TorchColor * dot_nl4;
    float attenuation4 = 1.0 / ((0.5 * d4) * (0.05 * d4) + 0.1); 
    total_torch_lighting += diffuse4 * attenuation4;

    // ---- CÁLCULO TOCHA 5 ----
    float d5 = length(v_ToLightTorch5.xyz); 
    vec3 L5 = normalize(v_ToLightTorch5.xyz);
    float dot_nl5;
    if (object_id == SPHERE) {
        dot_nl5 = dot(N_normalized, L5) * 0.5 + 0.5;
        dot_nl5 = pow(dot_nl5, 2.0);
    } else {
        dot_nl5 = max(dot(N_normalized, L5), 0.0);
    }
    vec3 diffuse5 = Kd0 * u_TorchColor * dot_nl5;
    float attenuation5 = 1.0 / ((0.5 * d5) * (0.05 * d5) + 0.1); 
    total_torch_lighting += diffuse5 * attenuation5;

    // ---- CÁLCULO TOCHA 6 ----
    float d6 = length(v_ToLightTorch6.xyz); 
    vec3 L6 = normalize(v_ToLightTorch6.xyz);
    float dot_nl6;
    if (object_id == SPHERE) {
        dot_nl6 = dot(N_normalized, L6) * 0.5 + 0.5;
        dot_nl6 = pow(dot_nl6, 2.0);
    } else {
        dot_nl6 = max(dot(N_normalized, L6), 0.0);
    }
    vec3 diffuse6 = Kd0 * u_TorchColor * dot_nl6;
    float attenuation6 = 1.0 / ((0.5 * d6) * (0.05 * d6) + 0.1); 
    total_torch_lighting += diffuse6 * attenuation6;

    // 1. Criamos uma variável para o brilho próprio do objeto (começa zerada para os outros objetos)
    vec3 emissive_lighting = vec3(0.0);

    // 2. Se for a esfera, damos a ela um brilho próprio alaranjado forte
    if (object_id == SPHERE) {
        emissive_lighting = vec3(1.0, 0.45, 0.1); // Cor do "fogo" emitido pela própria cápsula
    }

    // 3. Somamos esse brilho próprio na cor final
    color.rgb = (Kd0 * (0.0)) + total_torch_lighting + emissive_lighting;
    
    // Aplica a transparência calculada de cada objeto
    color.a = alpha_output;

    // Cor final com correção gamma, considerando monitor sRGB.
    color.rgb = pow(color.rgb, vec3(1.0,1.0,1.0)/2.2);
}
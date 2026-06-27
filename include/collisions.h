#ifndef COLLISIONS_H
#define COLLISIONS_H

#include <glm/vec3.hpp>
#include <string>

// Estrutura para representar os obstáculos invisíveis no mundo
struct BoundingBox {
    glm::vec3 min;
    glm::vec3 max;
    std::string type; // Ex: "plataforma", "parede", "tnt"
    int id = -1;      // Identificador para as caixas específicas
};

// Declaração da função de detecção de colisão AABB
bool CheckAABBCollision(glm::vec3 minA, glm::vec3 maxA, glm::vec3 minB, glm::vec3 maxB);

#endif // COLLISIONS_H
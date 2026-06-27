#include "collisions.h"
#include <glm/glm.hpp>

// ==========================================
// MOTOR DE FÍSICA E COLISÃO (AABB)
// ==========================================
bool CheckAABBCollision(glm::vec3 minA, glm::vec3 maxA, glm::vec3 minB, glm::vec3 maxB) {
    // Verifica sobreposição no eixo X
    bool collisionX = maxA.x >= minB.x && minA.x <= maxB.x;
    
    // Verifica sobreposição no eixo Y
    bool collisionY = maxA.y >= minB.y && minA.y <= maxB.y;
    
    // Verifica sobreposição no eixo Z
    bool collisionZ = maxA.z >= minB.z && minA.z <= maxB.z;
    
    // Só há colisão real se estiverem se tocando nos 3 eixos simultaneamente
    return collisionX && collisionY && collisionZ;
}
// ------------------------------------------
#version 330 core

layout (location = 0) in vec3 position;
layout (location = 1) in vec3 normale;
layout (location = 2) in vec4 couleur;


uniform vec4 translation;
uniform mat4 rotation;
uniform mat4 projection;

out vec3 coordonnee_3d;
out vec3 coordonnee_3d_locale;
out vec3 vnormale;
out vec4 vcouleur;

//Un Vertex Shader minimaliste
void main (void)
{
  //Les coordonnees 3D du sommet
  coordonnee_3d = position;

  //Coordonnees du sommet
  vec4 p = rotation*vec4(position, 1.0)+translation;
  coordonnee_3d_locale = p.xyz;

  //Projection du sommet
  p = projection*p;

  //Gestion des normales
  vec4 n = rotation*vec4(normale, 0.0);
  vnormale = n.xyz;

  //Gestion couleurs
  /*float x = abs(coordonnee_3d.x);
  float y = abs(coordonnee_3d.y);
  float z = abs(coordonnee_3d.z);
  vcouleur=vec4(x,y,z,1.0);*/
  vcouleur = couleur;

  //position dans l'espace ecran
  gl_Position = p;
  
}

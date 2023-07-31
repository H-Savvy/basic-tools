<style>
  /* Cambiar tamaño de letras */
  p {
    font-size: 18px;
  }

  code {
    font-size: 14px;
    background-color: #f0f0f0;
    padding: 2px 4px;
    border-radius: 3px;
  }
</style>

<!-- Contenido con estilos -->

<p>Para actualizar e instalar las herramientas básicas, sigue los siguientes pasos:</p>

<ol>
  <li>
    <p>Actualiza la lista de paquetes disponibles e instala las actualizaciones:</p>
    <code>apt update && apt upgrade -y</code>
  </li>
  <li>
    <p>Instala el paquete "git":</p>
    <code>apt install git</code>
  </li>
  <li>
    <p>Clona el repositorio "basic-tools" desde GitHub:</p>
    <code>git clone https://github.com/H-Savvy/basic-tools.git</code>
  </li>
  <li>
    <p>Navega al directorio "basic-tools":</p>
    <code>cd basic-tools</code>
  </li>
  <li>
    <p>Otorga permisos de ejecución al script "basic-tools.sh":</p>
    <code>chmod +x basic-tools.sh</code>
  </li>
  <li>
    <p>Ejecuta el script "basic-tools.sh" con privilegios de superusuario:</p>
    <code>sudo ./basic-tools.sh</code>
  </li>
</ol>

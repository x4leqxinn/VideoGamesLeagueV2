<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar sesión</title>
    <link rel="stylesheet" href="../theme/css/forms/forms2.css">
    <jsp:include page="../includes/links/navbar-link.jsp"></jsp:include>
</head>

<!-- Incluimos la barra de navegacición -->
<jsp:include page="../template/navbar2.jsp"></jsp:include>

<body>
    <img class="background-img" src="../theme/img/equipo/team-fifa.png" alt="Imagen de fondo">
    <div class="background-transparencia"></div>
    <main>
        <form action="../ControladorUsuario" method="POST" class="formulario" id="formulario">

            <!-- Grupo: Usuario -->
            <div class="formulario__grupo" id="grupo__usuario">
                <label for="usuario" class="formulario__label">Usuario</label>
                <div class="formulario__grupo-input">
                    <input type="text" class="formulario__input" name="usuario" id="usuario" placeholder="Ej. Panshoots" required minlength="4" maxlength="16">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div>
                <p class="formulario__input-error">El usuario tiene que ser de 4 a 16 dígitos y solo puede contener numeros, letras y guion bajo.</p>
            </div>

            <!-- Grupo: ContraseÃÂ±a -->
            <div class="formulario__grupo" id="grupo__password">
                <label for="password" class="formulario__label">Contraseña</label>
                <div class="formulario__grupo-input">
                    <input type="password" class="formulario__input" name="password" id="password" required minlength="3" maxlength="20">
                    <i class="formulario__validacion-estado fas fa-times-circle"></i>
                </div>
                <p class="formulario__input-error">La contraseña tiene que ser de 4 a 12 dígitos.</p>
            </div>

            <div class="formulario__mensaje" id="formulario__mensaje">
                <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
            </div>

            <div class="formulario__grupo formulario__grupo-btn-enviar">
                <button type="submit" class="formulario__btn" name="btnAccion" value="Loguear">Iniciar sesión</button>
                <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
            </div>
            <a href="registro.jsp">No tienes Cuenta Registrate</a>
        </form>
        
    </main>
    <!--Incluir el CDN de Sweet alert -->
    <!-- Sweet Alert -->
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
    <!-- <script src="../functions/js/forms/formulario-login.js"></script> -->
    <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
    <jsp:include page="../includes/cdn/cdn-sweet-alert.jsp"></jsp:include>
    <jsp:include page="../includes/scripts/navbar-script.jsp"></jsp:include>
</body>

</html>
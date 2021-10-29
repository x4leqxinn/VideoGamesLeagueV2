<%-- 
    Document   : prueba
    Created on : 07-10-2021, 14:32:53
    Author     : jorge
--%>
<!-- Prefijos -->
<!-- JSTL -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Establecemos la conexión a la BD -->
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/liga_videojuegos?zeroDateTimeBehavior=convertToNull" user="muca" password="admin"></sql:setDataSource>
<sql:query dataSource="${dataSource}" var="tipoJugador">
    Select id, descripcion FROM tipo_jugador
</sql:query>
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Registro</title>
            <link rel="stylesheet" href="../theme/css/forms/forms.css">
            <jsp:include page="../includes/links/navbar-link.jsp"></jsp:include>
        </head>

        <!-- Incluimos la barra de navegación -->
        <jsp:include page="../template/navbar.jsp"></jsp:include>

        <body>
            <img class="background-img" src="../theme/img/equipo/team-fifa.png" alt="Imagen de fondo">
            <div class="background-transparencia"></div>
            <main>
                <form action="../ControladorUsuario" method="POST" class="formulario" id="formulario">

                    <!-- Grupo: Nombre -->
                    <div class="formulario__grupo" id="grupo__nombre">
                        <label for="nombre" class="formulario__label">Nombre</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="nombre" id="nombre" placeholder="Ej. Francisco" required minlength="3" maxlength="40">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El nombre sÃ³lo puede contener letras y espacios.</p>
                    </div>

                    <!-- Grupo: Apellido -->
                    <div class="formulario__grupo" id="grupo__apellido">
                        <label for="nombre" class="formulario__label">Apellido</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="apellido" id="apellido" placeholder="Ej. Juilliet" required minlength="3" maxlength="40">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El apellido sÃ³lo puede contener letras y espacios.</p>
                    </div>

                    <!-- Grupo: Correo Electronico -->
                    <div class="formulario__grupo" id="grupo__correo">
                        <label for="correo" class="formulario__label">Correo ElectrÃ³nico</label>
                        <div class="formulario__grupo-input">
                            <input type="email" class="formulario__input" name="correo" id="correo" placeholder="Ej. correo@correo.com" required minlength="10" maxlength="60">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El correo solo puede contener letras, numeros, puntos, guiones y guion bajo.</p>
                    </div>

                    <!-- Grupo: Habilidad -->
                    <div class="formulario__grupo" id="grupo__habilidad">
                        <label for="habilidad" class="formulario__label">Habilidad</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="habilidad" id="habilidad" placeholder="Ej. Ninguna" required minlength="10" maxlength="40">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">La habilidad sÃ³lo puede contener letras y espacios.</p>
                    </div>


                    <!-- Grupo: Usuario -->
                    <div class="formulario__grupo" id="grupo__usuario">
                        <label for="usuario" class="formulario__label">Usuario</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="usuario" id="usuario" placeholder="Ej. Panshoots" required minlength="4" maxlength="16">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El usuario tiene que ser de 4 a 16 dígitos y solo puede contener numeros, letras y guion bajo.</p>
                    </div>

                    <!-- Grupo: Cbo Tipo Jugador -->
                    <div class="formulario__grupo">
                        <label for="cboTipoJugador" class="formulario__label-cbo">
                            <span>Tipo Jugador</span>
                                </label>
                        <select name="cboTipoJugador" id="cboTipoJugador" class="formulario__input-cbo" required>
                    <!-- Primer op -->
                    <option disabled selected value="0">Seleccione</option>
                    <!--Quitar Options y poner la lista de la BDD -->
                        <c:forEach var="x" items="${tipoJugador.rows}">
                             <option value="${x.id}">${x.descripcion}</option>
                        </c:forEach>
                </select>
    
                    </div>

                    <!-- Grupo: ContraseÃ±a -->
                    <div class="formulario__grupo" id="grupo__password">
                        <label for="password" class="formulario__label">ContraseÃ±a</label>
                        <div class="formulario__grupo-input">
                            <input type="password" class="formulario__input" name="password" id="password" required minlength="8" maxlength="20">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">La contraseÃ±a tiene que ser de 4 a 12 dÃ­gitos.</p>
                    </div>

                    <!-- Grupo: ContraseÃ±a 2 -->
                    <div class="formulario__grupo" id="grupo__password2">
                        <label for="password2" class="formulario__label">Repetir ContraseÃ±a</label>
                        <div class="formulario__grupo-input">
                            <input type="password" class="formulario__input" name="password2" id="password2" required minlength="8" maxlength="20">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Ambas contraseÃ±as deben ser iguales.</p>
                    </div>

                    <!-- Grupo: Cbo Tipo Jugador TEST -->
                    <!-- 
                
            <div class="formulario__grupo">
                <label for="cboTipo" class="formulario__label-cbo">
                    <span>Tipo Jugador</span>
                    <input list="cboTipo" placeholder="Seleccione" class="formulario__input-cbo">
                    <datalist id = "cboTipo">
                        <option value="Estratega"></option>
                        <option value="Shooter"></option> 
                    </datalist>
                </label>
            </div>  
            -->

                    <div class="formulario__mensaje" id="formulario__mensaje">
                        <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
                    </div>


                    <div class="formulario__grupo formulario__grupo-btn-enviar">
                        <button type="submit" class="formulario__btn" name="btnAccion" value="RegistrarUsuario">Registrarse</button>
                        <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                    </div>
                <div>${msOKRegistrarU}${msNORegistrarU}${msErrorRegistrarU}</div>       
                    
                </form>

            </main>
            <!--Incluir el CDN de Sweet alert -->
            <!--<script src="../functions/js/forms/formulario-registro.js"></script> -->    
            <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
            <jsp:include page="../includes/cdn/cdn-sweet-alert.jsp"></jsp:include>
            <jsp:include page="../includes/scripts/navbar-script.jsp"></jsp:include>
        </body>

        </html>
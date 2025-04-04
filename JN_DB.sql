USE [master]
GO

CREATE DATABASE [JN_DB]
GO

USE [JN_DB]
GO

CREATE TABLE [dbo].[Error](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [bigint] NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[Mensaje] [varchar](max) NOT NULL,
	[Origen] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Error] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[EstadosAplicacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EstadoParticipacion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_EstadosAplicacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Oferta](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdPuesto] [bigint] NOT NULL,
	[Salario] [decimal](10, 2) NOT NULL,
	[Horario] [varchar](500) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Oferta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Perfil](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Puesto](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Descripcion] [varchar](1024) NOT NULL,
 CONSTRAINT [PK_Puesto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Usuario](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Identificacion] [varchar](15) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[Contrasenna] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
	[IdPerfil] [bigint] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Usuario_Oferta](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [bigint] NOT NULL,
	[IdOferta] [bigint] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_Usuario_Oferta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[EstadosAplicacion] ON 
GO
INSERT [dbo].[EstadosAplicacion] ([Id], [EstadoParticipacion]) VALUES (1, N'En Proceso')
GO
INSERT [dbo].[EstadosAplicacion] ([Id], [EstadoParticipacion]) VALUES (2, N'En Entrevista')
GO
INSERT [dbo].[EstadosAplicacion] ([Id], [EstadoParticipacion]) VALUES (3, N'Descartado')
GO
INSERT [dbo].[EstadosAplicacion] ([Id], [EstadoParticipacion]) VALUES (4, N'Contratado')
GO
SET IDENTITY_INSERT [dbo].[EstadosAplicacion] OFF
GO

SET IDENTITY_INSERT [dbo].[Oferta] ON 
GO
INSERT [dbo].[Oferta] ([Id], [IdPuesto], [Salario], [Horario], [Cantidad], [Estado]) VALUES (1, 2, CAST(3600.00 AS Decimal(10, 2)), N'Lunes a Viernes de 08:00 a 17:00 Virtual', 5, 1)
GO
INSERT [dbo].[Oferta] ([Id], [IdPuesto], [Salario], [Horario], [Cantidad], [Estado]) VALUES (2, 1, CAST(2800.00 AS Decimal(10, 2)), N'Lunes a Viernes Medio Tiempo', 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Oferta] OFF
GO

SET IDENTITY_INSERT [dbo].[Perfil] ON 
GO
INSERT [dbo].[Perfil] ([Id], [Nombre]) VALUES (1, N'Reclutador(a)')
GO
INSERT [dbo].[Perfil] ([Id], [Nombre]) VALUES (2, N'Usuario(a)')
GO
SET IDENTITY_INSERT [dbo].[Perfil] OFF
GO

SET IDENTITY_INSERT [dbo].[Puesto] ON 
GO
INSERT [dbo].[Puesto] ([Id], [Nombre], [Descripcion]) VALUES (1, N'Programador Jr .NET', N'Tareas de desarrollo en Visual Studio .Net Core')
GO
INSERT [dbo].[Puesto] ([Id], [Nombre], [Descripcion]) VALUES (2, N'Asistente de BD SQL Server', N'Tareas de base de datos, mantenimiento y revisión')
GO
SET IDENTITY_INSERT [dbo].[Puesto] OFF
GO

SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([Id], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [IdPerfil]) VALUES (1, N'304590415', N'Eduardo CC', N'ecalvo90415@ufide.ac.cr', N'o7ZFK+0vH7H7CzFhUIz2ig==', 1, 1)
GO
INSERT [dbo].[Usuario] ([Id], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [IdPerfil]) VALUES (4, N'118420238', N'Darien Aguilar', N'daguilar20238@ufide.ac.cr', N'qaQjSK8oist/vCdoRBG3IQ==', 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO

SET IDENTITY_INSERT [dbo].[Usuario_Oferta] ON 
GO
INSERT [dbo].[Usuario_Oferta] ([Id], [IdUsuario], [IdOferta], [Fecha], [Estado]) VALUES (6, 4, 2, CAST(N'2025-04-03T20:36:13.867' AS DateTime), 1)
GO
INSERT [dbo].[Usuario_Oferta] ([Id], [IdUsuario], [IdOferta], [Fecha], [Estado]) VALUES (7, 4, 1, CAST(N'2025-04-03T20:45:01.843' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Usuario_Oferta] OFF
GO

ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [Uk_Correo] UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [Uk_Identificacion] UNIQUE NONCLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Oferta]  WITH CHECK ADD  CONSTRAINT [FK_Oferta_Puesto] FOREIGN KEY([IdPuesto])
REFERENCES [dbo].[Puesto] ([Id])
GO
ALTER TABLE [dbo].[Oferta] CHECK CONSTRAINT [FK_Oferta_Puesto]
GO

ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Perfil] FOREIGN KEY([IdPerfil])
REFERENCES [dbo].[Perfil] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Perfil]
GO

ALTER TABLE [dbo].[Usuario_Oferta]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Oferta_EstadosAplicacion] FOREIGN KEY([Estado])
REFERENCES [dbo].[EstadosAplicacion] ([Id])
GO
ALTER TABLE [dbo].[Usuario_Oferta] CHECK CONSTRAINT [FK_Usuario_Oferta_EstadosAplicacion]
GO

ALTER TABLE [dbo].[Usuario_Oferta]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Oferta_Oferta] FOREIGN KEY([IdOferta])
REFERENCES [dbo].[Oferta] ([Id])
GO
ALTER TABLE [dbo].[Usuario_Oferta] CHECK CONSTRAINT [FK_Usuario_Oferta_Oferta]
GO

ALTER TABLE [dbo].[Usuario_Oferta]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Oferta_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Usuario_Oferta] CHECK CONSTRAINT [FK_Usuario_Oferta_Usuario]
GO

CREATE PROCEDURE [dbo].[ActualizarContrasenna]
	@Id bigint,
	@Contrasenna varchar(50),
	@ContrasennaAnterior varchar(50)
AS
BEGIN
	
	IF(@ContrasennaAnterior != '')
	BEGIN
		UPDATE Usuario
		SET Contrasenna = @Contrasenna
		WHERE	Id = @Id
			AND	Contrasenna = @ContrasennaAnterior
	END
	ELSE
	BEGIN
		UPDATE Usuario
		SET Contrasenna = @Contrasenna
		WHERE Id = @Id
	END

END
GO

CREATE PROCEDURE [dbo].[ActualizarOferta]
	@Id bigint,
	@IdPuesto bigint,
	@Salario decimal(10,2),
	@Horario varchar(500),
	@Cantidad int,
	@Estado bit
AS
BEGIN
	
	UPDATE	dbo.Oferta
	   SET	IdPuesto = @IdPuesto,
			Salario = @Salario,
			Horario = @Horario,
			Cantidad = @Cantidad,
			Estado = @Estado
	 WHERE Id = @Id

END
GO

CREATE PROCEDURE [dbo].[ActualizarPuesto]
	@Id bigint,
	@Nombre varchar(255),
	@Descripcion varchar(1024)
AS
BEGIN
	
	UPDATE Puesto
	SET Nombre = @Nombre,
		Descripcion = @Descripcion
	WHERE Id = @Id

END
GO

CREATE PROCEDURE [dbo].[ActualizarUsuario]
	@Id bigint,
	@Identificacion varchar(15),
	@NombreUsuario varchar(250),
	@Correo varchar(100)
AS
BEGIN
	
	UPDATE Usuario
	SET Identificacion = @Identificacion,
		Nombre = @NombreUsuario,
		Correo = @Correo
	WHERE Id = @Id

END
GO

CREATE PROCEDURE [dbo].[AplicarOferta]
	@IdUsuario bigint,
	@IdOferta bigint
AS
BEGIN
	
	IF NOT EXISTS(SELECT 1 FROM dbo.Usuario_Oferta
	WHERE	IdUsuario = @IdUsuario
		AND IdOferta = @IdOferta)
	BEGIN

		INSERT INTO dbo.Usuario_Oferta(IdUsuario,IdOferta,Fecha,Estado)
		VALUES (@IdUsuario,@IdOferta,GETDATE(),1)

	END

END
GO

CREATE PROCEDURE [dbo].[ConsultarOfertas]
	@Id BIGINT
AS
BEGIN
	
	IF(@Id = 0)
		SET @Id = NULL

	SELECT	O.Id,Salario,Horario,Cantidad,IdPuesto,P.Nombre,P.Descripcion,Estado,
			CASE WHEN Estado = 1 THEN 'Activo' ELSE 'Inactivo' END EstadoDescripcion
	FROM	dbo.Oferta O
	INNER	JOIN dbo.Puesto P ON O.IdPuesto = P.Id
	WHERE	O.Id = ISNULL(@Id,O.Id)

END
GO

CREATE PROCEDURE [dbo].[ConsultarOfertasDisponibles]

AS
BEGIN
	
	SELECT	O.Id, Salario, Horario, Cantidad, IdPuesto, P.Nombre, P.Descripcion, O.Estado, COUNT(UO.IdOferta) CantidadAplicaciones
	FROM	dbo.Oferta O
	INNER	JOIN dbo.Puesto P ON O.IdPuesto = P.Id
	LEFT	JOIN dbo.Usuario_Oferta UO ON O.Id = UO.IdOferta
	WHERE	O.Estado = 1
		AND O.Cantidad > 0
	GROUP BY O.Id, Salario, Horario, Cantidad, IdPuesto, P.Nombre, P.Descripcion, O.Estado

END
GO

CREATE PROCEDURE [dbo].[ConsultarPuestos] 
	@Id BIGINT
AS
BEGIN
	
	IF(@Id = 0)
		SET @Id = NULL

	SELECT	Id,Nombre,Descripcion
	FROM	dbo.Puesto
	WHERE	Id = ISNULL(@Id,Id)

END
GO

CREATE PROCEDURE [dbo].[ConsultarUsuario]
	@Id BIGINT
AS
BEGIN
	
	SELECT	U.Id,
			Identificacion,
			U.Nombre 'NombreUsuario',
			Correo,
			Estado,
			IdPerfil,
			P.Nombre 'NombrePerfil'
	FROM	dbo.Usuario U
	INNER	JOIN dbo.Perfil P ON U.IdPerfil = P.Id
	WHERE   U.Id = @Id
		AND Estado = 1

END
GO

CREATE PROCEDURE [dbo].[ConsultarUsuariosOfertas] 
	
AS
BEGIN
	
	SELECT	UO.Id,IdUsuario, 
			U.Identificacion, 
			U.Nombre,
			IdOferta,
			Salario,
			Horario,
			Fecha,
			UO.Estado
	FROM	dbo.Usuario_Oferta UO
	INNER	JOIN Usuario U ON UO.IdUsuario = U.Id
	INNER	JOIN Oferta O ON UO.IdOferta = O.Id

END
GO

CREATE PROCEDURE [dbo].[IniciarSesion]
	@Identificacion varchar(15),
	@Contrasenna varchar(50)
AS
BEGIN
	
	SELECT	U.Id,
			Identificacion,
			U.Nombre 'NombreUsuario',
			Correo,
			Estado,
			IdPerfil,
			P.Nombre 'NombrePerfil'
	FROM	dbo.Usuario U
	INNER	JOIN dbo.Perfil P ON U.IdPerfil = P.Id
	WHERE   Identificacion = @Identificacion
		AND Contrasenna = @Contrasenna
		AND Estado = 1

END
GO

CREATE PROCEDURE [dbo].[RegistrarCuenta]
	@Identificacion varchar(15),
	@NombreUsuario varchar(250),
	@Correo varchar(100),
	@Contrasenna varchar(50)
AS
BEGIN
	
	IF NOT EXISTS(SELECT 1 FROM dbo.Usuario 
				  WHERE Identificacion = @Identificacion
					 OR Correo = @Correo)
	BEGIN

		INSERT INTO dbo.Usuario(Identificacion,Nombre,Correo,Contrasenna,Estado,IdPerfil)
		VALUES (@Identificacion,@NombreUsuario,@Correo,@Contrasenna,1,2)

	END

END
GO

CREATE PROCEDURE [dbo].[RegistrarError]
	@IdUsuario bigint,
	@Mensaje varchar(max),
	@Origen varchar(100)
AS
BEGIN
	
	INSERT INTO dbo.Error(IdUsuario,FechaHora,Mensaje,Origen)
    VALUES (@IdUsuario,GETDATE(),@Mensaje,@Origen)

END
GO

CREATE PROCEDURE [dbo].[RegistrarOferta]
	@IdPuesto bigint,
	@Salario decimal(10,2),
	@Horario varchar(500),
	@Cantidad int
AS
BEGIN
	
	INSERT INTO dbo.Oferta(IdPuesto,Salario,Horario,Cantidad,Estado)
    VALUES (@IdPuesto,@Salario,@Horario,@Cantidad,1)

END
GO

CREATE PROCEDURE [dbo].[RegistrarPuesto]
	@Nombre varchar(255),
	@Descripcion varchar(1024)
AS
BEGIN
	
	INSERT INTO dbo.Puesto (Nombre,Descripcion)
    VALUES (@Nombre,@Descripcion)

END
GO

CREATE PROCEDURE [dbo].[ValidarUsuarioCorreo]
	@Correo varchar(100)
AS
BEGIN
	
	SELECT	U.Id,
			Identificacion,
			U.Nombre 'NombreUsuario',
			Correo,
			Estado,
			IdPerfil,
			P.Nombre 'NombrePerfil'
	FROM	dbo.Usuario U
	INNER	JOIN dbo.Perfil P ON U.IdPerfil = P.Id
	WHERE   Correo = @Correo

END
GO
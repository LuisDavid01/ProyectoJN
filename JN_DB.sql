USE [master]
GO

CREATE DATABASE [JN_DB]
GO

USE [JN_DB]
GO

CREATE TABLE [dbo].[Oferta](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdPuesto] [bigint] NOT NULL,
	[Salario] [decimal](10, 2) NOT NULL,
	[Horario] [varchar](500) NOT NULL,
	[Cantidad] [int] NOT NULL,
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

SET IDENTITY_INSERT [dbo].[Oferta] ON 
GO
INSERT [dbo].[Oferta] ([Id], [IdPuesto], [Salario], [Horario], [Cantidad]) VALUES (1, 2, CAST(3200.00 AS Decimal(10, 2)), N'Lunes a Viernes de 08:00 a 17:00 Virtual', 5)
GO
INSERT [dbo].[Oferta] ([Id], [IdPuesto], [Salario], [Horario], [Cantidad]) VALUES (2, 1, CAST(2800.00 AS Decimal(10, 2)), N'Lunes a Viernes Medio Tiempo', 2)
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
INSERT [dbo].[Usuario] ([Id], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [IdPerfil]) VALUES (1, N'304590415', N'Eduardo Calvo Castillo', N'ecalvo90415@ufide.ac.cr', N'o7ZFK+0vH7H7CzFhUIz2ig==', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO

SET IDENTITY_INSERT [dbo].[Usuario_Oferta] ON 
GO
INSERT [dbo].[Usuario_Oferta] ([Id], [IdUsuario], [IdOferta], [Fecha], [Estado]) VALUES (1, 1, 1, CAST(N'2025-02-20T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Usuario_Oferta] ([Id], [IdUsuario], [IdOferta], [Fecha], [Estado]) VALUES (2, 1, 2, CAST(N'2025-02-19T00:00:00.000' AS DateTime), 1)
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

CREATE PROCEDURE [dbo].[ConsultarOfertas]
	@Id BIGINT
AS
BEGIN
	
	IF(@Id = 0)
		SET @Id = NULL

	SELECT	O.Id,Salario,Horario,Cantidad,IdPuesto,P.Nombre,P.Descripcion
	FROM	dbo.Oferta O
	INNER	JOIN dbo.Puesto P ON O.IdPuesto = P.Id
	WHERE	O.Id = ISNULL(@Id,O.Id)

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
	@Nombre varchar(250),
	@Correo varchar(100),
	@Contrasenna varchar(50)
AS
BEGIN
	
	IF NOT EXISTS(SELECT 1 FROM dbo.Usuario 
				  WHERE Identificacion = @Identificacion
					 OR Correo = @Correo)
	BEGIN

		INSERT INTO dbo.Usuario(Identificacion,Nombre,Correo,Contrasenna,Estado,IdPerfil)
		VALUES (@Identificacion,@Nombre,@Correo,@Contrasenna,1,2)

	END

END
GO
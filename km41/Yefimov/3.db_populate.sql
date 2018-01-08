USE [Coursework]
GO
SET IDENTITY_INSERT [dbo].[Computers] ON 

GO
INSERT [dbo].[Computers] ([id], [name], [video], [videogb], [memory], [hdd], [optidrive], [monit], [moninches]) VALUES (1, N'power white', N'TITAN', 8, 12, 2000, 1, 1, 24)
GO
INSERT [dbo].[Computers] ([id], [name], [video], [videogb], [memory], [hdd], [optidrive], [monit], [moninches]) VALUES (2, N'power black', N'GTX1080', 4, 8, 1000, 1, 1, 22)
GO
INSERT [dbo].[Computers] ([id], [name], [video], [videogb], [memory], [hdd], [optidrive], [monit], [moninches]) VALUES (5, N'strong guy', N'Radeon HD 6870', 4, 8, 1000, 0, 0, NULL)
GO
INSERT [dbo].[Computers] ([id], [name], [video], [videogb], [memory], [hdd], [optidrive], [monit], [moninches]) VALUES (7, N'weak guy', N'Radeon HD 4870', 1, 2, 500, 1, 0, NULL)
GO
INSERT [dbo].[Computers] ([id], [name], [video], [videogb], [memory], [hdd], [optidrive], [monit], [moninches]) VALUES (8, N'ALIENWARE', N'GTX1060', 2, 4, 1000, 0, 1, 19)
GO
SET IDENTITY_INSERT [dbo].[Computers] OFF
GO
SET IDENTITY_INSERT [dbo].[Stores] ON 

GO
INSERT [dbo].[Stores] ([id], [name], [address], [email]) VALUES (1, N'Comfy', N'Киев, ул. В. Гетьмана, 6', N'comfy@i.ua')
GO
INSERT [dbo].[Stores] ([id], [name], [address], [email]) VALUES (2, N'Allo', N'Киев, просп. Победы, 47-А ', N'allo@gmail.com')
GO
INSERT [dbo].[Stores] ([id], [name], [address], [email]) VALUES (3, N'Rozetka', N'Киев, ул. Ярославская, 57', N'rozetka@i.ua')
GO
INSERT [dbo].[Stores] ([id], [name], [address], [email]) VALUES (5, N'MoYo', N'Киев, ул. Большая Васильковская, 18 ', N'moyo@gmail.com')
GO
INSERT [dbo].[Stores] ([id], [name], [address], [email]) VALUES (6, N'Sokol', N'Киев, ул. Семьи Хохловых, 15', N'sokol@i.ua')
GO
SET IDENTITY_INSERT [dbo].[Stores] OFF
GO
SET IDENTITY_INSERT [dbo].[ComputerInStores] ON 

GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (1, 1, 1, 5000, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (2, 2, 6, 7002, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (3, 1, 2, 5300, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (4, 2, 3, 6900, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (6, 1, 3, 5200, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (7, 1, 5, 5230, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (8, 1, 6, 5220, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (9, 2, 2, 6950, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (10, 2, 5, 6940, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (11, 2, 1, 6960, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (12, 5, 1, 6000, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (13, 5, 2, 5999, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (14, 5, 3, 5950, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (15, 5, 5, 5800, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (16, 5, 6, 5850, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (17, 7, 1, 4000, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (18, 7, 2, 3999, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (19, 7, 3, 3950, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (20, 7, 5, 3970, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (22, 7, 6, 3990, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (23, 8, 1, 7000, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (24, 8, 2, 6999, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (25, 8, 3, 6950, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (26, 8, 5, 6800, NULL)
GO
INSERT [dbo].[ComputerInStores] ([id], [computer_id], [store_id], [price], [comment]) VALUES (28, 8, 6, 6890, NULL)
GO
SET IDENTITY_INSERT [dbo].[ComputerInStores] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO

INSERT [dbo].[Users] ([id], [username], [isadmin]) VALUES (1, N'admincomp', 1)
GO

SET IDENTITY_INSERT [dbo].[Users] OFF
GO

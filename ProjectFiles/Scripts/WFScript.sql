USE [SBAS_SC]
GO
/****** Object:  Table [dbo].[WF_Activity]    Script Date: 2017/6/27 1:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WF_Activity](
	[Id] [varchar](36) NOT NULL,
	[FlowInfoId] [varchar](36) NULL,
	[ActName] [nvarchar](50) NULL,
	[Step] [int] NULL,
	[RoleId] [varchar](36) NULL,
	[Department] [varchar](36) NULL,
	[GroupId] [varchar](36) NULL,
	[ApproverCount] [int] NULL,
	[ApproveType] [int] NULL,
	[CreateTime] [datetime] NULL,
	[ActType] [int] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WF_Process]    Script Date: 2017/6/27 1:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WF_Process](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WorFlowId] [varchar](36) NULL,
	[ActivityId] [varchar](36) NULL,
	[Step] [int] NULL,
	[ApproverID] [varchar](36) NULL,
	[Operate] [int] NULL,
	[OperateTime] [datetime] NULL,
	[Remark] [nvarchar](100) NULL,
	[IsFinish] [bit] NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_WF_Process] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WF_WorkFlow]    Script Date: 2017/6/27 1:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WF_WorkFlow](
	[Id] [varchar](36) NOT NULL,
	[WorkInfoId] [varchar](36) NULL,
	[ContractId] [varchar](36) NULL,
	[CurrentActivityId] [varchar](36) NULL,
	[NextActivityId] [varchar](36) NULL,
	[StatusDescrip] [nvarchar](200) NULL,
	[WFStatus] [int] NULL,
	[IsFinish] [bit] NULL,
	[Requester] [varchar](36) NULL,
	[Creater] [varchar](36) NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_WF_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WF_WorkFlowInfo]    Script Date: 2017/6/27 1:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WF_WorkFlowInfo](
	[ID] [varchar](36) NOT NULL,
	[WFName] [nvarchar](50) NULL,
	[Descript] [nvarchar](100) NULL,
	[AmountFrom] [decimal](18, 3) NULL,
	[AmountTo] [decimal](18, 3) NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_WF_WorkFlowInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[WF_Activity] ([Id], [FlowInfoId], [ActName], [Step], [RoleId], [Department], [GroupId], [ApproverCount], [ApproveType], [CreateTime], [ActType]) VALUES (N'1EA7B210-87EB-44E5-97A5-00BBD71C9DAE', N'96F39899-3D0A-4FE2-8A17-716F95295F0A', N'领导审批', 2, N'd0533453-9cf8-459c-b28c-98cf397efaf1', NULL, N'', 1, 1, CAST(0x0000A79D0099E853 AS DateTime), 2)
GO
INSERT [dbo].[WF_Activity] ([Id], [FlowInfoId], [ActName], [Step], [RoleId], [Department], [GroupId], [ApproverCount], [ApproveType], [CreateTime], [ActType]) VALUES (N'446A4D8D-8488-4539-9C0C-71013476EFE7', N'96F39899-3D0A-4FE2-8A17-716F95295F0A', N'发放贷款', 3, N'', NULL, N'', 1, 3, CAST(0x0000A79D0099E853 AS DateTime), 3)
GO
INSERT [dbo].[WF_Activity] ([Id], [FlowInfoId], [ActName], [Step], [RoleId], [Department], [GroupId], [ApproverCount], [ApproveType], [CreateTime], [ActType]) VALUES (N'8EC5C68D-D011-4406-85EE-8EA8EF6D3F37', N'96F39899-3D0A-4FE2-8A17-716F95295F0A', N'提交申请', 1, N'', NULL, N'', 1, 5, CAST(0x0000A79D0099E852 AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[WF_Process] ON 

GO
INSERT [dbo].[WF_Process] ([Id], [WorFlowId], [ActivityId], [Step], [ApproverID], [Operate], [OperateTime], [Remark], [IsFinish], [CreateTime]) VALUES (4, N'4881a8ce-ce89-47af-a7bf-cb73b7f90ef9', N'8EC5C68D-D011-4406-85EE-8EA8EF6D3F37', 1, N'48f3889c-af8d-401f-ada2-c383031af92d', 1, CAST(0x0000A79F00091034 AS DateTime), N'合同提交', 1, CAST(0x0000A79F00091034 AS DateTime))
GO
INSERT [dbo].[WF_Process] ([Id], [WorFlowId], [ActivityId], [Step], [ApproverID], [Operate], [OperateTime], [Remark], [IsFinish], [CreateTime]) VALUES (5, N'4881a8ce-ce89-47af-a7bf-cb73b7f90ef9', N'1EA7B210-87EB-44E5-97A5-00BBD71C9DAE', 2, N'48f3889c-af8d-401f-ada2-c383031af92d', NULL, NULL, N'', 0, CAST(0x0000A79F00091034 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[WF_Process] OFF
GO
INSERT [dbo].[WF_WorkFlow] ([Id], [WorkInfoId], [ContractId], [CurrentActivityId], [NextActivityId], [StatusDescrip], [WFStatus], [IsFinish], [Requester], [Creater], [CreateTime]) VALUES (N'4881a8ce-ce89-47af-a7bf-cb73b7f90ef9', N'96F39899-3D0A-4FE2-8A17-716F95295F0A', N'05b6276b-6690-4dc8-8a8e-ab251ac1fa0a', N'', N'', NULL, 1, 0, N'48f3889c-af8d-401f-ada2-c383031af92d', N'48f3889c-af8d-401f-ada2-c383031af92d', CAST(0x0000A79F00091033 AS DateTime))
GO
INSERT [dbo].[WF_WorkFlowInfo] ([ID], [WFName], [Descript], [AmountFrom], [AmountTo], [CreateTime]) VALUES (N'96F39899-3D0A-4FE2-8A17-716F95295F0A', N'合同审批流程', N'合同金额小于等于10', CAST(0.000 AS Decimal(18, 3)), CAST(100000.010 AS Decimal(18, 3)), CAST(0x0000A79D0091B88A AS DateTime))
GO
INSERT [dbo].[WF_WorkFlowInfo] ([ID], [WFName], [Descript], [AmountFrom], [AmountTo], [CreateTime]) VALUES (N'B4509877-2366-4429-95AA-AAB05E0EB020', N'合同审批流程', N'合同金额大于100w', CAST(1000000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), CAST(0x0000A79D0091B88A AS DateTime))
GO
INSERT [dbo].[WF_WorkFlowInfo] ([ID], [WFName], [Descript], [AmountFrom], [AmountTo], [CreateTime]) VALUES (N'BA764BF1-9975-471B-8C30-176EFC640DF1', N'合同审批流程', N'合同金额大于10W小于100w', CAST(100000.000 AS Decimal(18, 3)), CAST(1000000.000 AS Decimal(18, 3)), CAST(0x0000A79D0091B88A AS DateTime))
GO
ALTER TABLE [dbo].[WF_Process] ADD  CONSTRAINT [DF_WF_Process_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审批人数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_Activity', @level2type=N'COLUMN',@level2name=N'ApproverCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审批类型 1、按角色 2、根据部门 3、提交者 4、用户组 5、跳过仅显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_Activity', @level2type=N'COLUMN',@level2name=N'ApproveType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1、开始 2、正常 3、结束' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_Activity', @level2type=N'COLUMN',@level2name=N'ActType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1、通过 2、拒绝 3、退回 4、撤销 5、重新提交' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_Process', @level2type=N'COLUMN',@level2name=N'Operate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_Process', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否完成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_Process', @level2type=N'COLUMN',@level2name=N'IsFinish'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审批状态 1、待审核 2、拒绝 3、退回 4、撤销 5、重新提交 6、结束' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_WorkFlow', @level2type=N'COLUMN',@level2name=N'WFStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否结束 结束、取消、' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_WorkFlow', @level2type=N'COLUMN',@level2name=N'IsFinish'
GO

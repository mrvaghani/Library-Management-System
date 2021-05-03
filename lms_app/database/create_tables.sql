
/****** Object:  Table [dbo].[authors]    Script Date: 5/1/2021 1:18:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[authors](
	[pid] [int] NOT NULL,
	[docid] [int] NOT NULL,
 CONSTRAINT [PK_authors] PRIMARY KEY CLUSTERED
(
	[pid] ASC,
	[docid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[authors]  WITH CHECK ADD  CONSTRAINT [FK_authors_book] FOREIGN KEY([docid])
REFERENCES [dbo].[book] ([docid])
GO

ALTER TABLE [dbo].[authors] CHECK CONSTRAINT [FK_authors_book]
GO

ALTER TABLE [dbo].[authors]  WITH CHECK ADD  CONSTRAINT [FK_authors_person] FOREIGN KEY([pid])
REFERENCES [dbo].[person] ([pid])
GO

ALTER TABLE [dbo].[authors] CHECK CONSTRAINT [FK_authors_person]
GO


/****** Object:  Table [dbo].[book]    Script Date: 5/1/2021 1:19:16 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[book](
	[docid] [int] NOT NULL,
	[isbn] [varchar](50) NULL,
 CONSTRAINT [PK_book] PRIMARY KEY CLUSTERED
(
	[docid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[book]  WITH CHECK ADD  CONSTRAINT [FK_book_document] FOREIGN KEY([docid])
REFERENCES [dbo].[document] ([docid])
GO

ALTER TABLE [dbo].[book] CHECK CONSTRAINT [FK_book_document]
GO


/****** Object:  Table [dbo].[borrowing]    Script Date: 5/1/2021 2:26:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[borrowing](
	[bor_no] [int] NOT NULL,
	[bdtime] [datetime] NULL,
	[rdtime] [datetime] NULL,
	[duedate]  AS (dateadd(day,(20),[bdtime])) PERSISTED,
	-- if returned - due < 0, return (ABS(returned - due)*20) else return 0
	[fine_in_cents]  AS (case when datediff(day,[rdtime],dateadd(day,(20),[bdtime]))<(0) then abs(datediff(day,[rdtime],dateadd(day,(20),[bdtime])))*(20) else (0) end),
 CONSTRAINT [PK_borrowing] PRIMARY KEY CLUSTERED
(
	[bor_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO





/****** Object:  Table [dbo].[borrows]    Script Date: 5/1/2021 1:19:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[borrows](
	[bor_no] [int] NOT NULL,
	[docid] [int] NOT NULL,
	[copyno] [int] NOT NULL,
	[bid] [int] NOT NULL,
	[rid] [int] NULL,
 CONSTRAINT [PK_borrows] PRIMARY KEY CLUSTERED
(
	[bor_no] ASC,
	[docid] ASC,
	[copyno] ASC,
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[borrows]  WITH CHECK ADD  CONSTRAINT [FK_borrows_borrowing] FOREIGN KEY([bor_no])
REFERENCES [dbo].[borrowing] ([bor_no])
GO

ALTER TABLE [dbo].[borrows] CHECK CONSTRAINT [FK_borrows_borrowing]
GO

ALTER TABLE [dbo].[borrows]  WITH CHECK ADD  CONSTRAINT [FK_borrows_copy] FOREIGN KEY([docid], [copyno], [bid])
REFERENCES [dbo].[copy] ([docid], [copyno], [bid])
GO

ALTER TABLE [dbo].[borrows] CHECK CONSTRAINT [FK_borrows_copy]
GO

ALTER TABLE [dbo].[borrows]  WITH CHECK ADD  CONSTRAINT [FK_borrows_reader] FOREIGN KEY([rid])
REFERENCES [dbo].[reader] ([rid])
GO

ALTER TABLE [dbo].[borrows] CHECK CONSTRAINT [FK_borrows_reader]
GO


/****** Object:  Table [dbo].[branch]    Script Date: 5/1/2021 1:19:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[branch](
	[bid] [int] NOT NULL,
	[lname] [varchar](50) NULL,
	[location] [varchar](50) NULL,
 CONSTRAINT [PK_branch] PRIMARY KEY CLUSTERED
(
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[chairs]    Script Date: 5/1/2021 1:20:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[chairs](
	[pid] [int] NOT NULL,
	[docid] [int] NOT NULL,
 CONSTRAINT [PK_chairs] PRIMARY KEY CLUSTERED
(
	[pid] ASC,
	[docid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[chairs]  WITH CHECK ADD  CONSTRAINT [FK_chairs_person] FOREIGN KEY([pid])
REFERENCES [dbo].[person] ([pid])
GO

ALTER TABLE [dbo].[chairs] CHECK CONSTRAINT [FK_chairs_person]
GO

ALTER TABLE [dbo].[chairs]  WITH CHECK ADD  CONSTRAINT [FK_chairs_proceedings] FOREIGN KEY([docid])
REFERENCES [dbo].[proceedings] ([docid])
GO

ALTER TABLE [dbo].[chairs] CHECK CONSTRAINT [FK_chairs_proceedings]
GO


/****** Object:  Table [dbo].[copy]    Script Date: 5/1/2021 1:20:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[copy](
	[docid] [int] NOT NULL,
	[copyno] [int] NOT NULL,
	[bid] [int] NOT NULL,
	[position] [varchar](6) NULL,
 CONSTRAINT [PK_copy] PRIMARY KEY CLUSTERED
(
	[docid] ASC,
	[copyno] ASC,
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[copy]  WITH CHECK ADD  CONSTRAINT [FK_copy_branch] FOREIGN KEY([bid])
REFERENCES [dbo].[branch] ([bid])
GO

ALTER TABLE [dbo].[copy] CHECK CONSTRAINT [FK_copy_branch]
GO

ALTER TABLE [dbo].[copy]  WITH CHECK ADD  CONSTRAINT [FK_copy_document] FOREIGN KEY([docid])
REFERENCES [dbo].[document] ([docid])
GO

ALTER TABLE [dbo].[copy] CHECK CONSTRAINT [FK_copy_document]
GO


/****** Object:  Table [dbo].[document]    Script Date: 5/1/2021 1:20:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[document](
	[docid] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](150) NULL,
	[pdate] [date] NULL,
	[publisherid] [int] NULL,
 CONSTRAINT [PK_document] PRIMARY KEY CLUSTERED
(
	[docid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[document]  WITH CHECK ADD  CONSTRAINT [FK_document_publisher] FOREIGN KEY([publisherid])
REFERENCES [dbo].[publisher] ([publisherid])
GO

ALTER TABLE [dbo].[document] CHECK CONSTRAINT [FK_document_publisher]
GO


/****** Object:  Table [dbo].[gedits]    Script Date: 5/1/2021 1:20:48 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[gedits](
	[docid] [int] NOT NULL,
	[issue_no] [int] NOT NULL,
	[pid] [int] NOT NULL,
 CONSTRAINT [PK_gedits] PRIMARY KEY CLUSTERED
(
	[docid] ASC,
	[issue_no] ASC,
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[gedits]  WITH CHECK ADD  CONSTRAINT [FK_gedits_journal_issue] FOREIGN KEY([docid], [issue_no])
REFERENCES [dbo].[journal_issue] ([docid], [issue_no])
GO

ALTER TABLE [dbo].[gedits] CHECK CONSTRAINT [FK_gedits_journal_issue]
GO

ALTER TABLE [dbo].[gedits]  WITH CHECK ADD  CONSTRAINT [FK_gedits_person] FOREIGN KEY([pid])
REFERENCES [dbo].[person] ([pid])
GO

ALTER TABLE [dbo].[gedits] CHECK CONSTRAINT [FK_gedits_person]
GO


/****** Object:  Table [dbo].[journal_issue]    Script Date: 5/1/2021 1:20:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[journal_issue](
	[docid] [int] NOT NULL,
	[issue_no] [int] NOT NULL,
	[scope] [varchar](50) NULL,
 CONSTRAINT [PK_journal_issue] PRIMARY KEY CLUSTERED
(
	[docid] ASC,
	[issue_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[journal_issue]  WITH CHECK ADD  CONSTRAINT [FK_journal_issue_journal_volume] FOREIGN KEY([docid])
REFERENCES [dbo].[journal_volume] ([docid])
GO

ALTER TABLE [dbo].[journal_issue] CHECK CONSTRAINT [FK_journal_issue_journal_volume]
GO


/****** Object:  Table [dbo].[journal_volume]    Script Date: 5/1/2021 1:21:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[journal_volume](
	[docid] [int] NOT NULL,
	[volume_no] [nchar](10) NULL,
	[editor] [varchar](50) NULL,
 CONSTRAINT [PK_journal_volume] PRIMARY KEY CLUSTERED
(
	[docid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[journal_volume]  WITH CHECK ADD  CONSTRAINT [FK_journal_volume_document] FOREIGN KEY([docid])
REFERENCES [dbo].[document] ([docid])
GO

ALTER TABLE [dbo].[journal_volume] CHECK CONSTRAINT [FK_journal_volume_document]
GO


/****** Object:  Table [dbo].[person]    Script Date: 5/1/2021 1:21:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[person](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[pname] [nvarchar](50) NULL,
 CONSTRAINT [PK_person] PRIMARY KEY CLUSTERED
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[person]  WITH CHECK ADD  CONSTRAINT [FK_person_person] FOREIGN KEY([pid])
REFERENCES [dbo].[person] ([pid])
GO

ALTER TABLE [dbo].[person] CHECK CONSTRAINT [FK_person_person]
GO


/****** Object:  Table [dbo].[proceedings]    Script Date: 5/1/2021 1:21:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[proceedings](
	[docid] [int] NOT NULL,
	[cdata] [date] NULL,
	[clocation] [varchar](50) NULL,
	[ceditor] [varchar](50) NULL,
 CONSTRAINT [PK_proceedings] PRIMARY KEY CLUSTERED
(
	[docid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[proceedings]  WITH CHECK ADD  CONSTRAINT [FK_proceedings_document] FOREIGN KEY([docid])
REFERENCES [dbo].[document] ([docid])
GO

ALTER TABLE [dbo].[proceedings] CHECK CONSTRAINT [FK_proceedings_document]
GO


/****** Object:  Table [dbo].[publisher]    Script Date: 5/1/2021 1:21:26 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[publisher](
	[publisherid] [int] NOT NULL,
	[pubname] [varchar](50) NULL,
	[address] [varchar](50) NULL,
 CONSTRAINT [PK_publisher] PRIMARY KEY CLUSTERED
(
	[publisherid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[reader]    Script Date: 5/1/2021 1:21:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[reader](
	[rid] [int] IDENTITY(300,1) NOT NULL,
	[rtype] [varchar](50) NULL,
	[rname] [varchar](50) NULL,
	[raddress] [varchar](50) NULL,
	[phone_no] [varchar](50) NULL,
 CONSTRAINT [PK_reader] PRIMARY KEY CLUSTERED
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[reservation]    Script Date: 5/1/2021 1:21:43 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[reservation](
	[res_no] [int] IDENTITY(991,1) NOT NULL,
	[dtime] [datetime] NULL,
 CONSTRAINT [PK_reservation] PRIMARY KEY CLUSTERED
(
	[res_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[reserves]    Script Date: 5/1/2021 1:21:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[reserves](
	[rid] [int] NULL,
	[reservation_no] [int] NOT NULL,
	[docid] [int] NOT NULL,
	[copyno] [int] NOT NULL,
	[bid] [int] NOT NULL,
 CONSTRAINT [PK_reserves] PRIMARY KEY CLUSTERED
(
	[reservation_no] ASC,
	[docid] ASC,
	[copyno] ASC,
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[reserves]  WITH CHECK ADD  CONSTRAINT [FK_reserves_reader] FOREIGN KEY([rid])
REFERENCES [dbo].[reader] ([rid])
GO

ALTER TABLE [dbo].[reserves] CHECK CONSTRAINT [FK_reserves_reader]
GO

ALTER TABLE [dbo].[reserves]  WITH CHECK ADD  CONSTRAINT [FK_reserves_reservation] FOREIGN KEY([reservation_no])
REFERENCES [dbo].[reservation] ([res_no])
GO

ALTER TABLE [dbo].[reserves] CHECK CONSTRAINT [FK_reserves_reservation]
GO

ALTER TABLE [dbo].[reserves]  WITH CHECK ADD  CONSTRAINT [FK_reserves_reserves] FOREIGN KEY([docid], [copyno], [bid])
REFERENCES [dbo].[copy] ([docid], [copyno], [bid])
GO

ALTER TABLE [dbo].[reserves] CHECK CONSTRAINT [FK_reserves_reserves]
GO






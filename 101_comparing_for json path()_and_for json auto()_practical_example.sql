use int_ques;

--https://stackoverflow.com/questions/52284555/for-json-path-vs-for-json-auto-sql-server

/*
    /****** Object:  Table [dbo].[accreditations]    Script Date: 11/09/2018 22:29:43 ******/
CREATE TABLE [dbo].[accreditations](
    [SchoolCode] [nvarchar](255) NULL,
    [IndiUID] [nvarchar](255) NULL,
    [Value] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataValues]    Script Date: 11/09/2018 22:29:44 ******/
CREATE TABLE [dbo].[DataValues](
    [Code] [nvarchar](255) NULL,
    [SCHOOL_NAME_FORMAL] [nvarchar](255) NULL,
    [SCHOOL_WEBSITE] [nvarchar](255) NULL,
    [SCHOOL_EMAIL] [nvarchar](255) NULL,
    [SCHOOL_TELEPHONE] [float] NULL,
    [Address 1] [nvarchar](255) NULL,
    [Address 2] [nvarchar](255) NULL,
    [Address 3] [nvarchar](255) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[accreditations] ([SchoolCode], [IndiUID], [Value]) VALUES (N'ABC', N'Indicator1', N'True')
GO
INSERT [dbo].[accreditations] ([SchoolCode], [IndiUID], [Value]) VALUES (N'ABC', N'Indicator2', N'False')
GO
INSERT [dbo].[accreditations] ([SchoolCode], [IndiUID], [Value]) VALUES (N'ABC', N'Indicator3', N'False')
GO
INSERT [dbo].[accreditations] ([SchoolCode], [IndiUID], [Value]) VALUES (N'DEF', N'Indicator1', N'True')
GO
INSERT [dbo].[accreditations] ([SchoolCode], [IndiUID], [Value]) VALUES (N'DEF', N'Indicator2', N'False')
GO
INSERT [dbo].[accreditations] ([SchoolCode], [IndiUID], [Value]) VALUES (N'DEF', N'Indicator3', N'False')
GO
INSERT [dbo].[accreditations] ([SchoolCode], [IndiUID], [Value]) VALUES (N'GHI', N'Indicator1', N'True')
GO
INSERT [dbo].[accreditations] ([SchoolCode], [IndiUID], [Value]) VALUES (N'GHI', N'Indicator2', N'True')
GO
INSERT [dbo].[accreditations] ([SchoolCode], [IndiUID], [Value]) VALUES (N'GHI', N'Indicator3', N'True')
GO
INSERT [dbo].[DataValues] ([Code], [SCHOOL_NAME_FORMAL], [SCHOOL_WEBSITE], [SCHOOL_EMAIL], [SCHOOL_TELEPHONE], [Address 1], [Address 2], [Address 3]) VALUES (N'ABC', N'test', N'www.test.edu', N'hello@test.edu', 123456798, N'1 Oak Grove', N'London', N'UK')
GO
INSERT [dbo].[DataValues] ([Code], [SCHOOL_NAME_FORMAL], [SCHOOL_WEBSITE], [SCHOOL_EMAIL], [SCHOOL_TELEPHONE], [Address 1], [Address 2], [Address 3]) VALUES (N'DEF', N'something', N'https://something.edu/fulltime', N'hello@something.edu', 987654321, N'23 Tree Road', N'Paris', N'France')
GO
INSERT [dbo].[DataValues] ([Code], [SCHOOL_NAME_FORMAL], [SCHOOL_WEBSITE], [SCHOOL_EMAIL], [SCHOOL_TELEPHONE], [Address 1], [Address 2], [Address 3]) VALUES (N'GHI', N'university', N'http://www.university.ac.uk/', N'hello@university.ac.uk/', 123123123, N'57 Bonsai Lane', N'London', N'UK')
GO

*/

select * from accreditations
select * from DataValues

select school_website as websiteURL,
		school_email as email,
		school_telephone as phone,
		[address 1] as [address.address1],
		[address 2] as [address.address2],
		[address 3] as [address.address3],
		(select [indiUID] as [name],
		[value] as [value] from accreditations
		where dv.code = accreditations.schoolcode
		for json path) as accreditation
from DataValues dv
where school_website = 'www.test.edu'
/*
join accreditations
on dv.code = accreditations.schoolcode

*/
FOR JSON path





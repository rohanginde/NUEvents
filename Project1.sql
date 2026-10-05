
GO

-- Switch to the NUEvents database to begin creating tables
USE NUEvents;
GO

-- Users Table
CREATE TABLE Users (
  UserID INT IDENTITY PRIMARY KEY,
  Fname NVARCHAR(255),
  Lname NVARCHAR(255),
  BirthDate DATE,
  UserAge INT,
  UserGender NVARCHAR(50),
  UserEmail NVARCHAR(255)
);
GO

-- Venue Table
CREATE TABLE Venue (
  VenueID INT IDENTITY PRIMARY KEY,
  VenueName NVARCHAR(255),
  VenueLocation NVARCHAR(255),
  Capacity INT
);
GO

-- Schedule Table
CREATE TABLE Schedule (
  ScheduleID INT IDENTITY PRIMARY KEY,
  Date DATE,
  StartTime TIME,
  EndTime TIME
);
GO

-- Organizer Table
CREATE TABLE Organizer (
  OrganizerID INT IDENTITY PRIMARY KEY,
  OrganizerName NVARCHAR(255),
  OrganizerEmail NVARCHAR(255),
  OrganizerPhone NVARCHAR(50)
);
GO

-- Event Table
CREATE TABLE Event (
  EventID INT IDENTITY PRIMARY KEY,
  EventName NVARCHAR(255),
  OrganizerID INT,
  ScheduleID INT,
  VenueID INT,
  EventDescription NVARCHAR(MAX),
  FOREIGN KEY (OrganizerID) REFERENCES Organizer(OrganizerID),
  FOREIGN KEY (ScheduleID) REFERENCES Schedule(ScheduleID),
  FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)
);
GO

-- Ticket Table
CREATE TABLE Ticket (
  TicketID INT IDENTITY PRIMARY KEY,
  EventID INT,
  UserID INT,
  TicketPrice MONEY,
  TicketType NVARCHAR(255),
  TicketStatus NVARCHAR(255),
  TicketLevel NVARCHAR(255),
  FOREIGN KEY (EventID) REFERENCES Event(EventID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
GO

-- and so on for the other tables...

-- Promotions Table
CREATE TABLE Promotions (
  PromotionID INT IDENTITY PRIMARY KEY,
  EventID INT,
  PromotionChannel NVARCHAR(255),
  TargetAge INT,
  PromotionDescription NVARCHAR(MAX),
  FOREIGN KEY (EventID) REFERENCES Event(EventID)
);
GO

-- Inventory Table
CREATE TABLE Inventory (
  InventoryID INT IDENTITY PRIMARY KEY,
  ItemName NVARCHAR(255),
  Quantity INT
);
GO

-- Feedback Table
CREATE TABLE Feedback (
  FeedbackID INT IDENTITY PRIMARY KEY,
  UserID INT,
  EventID INT,
  Rating INT,
  Description NVARCHAR(MAX),
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (EventID) REFERENCES Event(EventID)
);
GO

-- Vendors Table
CREATE TABLE Vendors (
  VendorID INT IDENTITY PRIMARY KEY,
  VendorName NVARCHAR(255),
  VendorEmail NVARCHAR(255),
  VendorType NVARCHAR(255)
);
GO

-- Vendors and Organizers Association Table
CREATE TABLE VOAssociation (
  OrganizerID INT,
  VendorID INT,
  PRIMARY KEY (OrganizerID, VendorID),
  FOREIGN KEY (OrganizerID) REFERENCES Organizer(OrganizerID),
  FOREIGN KEY (VendorID) REFERENCES Vendors(VendorID)
);
GO

-- Sponsors Table
CREATE TABLE Sponsors (
  SponsorID INT IDENTITY PRIMARY KEY,
  SponsorName NVARCHAR(255),
  SponsorEmail NVARCHAR(255),
  SponsorCategory NVARCHAR(255),
  SponsorPhone NVARCHAR(50)
);
GO

-- Sponsorship Table
CREATE TABLE Sponsorship (
  SponsorshipID INT IDENTITY PRIMARY KEY,
  SponsorID INT,
  BudgetID INT,
  FOREIGN KEY (SponsorID) REFERENCES Sponsors(SponsorID),
  FOREIGN KEY (BudgetID) REFERENCES Budget(BudgetID)
);
GO

-- Budget Table
CREATE TABLE Budget (
  BudgetID INT IDENTITY PRIMARY KEY,
  EventID INT,
  TotalBudget MONEY,
  Expenditure MONEY,
  FOREIGN KEY (EventID) REFERENCES Event(EventID)
);
GO

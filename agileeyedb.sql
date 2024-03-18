-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2024 at 03:16 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agileeyedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `Announcement_ID` varchar(19) NOT NULL,
  `Space` varchar(15) NOT NULL,
  `Date` date NOT NULL,
  `Announcement` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `artifact`
--

CREATE TABLE `artifact` (
  `Artifact_ID` varchar(25) NOT NULL,
  `Artifact_Name` varchar(100) NOT NULL,
  `Artifact_Description` varchar(255) NOT NULL,
  `Allow_Multiple_Instructors` tinyint(1) UNSIGNED NOT NULL,
  `Is_A_Sub_Artifact` tinyint(1) UNSIGNED NOT NULL,
  `Sub_Artifact_Of` varchar(21) DEFAULT NULL,
  `File_Format` varchar(11) NOT NULL,
  `Supposed_Start_Date` date NOT NULL,
  `Supposed_End_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `artifact_instructor`
--

CREATE TABLE `artifact_instructor` (
  `Artifact_IIS_ID` varchar(26) NOT NULL,
  `Instructor` varchar(16) DEFAULT NULL,
  `Artifact` varchar(25) DEFAULT NULL,
  `Check_All` tinyint(1) UNSIGNED NOT NULL,
  `Section` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `ID` bigint(6) NOT NULL,
  `Is_Admin` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`ID`, `Is_Admin`) VALUES
(220001, 0),
(220011, 0),
(220012, 1);

-- --------------------------------------------------------

--
-- Table structure for table `instructor_in_space`
--

CREATE TABLE `instructor_in_space` (
  `IIS_ID` varchar(16) NOT NULL,
  `Instructor` bigint(6) NOT NULL,
  `Space` varchar(15) NOT NULL,
  `Is_A_Creator` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructor_in_space`
--

INSERT INTO `instructor_in_space` (`IIS_ID`, `Instructor`, `Space`, `Is_A_Creator`) VALUES
('9QtQUGFVdAwd6nyM', 220011, 'N3DTDb0UNNcshTr', 1),
('AQ84dTMTpU3MZ5b1', 220011, 'AmXj3BOAgv6C8yj', 1),
('kvKYTaJm1K1jO4MN', 220012, 'ONgLy1LUGEJVIzx', 1),
('RhRWBHDezgLIduVJ', 220012, 'AmXj3BOAgv6C8yj', 0),
('XgJkkO2UEtzJMQQk', 220001, 'N3DTDb0UNNcshTr', 0);

-- --------------------------------------------------------

--
-- Table structure for table `link`
--

CREATE TABLE `link` (
  `Link_ID` varchar(10) NOT NULL,
  `User` bigint(12) NOT NULL,
  `Link` varchar(255) NOT NULL,
  `Link_Type` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `link_type`
--

CREATE TABLE `link_type` (
  `Type_ID` varchar(5) NOT NULL,
  `Link_Type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `link_type`
--

INSERT INTO `link_type` (`Type_ID`, `Link_Type`) VALUES
('L_001', 'Linkedin'),
('L_002', 'Github');

-- --------------------------------------------------------

--
-- Table structure for table `member_todo`
--

CREATE TABLE `member_todo` (
  `ToDo_Member` varchar(24) NOT NULL,
  `ToDo` varchar(23) NOT NULL,
  `Team_Member` varchar(22) NOT NULL,
  `Status` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `Project_ID` varchar(21) NOT NULL,
  `Project_Name` varchar(100) NOT NULL,
  `Project_Logo` varchar(255) DEFAULT NULL,
  `Project_Banner` varchar(255) DEFAULT NULL,
  `Project_Description` varchar(255) DEFAULT NULL,
  `Project_Link` varchar(255) DEFAULT NULL,
  `Team` varchar(20) DEFAULT NULL,
  `Is_Deployed` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_tag`
--

CREATE TABLE `project_tag` (
  `project_tags_id` varchar(30) NOT NULL,
  `Project` varchar(21) DEFAULT NULL,
  `Tag` varchar(5) DEFAULT NULL,
  `Is_Main_Tag` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `revision`
--

CREATE TABLE `revision` (
  `Revision_ID` varchar(29) NOT NULL,
  `Revision_Number` tinyint(2) UNSIGNED NOT NULL,
  `Submission` varchar(28) DEFAULT NULL,
  `Date_Checked` date NOT NULL,
  `Approval_Status` tinyint(1) UNSIGNED NOT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `Percentage_Added` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `space`
--

CREATE TABLE `space` (
  `Space_ID` varchar(15) NOT NULL,
  `Space_Code` varchar(7) NOT NULL,
  `Space_Name` varchar(100) NOT NULL,
  `Space_Banner` varchar(5) NOT NULL,
  `Space_Description` varchar(255) NOT NULL,
  `Allow_Collaborators` tinyint(1) UNSIGNED NOT NULL,
  `Section` varchar(7) NOT NULL,
  `Semester` tinyint(1) UNSIGNED NOT NULL,
  `Is_Closed` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `space`
--

INSERT INTO `space` (`Space_ID`, `Space_Code`, `Space_Name`, `Space_Banner`, `Space_Description`, `Allow_Collaborators`, `Section`, `Semester`, `Is_Closed`) VALUES
('AmXj3BOAgv6C8yj', 'y3V2Jvw', 'Web Development 2', 'SB_01', 'files/spaces/AmXj3BOAgv6C8yj1.json', 1, 'Mix', 2, 0),
('N3DTDb0UNNcshTr', 'RT8EX4y', 'Web Development 1', 'SB_01', 'files/spaces/N3DTDb0UNNcshTrz.json', 1, 'Mix', 1, 1),
('ONgLy1LUGEJVIzx', 'Edhvqf8', 'Project Management', 'SB_02', 'files/spaces/ONgLy1LUGEJVIzx3.json', 0, 'CS2A', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `space_banner`
--

CREATE TABLE `space_banner` (
  `Banner_Type` varchar(5) NOT NULL,
  `Banner_Name` varchar(100) NOT NULL,
  `Banner` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `space_banner`
--

INSERT INTO `space_banner` (`Banner_Type`, `Banner_Name`, `Banner`) VALUES
('SB_01', 'Fetching Something...', 'files/banners/sb01.png'),
('SB_02', 'Silver Lines On Those Clouds', 'files/banner/sb02.png');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `ID` bigint(12) NOT NULL,
  `Year_Level` tinyint(1) UNSIGNED NOT NULL,
  `Course` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`ID`, `Year_Level`, `Course`) VALUES
(210000003333, 3, 'IT'),
(220000005555, 2, 'IT'),
(220000007106, 2, 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `student_in_space`
--

CREATE TABLE `student_in_space` (
  `SIS_ID` varchar(17) NOT NULL,
  `Student` bigint(12) NOT NULL,
  `Space` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_in_space`
--

INSERT INTO `student_in_space` (`SIS_ID`, `Student`, `Space`) VALUES
('5VvgO0ixWufUGT9bc', 220000007106, 'N3DTDb0UNNcshTr'),
('62lILMZpElQfeGO3Z', 220000007106, 'AmXj3BOAgv6C8yj'),
('9YBuubuiqUt8Yz0Tx', 210000003333, 'N3DTDb0UNNcshTr'),
('d3HqS3yM6B0cSqVll', 220000005555, 'AmXj3BOAgv6C8yj'),
('TxqAwcbKzIYKVHlRi', 220000005555, 'N3DTDb0UNNcshTr');

-- --------------------------------------------------------

--
-- Table structure for table `submission`
--

CREATE TABLE `submission` (
  `Submission_ID` varchar(28) NOT NULL,
  `Submitted_By` varchar(20) DEFAULT NULL,
  `Submitted_To` varchar(26) DEFAULT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `File` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `Tag_ID` varchar(5) NOT NULL,
  `Tag_Name` varchar(20) NOT NULL,
  `Tag_Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `Team_ID` varchar(20) NOT NULL,
  `Team_Name` varchar(50) NOT NULL,
  `Section` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`Team_ID`, `Team_Name`, `Section`) VALUES
('CUKqfRlsmuHzF4AFolCb', 'UIC Cafe', 'IT2A'),
('LxVICeXZPG7esgui7L0n', 'Canteen Kiosk', 'IT2A'),
('n2uWsDqRfQ18GUgp73OL', 'ReqEase', 'IT2B'),
('NCpGmxDkrUS4giSS5t2u', 'GearGuard', 'CS2A'),
('Nh6IYwMxAN3Hw5D0PB5D', 'E&T', 'IT2B');

-- --------------------------------------------------------

--
-- Table structure for table `team_member`
--

CREATE TABLE `team_member` (
  `TM_ID` varchar(22) NOT NULL,
  `Team` varchar(20) NOT NULL,
  `Member` varchar(17) NOT NULL,
  `Member_Role` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_role`
--

CREATE TABLE `team_role` (
  `Role_ID` varchar(4) NOT NULL,
  `Role_Name` varchar(50) NOT NULL,
  `Role_Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_role`
--

INSERT INTO `team_role` (`Role_ID`, `Role_Name`, `Role_Description`) VALUES
('R_01', 'Project Manager', 'The one who ensures the tasks are completed on time and within budget. They will be overseeing the entire project lifecycle'),
('R_02', 'UI/UX Designer', 'Assigned to form intuitive and user-friendly interfaces that enhance the user experience'),
('R_03', 'Document Specialist', 'Responsible for creating a clear and concise documentation to guide users and developers about the project.'),
('R_04', 'Test Developer', 'Writing and executing test cases to ensure that the project functions run successfully.'),
('R_05', 'Front-End Developer', 'Building the user-facing components of the project.'),
('R_06', 'Back-End Developer', 'Constructing the bridge between Front-End to Database to power the project.'),
('R_07', 'Full-Stack Developer', 'Possessing knowledge in both Front-End and Back-End development.');

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE `todo` (
  `ToDo_ID` varchar(23) NOT NULL,
  `ToDo` varchar(255) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` bigint(12) NOT NULL,
  `First_Name` varchar(150) NOT NULL,
  `Middle_Name` varchar(150) DEFAULT NULL,
  `Last_Name` varchar(150) NOT NULL,
  `Email_Address` varchar(150) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Day_Of_Registration` date NOT NULL,
  `Activation_Status` tinyint(1) UNSIGNED NOT NULL,
  `Profile_Picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `First_Name`, `Middle_Name`, `Last_Name`, `Email_Address`, `Password`, `Day_Of_Registration`, `Activation_Status`, `Profile_Picture`) VALUES
(220001, 'George', 'Dela Cruz', 'Dela Costa', 'gdelacosta@uic.edu.ph', '*00A51F3F48415C7D4E8908980D443C29C69B60C9', '2024-02-09', 1, 'files/default.png'),
(220011, 'John', 'Dane', 'Doe', 'jdoe@uic.edu.ph', '*00A51F3F48415C7D4E8908980D443C29C69B60C9', '2024-02-01', 1, 'files/pic3.jpg'),
(220012, 'Claire', 'Ang', 'Lair', 'clair@uic.edu.ph', '*00A51F3F48415C7D4E8908980D443C29C69B60C9', '2024-03-01', 1, 'files/pic2.jpg'),
(210000003333, 'Felix', 'May', 'Ang', 'fang_210000003333@uic.edu.ph', '*ABE9E5815A184476C6B28F5A78DA7EFE3CE05ACC', '2024-02-14', 1, 'files/default.png'),
(220000005555, 'Mary Johanna', 'Sarah', 'Burns', 'mburns_220000005555@uic.edu.ph', '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257', '2024-03-02', 1, 'files/default.png'),
(220000007106, 'Maria', 'Leonora', 'Teresa', 'mteresa_220000007106@uic.edu.ph', '*EED7F65909C40C206A9EF528A9AA2B5644A58042', '2024-03-01', 1, 'files/pic4.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`Announcement_ID`),
  ADD KEY `‘fk_space_announcement’` (`Space`);

--
-- Indexes for table `artifact`
--
ALTER TABLE `artifact`
  ADD PRIMARY KEY (`Artifact_ID`);

--
-- Indexes for table `artifact_instructor`
--
ALTER TABLE `artifact_instructor`
  ADD PRIMARY KEY (`Artifact_IIS_ID`),
  ADD KEY `‘fk_instructor_check’` (`Instructor`),
  ADD KEY `‘fk_artifact_based’` (`Artifact`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `instructor_in_space`
--
ALTER TABLE `instructor_in_space`
  ADD PRIMARY KEY (`IIS_ID`),
  ADD KEY `‘fk_instructor_space’` (`Space`),
  ADD KEY `‘fk_instructor_id’` (`Instructor`);

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`Link_ID`),
  ADD KEY `‘fk_linktype’` (`Link_Type`),
  ADD KEY `‘fk_userowned’` (`User`);

--
-- Indexes for table `link_type`
--
ALTER TABLE `link_type`
  ADD PRIMARY KEY (`Type_ID`);

--
-- Indexes for table `member_todo`
--
ALTER TABLE `member_todo`
  ADD PRIMARY KEY (`ToDo_Member`),
  ADD KEY `‘fk_todo’` (`ToDo`),
  ADD KEY `‘fk_team_member_todo’` (`Team_Member`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`Project_ID`),
  ADD KEY `‘fk_team_project’` (`Team`);

--
-- Indexes for table `project_tag`
--
ALTER TABLE `project_tag`
  ADD PRIMARY KEY (`project_tags_id`),
  ADD KEY `‘fk_work’` (`Project`),
  ADD KEY `‘fk_tag’` (`Tag`);

--
-- Indexes for table `revision`
--
ALTER TABLE `revision`
  ADD PRIMARY KEY (`Revision_ID`),
  ADD KEY `‘fk_submission’` (`Submission`);

--
-- Indexes for table `space`
--
ALTER TABLE `space`
  ADD PRIMARY KEY (`Space_ID`),
  ADD UNIQUE KEY `Space_Code` (`Space_Code`),
  ADD KEY `fk_space_banner` (`Space_Banner`);

--
-- Indexes for table `space_banner`
--
ALTER TABLE `space_banner`
  ADD PRIMARY KEY (`Banner_Type`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `student_in_space`
--
ALTER TABLE `student_in_space`
  ADD PRIMARY KEY (`SIS_ID`),
  ADD KEY `‘fk_student_id’` (`Student`),
  ADD KEY `‘fk_space’` (`Space`);

--
-- Indexes for table `submission`
--
ALTER TABLE `submission`
  ADD PRIMARY KEY (`Submission_ID`),
  ADD KEY `‘fk_artifact_instructor’` (`Submitted_To`),
  ADD KEY `‘fk_by_team’` (`Submitted_By`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`Tag_ID`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`Team_ID`);

--
-- Indexes for table `team_member`
--
ALTER TABLE `team_member`
  ADD PRIMARY KEY (`TM_ID`),
  ADD KEY `‘fk_team_joined’` (`Team`),
  ADD KEY `‘fk_team_member’` (`Member`),
  ADD KEY `‘fk_team_member_role’` (`Member_Role`);

--
-- Indexes for table `team_role`
--
ALTER TABLE `team_role`
  ADD PRIMARY KEY (`Role_ID`);

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`ToDo_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email_Address` (`Email_Address`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `‘fk_space_announcement’` FOREIGN KEY (`Space`) REFERENCES `space` (`Space_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `artifact_instructor`
--
ALTER TABLE `artifact_instructor`
  ADD CONSTRAINT `‘fk_artifact_based’` FOREIGN KEY (`Artifact`) REFERENCES `artifact` (`Artifact_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `‘fk_instructor_check’` FOREIGN KEY (`Instructor`) REFERENCES `instructor_in_space` (`IIS_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `‘fk_instructor’` FOREIGN KEY (`ID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `instructor_in_space`
--
ALTER TABLE `instructor_in_space`
  ADD CONSTRAINT `‘fk_instructor_id’` FOREIGN KEY (`Instructor`) REFERENCES `instructor` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `‘fk_instructor_space’` FOREIGN KEY (`Space`) REFERENCES `space` (`Space_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `link`
--
ALTER TABLE `link`
  ADD CONSTRAINT `‘fk_linktype’` FOREIGN KEY (`Link_Type`) REFERENCES `link_type` (`Type_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `‘fk_userowned’` FOREIGN KEY (`User`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `member_todo`
--
ALTER TABLE `member_todo`
  ADD CONSTRAINT `‘fk_team_member_todo’` FOREIGN KEY (`Team_Member`) REFERENCES `team_member` (`TM_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `‘fk_todo’` FOREIGN KEY (`ToDo`) REFERENCES `todo` (`ToDo_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `‘fk_team_project’` FOREIGN KEY (`Team`) REFERENCES `team` (`Team_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_tag`
--
ALTER TABLE `project_tag`
  ADD CONSTRAINT `‘fk_tag’` FOREIGN KEY (`Tag`) REFERENCES `tag` (`Tag_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `‘fk_work’` FOREIGN KEY (`Project`) REFERENCES `project` (`Project_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `revision`
--
ALTER TABLE `revision`
  ADD CONSTRAINT `‘fk_submission’` FOREIGN KEY (`Submission`) REFERENCES `submission` (`Submission_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `space`
--
ALTER TABLE `space`
  ADD CONSTRAINT `fk_space_banner` FOREIGN KEY (`Space_Banner`) REFERENCES `space_banner` (`Banner_Type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `‘fk_student’` FOREIGN KEY (`ID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_in_space`
--
ALTER TABLE `student_in_space`
  ADD CONSTRAINT `‘fk_space’` FOREIGN KEY (`Space`) REFERENCES `space` (`Space_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `‘fk_student_id’` FOREIGN KEY (`Student`) REFERENCES `student` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `submission`
--
ALTER TABLE `submission`
  ADD CONSTRAINT `‘fk_artifact_instructor’` FOREIGN KEY (`Submitted_To`) REFERENCES `artifact_instructor` (`Artifact_IIS_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `‘fk_by_team’` FOREIGN KEY (`Submitted_By`) REFERENCES `team` (`Team_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team_member`
--
ALTER TABLE `team_member`
  ADD CONSTRAINT `‘fk_team_joined’` FOREIGN KEY (`Team`) REFERENCES `team` (`Team_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `‘fk_team_member_role’` FOREIGN KEY (`Member_Role`) REFERENCES `team_role` (`Role_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `‘fk_team_member’` FOREIGN KEY (`Member`) REFERENCES `student_in_space` (`SIS_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

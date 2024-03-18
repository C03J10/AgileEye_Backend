from sqlalchemy import Boolean, Column, ForeignKey, Integer, String, Date
from sqlalchemy.orm import relationship

from database import Base

# table user
class User(Base):
    __tablename__ = "user"

    id = Column(Integer, primary_key=True)
    first_name = Column(String)
    middle_name = Column(String)
    last_name = Column(String)
    email_address = Column(String, unique=True, index=True)
    password = Column(String)
    day_of_registration = Column(Date)
    activation_status = Column(Boolean)
    profile_picture = Column(String, default="files/default.png")

    links = relationship("Link", back_populates="owner")
    instructor_role = relationship("Instructor", back_populates="user_instruct")
    student_role = relationship("Student", back_populates="user_student")

#table link type
class Link_Type(Base):
    __tablename__ = "link_type"

    type_id = Column(String, primary_key=True)
    link_type = Column(String)

    links_belong = relationship("Link", back_populates="type_of_link")

#table link
class Link(Base):
    __tablename__ = "link"

    link_id = Column(String, primary_key=True)
    user = Column(Integer, ForeignKey(User.id))
    link = Column(String)
    link_type = Column(String, ForeignKey(Link_Type.type_id))

    type_of_link = relationship("Link_Type", back_populates="links_belong")
    owner = relationship("User", back_populates="links")

#table instructor
class Instructor(Base):
    __tablename__ = "instructor"

    id = Column(Integer, ForeignKey(User.id), primary_key=True)
    is_admin = Column(Boolean)

    user_instruct = relationship("User", back_populates="instructor_role")
    space_instructor = relationship("Instructor_In_Space", back_populates="instructors_with_space")

#table student
class Student(Base):
    __tablename__ = "student"

    id = Column(Integer, ForeignKey(User.id), primary_key=True)
    year_level = Column(Integer)
    course = Column(String)

    user_student = relationship("User", back_populates="student_role")
    space_student = relationship("Student_In_Space", back_populates="student_with_space")

#table space banner
class Space_Banner(Base):
    __tablename__ = "space_banner"

    banner_type = Column(String, primary_key=True)
    banner_name = Column(String, unique=True)
    banner = Column(String)

    space_in_use = relationship("Space", back_populates="space_banner_used")

#table space
class Space(Base):
    __tablename__ = "space"

    space_id = Column(String, primary_key=True)
    space_code = Column(String)
    space_name = Column(String)
    space_banner = Column(String, ForeignKey(Space_Banner.banner_type))
    space_description = Column(String)
    allow_collaborators = Column(Boolean)
    section = Column(String)
    semester = Column(Integer)
    is_closed = Column(Boolean)

    space_banner_used = relationship("Space_Banner", back_populates="space_in_use")
    announcements = relationship("Announcement", back_populates="space_announced")
    instructors = relationship("Instructor_In_Space", back_populates="instructors_here")
    students = relationship("Student_In_Space", back_populates="students_here")

#table announcement
class Announcement(Base):
    __tablename__ = "announcement"

    announcement_id = Column(String, primary_key=True)
    space = Column(String, ForeignKey(Space.space_id))
    date = Column(Date)
    announcement = Column(String)

    space_announced = relationship("Space", back_populates="announcements")

#table instructor in space
class Instructor_In_Space(Base):
    __tablename__ = "instructor_in_space"

    iis_id = Column(String, primary_key=True)
    instructor = Column(Integer, ForeignKey(Instructor.id))
    space = Column(String, ForeignKey(Space.space_id))
    is_a_creator = Column(Boolean)

    instructors_with_space = relationship("Instructor", back_populates="space_instructor")
    instructors_here = relationship("Space", back_populates="instructors")

#table student in space
class Student_In_Space(Base):
    __tablename__ = "student_in_space"

    sis_id = Column(String, primary_key=True)
    student = Column(Integer, ForeignKey(Student.id))
    space = Column(String, ForeignKey(Space.space_id))

    student_with_space = relationship("Student", back_populates="space_student")
    students_here = relationship("Space", back_populates="students")

#table team role
class Team_Role(Base):
    __tablename__ = "team_role"

    role_id = Column(String, primary_key=True)
    role_name = Column(String, unique=True, index=True)
    role_description = Column(String)


#table team
class Team(Base):
    __tablename__ = "team"

    team_id = Column(String, primary_key=True)
    team_name = Column(String)
    section = Column(String)

#table team member
class Team_Member(Base):
    __tablename__ = "team_member"

    tm_id = Column(String, primary_key=True)
    team = Column(String, ForeignKey(Team.team_id))
    section = Column(String)

#table todo
class Todo(Base):
    __tablename__ = "todo"

    todo_id = Column(String, primary_key=True)
    todo = Column(String)
    start_date = Column(Date)
    end_date = Column(Date)

#table member todo
class Member_Todo(Base):
    __tablename__ = "member_todo"

    todo_member = Column(String, primary_key=True)
    todo= Column(String, ForeignKey(Todo.todo_id))
    team_member = Column(String, ForeignKey(Team_Member.tm_id))
    status = Column(Boolean)

#table project
class Project(Base):
    __tablename__ = "project"

    project_id = Column(String, primary_key=True)
    project_name = Column(String)
    project_logo = Column(String)
    project_banner = Column(String)
    project_description = Column(String)
    project_link = Column(String)
    team = Column(String)
    is_deployed = Column(Integer)

    project_made = relationship("Project_Tag", back_populates="project_assigned")

#table tag
class Tag(Base):
    __tablename__ = "tag"

    tag_id = Column(String, primary_key=True)
    tag_name = Column(String, unique=True, index=True)
    tag_description = Column(String)

    project_tags = relationship("Project_Tag", back_populates="tags_assigned")

#table project tag
class Project_Tag(Base):
    __tablename__ = "project_tag"

    project_tags_id = Column(String, primary_key=True)
    project = Column(String, ForeignKey(Project.project_id))
    tag = Column(String, ForeignKey(Tag.tag_id))
    is_main_tag = Column(Boolean)

    project_assigned = relationship("Project", back_populates="project_made")
    tags_assigned = relationship("Tag", back_populates="project_tags")

#table artifact
class Artifact(Base):
    __tablename__ = "artifact"

    artifact_id = Column(String, primary_key=True)
    artifact_name = Column(String)
    artifact_description = Column(String)
    allow_multiple_instructors = Column(Boolean)
    is_a_sub_artifact = Column(Boolean)
    sub_artifact_of = Column(String)
    file_format = Column(String)
    supposed_start_date = Column(Date)
    supposed_end_date = Column(Date)

#table artifact instructor
class Artifact_Instructor(Base):
    __tablename__ = "artifact_instructor"

    artifact_iis_id = Column(String, primary_key=True)
    instructor = Column(String)
    artifact = Column(String)
    check_all = Column(Boolean)
    section = Column(String)

#table submission
class Submission(Base):
    __tablename__ = "submission"

    submission_id = Column(String, primary_key=True)
    submitted_by= Column(String, ForeignKey(Team.team_id))
    submitted_to = Column(String, ForeignKey(Artifact_Instructor.artifact_iis_id))
    start_date = Column(Date)
    end_date = Column(Date)
    File = Column(String)

#table revision
class Revision(Base):
    __tablename__ = "revision"

    revision_id = Column(String, primary_key=True)
    revision_number = Column(Integer)
    submission= Column(String, ForeignKey(Submission.submission_id))
    date_checked = Column(Date)
    approval_status = Column(Boolean)
    comment = Column(String)
from typing import Union

from pydantic import BaseModel

#table user
class UserBase(BaseModel):
    id: int
    first_name: str
    middle_name: str
    last_name: str
    email_address: str
    profile_picture: str

class CreateUser(UserBase):
    password: str
    day_of_registration: str
    
#table link type
class LinkTypeBase(BaseModel):
    type_id: str
    link_type: str

#table link
class LinkBase(BaseModel):
    link_id: str
    user: int
    link: str
    link_type: str

#table instructor
class InstructorBase(UserBase):
    is_admin: bool

    class Config:
        orm_mode = True

#table team role
class TeamRoleBase(BaseModel):
    role_id: str
    role_name: str
    role_description: str
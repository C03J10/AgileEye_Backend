from fastapi import Depends, HTTPException, APIRouter, Form
from sqlalchemy.orm import Session

from database import SessionLocal, engine, get_db
from models import Instructor, User
from schemas import InstructorBase

InstructorsRouter = APIRouter(tags=["Instructors"])

@InstructorsRouter.get("/instructors/", response_model=list[InstructorBase])
async def get_users(db: Session = Depends(get_db)):
    users = db.query(
        User.id, 
        User.first_name, 
        User.middle_name, 
        User.last_name, 
        User.email_address, 
        User.profile_picture, 
        Instructor.is_admin).join(Instructor).all()
    return users

@InstructorsRouter.get("/instructors/{user_id}", response_model=InstructorBase)
async def get_user(user_id= int,db:Session = Depends(get_db)):
    user = db.query(User.id, User.first_name, User.middle_name, User.last_name, User.email_address, User.profile_picture, Instructor.is_admin).filter(User.id == user_id).join(Instructor).first()
    return user
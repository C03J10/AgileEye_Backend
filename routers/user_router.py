from fastapi import Depends, HTTPException, APIRouter, Form
from sqlalchemy.orm import Session
import bcrypt

from database import SessionLocal, engine, get_db
from models import User
from schemas import UserBase

UsersRouter = APIRouter(tags=["Users"])

@UsersRouter.get("/users/", response_model=list[UserBase])
async def get_users(db: Session = Depends(get_db)):
    users = db.query(User).all()
    return users

@UsersRouter.get("/users/{user_id}", response_model=UserBase)
async def get_user(user_id= int,db:Session = Depends(get_db)):
    user = db.query(User).filter(User.id == user_id).first()
    return user

@UsersRouter.get("/auth/", response_model=UserBase)
async def get_user_by_id(user_id= int, passw = str, db:Session = Depends(get_db)):
    hashed_password = str(hash(passw))
    user = db.query(User).filter(User.id == user_id, User.password == hashed_password).first()
    return user  

@UsersRouter.post("/register/", response_model=UserBase)
async def create_user(user_id= int, passw = str, db:Session = Depends(get_db)):
    hashed_password = str(hash(passw))
    print(type(hashed_password))
    user = db.query(User).filter(User.id == user_id, User.password == hashed_password).first()
    return user 

@UsersRouter.put("/user/update", response_model=UserBase)
async def create_user(user_id= int, passw = str, db:Session = Depends(get_db)):
    hashed_password = str(hash(passw))
    print(type(hashed_password))
    user = db.query(User).filter(User.id == user_id, User.password == hashed_password).first()
    return user 

@UsersRouter.put("/user/deactivate", response_model=UserBase)
async def create_user(user_id= int, passw = str, db:Session = Depends(get_db)):
    hashed_password = str(hash(passw))
    print(type(hashed_password))
    user = db.query(User).filter(User.id == user_id, User.password == hashed_password).first()
    return user
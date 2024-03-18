from fastapi import Depends, HTTPException, APIRouter, Form
from sqlalchemy.orm import Session

from database import SessionLocal, engine, get_db
from models import Link, Link_Type, User
from schemas import LinkTypeBase

LinksRouter = APIRouter(tags=["Links"])

@LinksRouter.get("/link_types/", response_model=list[LinkTypeBase])
async def get_link_types(db: Session = Depends(get_db)):
    users = db.query(Link_Type).all()
    return users
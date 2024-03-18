from fastapi import Depends, HTTPException, APIRouter, Form
from sqlalchemy.orm import Session

from database import SessionLocal, engine, get_db
from models import Link_Type
from schemas import LinkTypeBase

LinkTypesRouter = APIRouter(tags=["Link Types"])

@LinkTypesRouter.get("/link_types/", response_model=list[LinkTypeBase])
async def get_link_types(db: Session = Depends(get_db)):
    linktypes = db.query(Link_Type).all()
    return linktypes

@LinkTypesRouter.get("/link_types", response_model=LinkTypeBase)
async def get_link_type(link_type: str,db: Session = Depends(get_db)):
    linktype = db.query(Link_Type).filter(Link_Type.link_type == link_type).first()
    return linktype

@LinkTypesRouter.get("/link_types/create", response_model=LinkTypeBase)
async def get_link_type(link_type: str,db: Session = Depends(get_db)):
    linktype = db.query(Link_Type).filter(Link_Type.link_type == link_type).first()
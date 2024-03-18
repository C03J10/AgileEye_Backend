from fastapi import Depends, HTTPException, APIRouter, Form
from sqlalchemy.orm import Session

from database import SessionLocal, engine, get_db
from models import Team_Role
from schemas import TeamRoleBase

TeamRolesRouter = APIRouter(tags=["Team Roles"])

@TeamRolesRouter.get("/team_roles/", response_model=list[TeamRoleBase])
async def get_team_roles(db: Session = Depends(get_db)):
    teamroles = db.query(Team_Role).all()
    return teamroles

@TeamRolesRouter.get("/team_roles/{role_id}", response_model=TeamRoleBase)
async def get_team_roles(role_id= str,db: Session = Depends(get_db)):
    find_role = "%{}".format(role_id)
    teamroles = db.query(Team_Role).filter(Team_Role.role_id.like(find_role)).first()
    return teamroles
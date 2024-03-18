from fastapi import FastAPI

from routers.user_router import UsersRouter
from routers.link_type_router import LinkTypesRouter
from routers.instructor_router import InstructorsRouter
from routers.team_role_router import TeamRolesRouter

app = FastAPI()

app.include_router(UsersRouter, prefix="/api")
app.include_router(LinkTypesRouter, prefix="/api")
app.include_router(InstructorsRouter, prefix="/api")
app.include_router(TeamRolesRouter, prefix="/api")
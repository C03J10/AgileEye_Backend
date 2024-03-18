# How to use this repository

- Install miniconda and create a virtual environment then activate

  `conda create --name your_venv_name python=3.9`

  `conda activate your_venv_name`
  
- After activating your newly created environment, install the following

  `pip install fastapi uvicorn bcrypt pymysql sqlalchemy`

- Clone this repository
- Change the directory on your miniconda terminal to the directory on where you clone this repository
- Run using

  `uvicorn main:app --reload`

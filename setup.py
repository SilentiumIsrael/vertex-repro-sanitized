import pathlib

import pkg_resources
from setuptools import find_packages
from setuptools import setup

""" setup.py used for packaging ConvTasNet as a software distribution for cloud 
training in Vertex AI. See usage in ./create_vertex_ai_job.ps1 """

# dynamically read dependencies from requirements.txt (derived from Conda env)
with pathlib.Path("requirements.txt").open() as requirements_txt:
    install_requires = [
        str(requirement)
        for requirement
        in pkg_resources.parse_requirements(requirements_txt)
    ]

setup(
    name="noise-distillation-trainer",
    version="0.1",
    install_requires=install_requires,
    packages=find_packages(include=["NoiseDistillation.ConvTasNet", "Utils.AWS"], exclude=["DNN4ANC"]),
    include_package_data=False,
    description="Minimal reproduction of issue with module loading"
)

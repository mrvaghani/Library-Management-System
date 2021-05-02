from setuptools import setup

setup(
    name='lms_app',
    packages=['lms_app'],
    include_package_data=True,
    install_requires=[
        'flask',
    ],
)
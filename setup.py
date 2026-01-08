from setuptools import setup, find_packages

setup(
    name="git-train-commit-message",
    version="1.0.0",
    packages=find_packages(),
    install_requires=[
        "nltk>=3.8",
        "tqdm>=4.0",
    ],
    entry_points={
        "console_scripts": [
            "git-train-commit-message=git_train_commit_message.main:main",
        ],
    },
    author="git-add-llm",
    description="Analyze git commit patterns and generate style prompts",
    python_requires=">=3.6",
)

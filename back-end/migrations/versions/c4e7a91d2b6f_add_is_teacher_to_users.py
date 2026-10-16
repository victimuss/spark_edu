"""add is_teacher to users

Revision ID: c4e7a91d2b6f
Revises: 69dc5050f4a7
Create Date: 2026-10-14 22:55:00.000000

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


revision: str = "c4e7a91d2b6f"
down_revision: Union[str, Sequence[str], None] = "69dc5050f4a7"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    op.add_column(
        "users",
        sa.Column(
            "is_teacher",
            sa.Boolean(),
            nullable=False,
            server_default=sa.false(),
        ),
    )
    op.execute("UPDATE users SET is_teacher = TRUE WHERE user_name = 'Timur'")


def downgrade() -> None:
    op.drop_column("users", "is_teacher")

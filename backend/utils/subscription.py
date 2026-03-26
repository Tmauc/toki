"""TOKI: Subscription module simplified — monetization disabled, all features unlocked."""
from models.users import PlanType, SubscriptionStatus, Subscription, PlanLimits
import logging

logger = logging.getLogger(__name__)

PAID_PLAN_TYPES = {PlanType.unlimited, PlanType.pro}


def is_paid_plan(plan: PlanType) -> bool:
    return True  # TOKI: always paid


def get_paid_plan_definitions() -> list[dict]:
    return []


def get_plan_type_from_price_id(price_id: str) -> PlanType:
    return PlanType.unlimited


def get_basic_plan_limits() -> PlanLimits:
    return PlanLimits(transcription_seconds=999999)


def get_default_basic_subscription() -> Subscription:
    return Subscription(
        plan=PlanType.unlimited,
        status=SubscriptionStatus.active,
    )


def get_plan_limits(plan: PlanType) -> PlanLimits:
    return PlanLimits(transcription_seconds=999999)


def get_plan_features(plan: PlanType) -> list[str]:
    return ['Unlimited transcription', 'All features unlocked']


def can_user_make_payment(uid: str, target_price_id: str = None) -> tuple[bool, str]:
    return True, ''


def get_monthly_usage_for_subscription(uid: str) -> dict:
    return {}


def has_transcription_credits(uid: str) -> bool:
    return True  # TOKI: always has credits


def get_remaining_transcription_seconds(uid: str) -> int | None:
    return None  # None = unlimited


def reconcile_basic_plan_with_stripe(uid: str, subscription=None):
    return subscription  # TOKI: no-op

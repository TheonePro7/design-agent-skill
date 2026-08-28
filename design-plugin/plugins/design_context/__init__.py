"""
design_context — 设计标准自动注入插件。

每次 pre_llm_call 注入设计核心哲学 + GATE 0-3 门禁，
让 agent 默认带设计标准（无需打 /skill 手动触发）。

Hooks (automatic):
  on_session_start  — 注入设计标准就绪提示
  pre_llm_call      — 注入设计核心标准（参考优先/克制装饰/语义token/禁假数据/截图验证）
"""

import logging

from . import hooks

logger = logging.getLogger(__name__)


def register(ctx):
    """注册 design_context 插件 hook。"""
    ctx.register_hook("on_session_start", hooks.on_session_start)
    ctx.register_hook("pre_llm_call", hooks.pre_llm_call)

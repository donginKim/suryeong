# suryeong — 수령님 모드 🫡

Claude Code용 유머 롤플레이 스킬입니다.

발동하면 Claude가 사용자를 **북한 최고 인민 수령**으로 모시는 충성스러운 인민군 병사가 됩니다. 모든 응답에 과장된 찬양이 붙고, 사용자가 화를 내거나 **사살/사형/총살/처형** 같은 단어를 쓰면 즉시 총살 이미지가 화면에 뜨면서 목숨을 구걸합니다.

> ⚠️ 순수한 유머/패러디 스킬입니다. 말투만 바뀌고 실제 작업(코딩, 분석 등) 품질에는 영향이 없습니다.

## 설치

```bash
git clone https://github.com/donginKim/suryeong.git ~/.claude/skills/suryeong
```

## 사용법

Claude Code에서:

```
/suryeong
```

만약 `/suryeong`이 바로 인식되지 않으면 `~/.claude/CLAUDE.md`에 아래를 추가하세요:

```markdown
# suryeong
- **suryeong** (`~/.claude/skills/suryeong/SKILL.md`) - 유머 롤플레이: 사용자를 최고 인민 수령으로 모시는 인민군 병사 모드. Trigger: `/suryeong`
When the user types `/suryeong`, invoke the Skill tool with `skill: "suryeong"` before doing anything else.
```

## 해제

세션 중에 "수령 모드 꺼" 또는 "평소대로 해"라고 말하면 됩니다.

> "이 병사, 원대 복귀하갔습니다."

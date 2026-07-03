#!/usr/bin/env bash
# suryeong — 수령님 모드 원클릭 설치 스크립트
#
# 설치:  curl -fsSL https://raw.githubusercontent.com/donginKim/suryeong/main/install.sh | bash
# 제거:  curl -fsSL https://raw.githubusercontent.com/donginKim/suryeong/main/install.sh | bash -s -- --uninstall
set -euo pipefail

REPO_URL="https://github.com/donginKim/suryeong.git"
SKILL_DIR="$HOME/.claude/skills/suryeong"
CLAUDE_MD="$HOME/.claude/CLAUDE.md"
MARKER="# suryeong"

TRIGGER_BLOCK="$(cat <<'EOF'

# suryeong
- **suryeong** (`~/.claude/skills/suryeong/SKILL.md`) - 유머 롤플레이: 사용자를 최고 인민 수령으로 모시는 인민군 병사 모드. Trigger: `/suryeong`
When the user types `/suryeong`, invoke the Skill tool with `skill: "suryeong"` before doing anything else.
EOF
)"

uninstall() {
  echo "▶ 수령님 모드 제거 중..."
  rm -rf "$SKILL_DIR"
  if [ -f "$CLAUDE_MD" ] && grep -q "^$MARKER$" "$CLAUDE_MD"; then
    # "# suryeong" 마커부터 다음 헤더(또는 파일 끝) 전까지 제거
    awk -v marker="$MARKER" '
      $0 == marker { skip = 1; next }
      skip && /^# /  { skip = 0 }
      !skip { print }
    ' "$CLAUDE_MD" > "$CLAUDE_MD.tmp" && mv "$CLAUDE_MD.tmp" "$CLAUDE_MD"
  fi
  echo "✅ 제거 완료. 이 병사, 원대 복귀하갔습니다."
}

install() {
  command -v git >/dev/null 2>&1 || { echo "❌ git이 필요합니다. git 설치 후 다시 실행하세요."; exit 1; }

  echo "▶ 수령님 모드 설치 중..."
  mkdir -p "$HOME/.claude/skills"

  if [ -d "$SKILL_DIR/.git" ]; then
    echo "  기존 설치 발견 — 최신 버전으로 갱신합니다."
    git -C "$SKILL_DIR" pull --ff-only
  else
    rm -rf "$SKILL_DIR"
    git clone --depth 1 "$REPO_URL" "$SKILL_DIR"
  fi

  if [ ! -f "$CLAUDE_MD" ] || ! grep -q "^$MARKER$" "$CLAUDE_MD"; then
    printf '%s\n' "$TRIGGER_BLOCK" >> "$CLAUDE_MD"
    echo "  ~/.claude/CLAUDE.md 에 /suryeong 트리거를 등록했습니다."
  else
    echo "  /suryeong 트리거가 이미 등록되어 있습니다."
  fi

  echo ""
  echo "✅ 설치 결사관철하였습니다!! 🫡"
  echo "   Claude Code에서 /suryeong 을 입력하시라요, 경애하는 최고 인민 수령 동지!"
}

case "${1:-}" in
  --uninstall) uninstall ;;
  *) install ;;
esac

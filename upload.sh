#!/bin/bash
# 파일을 GitHub에 업로드하고 Raw URL을 출력하는 스크립트
# 사용법: ./upload.sh <파일경로>

if [ -z "$1" ]; then
    echo "사용법: ./upload.sh <파일경로>"
    exit 1
fi

FILE_PATH="$1"
FILE_NAME=$(basename "$FILE_PATH")
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

cp "$FILE_PATH" "$REPO_DIR/uploads/$FILE_NAME"
cd "$REPO_DIR"
git add "uploads/$FILE_NAME"
git commit -m "Upload: $FILE_NAME"
git push origin main

echo ""
echo "✅ 업로드 완료!"
echo ""
echo "📋 Raw URL (파싱에 사용):"
echo "https://raw.githubusercontent.com/JungiSon/NH_Test/main/uploads/$FILE_NAME"

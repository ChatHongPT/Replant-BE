@echo off
echo ====================================
echo FCM 설정 테스트
echo ====================================
echo.

echo [1/3] Firebase 설정 파일 확인...
if exist "src\main\resources\firebase-service-account.json" (
    echo ✓ firebase-service-account.json 파일 존재
) else (
    echo ✗ firebase-service-account.json 파일 없음!
    exit /b 1
)

echo.
echo [2/3] .env 파일 설정 확인...
findstr "FIREBASE_CONFIG_PATH" .env >nul
if %errorlevel% equ 0 (
    echo ✓ FIREBASE_CONFIG_PATH 설정됨
) else (
    echo ✗ FIREBASE_CONFIG_PATH 설정 없음!
    exit /b 1
)

echo.
echo [3/3] 서버 실행 및 Firebase 초기화 확인...
echo 서버를 실행합니다. Firebase 로그를 확인하세요:
echo.
echo     [Firebase] Firebase Admin SDK 초기화 완료
echo.
echo 위 메시지가 보이면 성공입니다!
echo.
echo Ctrl+C를 눌러 서버를 중지할 수 있습니다.
echo.
pause
gradlew bootRun

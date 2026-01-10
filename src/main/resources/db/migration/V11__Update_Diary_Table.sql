-- diary 테이블에 누락된 컬럼 추가

-- emotion 컬럼 추가 (프론트엔드 호환용)
ALTER TABLE diary ADD COLUMN IF NOT EXISTS emotion VARCHAR(50) AFTER date;

-- 날씨 컬럼 추가
ALTER TABLE diary ADD COLUMN IF NOT EXISTS weather VARCHAR(50) AFTER content;

-- 위치 컬럼 추가
ALTER TABLE diary ADD COLUMN IF NOT EXISTS location VARCHAR(255) AFTER weather;

-- 이미지 URL 목록 추가 (JSON)
ALTER TABLE diary ADD COLUMN IF NOT EXISTS image_urls JSON AFTER location;

-- 비공개 여부 추가
ALTER TABLE diary ADD COLUMN IF NOT EXISTS is_private BOOLEAN DEFAULT FALSE AFTER image_urls;

-- 생성일시 추가
ALTER TABLE diary ADD COLUMN IF NOT EXISTS created_at DATETIME DEFAULT CURRENT_TIMESTAMP AFTER is_private;

-- 수정일시 추가
ALTER TABLE diary ADD COLUMN IF NOT EXISTS updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER created_at;

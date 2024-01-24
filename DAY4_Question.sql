DROP TABLE IF EXISTS member_info;
CREATE TABLE IF NOT EXISTS member_info (
	member_code INT AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(70) NOT NULL,
    birth_date DATE,
    division_code CHAR(2),
    detail_info VARCHAR(500),
	contact VARCHAR(50) NOT NULL,
	team_code INT,
    FOREIGN KEY (team_code) REFERENCES team_info(team_code),
    active_status CHAR(2) DEFAULT 'Y' CHECK (active_status IN ('Y', 'N', 'H'))
) ENGINE = INNODB COMMENT '회원정보';

INSERT INTO member_info
	(member_code, member_name, birth_date, division_code, detail_info, contact, team_code, active_status)
VALUES
	(1, '송가인', '1990-01-30', 1 , '안녕하세요 송가인입니다~', '010-9494-9494', 1, 'H'),
	(2, '임영웅', '1992-05-03', NULL , '국민아들 임영웅입니다~', 'hero@trot.com', 1, 'Y'),
	(3, '태진아', NULL, NULL , NULL, '(1급기밀)', 3, 'Y');
SELECT * FROM member_info;
-- 행의 개수 확인
SELECT count(*) FROM member_info;

-- ---------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS team_info;
CREATE TABLE IF NOT EXISTS team_info (
	team_code INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(100) NOT NULL,
    team_detail VARCHAR(500),
    use_yn CHAR(2) DEFAULT 'Y' CHECK (use_yn IN ('Y', 'N'))
) ENGINE = INNODB COMMENT '소속정보';

INSERT INTO team_info
	(team_code, team_name, team_detail, use_yn)
VALUES
	(1, '음악감상부', '클래식 및 재즈 음악을 감상하는 사람들의 모임', 'Y' ),
	(2, '맛집탐방부', '맛집을 찾아`다니는 사람들의 모임', 'N' ),
	(3, '행복찾기부', NULL ,'Y');
SELECT * FROM team_info;
-- 행의 개수 확인
SELECT count(*) FROM team_info;


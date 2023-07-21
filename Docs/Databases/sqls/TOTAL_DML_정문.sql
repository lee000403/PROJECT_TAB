-- SURVEY_TYPE 설문 A, B 타입 코드 데이터 삽입
INSERT INTO SURVEY_TYPE (SURVEY_TYPE, SURVEY_TYPE_ID) VALUES ('환자 및 가족 설문', 'SUR-A');
INSERT INTO SURVEY_TYPE (SURVEY_TYPE, SURVEY_TYPE_ID) VALUES ('파트너 설문', 'SUR-B');

-- SURVEY_QUESTIONS 설문 A 질문 코드 데이터 삽입
INSERT INTO SURVEY_QUESTIONS (SURVEY_Q, SURVEY_TYPE_ID, SURVEY_Q_ID) VALUES ('선호하는 파트너의 성별이 있나요?', 'SUR-A', 'SURQ01');
INSERT INTO SURVEY_QUESTIONS (SURVEY_Q, SURVEY_TYPE_ID, SURVEY_Q_ID) VALUES ('선호하는 파트너의 연령이 있나요?', 'SUR-A', 'SURQ02');
INSERT INTO SURVEY_QUESTIONS (SURVEY_Q, SURVEY_TYPE_ID, SURVEY_Q_ID) VALUES ('어떤 근무 형태를 원하시나요?', 'SUR-A', 'SURQ03');
INSERT INTO SURVEY_QUESTIONS (SURVEY_Q, SURVEY_TYPE_ID, SURVEY_Q_ID) VALUES ('원하시는 고용형태는요?', 'SUR-A', 'SURQ04');
INSERT INTO SURVEY_QUESTIONS (SURVEY_Q, SURVEY_TYPE_ID, SURVEY_Q_ID) VALUES ('서비스를 받고 싶은 지역을 선택해주세요', 'SUR-A', 'SURQ05');
INSERT INTO SURVEY_QUESTIONS (SURVEY_Q, SURVEY_TYPE_ID, SURVEY_Q_ID) VALUES ('차량 또는 면허가 필요할까요?', 'SUR-A', 'SURQ06');
INSERT INTO SURVEY_QUESTIONS (SURVEY_Q, SURVEY_TYPE_ID, SURVEY_Q_ID) VALUES ('자격증이 필요한가요?', 'SUR-A', 'SURQ07');

-- SURVEY_QUESTIONS 설문 B 질문 코드 데이터 삽입
INSERT INTO SURVEY_QUESTIONS (SURVEY_Q, SURVEY_TYPE_ID, SURVEY_Q_ID) VALUES ('선호하는 환자의 성별이 있나요?', 'SUR-B', 'SURQ08');
INSERT INTO SURVEY_QUESTIONS (SURVEY_Q, SURVEY_TYPE_ID, SURVEY_Q_ID) VALUES ('어떤 근무 형태를 원하시나요?', 'SUR-B', 'SURQ09');
INSERT INTO SURVEY_QUESTIONS (SURVEY_Q, SURVEY_TYPE_ID, SURVEY_Q_ID) VALUES ('원하시는 고용형태는요?', 'SUR-B', 'SURQ10');
INSERT INTO SURVEY_QUESTIONS (SURVEY_Q, SURVEY_TYPE_ID, SURVEY_Q_ID) VALUES ('동행 가능한 환자의 치매 단계는 어떻게 될까요?', 'SUR-B', 'SURQ11');
INSERT INTO SURVEY_QUESTIONS (SURVEY_Q, SURVEY_TYPE_ID, SURVEY_Q_ID) VALUES ('선호하는 지역을 선택해주세요(1순위)', 'SUR-B', 'SURQ12');
INSERT INTO SURVEY_QUESTIONS (SURVEY_Q, SURVEY_TYPE_ID, SURVEY_Q_ID) VALUES ('선호하는 지역을 선택해주세요(2순위)', 'SUR-B', 'SURQ13');
INSERT INTO SURVEY_QUESTIONS (SURVEY_Q, SURVEY_TYPE_ID, SURVEY_Q_ID) VALUES ('차량 또는 면허가 있나요?', 'SUR-B', 'SURQ14');
INSERT INTO SURVEY_QUESTIONS (SURVEY_Q, SURVEY_TYPE_ID, SURVEY_Q_ID) VALUES ('자격증이 있나요?', 'SUR-B', 'SURQ15');

-- SURVEY_QNA 설문 A 답변 코드 데이터 삽입
INSERT INTO SURVEY_QNA (ST_Q_CODE, ST_ANS_SCORE, ST_QNA_CODE)
VALUES
    ('SURQ01', '무관', 'SURA-0001'),
    ('SURQ01', '남', 'SURA-0002'),
    ('SURQ01', '여', 'SURA-0003'),
    ('SURQ02', '초등학생 이상', 'SURA-0004'),
    ('SURQ02', '중학생 이상', 'SURA-0005'),
    ('SURQ02', '고등학생 이상', 'SURA-0006'),
    ('SURQ02', '20대', 'SURA-0007'),
    ('SURQ02', '30대', 'SURA-0008'),
    ('SURQ02', '40대', 'SURA-0009'),
    ('SURQ02', '50대', 'SURA-0010'),
    ('SURQ02', '60대', 'SURA-0011'),
    ('SURQ02', '무관', 'SURA-0012'),
    ('SURQ03', '출퇴근형 (오전만)', 'SURA-0013'),
    ('SURQ03', '출퇴근형 (오후만)', 'SURA-0014'),
    ('SURQ03', '출퇴근형 (종일)', 'SURA-0015'),
    ('SURQ03', '입주형', 'SURA-0016'),
    ('SURQ03', '파트너와 상담 후 결정할게요.', 'SURA-0017'),
    ('SURQ04', '장기 요양보호사', 'SURA-0018'),
    ('SURQ04', '단기케어', 'SURA-0019'),
    ('SURQ04', '자원봉사자', 'SURA-0020'),
    ('SURQ05', '인천 동구', 'SURA-0021'),
    ('SURQ05', '대구 수성구', 'SURA-0022'),
    ('SURQ05', '경기 고양시', 'SURA-0023'),
    ('SURQ05', '대구 중구', 'SURA-0024'),
    ('SURQ05', '부산 사하구', 'SURA-0025'),
    ('SURQ05', '경기 성남시', 'SURA-0026'),
    ('SURQ05', '부산 중구', 'SURA-0027'),
    ('SURQ05', '경기 수원시', 'SURA-0028'),
    ('SURQ05', '부산 해운대구', 'SURA-0029'),
    ('SURQ05', '부산 동래구', 'SURA-0030'),
    ('SURQ05', '대전 동구', 'SURA-0031'),
    ('SURQ05', '인천 중구', 'SURA-0032'),
    ('SURQ05', '대전 중구', 'SURA-0033'),
    ('SURQ05', '서울 종로구', 'SURA-0034'),
    ('SURQ06', '차량 필요', 'SURA-0035'),
    ('SURQ06', '운전 필요', 'SURA-0036'),
    ('SURQ06', '무관', 'SURA-0037'),
    ('SURQ07', '요양 보호사 자격증', 'SURA-0038'),
    ('SURQ07', '치매 파트너 교육 이수', 'SURA-0039'),
    ('SURQ07', '무관', 'SURA-0040'),
    ('SURQ08', '무관', 'SURA-0041'),
    ('SURQ08', '남', 'SURA-0042'),
    ('SURQ08', '여', 'SURA-0043'),
    ('SURQ09', '출퇴근형 (오전만)', 'SURA-0044'),
    ('SURQ09', '출퇴근형 (오후만)', 'SURA-0045'),
    ('SURQ09', '출퇴근형 (종일)', 'SURA-0046'),
    ('SURQ09', '입주형', 'SURA-0047'),
    ('SURQ09', '파트너와 상담 후 결정할게요.', 'SURA-0048'),
    ('SURQ10', '장기 요양보호사', 'SURA-0049'),
    ('SURQ10', '단기케어', 'SURA-0050'),
    ('SURQ10', '자원봉사자', 'SURA-0051'),
    ('SURQ11', '경증 치매', 'SURA-0052'),
    ('SURQ11', '중등도 치매', 'SURA-0053'),
    ('SURQ11', '중증 치매', 'SURA-0054'),
    ('SURQ12', '인천 동구', 'SURA-0055'),
    ('SURQ12', '대구 수성구', 'SURA-0056'),
    ('SURQ12', '경기 고양시', 'SURA-0057'),
    ('SURQ12', '대구 중구', 'SURA-0058'),
    ('SURQ12', '부산 사하구', 'SURA-0059'),
    ('SURQ12', '경기 성남시', 'SURA-0060'),
    ('SURQ12', '부산 중구', 'SURA-0061'),
    ('SURQ12', '경기 수원시', 'SURA-0062'),
    ('SURQ12', '부산 해운대구', 'SURA-0063'),
    ('SURQ12', '부산 동래구', 'SURA-0064'),
    ('SURQ12', '대전 동구', 'SURA-0065'),
    ('SURQ12', '인천 중구', 'SURA-0066'),
    ('SURQ12', '대전 중구', 'SURA-0067'),
    ('SURQ12', '서울 종로구', 'SURA-0068'),
    ('SURQ13', '인천 동구', 'SURA-0069'),
    ('SURQ13', '대구 수성구', 'SURA-0070'),
    ('SURQ13', '경기 고양시', 'SURA-0071'),
    ('SURQ13', '대구 중구', 'SURA-0072'),
    ('SURQ13', '부산 사하구', 'SURA-0073'),
    ('SURQ13', '경기 성남시', 'SURA-0074'),
    ('SURQ13', '부산 중구', 'SURA-0075'),
    ('SURQ13', '경기 수원시', 'SURA-0076'),
    ('SURQ13', '부산 해운대구', 'SURA-0077'),
    ('SURQ13', '부산 동래구', 'SURA-0078'),
    ('SURQ13', '대전 동구', 'SURA-0079'),
    ('SURQ13', '인천 중구', 'SURA-0080'),
    ('SURQ13', '대전 중구', 'SURA-0081'),
    ('SURQ13', '서울 종로구', 'SURA-0082'),
    ('SURQ14', '차량 있음', 'SURA-0083'),
    ('SURQ14', '운전 가능', 'SURA-0084'),
    ('SURQ14', '운전 불가', 'SURA-0085'),
    ('SURQ15', '요양 보호사 자격증', 'SURA-0086'),
    ('SURQ15', '치매 파트너 교육 이수', 'SURA-0087'),
    ('SURQ15', '없음', 'SURA-0088');


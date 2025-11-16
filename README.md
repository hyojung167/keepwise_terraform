# Keepwise 
> gpt -- 기반 정보 자동 아카이빙 서비스

### 📦 DevOps & Automation (Badges)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?logo=terraform&logoColor=white)
![Azure](https://img.shields.io/badge/Azure-0078D4?logo=microsoftazure&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?logo=githubactions&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?logo=linux&logoColor=black)


## 프로그램 구조도
<img width="1547" height="666" alt="Items" src="https://github.com/user-attachments/assets/07d326ad-9098-4231-abb8-cbfd7086c42d" />

## 주요 기능  
Azure 및 Open AI를 활용해 정보를 수집과 동시에 요약·분류·태그화하고, 사용자가 원하는 정보를 필요 시점에 쉽게 찾아 활용
- 정보 수집 및 자동 업로드
- 수집된 정보를 텍스트로 인식
- 정보 구조화 및 분류에 맞게 데이터 저장
- 정보 검색 및 재활용
- 사용자 제어 및 피드백 학습

### 수집 데이터 유형
- 스크린샷 → OCR로 텍스트 인식(Naver CLOVA OCR)
- 뉴스레터 → 이메일 연동(IMAP)
- 유튜브 동영상 → 동영상 – 음성 – 텍스트 변환 (pytube, ffmpeg, whisper)
- 웹페이지 → html parsing (Request,BeautifulSoup, html2text)

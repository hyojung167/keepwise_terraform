# Keepwise 
> gpt -- 기반 정보 자동 아카이빙 서비스

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?logo=terraform&logoColor=white)
![Azure](https://img.shields.io/badge/Azure-0078D4?logo=microsoftazure&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?logo=githubactions&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?logo=linux&logoColor=black)


## 프로그램 구조도
<img width="1547" height="666" alt="Items" src="https://github.com/user-attachments/assets/07d326ad-9098-4231-abb8-cbfd7086c42d" />

## 주요 기능  
Azure 및 Open AI를 활용해 정보를 수집과 동시에 요약·분류·태그화하고, 사용자가 원하는 정보를 필요 시점에 쉽게 찾아 활용
#### 1. 정보 수집 및 자동 업로드
  - 스크린샷, 웹페이지, 이메일, 동영상 등 다양한 입력 소스를 자동 수집
#### 2. 수집된 정보를 텍스트로 인식
  - 이미지, 웹페이지, PDF 등에서 텍스트 자동 인식
  - 작성자, 출처, 날짜, URL, 첨부 이미지 등 메타데이터 자동 수집
#### 3. 정보 유형 판단 및 분류 기준 생성 (GPT 기반 자동 분류)
  - GPT가 콘텐츠를 분석해 
    - 내용 요약 
    - 저장할 폴더 결정
    - 태그 생성 
#### 4. 분류 기준에 맞게 데이터 저장
#### 5. 정보 검색 및 재활용
#### 6. 사용자 설정 및 피드백 학습

### 수집 데이터 유형
- 스크린샷 → OCR로 텍스트 인식(Naver CLOVA OCR)
- 뉴스레터 → 이메일 연동(IMAP)
- 유튜브 동영상 → 동영상 – 음성 – 텍스트 변환 (pytube, ffmpeg, whisper)
- 웹페이지 → html parsing (Request,BeautifulSoup, html2text)


## Terraform 코드 구조
```
├── main.tf              # 메인 설정
├── variables.tf         # 변수 정의
├── outputs.tf           # 출력값
├── backend.tf           # State 원격 저장
└── modules/
    ├── agw/             # Application Gateway 모듈
    ├── apim/            # API Management 모듈
    ├── db/              # Storage 모듈
    ├── function/        # Function 모듈
    ├── network/         # Network 모듈
    ├── openai/          # Openai 모듈
    ├── security/        # Security 모듈
    └── vm/              # Virtual Machine 모듈
```


## 배포 방법
```bash
# 초기화
terraform init

# 계획 확인
terraform plan

# 배포
terraform apply
```

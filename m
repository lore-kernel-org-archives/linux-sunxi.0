Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669D03EB7E1
	for <linux-sunxi@lists.linux.dev>; Wed,  6 May 2026 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778066908; cv=none; b=ezquzKNk/Q+6aDXd+0BcXXkkuALXyq4u1ZBZciq0Q8DEUNwHrF4KMYFuBKhqfZYRf5Y3nuS2phhwhrrt5vbsHR2CauoIPzgNR13oQmUW8JQI0UTdBza7HYoTCCAqLqyvHE4IHiHMA3BRFZ1MtUMgoscqGQ/ntXN/Hmhr6AX8RSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778066908; c=relaxed/simple;
	bh=FZdQB3/FsbYQjVBORTAIL3TzbryCdtpamszl5QYad3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swY+d9mn8J42xx/+iEVB7Ts/5ZNNN0B6y7nu97lF+1VRieOcp8/X16G3suKDhCiHQISY0yOjYzkBXNblN9786wbmUf74A2kCrxvzPUs+JxnNALvPP7IOARnnCCYUyQnrZ2gVXu4uXAxGQoAvJ9+v1ddOylRIDsiTOudiLSMYx3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKF+OFjO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VaRCf+xT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKF+OFjO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VaRCf+xT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467u9Kk1434973
	for <linux-sunxi@lists.linux.dev>; Wed, 6 May 2026 11:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XIVvCag5+qHTXfZfw4sjt+95kJffxAurMP3XU4MOgXI=; b=kKF+OFjOj0ly2Gqg
	hOV2AQlQtPG896p5oCmC1Pg0znphnzTUjMdFriP7jVFiD7r5xGKO/u1cpXqREjN2
	S4ZkZdQrKXc/bhEfGZl/jJiUETw4cbymRaOJnlX/yYOVZT012teCdFhhayF6Xbe1
	KKTIcaJqXWhB5/rogJ9HiEIWBr1Ir+JMMvB9JWvi/t+6Yt1+5uDDx6q5l0ZxX/MB
	vH0uK7z+VScbMiQhOiCZswXcfDVqfAlgzvJ7iYJNQ7d2dJ5yPfj21BozJ7iwrk1P
	Ls6K4SZL8+8MPz6Z/pRmgCgV/11gX7BABZWpPaifjrTnTGr0mdSO8RNDCMBfJpDz
	oL9ilw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyuqdt3ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 06 May 2026 11:28:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5104b861649so39309541cf.1
        for <linux-sunxi@lists.linux.dev>; Wed, 06 May 2026 04:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778066906; x=1778671706; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XIVvCag5+qHTXfZfw4sjt+95kJffxAurMP3XU4MOgXI=;
        b=VaRCf+xTfQunveJgk3MIMkKnTocvcKv7yYOEh7tfL0WmMsuQXka6YofKofSOjbuLFp
         Kzr/Le+Tei2WWLHcDoFpkvOarlWpwNFcQTOBeAL8HKeTvsajbe7f9WwvUP1GVzV+a3OQ
         7AH6uYi0T/vdxWG6Wn6CIBhlUtzVOuypuGQJY3IkZyGgzaDZnH1gYtL3tQQn+WrYpRta
         3z+WFlNOSDSuik8gVwnFMtAquS6Y4ZUkv5dQVLy3uV6IPYe4EM4uU+ebx1cW7CJQxCHX
         Y7HngR5wVoIS60CpK72zU9ipXSGRYfXLkgvpQ2SMWR3m4HjjFaaUwDKQZB26ncQlfE5x
         IQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778066906; x=1778671706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIVvCag5+qHTXfZfw4sjt+95kJffxAurMP3XU4MOgXI=;
        b=CBUz4SNmJZwGQNTwNnPsvTVVMm1axN+pJhnZ/ojrPYCEeBqbYlL3nqypgOLMSKSMSI
         IkNEKjs4NtZ8MZLsJUb1RxBW5VJhWT4VaGbf4C8rR8TJ5tINBjtaD8+MQmaJOb2cHmP/
         4XzzL0h8jWSPD85XeqI5tp1YoOvE31mGmfLB3pWD7jrZGCZKQMc9sQcvQoR1Kwjylq1K
         RovqXZI7MOk9YMvS3vOwagPor7ej/mTbGZ5R3XOvMQ/A+kTsEvnQzz6HFnhLWCv8PXF/
         YvUK52ykyABjTn+9wL1xjkWwNst3BKNm8BCp7Y15+JNeZWHRV76PVoO4wpdtSHDgjbyq
         J/bw==
X-Forwarded-Encrypted: i=1; AFNElJ9g+oKRbsHv4eLUZOCxi//95HXYeUyx0KiRhuNixb4yFYwpF0arnkjQz6hxoM1HlMtqBdBaSlRxc5Gmpw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyp/38z1cPpqeOLZzR9di/p82U/tx4WIe88WLQEKx+kcAOZ72cg
	2vGPSS/bBv2ntHRnCLJRcpocHj/+c7ljc8pJyVwlT2fbjUTahrxlCx0ayqk5sKWkPdD8LV+YYeZ
	D5LfliDV6bk8RtHBSBJ/QZpw4H97nIOQQxBIL71ZZcrXIDLSgVqLOpvQvJ/PGA9V1LA==
X-Gm-Gg: AeBDietWjq4G5nSTrfpjoymtcZUPUNobHa81duBFikiYahRgDjcz2YEontKWizx+egE
	K+pH0Dv/nFccrW78OXoU4AGe1MLPF7GUSH+I62ngbpv9vG+X5OV+svsnKac7e1p8AnhIuhSQeiu
	Gam82Icn1rsP2hcH02ITPtO4FES2yfynuzAhwy/3eBBaqB7UVQ6SMF4asFV8C+RbDJhPgaJWVLR
	O5YMyZBQ3zsKX1zh1I3IdpzNv+9M9UqKu5GTHvojD/bq0JH2Hcz/gWsxPH9Q/rY/rEJlRK/3/uS
	VvVrOf+PeTy27iBrAMNGrZgUp0NMNy5aUcZm9MIT2Ddicgwv4WHv8ixO5sKihs6PuSGyAI2eivZ
	WR1or9SjvzXLRFMQzk8T4MvfprDZ16ab5ZNjJeUcJtWl3E66vcw+WtMPws7gLs8tEQeVZ/isGHn
	Qc7p+jX/g+rHuFOquAEuM=
X-Received: by 2002:a05:622a:620a:b0:50f:c26d:f314 with SMTP id d75a77b69052e-514621df688mr43427411cf.57.1778066905709;
        Wed, 06 May 2026 04:28:25 -0700 (PDT)
X-Received: by 2002:a05:622a:620a:b0:50f:c26d:f314 with SMTP id d75a77b69052e-514621df688mr43425951cf.57.1778066903771;
        Wed, 06 May 2026 04:28:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a? ([2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a48c04sm12287193f8f.15.2026.05.06.04.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:28:23 -0700 (PDT)
Message-ID: <9ca77795-ebd2-4157-9e74-1fa1001e750b@oss.qualcomm.com>
Date: Wed, 6 May 2026 13:28:22 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Add hstimer support for H616 and T113-S3
To: Michal Piekos <michal.piekos@mmpsystems.pl>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Andre Przywara <andre.przywara@arm.com>,
        Conor Dooley <conor.dooley@microchip.com>
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W4sIkxWk c=1 sm=1 tr=0 ts=69fb25da cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=I7hbHXdXhLuFcQShn1MA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDExMiBTYWx0ZWRfX2xAI7s8i7QOW
 NmFQNEHBYqmkU9Q1+o1+wNxi1w8oYerWGGuYDMux2Zf1DgYHi+P2p6HOJHe/tTGsyZLTx+05l/f
 b8afRwLMpJsVKkcon3Mkbcu3gIkcAzAtCdmJBpm5BkeLO0F8azn5saVj+j/3Q87jjMwP2NtAXqs
 B97k1qX9igAcndo8Ces7iSM8/iDUoQAWbQpQcjrJ1ceZptAbeOO+W589fM4BUyEMCMHghawN/uD
 ToWCselEkiumHzQV6EXfpEF47ZlwDNlg0c7J49vx+9iFk39G3/yLJ8pA3FwFzS+hQfxh4sZPln9
 L4mPs8G5VmOEweoc/63j9CsC2ID1TF/bNzQfh9oPdSLFiqP+7PhTQTZTb6PdZQrMoTjQunH9zt6
 3uwwqXkZAgRPQIuawRL5DbEcKq3awskPlBvocLo7fDc5l6gag2+kkHeVtqacKXW/w0xrPAUmShK
 gRCFM+MaUbMRtDxM3vQ==
X-Proofpoint-ORIG-GUID: kTCss2OfxO7vaCuAkU0qhY2jpqkthuMV
X-Proofpoint-GUID: kTCss2OfxO7vaCuAkU0qhY2jpqkthuMV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060112

On 4/28/26 18:26, Michal Piekos wrote:
> Add support for Allwinner D1 high speed timer in sun5i hstimer driver
> and describe corresponding nodes in dts for H616 and T113-S3 SoC's.
> 
> D1 and H616 uses same model as existing driver except register shift
> compared to older variants.
> 
> Added register layout abstraction in the driver, extended the binding
> with new compatibles and wired up dts nodes for T113-S3 and H616 which
> uses D1 as fallback compatible.
> 
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---

Applied patches 1 and 2

Thanks

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91D52DEA62
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Jul 2025 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751980131; cv=none; b=Ee70rbBmsUxCNij8HNNgVjwK/mFxcmafleSHWGbiMdFQF0N/EuamxxOAUoF8m/WtCmt1IWSu/xdqjdOY127z0pBg9ji7buF32EiZFvAS2Rus4NjT8G2ylO0BNr2Dbz7Ot8VMtU2wXZl4HIz1h9P+RPVdW4/rkRnSDCABiFpezOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751980131; c=relaxed/simple;
	bh=WzAnNBoWqDOEgWIAvOrUUm+cPnnAQsDqlITlF4IdpJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tk/qew0gVjnZf8qaTnnk/jP3TJ+E4SLbnttNYcKLx8aXtNsFGk/w7clQ6dt3m36MhJ7Q4Uvl203VdkLMKXifnqSnQZkW9RgAoXfcH2eCmOLwa9XaBlyMeAeW8eiBHlyI13Tgo04dvuMxZIDmHBay3BJlPNFcXOm4LhR/r/wo76w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PP6LPZ7J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PP6LPZ7J"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAb7J017098
	for <linux-sunxi@lists.linux.dev>; Tue, 8 Jul 2025 13:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=; b=PP6LPZ7JgWREVlGz
	xfOB3FpIVnYll1AYnAcFtC/DmwaJdneoFKAds0rkDurunf9pH4YLir6HsmEf4de9
	HcAb4L1GmOdV5asQHAXWWHVSYybzZscWrdsAnruQvX7JKZoWdGwgOp91+6ZrIWQX
	YUre65nGE2maSnxdnrutcHQbULUETjK2S+d+a2CpRm1GzVKb36THIn0oNrO3edvn
	EhkHEL/TwV7aqGGErrPonLag+kMrXl42AS6mV7ArPdePlVFgIjTmLDTZcPQ9ohiD
	20G6VCM78LPNilAxjywxwTnMG2XzL+304fFq0SgWTulqm1zX1uARzTyBfJQBNETZ
	rAGD4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtkn97w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 13:08:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d094e04aa4so90306985a.1
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 06:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751980128; x=1752584928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=;
        b=Wdv+q1Pxz769gt1ru0bIisRdseCp34d194CukU8dvMziKH1gwcbf9iY8bAw8GrBJqE
         vD5jiO36OSeKkpzTXfhwbmA0e4Vp7BKl3tc4c7ISKr5x8E9DnzlnPXDYyl+BCZUSSuMS
         8hH4PcJABLVwqQw35zkIrdhrH7xNmlQwZ/XFInxg9Sb/a61WoZYkKJvBFqFuAjHCDj/0
         2xWrGnsP1V8feNVxkWLqV+Jo0NMOLO4UmH5X/RxpM8reIjlKXWPBEiJgpQ1wsYtx5FLl
         W8Ph9SH2qqoKW6uZZltctjXpC/v3x+rN69CYfVsqmx0RE5wTfIWnF2T4tm+sEZkqLwX7
         QZUA==
X-Forwarded-Encrypted: i=1; AJvYcCWqPh6P9F/ZHlwYQnQhhY73rBjhL4H5bJZO4LirEEywjHOPaRrC+HLHJFduo79QGyJ+Egus0JeU5sOT4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmnjW7viwa7ANug0z6ZBFpUH/HDWTFCVyTrV5J1mKLD3oJ2DAu
	Ghp9STUtgLFBYj0aQERv4LqM+CMAOPqpS28DNMLLh6aESgb+nfi9p4J/BrTzoCHFbA+ltAYR944
	YaWoxe1syc00AHAPglEFZjJ+Cx6Oy5L55SU/CEhVNa3CBseO+LciAxltbXg4MTVnClQ==
X-Gm-Gg: ASbGncvyySU/ntcIuYBOjtEEfX46YFGPKzGEuW3zZfSQFH7aQ02gVsJRmBfNwP0En8J
	Dx2rNY4zQ1N+8Zbr1sC5scFVA5iyTKoYZLj35TAHEjHBuX1fjO5+AY8f/4nbCE+1DPjGyzIgP9Y
	EZdWZaOINkFXUpLFjuIufo5KS0cFHwiMjJXsw2X0FRyFuV99Abbai9mx02s7NoQFIyr3c9GYwtf
	ycOgbdbyXpAlPPWYCU7+SbECd7ZvDfwSgk2XdUNsZex118v1239xyS7pIh4Usl/1H2E9PPnB/sA
	2q2uBYihvW4eiU3/vWzAq2FkQ5FIqbjNHxeB89gTVgnODYMsen0BSBiJ6SZ4EilKsqvkY/e+/1d
	oyeQ=
X-Received: by 2002:a05:620a:4710:b0:7d4:289c:884f with SMTP id af79cd13be357-7d5ddb39d6bmr894184985a.1.1751980127628;
        Tue, 08 Jul 2025 06:08:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBiGS5COZ9Dfk9VqBJ+kMTORiJffjyBCmhWeiZXp87B/AUtfoZjbT3vyAV0W19xiv8/+LqXQ==
X-Received: by 2002:a05:620a:4710:b0:7d4:289c:884f with SMTP id af79cd13be357-7d5ddb39d6bmr894183185a.1.1751980127166;
        Tue, 08 Jul 2025 06:08:47 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1edfsm883127366b.180.2025.07.08.06.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:08:45 -0700 (PDT)
Message-ID: <8b473da7-5e6b-465e-ac33-a114a2b6f673@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:08:43 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] clk: qcom: rpmh: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
 <20250703-clk-cocci-drop-round-rate-v1-4-3a8da898367e@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-4-3a8da898367e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwOSBTYWx0ZWRfX+zXrruvHEDiJ
 L5os38LtY7AY7udMGIxmgDvFjYEjmQQmWI/rD60+Do6J7f+u8y0wD7eYeosok4U4+N/bVev72q6
 6UMCLJMbpzbEjS8mBwREBRAI8nF/8ETmAi9G3ljzCvDjLMWs9WoSyH9hpGMVhXz5oNqThbAVc0k
 L7qoJ2xcTN8Gf9vk/wOSZyHtw5unJ1h636zLwvnxbHMqsoSIdivqh2/aYEFAG0OLkHqvCj9IqYh
 Tla97zq1OAButdzXzMPDpmM254SOPBSiLVFBsdVg21jrtL9rNqiF936/zf0XkqUQGx0zIwVeP/2
 rzCcVDWonX2ubMdXt5kaS9yhLOsjxwNwpDM+Rs6EEgvhOO6PyW9Vkla8DOmKE7cdF7DZwlZsW5l
 dANN8eUhdlDt4KPtWvEIRky6dZ8k9FFFO9bKzoLN2gTQBqFXLjzu4NJAQZErYJ8H5HybqlrA
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686d1861 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=oBXrOfH6mq4iYN50PBoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: g-V4zfBsCyaBFeEJC0-WyUxJ-gAKdhYQ
X-Proofpoint-GUID: g-V4zfBsCyaBFeEJC0-WyUxJ-gAKdhYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 mlxscore=0 malwarescore=0 mlxlogscore=841 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080109

On 7/4/25 1:22 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

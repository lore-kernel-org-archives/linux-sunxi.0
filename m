Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E032C0F96
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Nov 2025 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762505141; cv=none; b=hzsECMwWgTTp+IUYKFWTsHlqnNMGRSKdGe5ojKyMNAG3uuvxZcDZI8KZ6xOdKVJz0euqgcAOyRc2UrtiMm/YxcLuzmLaFf1CK0sFogfIZqBANSXyDjcgcBGPSm6QQmSO6rQOD8tef8fwbW8mx1B4wfTSZmdTQhf/1soye7llh7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762505141; c=relaxed/simple;
	bh=RKIGS9KO0vrK2ZX9kbsgi19599kVH40TuOoD/FFjBG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Og0HimTkxEiVeyz+JUbeIIPU4Ljv0AJFMRZ3dHMalaQErTVuLfIX2JY1F3zHy9fCE6hH/nZgWUPpA5O/t2FmqYUS/9RBvT2MY9j98KxH/yxmbhlh96xLwboAXOQWlbbhg3N72MuenDpR4tOIXugPwNRdNL559mfQiJ6sO7KGqQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9VKSGL5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Awpxd8iD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9VKSGL5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Awpxd8iD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A78d6MA4131318
	for <linux-sunxi@lists.linux.dev>; Fri, 7 Nov 2025 08:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QgS5hwRfj2mxPLEmin/RQvyBPkehj/tTh/N9o3Q2CaE=; b=j9VKSGL5ldNhCJw0
	IDsem0Fzr4SZuyQvM/h+H2DD1w1AXbGzSR3pIfo38NsMeard3DiozlihvbgOA8mk
	E6iXrhmwPw+FvmJt6QIA33bRR//xSA+t/4krdqjLlTv+Ktsev+bV4kYprelpwNdF
	GRGMArQuSTUJWlqAla3WFLSuaGWvjhBrDvToC7CMXn0vN+J1xQZllcYOCXarce4g
	qBJRGRQBgZLrKak5prqU40NrNsbZbzxGb2YBYOhfRhU9EAFl2akC7pCJS1EFpvvT
	BJycTnz7G1RABrBE0q3f8B1E86f9WqOUQCb0IEp4y1Fp73PNUYDuiP/x9QZmB2cp
	h7FEuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8u3x3c0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 07 Nov 2025 08:45:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b22253132cso18508785a.3
        for <linux-sunxi@lists.linux.dev>; Fri, 07 Nov 2025 00:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762505136; x=1763109936; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QgS5hwRfj2mxPLEmin/RQvyBPkehj/tTh/N9o3Q2CaE=;
        b=Awpxd8iD3rvwwKbERS01WpRdPm+QHC1HqGDkd4woIVBazzgxZFOyy1vz8EZqou3hbh
         TAWFGKfFvcgLGvOvRjYnZZX4bdQWA6wsnzy1IxjTEsUniWNn5q65+okp1Wmu58dzuMjq
         laKWsPrscVyVjSQ0DgpKVQvIfz/qBfGTXGS5zNIEoQbx2ZARRHifzq2nLWKT1Y3gWmI9
         G7rHWF8wst+xplwswXPHo6+1jseZ5Ul/7mXh0iA/L9Z/Hv0mFERWZmP9hPT0yjFvCVnb
         i1IlFAwxs+HWJK/kYTFnfG7OnbOryvGt2uXTs4g6fKYhCqg7ZNTescMStCDVsa6CsNBM
         SiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762505136; x=1763109936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgS5hwRfj2mxPLEmin/RQvyBPkehj/tTh/N9o3Q2CaE=;
        b=epjd4pcTo0CXE6WyzbgfN6Wocq+4qxsUKDfG7l8Wfy4iNyHgXnpOwn60ps3wkhD7qM
         UCKRBgGR5KmBUl8VIySWXyzTp5jk4iF/cE9jqFZVh7PBiSzv/JawaTQxpFZWsi8SBzq2
         xbyEzx1V2rYrP+WapsAzfWWduO1n9/DH/wCq97jYaftIL/nzhD783Cv4GFhldTzRwvi/
         rLuaam77e6yi6g1J0vn+TZ4/J7zmdvyDDaZA1lm5nJaZ/PyOGWdhZDJHmzlY2AdhvmmD
         /6jhyGFz0U4oVYd17hsH+wQY/FH7yIaMOQtjHO7LOXTMIKhMUBUmWkfs8vpkCzNpf5oF
         7eOA==
X-Forwarded-Encrypted: i=1; AJvYcCW00cItZpXO6LiC2E37wJY5nR5Ch3OxShVQIN3YavME4YZUw0l4bAUmKzCdvTsXkgb7Fl87JW/7jzHgmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgj07UvC1tGIMlWG3ZOLv4laMLCFkRSS4z2WF7myljTxPB6liq
	rPxiWe16qWoBYWnXth7JRiIh4uo/RlX+v9MkDrZ1ff85UB1K7FvpG2Q7tU87UqklNFz/Gkb+Gjt
	P/2rJm4DKBxKw3vVjzO9mnXdBncolJLgBazuxZ8XNdWw//TrZ8S/P8TY54OQjjJmoZQ==
X-Gm-Gg: ASbGncsOGyfbs97TsP5Gy+vaArrPB8KrMcuF1AHvLcxcOPX22nXDrK/viZ510d8pdhQ
	sgqUQe6NflYJImbgGFYf8JhmJBD/qVVf64tR3W+Fn7SpV1MNp6F7PcdbS6Q1kACz4KNBXzXgSHD
	3THzbBYz9AiuTv3YAUdU3IgVzPjyRL+K3OaudY9osJYbPRbXIBamxXDSQ0eKqeIrsYpq+wzHHLl
	zpgD5kWSPDPnPx3atzTTI3LMWdpChTUo0qjIhy+JyGNRDQr3h3yhutrD/62xdE+oO+afjXBg/Ny
	aO2zx9Ytnwchj/DDCp37W6PonbD6UY1Zdx3mrUtpkRLQJrn7rRljguU2cH3q+DKgrbfArb4jeiJ
	hVWZ9H6OvGZpl/EpyS7p88Q6iiRYd7YkX7jXTngtLQ5cVxo8v3RAHPkeM
X-Received: by 2002:a05:620a:29c6:b0:8b2:fea:21ad with SMTP id af79cd13be357-8b245325b1cmr200933585a.9.1762505136038;
        Fri, 07 Nov 2025 00:45:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvBCF3YyaLzOcN+aoUwXSd+qKgBVW+y3iV9o0DDasJiaqAVotNnEsYQ0f5UYACwqcVlSpGpA==
X-Received: by 2002:a05:620a:29c6:b0:8b2:fea:21ad with SMTP id af79cd13be357-8b245325b1cmr200931685a.9.1762505135491;
        Fri, 07 Nov 2025 00:45:35 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97e563sm184419466b.41.2025.11.07.00.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:45:34 -0800 (PST)
Message-ID: <c7065cd8-9819-4af1-a346-4daaa4e306e9@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 09:45:30 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] firmware: qcom: scm: Simplify with
 of_machine_device_match()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-7-d780ea1780c2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-7-d780ea1780c2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA2OSBTYWx0ZWRfX4kmDrtqzDtz/
 AsajWTDuLBWwIR9QbGW1f2KG5aid4Hjrj7cRX1YDXamqDrSHmwNKBqbjc4nSuRThE73lYWQf6lX
 KKNcgxI4YccvvYaP/1jdQaJ3nlQeOmSao+cbHR4IqdmA2gEWEdwfo+z90/4Ze+9zeUHR6I5OZz9
 weWNFm3g6FtgWoMAWbppTGf05pj+ivrJ9yP5oUhHNS6e6dHuzwWRDO86vBNK+mr85k3Nlmx2D5A
 VQalxXNLLjyZFM56g/t0cN6SdSbaUGAe3hSfwbz8t+mWc1PqdFIZDf7IjpeD4eWMuxJxP4bBAKO
 G3d2z0Kqxx/RNo5mVj6kFVGw4BR2tWwn0k8AiWQUrFA98+C6DQ9gctEBG+dFeR4VUVp/WoEqTPk
 UKUuVZ2G+I7VLbtH9/X6Upc6+I66vw==
X-Proofpoint-ORIG-GUID: m5AB9nEMQYJypzqrh6feSICVFzqoMLSm
X-Proofpoint-GUID: m5AB9nEMQYJypzqrh6feSICVFzqoMLSm
X-Authority-Analysis: v=2.4 cv=BrKQAIX5 c=1 sm=1 tr=0 ts=690db1b1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=TYptV6U4Xydj_hDeH6gA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1011 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070069

On 11/6/25 8:07 PM, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node and matching against it with
> new of_machine_device_match() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

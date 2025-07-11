Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597D227E7E1
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Jul 2025 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752228023; cv=none; b=nPNFSBmktPw8hiTR32XvURoS+JKnDf22lEATkFEWi2zCIbumw9hX/MB2YlQpLa/qbwLz8iFZkuXpkUv7KiIaVfx9bKq6OcchpJ7gd4eXbs3+WWrcLKi0Bu99rTyeQin1/ZAipzeM4tJyZSdbH+RkjZ6TQh/8J1gCQtHvFerMGL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752228023; c=relaxed/simple;
	bh=zWLtanhvCIpSQaF+swneQUeYFWPTh5F4obnY4lrF7m0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPftraXETVJTWODWEq+RUYP/+nN3d6uC1AjsrfFdv242IpnAHKTXyVigpYF1Wp8NWUH2yjqV2ClftE2DfA8uSgYu8IDAr7HjWDj8r8w5MKeT1myAAZE28PQ45zvyoIZuO0nRFWuurSdKDRfQGqh6F0F0F06ilM/iKnQYevfBSsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=axw5SR9u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="axw5SR9u"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1XKNZ003223
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Jul 2025 10:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=; b=axw5SR9uMFk3cf5O
	c65Nu/hMWRZOrxPT5SbOCqJIjVKnOvBhRE8X0fQ6i0KGuZLwsJI0EMBLgz44VhIW
	WcVUXjWHyNwtSFfylk/BbF+Eaf/rUfoS1cG536ujCumN/i+ut4Zxunksp+PYpzh7
	9T05vbaYGayHfh2hWaTcUL5KISKFpUwpRwKtAn9d9LconQakq9FBerVWsIjzrkET
	twVdqZ98NXYE937d6Lqi2sragbZoGI3siTh6HPt3YfEY+J9hwAYplrs+on2CVKB8
	qWsm/cZD23v+ESTat3Gkt/SyuF/AK3Lr8QaRKSrvAKbwTUDr9l5tbRMmg66stqP7
	Qqv/kQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2bkb2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Jul 2025 10:00:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7dbce38d456so35447285a.0
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Jul 2025 03:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752228020; x=1752832820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=;
        b=G6ztEdWQnkv6lbdaQftg5mnNxjNcyboOPdmeAoc+lwiojPv2Uu2GtAlko4ZhEh3pN9
         wDf3qMrOLViRnSsymosfaPZzeOXt6Hb1GsMBd8CpOLPilaPDFsfxT648U0Xa57d2v5iS
         nkNSh5w6HX2rlQezd3glHCjJXV9JsoXAYJX1s9od21tb0wInl/J1Vyj/O2936n0LMkg2
         PWc80S7wGYQ4wld5WM1a70nHmC8w6dmKajsCn4/QpcuLVFQ3/PbpUmwvGaQy7nc3JxBP
         t0/Wt0mUObzuq4Yk0Du0WrZmttw/mPWOdsZAj/EBbuJQY8hEeADXn0YGy7m4MU4Jyrx6
         XsLw==
X-Forwarded-Encrypted: i=1; AJvYcCW9XRp4DAedmBVJIGWOzcWU/60LQUnAOJUf9FtEhnVbJVC3WK/KqKLsexnwSbVayg54gZG5elYKG/6wcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwR2NfsRK0eveZozrdPLF9ZfmK8ICVABgIb3YnCkkv+nRpjSqxc
	nt64HcoO8TUG3dQg3u/gQxK+/v00KndnxERM+4gyKrcS2T+StIkEsrSbRgi1J+wM9HtKb3z4GNk
	P4jOYs9WGMSmMNVAa/OkqpgFGSYBxrcxzidzbnb9Er3ZXq5Y/GP6ZKgCng1Tir25V+A==
X-Gm-Gg: ASbGncuspE5C+/ADRoFXjaQohynC6l9Vb8zaPPlHp7P7V3L6taa290LLbePDJMcdkBj
	dWSbLaH+TjmP7Dx6x9HawZXFXKJOEGnLubWFlRc0SfXsZZW8Teh07ghRkXSJdmFmzbfNTq9XH8I
	u9bqAIlPWoy+kbRbKWSSvwu2WD+ZpHkx4SzYhvvpldYZdPJNJESGoca199zu+vmNWLrzjSaFn6N
	WEMhu2gR0HjwApm4xMiOLMIIOhQsmaom99KZiVih1NWAcUKzuZjbGEjkecApTW2RzRf62RE/h//
	PiVmwXpNuZiMHkl06uUAJb7Vx5m14y/Gi1B6kOWERZ4mRv1GhlLkTooZwcNJnbUiG5jzvCYOQMT
	FjZkLFYinhCDmS3jujK2c
X-Received: by 2002:a05:620a:1791:b0:7d4:4353:880 with SMTP id af79cd13be357-7de97c2cee7mr101576485a.6.1752228019710;
        Fri, 11 Jul 2025 03:00:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlhPKclj6Yn0L7q+F2xj0Xt2MfgZll0J2UP/WxG5I7gSC0cNE/OxkTsOoKzfyHayBKXzvFZg==
X-Received: by 2002:a05:620a:1791:b0:7d4:4353:880 with SMTP id af79cd13be357-7de97c2cee7mr101571885a.6.1752228019106;
        Fri, 11 Jul 2025 03:00:19 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e907c7sm276215566b.17.2025.07.11.03.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 03:00:15 -0700 (PDT)
Message-ID: <9b1c3318-7d89-4fcf-99ea-3b446793a758@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 12:00:10 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij
 <linus.walleij@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai
 <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MCBTYWx0ZWRfX1tk/D6xW6k00
 YvbAGqqx+8CKaT9hZqOBPXWvOSrlwrnVtY6op9P+p6r3ByP0YL1HfZ2FMNOSX2DxW1BCoK6cGcb
 fE7DngYxKenElf0VqTDWIEMrnQjbc5n6O43MiW0NG8U0d4g0YYTM+IF9KhICJ5EsJZybaBSjCZb
 NEih2p3D7EM/Ku6MmeZ4EvfFR9CrqnIL1HWVV+4AMXrgbFOtzjMbIBO90KVlGBNi6P7uluBgmO5
 qzmC0uDF6i00OUV4hUppcTiykffxPClpRxiZUf9HicSgG0EPk69Vg3WPCSA5fvUjMhMqlpO0L7x
 8GyuWj+hVO6rgUKph4a3sCxllv/2WgPThqpVLDW3xVXHzxEYbhFEqv2sSnOJnMP43Ct5n0FNxn3
 XWiaINetaMFKSdhIxaperQCmc99DiarncveKJ1ovYt9yzsx1Up5DlpHmn3najwZQnv2FJfP1
X-Proofpoint-ORIG-GUID: ndalfcCPoPowuF2Ug1yAwqu5Sch59d12
X-Proofpoint-GUID: ndalfcCPoPowuF2Ug1yAwqu5Sch59d12
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=6870e0b4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=Lh8LEGs6nEvmLzq652MA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=830 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110070

On 7/10/25 7:43 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

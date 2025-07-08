Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171552DC342
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Jul 2025 13:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751980123; cv=none; b=LnaTJ9OmYZobJOTmyPj7O4zxCCCvSbWJkt82bLTNReZiw0nEKSuxTV3ooH7SYWt9Nrra1qQZBt4fwtM3PNpR6Dcyv0BtN7GIK89GNLP7Jn3aG0ljqmYQej/PqsTh7zC1fs/aHMO5AGh1WYzOVNUUPAdrNU2unRRsjbwcG9cw6SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751980123; c=relaxed/simple;
	bh=WzAnNBoWqDOEgWIAvOrUUm+cPnnAQsDqlITlF4IdpJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tmiwhb9BOy/tqh/ukmWsBMFJ5VRLzmGOpfQI3+2Jz52bUw97NHiO0GbH2hqYzF7CwK5Ao6jwoZ3NY3WiQ7dTtfn7Sfh9dU7K3JCW4pdSU+6mc4fTG81vOoHz1u2Tzl1YXISbwsUFtyCM13hpJzovGOrypO9qyVv8BjTNmxV/N1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJkmmfuH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJkmmfuH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AARuI012371
	for <linux-sunxi@lists.linux.dev>; Tue, 8 Jul 2025 13:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=; b=UJkmmfuHN0Jr6kLA
	ld5/JgheNu5sbMNgZkiwYUgO4GjvZ0BhglW00c59meaADsYhrZJWYQqmA1gc/OUc
	DUrnK/NvCvH5C3ONM0GjvGKFSW0GsKNdezqCPza8ZE4tevjkJ9e1npZeNjJmh0a+
	INZ4fgtIBBYO0j6f6etpT389hYl24vuIu2PlUOUPRwGL81B4dcop5sZWnBHRiFtS
	shOo7dNQC/vBBtAFgTDT/48Rt3FZKyaSlMLbcUDvTnThA0dRBC3CHwWIE5u6O4Qv
	lz8B4EKeQFe+0hY6nqY73fapqXHeHNzj+ARgwUPzAaWQ1qY+sXoEn7n7SuSC6Xxx
	t7bbIQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv97nbjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 13:08:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09b74dc4bso43291185a.2
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 06:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751980120; x=1752584920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=;
        b=fEaA6f3/jWU+HV5u9RIab5J50TYmGuqyf8vWr93NAbR8h5W6SBZItg+WAKkVI3KInv
         ++MKfLEXDpS52e3WweLyGStV2od8JidnBa6Ka4bNlpmr303TZyNOp3d7lMnTnMjjbAmy
         ERh1KIR0eyhnM5fwcg7XwO8w2PMf8cla0QvBvyEblMC4lqlXgtEkl6NZxFukwEImPPEb
         Rhk4aDH6x+nIf6QKreXSHtcc0Iuaccck7jwgZ16SmvzzVd+Zm6cOjf6TFNDLnGeB4qt2
         Rz2PkUFZAD2lJTJkn7cQ2LItkwZi/wcJJDVuLEyZ44lB6EZh98Nl9NyJo0/fnxm8nMV3
         q3BA==
X-Forwarded-Encrypted: i=1; AJvYcCUwL7u/oP0jZCN6YN42tClzGJ7XVoXFsYxG48ckhHCBmZ6V6Q3jgZs3foPPQgYDVPb+2ru5Y3bjhdQvUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHsqquSH/mUdRiW/dKxh3lqj6TbV4UXRFQF+5+Qi5DQfgfxV23
	Vh7v5LUtIyn4eYYkck99PHG/1dAMH8/bExA3uMNJ0C9dmkZxADMHiB8BUvT1pJL3LsRF1fvfqKx
	ByV7E65ByTs4eejm7O66e7xZi+nK7zxosMgusVXu7jf5hSVCiBKA1qp82LDcxK8IBDQ==
X-Gm-Gg: ASbGnctnwQPSMmTX1TTRddQF7B4aOcEHLX/fXm728sbBwoxGQcUKRAiT9KXj7w8HOid
	PGnk+UgM1X+5mjqh1XHzixDoYFAsGwewKTMhJ6ycXTuIbR8gWcynqjQz+H6Y7XLVFINJTjul0fn
	9bS5VolEwzqY9PcQNwYlbyA/xZ4xSHPuT6rexKjzl9Op2K5xPzeMwRBLXttdRtfk5bnWHxsDG3v
	mM4KJt7I3S0tZnjYWqax/f9J+gth1ViDA1Ajozv8xNoV1wgYct60ImgXqfAMO6MTbr9ugGY9c9x
	WzZyKH9thZ20F8FybQv19LjULZD10lkd6QprTQBqRNDWYnMTvA4DoOrTxGVshGLOnvm4J7jckDt
	yeJ4=
X-Received: by 2002:a05:620a:4148:b0:7d5:c1d9:939a with SMTP id af79cd13be357-7d5ddc689bfmr784813985a.9.1751980119799;
        Tue, 08 Jul 2025 06:08:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjMkzcx+Tq4TsX9kndjZh7wHfMuEQIojKWDO/yYN17QbawLmZlZmFuRE1iLw+w/7zUU6OuFw==
X-Received: by 2002:a05:620a:4148:b0:7d5:c1d9:939a with SMTP id af79cd13be357-7d5ddc689bfmr784811485a.9.1751980119240;
        Tue, 08 Jul 2025 06:08:39 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1edfsm883127366b.180.2025.07.08.06.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:08:38 -0700 (PDT)
Message-ID: <fd367b55-fd20-4601-ab03-b398dcb326e7@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:08:34 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] clk: qcom: rpm: convert from round_rate() to
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
 <20250703-clk-cocci-drop-round-rate-v1-3-3a8da898367e@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-3-3a8da898367e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686d1859 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=oBXrOfH6mq4iYN50PBoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwOSBTYWx0ZWRfX/5goblkA1BYK
 QNXXZ1VmtAZR9HvGSbq1ABS3CpUuEs6NvX1gxTEU2a2phK7HaGnn2fuOzYNvewKTfy5LjJ71+rX
 zY0MaX4TOxTFYck4/RuLeIaGgr9fXb7buMn6Sdfm4edt+gfXLxqDEO3M4ujLUS1CkeVKApP1w8Q
 Y9LGe/1vLhoL7uILEB4+qlknLeNkLIeqCOV27DogyXcMUf5DM/eMtMdGXueZI5li9rQ1VD5c3Ou
 sJ/GmLyY5z4hfy7gJiShBVN8kVkpHgrByZzT0vBbcz3w+AR89UQYdUAzR7ALM76eo2lU3XJECJo
 GodAoeNQXIwHTNARn9VbsTCg8BIjzUZ5EG77q1K/lM+ZJzOFPDvQvovQr/EmBuMEIu8KGNp0jjT
 oYTleJBVW93YIymQ7jJlPtew8HKtvKIVDgrVpnhbYw4Jinkoz4kpSqjwIGX9LWBG4ERZFcQP
X-Proofpoint-GUID: a_5FdTunZPhf5TMpYSa6kuMTAH4EtcAL
X-Proofpoint-ORIG-GUID: a_5FdTunZPhf5TMpYSa6kuMTAH4EtcAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1011 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=841 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080109

On 7/4/25 1:22 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

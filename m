Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E68D396D0B
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Mar 2026 11:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054665; cv=none; b=b6w9dv8+0P1T3JcakffrnEmbekdljA0If6crALiKS3GF9Ew0MKkx4QQGC2PBAcoEwZfnIPZbW2xJbxYzVnYKC+NWRrSleurNFEwwxRrF2e1jQNk0i6HNspH0v39BldYaOuPtyIL/EVdm4oyYGhpA+ygYdEIxhTMv0xPQzMmR9w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054665; c=relaxed/simple;
	bh=jRloghjBa1pGeGfZukYYZ2zI6AVLcOq1y96jm/iQ/U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCQUwITUNZ/DJf2jDYRDKDA13reb7iu48PO7xruOJ984ghHSChZkMyllgX8F4xRMS/OSSOuu/55DHyjywibgeJOwgmHV+6NF4tUFNUMqP2vK1N7rFOF3SyyeoxKTwRsptz8aO6B/xU6G4j2ZGddHIUDOfVBJZnm4Kv8CEYmQwGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JeyvWL9C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5sHrT58; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JeyvWL9C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5sHrT58"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629B3Wfe2986038
	for <linux-sunxi@lists.linux.dev>; Mon, 9 Mar 2026 11:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2vcqntBHnJ9jNcmMCrhjcICJ
	WTC4/uHfcjNc+otCaEk=; b=JeyvWL9CvFdqMvYH4Uwf5YXE6DfuYFJRKgNHwPFY
	j4P2q15t+EjR4zrgqEgCtY6mhfSEZVxpWD8Ja4EEbbJDJoOAyAd77b3YHrktAGR8
	sNrWbQJZhKLG1cyMMGplh0w41UKXhpoPf2MeJiOuhVMxrIJl8FxS0tnYn5yh/K3i
	tdp2qiAEg51gDf7PkG3fG37g1BIo+w6nyF3PQFjASzyrU9UmTqeePxxdNJ8YcKQo
	GTlIlhBM6cKjrIZ9Et6Uc7EyRo5Ofl5HTG3DK13vijuu2TQ48ylv3nf2LEd7a8DA
	ca2Whh2J67xeuowrAUHuoD5nRjBWvj1EenFqV0oJlTNgbg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vd45f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 09 Mar 2026 11:11:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-829ad81b132so7559366b3a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Mar 2026 04:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054662; x=1773659462; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2vcqntBHnJ9jNcmMCrhjcICJWTC4/uHfcjNc+otCaEk=;
        b=V5sHrT58Q7XldEFEHwwWVuEHs53QKjetslZKTjPIUt/hXFRBpJ4pgdLaFJZKOT5/tI
         BfQBDTAc1spPwuO4swyF+jcTo1KRAq5IRtmEyICJEa+b7AdpnVXOf7fuZgRNiCE4C3If
         /3IOXAdu5Lt9Lcy8fCG37NzKyT/DV14/FaHr/Kmp2+Z3z6H17YwA3QjJAetlUjXL01q3
         ZY8hPYHXZQZuHHyA3AEzY6OpryMKEJsf4xqYOpwY377/bK67dSpLkj+Gj5d1cmyEp7j9
         5VAHZgSL9vC0D4S8jGBJlp7ePi81aQnzRFxujLrlrWS7pZRs3/JbpwdoidthNasWeyoW
         oQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054662; x=1773659462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vcqntBHnJ9jNcmMCrhjcICJWTC4/uHfcjNc+otCaEk=;
        b=hIOEJt5HNLUTF4CzKJl1b9vKmUcwwR3fQBSmeZ4jLgWSB55AYhUavKNcWwkFD95129
         IBqFLE/yFc3FcbtMsiqa+RbGbby15DAS2yvfq7IjzlajSt5CVP0vHPvm+hwkztXpbc2D
         V9KOo0ZXp0f9NbqIWKP1Hif3objLMC+ciguzZ7U+KBqi/2wrckRvAc00f/6n86HugnXF
         ceM455Enumr0KBgZDaoMkTzYMMCWb7ye8ZFQQiPSXPmk7ABGZ9FqIrB0/hhwMa+VxX3c
         H/VHqES/ahSvMVOCOh+pTDnmoIX8WPuwL8riuiDWcCcZmERdHEeImC/PekYyA3UHgWRR
         pTCw==
X-Forwarded-Encrypted: i=1; AJvYcCUke2fFVDE7ysGpJ+nJqh6iJGmzUMKSU5+GgM34BlSt6Su+wMaXC0dGoRhQf01YsywUXgjTsdhoJGhnmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHG8TLMbv0uDl7A+anQkP4t4r1rVqjeA7Hstt0fOq/2ytstnO5
	E5Ty2blTslmT4TCL5qJNXaELJcy0yRd1ELu6hhUeA6eZHxioj1dDnfj0w1YAKk0RaBF2lA42Rhn
	g0jocTQNGwIaX/mjJBvsEfv1VnWpZHGbGudLx0i5a0ZR1lv5ETn3SVfVW6rQYDeKQww==
X-Gm-Gg: ATEYQzwGhtPrL/1EV6dfl+9QT9lwGYuSfrQ3ivcN8bSFxDng2PU+gId6oBkmvsxexLa
	sgnTMRC1gI7/PThNht/px42pLeKt6LqTgmo2+arIuZ1ZzHtrRXOxZuhh7NXUDAQhn/m+VPhzTvE
	O88dGvzDMFi+bOC8FDnqwL++TF0eqTyFWy4Xxzm0oZucvusPW8I0CWJkktHEgvFT5XCmxnOlFCc
	ZylSac9LAXR6BFO80ac70oTkmTgLvCcGA7QIksHrUDSADeXspLZG0sOvUzk6eH1QW0rW+n+azzM
	QFm8qqfPoafeK/rySmyR7p3Q9UOlZO9s9MIZK31krD51fQTkt8xlIsNjl75YgH8F2ee303+692r
	Dut88inL5mbU4TFLGXjOhFphjq0cKcAsay/I=
X-Received: by 2002:a05:6a00:2309:b0:828:f1d9:22cc with SMTP id d2e1a72fcca58-829a2d85103mr8988600b3a.20.1773054662320;
        Mon, 09 Mar 2026 04:11:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:2309:b0:828:f1d9:22cc with SMTP id d2e1a72fcca58-829a2d85103mr8988581b3a.20.1773054661861;
        Mon, 09 Mar 2026 04:11:01 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48676besm9478833b3a.40.2026.03.09.04.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:11:01 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:40:51 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        Jan Petrous <jan.petrous@oss.nxp.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
        Samuel Holland <samuel@sholland.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH net-next v2 5/7] net: stmmac: use u8 for host_dma_width
 and similar struct members
Message-ID: <aa6qu7oWLeB0Dpeu@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX5P-0000000CVsK-0iwX@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX5P-0000000CVsK-0iwX@rmk-PC.armlinux.org.uk>
X-Proofpoint-ORIG-GUID: xXFWZScP98rZTWk11AybTPlv9e8DYtv_
X-Proofpoint-GUID: xXFWZScP98rZTWk11AybTPlv9e8DYtv_
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69aeaac7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=nXI6kmJP-DpmoF2jiF4A:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfXyvIZrOw6vee7
 jgz3KPtPY2MYEb9mIWc0NSZKM1VIQ2QJIQbPizsJaNduA2/QKI2OiKJ859JMPebKrBycF4IzRpl
 bKpPGp9gFfeLKa8Gpc9F0bjsjbAjt7CFQTTRCO7MdCdkd7D60uBPXR4D7UP4NHbFSyxrRT+/tic
 201SG7aY7KJTToJVzntcLNT4lzjMuJcaJmG4mMaMttjHLNbbIuM1S97B/s3phBkq/ci9baO25Vd
 KknjQr4eDFMcPbHpfO69YV1X5nvqCSUGBlo91SN5s6zxQjARFOfmLHaInTSmuVAviX1ilMNWCz7
 /UgZrMayHwiH0zhSRBMDyV2PYdTeajbObjfsxMJ4dZITEVH/QCKc3lSD1Q8MM1PDQFLyZPi96Xk
 +4gK1fbEuaLLDP46BeGxQ3cI6ie6vLrLTQI/HAoZk9trPT139jIinxuZlrkO0LVCfqGKJy47kb+
 3++n6JqmAkv/S0m7zZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090102

On Mon, Mar 09, 2026 at 09:39:39AM +0000, Russell King (Oracle) wrote:
> We aren't going to see >= 256-bit address busses soon, so reduce
> host_dma_width and associated other struct members that initialise
> this from u32 to u8.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c         | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c    | 6 +++---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
>  include/linux/stmmac.h                                  | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 

Acked-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com> # qcom-ethqos

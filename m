Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C73C326939
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Jan 2026 21:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511155; cv=none; b=jVJee6fAA/n+sZZvxVrWHoTyl5lok4vFWEAGd62D99UXB/1Txmo5Me2dyhDAf9LAJTBEpbstYHsk9i3dWhcgWmwdfGYAOw9Zd6tJZZWZz57UU32gqA4icLmiTJMVcIzEYKZF+lAHMm0WMBv5pbJ63TejmESWSUWU2MifPZXrsO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511155; c=relaxed/simple;
	bh=ENmGoObji0+Hq4MublklfZhpzGxYbI0JiS47cctdDv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MroEJwv8eLodYEE0y1aPqpk0C5AeJNw4kzdAWFAjcs+KBFMqU6XbcF2D3Ki9nTTdq2SxDLTHawMW2tn7eF3OJA+Qe+TyJcx3cMZtbO6vMLoUN+wKvB3NWg4WqiEmLHwvx3orLhQlm3f2efbfQ/URQxNuQWdmwtirv9pS9XwyOcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcyP4ZgH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJgFn56K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcyP4ZgH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJgFn56K"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYJFN2174643
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Jan 2026 21:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=; b=LcyP4ZgHar0lfCNc
	erfRehhLm+Jly3LD5YZe+gnbNWLMPpKpCHqXWqbxOusksc+bO9tXicyW7jh//NJi
	usIGfOEjO9AEv9gpfGj/98YCcHfrTukl/zYmQLydJsdQKttHrSPAJdyOP2ZwhZgo
	JBQMEwdzMGLiVdBk1W/SXyZVvNdc5NRZT+FM7qpEx7/7NvdPOy5frXysA8s0gU8J
	ZqNYay2ewVXzcLHlbBz3ecFwu6edWv5ajyjydAsDG19/Yj+LuCA7AN0opCmt5loq
	k4QJeBZL720AEGIBMtghVzSNUa8Qz2OgpGPhh0XGju56X61amGvdnRG64wNypL3C
	6E2Taw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq1xh97m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Jan 2026 21:05:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52dcf85b2so523025685a.0
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Jan 2026 13:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768511151; x=1769115951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=;
        b=TJgFn56K0W9WJuU5klZvJZvnsR1HXUORQHFy2wYSqXQ0MUhadzwiGq1Fkl2Pax0uwy
         YCVhHwF4mRxiZmfrsrNxUy4Ni2J+lOb7Nv9+nuOF0MwSQSiap5KVdCzX6HDa2k6c0Mnv
         NsJsS+nNAexZVZtsh5vvMwH0xw+0KDGEFiE7gMSMQnWwhVgA7GJUVc+JeGUgJSDVSAmc
         w06/9moTmEEzeLKvxmSEtFjyzzNEOYxYZP9xWhzcfZ0PavG42m3NyNOzzbOAi6GxrwAI
         D8XQy8GkJ6OCFroVHUceRsfPFCfraeNE8iRjJH0bqmoVdQ9y0mJ1+T2cAf+9k7iPhSri
         +n9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511151; x=1769115951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=;
        b=juDs0HtQdj+IJMLS5685+aqlHIPvutSp1JiD04Mg5QdFMi9RgVfS/knqexOHPMg1Bb
         9zZdYh97Zb8HL3xLRXRtO5WT0DkGtXXAr1UMqc24ETpPsaR3vT6lpEZvD6HWOdZ5yG24
         g1wsKTet29WA41rTnUOYCphorgmYqp5S2gvxBTiaESQuC2tGOjjVrZL5JQuuEJidgIll
         W0Oot60fq4jMKkbieCYTAePoEBnvKr3kJ5SYrqBpvDKK5W/5UbHBlUy8fhhZrbLueco4
         CrFKxwVZNPIxritFe45wAtHfdRmj6bL91z2vEWcbrZKMvgOUrOrIz9PN7HPjzciEP2lX
         pZ4A==
X-Forwarded-Encrypted: i=1; AJvYcCW83VDJodEI5N3/lttzV+XYvSTeeR+EpmCcwLku4q7MNDqrj8H8DVkxNLXS8kitkXJkvVUINPgXZRYMJA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy46iIcJeWZpa4kSqtMrsKuP1rDBa+PSynoxep37iqzAhmwE0y
	NuSNHry4HT5JT/otw/YtclLsBrw44TEVd4KmRpLpMNv2sOmslopT74pX+4jmMy2jrMEjRdxX2sq
	n00c4tZc+a5OAs8hfGyOXj9lmrs/iXBV0NcGuuBL0K9x9eG16J9KBXuS1lY2wUHr1JDg7iq5Gpg
	==
X-Gm-Gg: AY/fxX4uhqhTWN/TAShl7P3bUFADE36oun8tSDZaRsOaGs0wRtUKhgs029N7a3aHxlF
	CAJuwvhAOPoctQi/tf6jL5cg+NCMZucwAvHLJT4Sq5swVvxEGs1Yr59XZKVOpYH/sm8UNffy5lk
	zd2+NxGQqUNLxJ/qKs85xg0QGVAv61kUYVooR4fTuLGWXnnLecMijBANElkz9pWxz+2IhO2uDEj
	LfH0WVPT0KH1Rm/2WCKjd4jThV6l/eo6F8vKkD6ETsPDziEh7kckTO+a7WIQ/T8gjwY4h3u8H+v
	JEoSmbMNXKPDjQ8Hu1DrVnf6gGWAPKWo0LWm2vZGI/HtRmmPxyW65wA7pncv4RgL98jvu7o3ttb
	uYYfOOc5V7V4PS9lrZQwbVZk0W3AlFU8SDqqbanRBYj06gyWtLEsUONGjZVh8hol4qovxke3NgY
	qNFFvQjsBcqpmZdYpojmEd+kY=
X-Received: by 2002:a05:620a:1723:b0:8b2:dfda:66c4 with SMTP id af79cd13be357-8c6a68d2f67mr120079185a.8.1768511150898;
        Thu, 15 Jan 2026 13:05:50 -0800 (PST)
X-Received: by 2002:a05:620a:1723:b0:8b2:dfda:66c4 with SMTP id af79cd13be357-8c6a68d2f67mr120072385a.8.1768511150340;
        Thu, 15 Jan 2026 13:05:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:05:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev,
        Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-actions@lists.infradead.org,
        Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Michal Simek <michal.simek@amd.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 00/27] clk: remove deprecated API divider_round_rate() and friends
Date: Thu, 15 Jan 2026 23:05:48 +0200
Message-ID: <176851027322.3933285.17869583744437773979.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: L3Q3IPkkOUgP_MkpQIZN9dabhS1v6pa3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX/5mdcA5r8s0o
 IDGnXtiijCg19h/ssQ2hKnnR+tBe5zuDyToubuBnVqYfIOwIpXwmiz0S7HIH0wt/vCHZ//JewYi
 s/HIVhDFufgMv6Iqm2n/3tlwK+yfb7t99+cN0oAtvjaNti25LW1t7DimiypcZynwELYGh6+a9H6
 qn3mXfMdSr4+/BY3MERp/oaaDz00SxuEChFRT+2RtlrhTQyLASFI7TV5ycV5+BjZ1j373I8zTmg
 drFq+zaa7qXB8KyJWLVTjP4bKD+XGnM+DKENub4y9he9ANY6ffas93kRzoKyaBV75jikKun8eGF
 PirgjNQIu7zk5jTB2noPDvYMkDkeVElrw48WzEx9AOoGAAmpztE4GpGqxVZGc6wMtC6bxFDTzNS
 TupkCl5VgE/2snmUKOpLCzpM0lC95FcZyt704StAMA356XcNNT1AbOCvAL5O7mtinRNQfEWtrJh
 rkHq4qbtWApXZ39aFog==
X-Authority-Analysis: v=2.4 cv=TdWbdBQh c=1 sm=1 tr=0 ts=696956af cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=whp_R4xS9ENlu3RGya8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: L3Q3IPkkOUgP_MkpQIZN9dabhS1v6pa3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165

On Thu, 08 Jan 2026 16:16:18 -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.
> 
> Note that when I converted some of these drivers from round_rate to
> determine_rate, this was mistakenly converted to the following in some
> cases:
> 
> [...]

Applied to msm-next, thanks!

[24/27] drm/msm/dsi_phy_14nm: convert from divider_round_rate() to divider_determine_rate()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1d232f793d4d

Best regards,
-- 
With best wishes
Dmitry



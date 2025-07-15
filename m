Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549C220110B
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Jul 2025 15:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752592341; cv=none; b=DHBgPMrrOQLZU3TG7hYR0P+UPb52qCEg/iu5lqgpuelhQKDJdlqWXp889o4G8B3RNk3k9Ds8OgCoEXzPdiGAR1DzsMfcCzI0fG1AtEshkvxuV9YOFFyRcWo8RDpiW5w3STVGVLhxzBL6/X+c7uwiunlNiCN/TPe/2hICOZF7n/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752592341; c=relaxed/simple;
	bh=C7Bt6ty4O6b5hObsfJEEwxiNOyTN1VXF/4lKT7wSu18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8MUADERqEucyVS66wnE4IEWd+cfOYGP2Dv1G/ZD+Ptxy8YpwuNTNcmKWnH5dvYwJrr9HpiXDSRFGwfYV6J+ZfoLMFBZ0hXDSdgGx2qzvS+vT1GtkwTIWn4HHQQrpN365bI6QWit5D5kCWtniuNT4aqsgshCMBxL/b6E4LrBJHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElfxlvT0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElfxlvT0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FC78Tc017093
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Jul 2025 15:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/8/GQmYozt0hkVdJKNP3dY4c
	27MmXYLwdf8DyqAf4/8=; b=ElfxlvT0VzYDBYqLPcqcx5u7gpdJm/0FYmMwnBnG
	y+B4eho5GQ38s7gyWa5V2do3XLCADnVdKyNIdYEaRxCT0C1n6voidTAPb/dJ8PNM
	cQjD55+s9FTC8E0DR8gaP1UR/8u1e6FZJsdhUG9oFq65KyWJvm1FKx/OIVGZhCDY
	GqP34VrlblGX7kQjhS4nxUIVXBXKFZ9NLggE072UbjrSEaUUDqK9bPvusCTM1sc8
	TYWch1G+ETibhGOgFvTa8N8/FWEZDaZpp8bAT7BoxZ0ifVXNJ6WcBNJaKwt99/uv
	EPvODnurcR0dUiYP2bhTrorQpVZq/UucSCwyWS482wIFPA==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu88n0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Jul 2025 15:12:18 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3df309d9842so129948045ab.3
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Jul 2025 08:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752592337; x=1753197137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8/GQmYozt0hkVdJKNP3dY4c27MmXYLwdf8DyqAf4/8=;
        b=DSRiC088eYT82QbiqvDP4GjqEEU8KaJuS6wC0zvzYLh9Ef7Vo6tNkp1cBy6z9HUJ+r
         uLTDwhZ7u62bFz1QnaN/jRllLsuhvN8t2ucdcAXycoL68TK2HIEMGqpQPw60muZBes/E
         REWH39ZW3ykQLXJ2JtGH/GbDZ+3j1p7vrrF7CZoBdWmgPZDpXfp0N+G6AKgCVXEc32XI
         M87W9VRDljDgOp8VgnxM6w9R2/vbje8Fd2J6+J0aP+YiPv1IlyuegrvBlVu4Rvm8NLEu
         S8t3VInINz6E5Btz7Ir6E6EQCTKjIc+iSgx3Rmq2ibFxhhWA/nCsBAjpaPuZOMEByk34
         4NlA==
X-Forwarded-Encrypted: i=1; AJvYcCXFUR+X7+u0b0xiRl1RRn+uugGehs7FnRNM9+tBMblNPou7mO5CkS/0NDpdDsUVNB5VbU2AnvHfgnTZSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAc8dziIsHVCDTclqcNZiVtFx+2uC+clBNfQp9jHxOQNr7TBcM
	cNXEg9xNrMtbpjOufaqhBwCQYhcwINrtALuD7LP5AW0wIA21RuJp1nXGhPR4K9f4iXMcyKUx461
	jAnyjucJ/vqPWdc8C0F6kAScOGsEycHOne/TdxT/D7Esa6TUub4ILqUSC94rsdJz73w==
X-Gm-Gg: ASbGncsF2mBHWdQMFhDFzMh5QxKYiZmTtmO8+qcbJJgZGWkPIKdhwxg3xAqypMCnO0e
	sJDS4VZ8AFOjXQSew2knfB5ufrWPV2m0GeiBGQfng7pCZ4brbb5ToMsxQXTc/lYOm9vdH0Z7eDg
	fdr6A4Rp/Qz2Jh8dUygb1PjYTAbD5AeZqCYBgZuz/Bi6mDI24f3ZtWHZA9XgFWUaKFq7hX5Ia3q
	GEJW/aH6NGv68R3s/gJIRimvgWELTBl0EvsOjy/pYSmakP73pTtR9O2WVSo12CELbo+n3L1C9r1
	TryzFUYgBFmGBscia6NaY4cCYk6CgATBmdNDVwUu8XJyIA6Z3v81i+jDJAYsM4zCS1dHKLZ6gG4
	cax3ydPnviNAlCs+uspno0DaQsW8Olpp9gsmV3fVkF9lOi5BmPbN+
X-Received: by 2002:a05:6e02:b23:b0:3e0:5042:6a0e with SMTP id e9e14a558f8ab-3e253317f2fmr190550635ab.14.1752592336613;
        Tue, 15 Jul 2025 08:12:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuCcHGzu/NV0coaNVvZvnyxMM3fWdvavBShiCcBGZwVBVkpyKA9SgxNyTJ8HCuKA2VAmYM7Q==
X-Received: by 2002:a05:6e02:b23:b0:3e0:5042:6a0e with SMTP id e9e14a558f8ab-3e253317f2fmr190549775ab.14.1752592336031;
        Tue, 15 Jul 2025 08:12:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7f380dsm2345658e87.83.2025.07.15.08.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 08:12:15 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:12:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
Message-ID: <tkqu2zt5yulnngwvda462fhmkmtmtjnwieruel6lfjr475h7ld@47goit7jldgk>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzOSBTYWx0ZWRfXx4wQ6zOrJpAP
 6S7GWC9lKAJa/k4Rd/NfaQtlViNV7HIiJn0LxN5MhYH0kTp/1673cMAs5F09dKL7Xi6DyEcuYSO
 sTh0bEc+myF4d6uYdUtg1+ZhAG4MCRGC7p5o//HkTMQapCFkZ968b3HuTLwkjspToeHCM7u3fGw
 bF1jCARyDPKFgZYK0xFVpsMn4r3hTqWakkXJC0uD8etwo6wKThv/wfagBmDqvNjzHPX5V8eY39W
 rgh2j5wd6rA3Yo4b3hReU6pRlFaGsf3/1+spnksq9X8kld8bM2aNlCELNyHno8b0wjRtr5DFU3o
 6ulJJAL6ZKIwlFnduukOJnf8ydOmV4v0JHDTV8XxifQ1I59+4HNDid6Pbh1kR+kjEdY3f5d7dRG
 /tpCBXmfNgMej5+hNz1wmZpfzSdpotCnuF9pkQU9xp/ow0p5OuYNtU0RHTcO/UEe3nC3885x
X-Proofpoint-ORIG-GUID: NMyOXpm0U4ZaMZz7PQsBBZd8iZmsHfBU
X-Proofpoint-GUID: NMyOXpm0U4ZaMZz7PQsBBZd8iZmsHfBU
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68766fd2 cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=8vIIu0IPYQVSORyX1RVL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150139

On Thu, Jul 10, 2025 at 01:43:04PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please take this via the drm-misc tree (I assume the rest is going to be
merged that way).

-- 
With best wishes
Dmitry

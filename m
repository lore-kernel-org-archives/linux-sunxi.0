Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74F437104F
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Mar 2026 23:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668420; cv=none; b=iacusg56+ZgZs8w8/td1XFsxV6VdUBYOezfiZ6NY4OaRVo9b1G93AAyehbSN2hc94Ubw7SEEhusha3i/8cwUfI9F7w0qmdCTRkAUzyMXO+1F1QtWr3TNPdxO21q8Ul5brsedhF+QG60cvmvQIIHwOu+cOVq/Lz3uw3pZUok6nJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668420; c=relaxed/simple;
	bh=hM0fx+PufUG+eR0kIJ1dr4h1ANr/zb80CpZtG5LPG3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DH6DjdPSSLf7v4BoX/3WDAwj6JOA0YI0WN50x1MXbhk3r5xajl2fmuFFuhiDPxEtN28MQfozOd1nSO5LoVzC1ZY1xvZ17dKlaSE+qgxKd55xKSfHs9FE2xXqCDr49gJHIB27g3RcBlxoJ+bEajSnoBcjZDZNrUZYNYLuDNYdzAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHnTZhnF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cgwhhVZo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHnTZhnF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cgwhhVZo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HH6Kn3837881
	for <linux-sunxi@lists.linux.dev>; Wed, 4 Mar 2026 23:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V50tlCURGOSWEpUNVC/f5JBG
	lAu9WVw1+uCs3+cXy8Q=; b=bHnTZhnFYn/tiIi8J4ULThpsgbab7UrmgW5OOJJi
	m7XwaAv8gzL5i/PPJCFmKWpARNfKhBWcj2eQ98Jty0ias+PktBjqdKCkXAPaELNj
	a0Gl+BUEEowrMPAKllx/ORmbxKvdbnv06gsWNMRC4vNwMWDRsN+/Umbybcd+e88B
	r/+5sfU/Jr5rGByjhLIWV29LUZnpLgy3RQf4wS6C8MkG2aHm4Hpng0Hc/lXMymq8
	+xAymHfPQW0I/zSIuwudwEu/Xyt9EGrksONWTgra0NIIeQgGca3xHZntcQ/B1uyx
	S9yybI9F7OtwJgszxO8ID4FgfjHXJVcqqpvfDRNL7lu1yA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m12h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 04 Mar 2026 23:53:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb52a9c0eeso5525853385a.2
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Mar 2026 15:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668417; x=1773273217; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V50tlCURGOSWEpUNVC/f5JBGlAu9WVw1+uCs3+cXy8Q=;
        b=cgwhhVZoifCrEjVEMBvFO7Fe8oaTu+OxsIldCe00EiyrBFbYw5amN6XuFpNG3DdMaS
         4UiBF2egsIRZMtPGY8DiGKLi1a2Clb46L2oTh6+J8+QsGrnCgPlkricr8Uzw0EiXLRk5
         vRZsr+pnLYxFksjLIeu7VQcI1xSGNTQUo57fwNqwvUVX5LtcTgIf9b53ym/MhdpWyyBO
         g1DVXer84lxeR42SGgP+bHEQtYlR1DyUkv/GC1j0KEp0kriZLMIQ9R5TjTKcg5x/7bNM
         jrg49Tud82CEtMZYeEHvGAKNIoO5Ep/W0ncfN90FcUSt4YgpkuoKKjpn2m67eid5Y0Eh
         3vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668417; x=1773273217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V50tlCURGOSWEpUNVC/f5JBGlAu9WVw1+uCs3+cXy8Q=;
        b=vlIEivL/VZLra+CNic7+ecCfXMKecufk+BG78Sknpli4AyeEkQdEMja2jmcfWNJawd
         iwQ7bZEEPCpNIIqSuoxWsH+WWO3V6TaOFcNKyzNMkVuclwt8wNLsnzks06Ygqyg3Fts/
         4DEGZ0WLkA/PEr9+P7KWDqHT0G+WmhSQ/Lnxg7iWgEQtU5lLaVWtuXsbxV7EZlwQkikH
         JoEA6BsusQsNqtK21hQ+d+4fRd3qVS4hWcmRNEM7io3LJdt+3218B2O9vG6ODuhhlXku
         CIpeT/oOwPrTADj/CW9lUB+pYrP7kJar/zwAI1ZNCuogkdYi98k2HsUmyASsYTouWy3J
         8iMg==
X-Forwarded-Encrypted: i=1; AJvYcCWEWAPR7MX4Y9624YsovFXzhqnSalNxM92TD0hPlV6exiFBclHWYklJTcq1bEZyJ4sQPhJ+B6A4mINgHw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbJTX8Cnj0PoO5XbnbiG9gsShz5bvvW3CvlzTFRYHyczX5owck
	NAnFXUQ4imUqlpSZROQShxRjOg16tqff0+mWNljFilJH2JJQAJ96NNS6A9Z4+v5McYNC11/EqYa
	pT0TLjUjgqS0a6lCMAShb3yN672rBkICMqmBizaC2uK0TsnvM8iKbc0LdKkiK/xeVWw==
X-Gm-Gg: ATEYQzzOR8K8VsaF3q4xlfHExW1Dl3zCzeNsZpk07W3bTs/QWbfUnto5oJlDoW9YYJN
	l5+NOXzgf1Lo2mBFmwR9qqunc/49QvYWEjTk7cR6sTq1ehXQLAstdKmKLOtaE0+g+ztJveZAsq3
	hDw5GzyfSSJY/Lo/yRx5wrSm97i+uYw+D3ySc/gstIqd+KW3POzFJP3K7ZIxcYoqtBiFPI98LxQ
	XtgAcggCTKieLt5UNvVzOoqPopvEk3LtIHfOQyByMZOhOq5YXCU4t1+OijRGbYfMKDIpSaAYmCs
	DtGXt0YyDGGI5nitslGM2z6bV5otS9bSYtfUWToHKM+ceVYZgZc1DjzoBLMgv6yRDYXIb5PD5Ev
	CJ7Y877/mJjB2u1eyPtn/ZhNS/bvLLL9viCzvRL5AxTH/sz6PNsnp6rEWOUuneKOVQT/lBNC62m
	DUEkmDS1LhgLwsU2ef3blI2tCrtM7GBLpIbtg=
X-Received: by 2002:a05:620a:3727:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8cd5afa6707mr498607985a.59.1772668417050;
        Wed, 04 Mar 2026 15:53:37 -0800 (PST)
X-Received: by 2002:a05:620a:3727:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8cd5afa6707mr498604985a.59.1772668416537;
        Wed, 04 Mar 2026 15:53:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1296993a0sm933837e87.31.2026.03.04.15.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:53:35 -0800 (PST)
Date: Thu, 5 Mar 2026 01:53:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH phy-next 11/22] drm/msm/dp: remove debugging prints with
 internal struct phy state
Message-ID: <esbforcln7bi4e5enmgwqj7d63usdyoobxyo3hwd4paou56aoc@kjlizz3ubksd>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-12-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-12-vladimir.oltean@nxp.com>
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a8c602 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=3ogKHO_BN1K2bhpmqR8A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=ST-jHhOKWsTCqRlWije3:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-ORIG-GUID: LotXlrXGT7h3lQqsu2TkeqlYh9HDzY27
X-Proofpoint-GUID: LotXlrXGT7h3lQqsu2TkeqlYh9HDzY27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5NiBTYWx0ZWRfX/TInQIHXPDkQ
 p6S9az/fLOj3ZF/0609JK0mP0JjKc+gISrve8Ej6582J5YUfiNlLBsXbLrJSNNyWHUQzCacblkK
 ZH/na5rPcUnqGPaig8bbznCVOPu3AopR0agr+NahoRz1xjKq0G30zhcu1Fn+deSjdHKN7m3GOuS
 BUNIle+n/iXH2PhmlIWQf9pZ+T3IRtnV/RqyxpnYL+WCBCqwBD1fQgMGuNNEHmOqcNvsF2XjWER
 yMV6ijjpOObzqmVip1yAFu2iQzO3FmFk9kHT3gwmaK6FPynoErhQwjXF4lVtEsMj/q7ZmY6j806
 RYewzLhm5qs3nisDYHAEYwNRWI3crqQpLIz+YM5nsKpEe8cucisuzqYSozOYzDD6d2tYdtSvvI4
 PlVglWWgdcOjrPY4NAtpE4Org7Rh3jaD6Jx5Tjped20OOEr/2xdya4w/ueO3N07wAHVdWiheWtf
 FyUczfq+L4PFnAXLT+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040196

On Wed, Mar 04, 2026 at 07:57:24PM +0200, Vladimir Oltean wrote:
> These do not provide much value, and will become hard to maintain once
> the Generic PHY framework starts hiding the contents of struct phy from
> consumers.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 18 ------------------
>  1 file changed, 18 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

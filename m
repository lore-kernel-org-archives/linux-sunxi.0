Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E9637AA7B
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Mar 2026 11:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773055177; cv=none; b=EYYxxF6aIFiUSeuJQ2GdIFVX0ykCBJvmBSCSCLBX1hCmTBXHCyJ5eO/62tmOFkY7Hg9keZ39wy5X0VsZTMz4gVN9vsRNdPBM51+AJtqiOBbezHRngojG2NoEnmmJwEtyLip20bXw4zZqcHcc3j2VOzZfCGu01IDyvpkDDchb7Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773055177; c=relaxed/simple;
	bh=AejVh39OfouTSd2iF1xalh+o1wTJiUiMTTrorUnm0v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIvoOyu73VszljU8+ylw80ysfVwIKScoJJAhU6zeRAqYWnlMl2usd+HDJe6qqTi6WOZBpIJPhnWH0pgadJX6Ml2vfPP8B207+NxeNwHHO3dzYXVrfQ1/0wgQNNz8DwZPUCeBfssG1hrOc/PLQWc4mBcv8p6qDvkAKQOQ9vDg4UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpI6JDD0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FYh4dAf2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpI6JDD0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FYh4dAf2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629A6iCg2195570
	for <linux-sunxi@lists.linux.dev>; Mon, 9 Mar 2026 11:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aBuXrT3z0syHkRjP3iylAVgo
	7EGbnv7gdiOgzGuaCiU=; b=IpI6JDD0HWnBmmlj0OFHN8/gFzwsaR6GGIPaSRWZ
	iFf/DH7u4vd7h1Ql6MNsSNVW9oPR5VFW70oJAOTynQa/kotTy97vXA0zLfU6dzvA
	uNntI343AApVrwilF4Ccnldt+LK7L50ujgLUmwLSHh8Zw6kc69JCAMGvA05QoRPE
	9O4dpQc5tRl5IG1keLHk0u4cwJIhRoOu4w361lkUDa5Q2QOyO9hNNQvNH43cn8he
	7kk5Yw7SulMX0XAPaDCMv1J1DuARQsDGemPZ4pfuNOCdlEnEvGJDhSE+ExzyMWep
	mCjRxW8ZWiSYWgw7VY+HBiZ9DBPabub841Zlzj4UETzIkA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5u87ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 09 Mar 2026 11:19:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adef9d486bso102877155ad.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Mar 2026 04:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773055174; x=1773659974; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aBuXrT3z0syHkRjP3iylAVgo7EGbnv7gdiOgzGuaCiU=;
        b=FYh4dAf2DkUIoXyU3S3OQxsKVOK2zMGGkpUh/OoV8xzKcekI9sXgTN36LP25aPmGcS
         jl4oBlq55aIUsY9fjL0mKc2DMLFjSIGvXKPJDVy5xdgMIzL9tVc15ruJuMuCGhALaYHo
         DXQh4cXv6acR7AQG9W60hN/GE0RkxiFpRCSSY4uPXMe+bqHBJoy7cESn/n9vkgRezfKf
         Oqsa6+NiXupN5YAygBBW4YkNl/nwsqmRwpiLFlUzByyv39V+soJR1f9GSLakWNyC2AJ/
         II/41yo/O/u1H/++HOoBLRf9rN7r8wHr5kPaqgGH/odktRAPu7WBO4B9Pj7H+uwSMCJV
         BVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773055174; x=1773659974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBuXrT3z0syHkRjP3iylAVgo7EGbnv7gdiOgzGuaCiU=;
        b=BFNW0mgHom6MUXhzn+yTppoDGYlB4PxXXPNiDC9/Ltk/76jhvBkFsWKQxfkqmMqaTO
         bciFVJwrZ37H5fBP8VNTF5SujHJ2XyvEu+1Jbs2MMx2DY1bv0AJLXx1S8V2AtKYaNaEb
         S46wM4TytBYJItpEsTbGyphp/YwMjkNjUVocbMBEYJnLvHvnLkhQEjCHt5EyMAxonHpE
         fy8kfp8LYDHgzAqdsSJCOnc5gY6xDRXT6NnF8SrJ0SbG2sDl6lQxoa5I8rIR6sYDslLr
         D4CRXFPP6nObFP5c6ybJi8sJGQI6ubXBWe2Un1N2h1/fZULnHBDk3gntcBDKFCPH2SJT
         dvEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd1ZlUctqXV2kCBAS+rZ+gdJ1ExjlGW4HZBEj0hzqbtD+ZqeChbbGCxfypSzuSSPIQSo0Fxgt9XfDcoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCCdkDKJegqukS3gOnXtpCDeiR6ZGoEkrNDS0iKBve3Hl9VuXb
	vxO6XpBMgknPdddZmzbNdeNTlp8zjW3q/iZtwFp/MWe1tUmVJYIYnr2fc1szhAvTmRvwjMBUmss
	Cgd9rVOQy02EOw+XUcy+c0OQ1dm8Cvi9qTyAKVZQ4pcZ0J3DmTwRAZpCSY3HYobW6Sg==
X-Gm-Gg: ATEYQzwcQ2azBJiiWooRvOsYsZ0T+eBYgSye607f0of3k1+3RV7PWmULEqqWETKXVAo
	NUfru4/2HAtc9T7aqhbLzU+emqh3SlYIhyJhINlLkTKDLP9m5NW0gDgbPVGXoQaUlEX/t7m36fo
	LPnOkH8Kgr/y84IREiZ0G+Lgn7/ShO6UPRjqKlKlUMz+o9/UhgMXb6d00z9bdqjcXgGJkfO33f1
	Z7d0ryA3THtZzxj/kZJ6MrJS/WxO/xj6M3rWQI51iaTsqXwEA8nyLsfTi3Tg/tLykBXsorADUi2
	A4Ztq2C+GKjppSHhUK8aQf7QQfte+HAfbx32hlYuAdSqPN7dPYFBWb8qPNxOcsTCSVLRNxsx2S2
	B/+8Zi+/LlzOHhdPnRDg6CJwtq16VTJR22cg=
X-Received: by 2002:a17:902:f64e:b0:2ae:5fc0:308f with SMTP id d9443c01a7336-2ae825056cemr110474405ad.41.1773055174156;
        Mon, 09 Mar 2026 04:19:34 -0700 (PDT)
X-Received: by 2002:a17:902:f64e:b0:2ae:5fc0:308f with SMTP id d9443c01a7336-2ae825056cemr110474115ad.41.1773055173696;
        Mon, 09 Mar 2026 04:19:33 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm150127135ad.85.2026.03.09.04.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:19:33 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:49:23 +0530
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
Subject: Re: [PATCH net-next v2 4/7] net: stmmac: use u8 for ?x_queues_to_use
 and number_?x_queues
Message-ID: <aa6su45ASA4jR2VJ@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX5K-0000000CVsE-0J0Y@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX5K-0000000CVsE-0J0Y@rmk-PC.armlinux.org.uk>
X-Proofpoint-GUID: L9gMdzyx5Zg-xjlEzahgitP5uTGAZI2E
X-Proofpoint-ORIG-GUID: L9gMdzyx5Zg-xjlEzahgitP5uTGAZI2E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwNCBTYWx0ZWRfXyj7+btjbTdHD
 DfBoEw6knDpZFYpEvZFRpfMkvWN81unXinKrn9ppzrIy5d80Q9QBBdzRSqN38CmS9Yhecw3xqpq
 cJTxKvmJZAt2Q98yS9MEN2AfY1sFBSCcw1ytheIIht7LRYbBUoGCfZtYlR/dktP/ortlSrdt6x7
 BSIcFb5dJSm9UCNzzWAlO8qQXMbMNiuUQp7Au4uOnfGOLeWf0hvVCBWpcijMrxLl+iinkRV7W6Q
 ildNNj1JMliOzR5IKHQK1Zw+qMPzGJTzicqwSNTcwXGm/uQdqVNa31kOwUje9cYjw13pmtA4lnJ
 fnAekXDHOaRuNpNUgCu6GWqf1lGdiBfL4GmpnHZ6auUx+CT5tpFs+5Q9z6bnhCTCdxh10XQIfKA
 UhJZGa5Wmx8yfIw+1K4pxgwFyWaPkH8TMhY8Ze2dzx2Twy+gHK33OdSosqK4HGDTbt7rL2/5nmD
 IMOU5EvawmAICPuq8KA==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69aeacc7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=2l7Dc_Zt4Q8SQ2GGjncA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090104

On Mon, Mar 09, 2026 at 09:39:34AM +0000, Russell King (Oracle) wrote:
> The maximum number of queues is a compile time constant of only eight.
> This makes using a 32-bit quantity wastefulf. Instead, use u8 for
> these and their associated variables.
> 
> When reading the DT properties, saturdate at U8_MAX. Provided the core
Nit: saturate?

	Ayaan

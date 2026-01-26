Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326E33EBF26
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Jan 2026 19:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454052; cv=none; b=AYQEf9UVQOael/KmniqcFpOMaw6C4AQJAMVgNv4KsObyUQA57nrzm4tG3CGsX8nk3jPw8iFTeiDoUU4lh4zn0xz8UDVyUGWRFkZOdOavuy9VtFbF88/a81P3CvIgTriQA2IgOOihp/ufVzNZLlGC2S3SRQ6BpKkC5hxbW0ccPBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454052; c=relaxed/simple;
	bh=alv7oD3Hs+zvmds7ajNwnK2W2ZWvaWeZjwZgZo6fLPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XqOw3rNG3BYN4reHRcjcGASMfNqtXizWW7b8wypzAk2iFM0fSCY9SRkLN7IJFIuj56wQG9Pau1/wz8G9FAe+SnCCZMg138LNZLsJ6b7ELX/+5Jd2DsG1eGaIIBess2AqM2/8Al8EsifRnTMIM905ySl4aXsGa7xLeZ3oyrMEORw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpmTm/e6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F67wf6s/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpmTm/e6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F67wf6s/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QG0Jan2971875
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Jan 2026 19:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RqfsakIPHTwBzETcZdpTqje6
	xP/4nMqp2xVshRQ/NMc=; b=lpmTm/e6ix4LNQPm1ErA67hrm5bi0+CXYTgXGVEB
	5F0JLpjpAhOtHSCDG4vdrvqC2JGo3hCvrEr5e8iZ3F9xYh0FL8olLDjrVQF65e6G
	Jz6c8yof4G15xtOR3MjHdtgW678YRnjlvURa1upnTFISVavfQoASqCblKnTtGXk7
	CM+kgUBwOBUVdSilX3vK7TBANL+8OdtuZXecKObrWvfEeMHye2ytT0PANsdqFpf3
	G/BnHS+NdT/I+N3PgV+FfLkKiUCRrcH9g3LwvfMgqxShe8x4RRsXcgAuNqSE3d4c
	oTGRdGsnap2WRIrzi5qf71AfbPBKQ8X9VO3abyLsJLK1AA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6xwk0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Jan 2026 19:00:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6cfd52556so1298373685a.0
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Jan 2026 11:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769454049; x=1770058849; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RqfsakIPHTwBzETcZdpTqje6xP/4nMqp2xVshRQ/NMc=;
        b=F67wf6s/1V98bXOb74FJW6SFYJeU99DLL1WdJY48J4AG4v7yEJUPMHww4y8+np9H3Q
         C+3X8piSK+kEL0H36/EWKq7hODZ0Moq3jX+v6V1buT1VgnvnuesGnS7B2XEEzqtsY1FV
         iQccxS46HxTHcfFNbPOORmhwvU8EaWNiAl8nNjEH2Xt5DuGLkYjNh7mcL2SiXQbXkhbn
         ewNLwNdBmuWYuC1DjeRS9/tfRUvrJrZ3CL+9ElVJ4+Vxmnb12yRqCNIWN3FxWc7cSXHf
         o1oX1KJczkTC4Mn5XTewQ3RlWtPC/BBs3WNVNBIcRM67ga6dqeVMyk+LeYC4JuGuDja4
         129w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769454049; x=1770058849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqfsakIPHTwBzETcZdpTqje6xP/4nMqp2xVshRQ/NMc=;
        b=hh8aqqYCv5z1jJCd9/XJg/YMcR35gRNG0v6JzwhkjFjl9lttzr8eFLtytMqrEqv6vS
         TFetScrTAagSiYUOvzm5UGatK8jBLu2/WBoeADt5yD4Uvqyu0eM9Mx0iGZ5YAX5iNdGO
         w0Nv26Bxx+mpWkrTZyw2JeA+ZPTtbPEOgmUaCcV8ga+PigXZjhl8VNbxR+/VjT/mIx79
         R3ua+wfRHC9hxOZolBltpz2P2mx9L/RC2mYtdXtupoeND4EYm5y11YPPPy3Rytwg/FTU
         MY2p82m+CfGAZQ8cZVveiKTX1ct2TnA2eovikoyRIAs/R7nNkxgA8YEzjkECmNXUFAny
         9ZPA==
X-Forwarded-Encrypted: i=1; AJvYcCUTFys8btNK1F8mwnMDWsZJYbP2IMLFZ6miu3OL+FKbdP2ZSa3j4X4na+g77fPHDW7CJk3x39f+fcH3bw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKb8EYIcBXVvkOkYCbEFIXNUW0EE4dki7tfJTuSYVH4HV7/iTv
	6bNAAl7pANCnnwNEizZltLRh3eFpvmVCckdYbaOUE8ZgD+cmFypMhV4SrlWgW35MN1Yvvgm1FP3
	KVnRNP5gWjmVmoAMZSbgSE5BYVRw6PUO5UJqPSiOVcKEPEJ4i8cZ7kxkXaC/tMpPqZg==
X-Gm-Gg: AZuq6aKsDykz0vLd4r7EdodMkmiuLBd9iBzRjNjup5iwQ4DAkLLagX8lMiElF7uVIeX
	HFZEeUSvRKYPjPESAm6M4sD6NsaozmcS5u2Npl7EQVpBAy0bQNAm8FvUnv3qZiJq9bl9Br4iYPK
	dKhQXGFHjrpgJLdnIbivQDFGzVu2bOOt/9420BmcdwSPNsa3MswNSgULObwgYj/eb54Ax0XQZGv
	AJvDE1YEpgy9KQDBscCkvYUJhtZpDtSNOlVznhYbZndo/wEmeWzNSCLttPGOdMDLjfw2dgNHhUv
	am1V2ujlR76/LJXmpeo/AhMYtgnsRjcbZsv5msukoAHoKrgHERLgaCeECcDsl2zigMbF5Ev4Dat
	mfVc+Gym6usKjDJx8WjGnDh0sKaz8Vh3/9afHO1WWe+rKAHYQydyjYiV+SNkbRdbLfJaRTklM6A
	wX1J9nRR7GBoXEbO7kF0XZsoo=
X-Received: by 2002:a05:620a:28cc:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8c6f98c08bemr619838285a.39.1769454049376;
        Mon, 26 Jan 2026 11:00:49 -0800 (PST)
X-Received: by 2002:a05:620a:28cc:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8c6f98c08bemr619828985a.39.1769454048666;
        Mon, 26 Jan 2026 11:00:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fae764sm30668421fa.8.2026.01.26.11.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:00:47 -0800 (PST)
Date: Mon, 26 Jan 2026 21:00:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 02/10] drm/vc4: hdmi: implement clear_infoframe
Message-ID: <jiq5ublhbfzuv3qsz3n6bve32wmto5hxc6mxppb2i2wagykafx@d235legi4r5o>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
 <20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
 <5c247393-b096-43ea-9ff4-9dd5fcdeec73@samsung.com>
 <CGME20260126174455eucas1p1f219202580a1033d3e881adc4f37f206@eucas1p1.samsung.com>
 <36278555-a01e-4c96-bb26-e170016e5f8c@samsung.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36278555-a01e-4c96-bb26-e170016e5f8c@samsung.com>
X-Proofpoint-GUID: 7B01zKBxWiL0QSBPsM9vhJqcMxd5xqHi
X-Proofpoint-ORIG-GUID: 7B01zKBxWiL0QSBPsM9vhJqcMxd5xqHi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE2MSBTYWx0ZWRfX7d6kZXqLFODQ
 Ww+77lD+bnRwW7z6fN25qkBVaxcYFtDukOnEYoCAD6V9A5eRYOO+p2quN9g+DbGVEivedfefSVY
 UNDMuPZm+WrnJoP+5kA9Uk8pzz1E5G8Twx5tXqw+ElF+h/KD0W51eTHO+D1npS3qsfWfkS9QaKu
 H8n9lNWvgBONX33ECHFxvD8/+MjVAWBqW9QnjCyb0D5TY/1c9+z7uwoUkUwrJ7kXoR1pzYM/3CD
 o6Y+D4subMR/4wjRJEdjhKnrOQw5FzWQOZYacNImfwUlXqYFTVo+qRXhfnKxXrVZoo3+yLtLl24
 dEuCtxzJmBiIPr8wgn7LB45J8DNnHEY+JJD2VfpL3xRztU6KiM0hK9kH5q/ncu/EEbvFsBm2pm7
 9tVV51Q77FeNt05HhxfnEg/hw6NRftl8+t5V0v+HogK8JqUO7X6vUlFcYEL769n1mlsO+8DxCN/
 SILVPY438TCmFvam7/w==
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=6977b9e2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FNNbUphbDgaJBy-ozdEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260161

On Mon, Jan 26, 2026 at 06:44:52PM +0100, Marek Szyprowski wrote:
> On 26.01.2026 18:42, Marek Szyprowski wrote:
> > On 07.01.2026 19:14, Dmitry Baryshkov wrote:
> >> Implement the clear_infoframe callback, disabling corresponding
> >> InfoFrame type.
> >>
> >> Acked-by: Maxime Ripard <mripard@kernel.org>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > This patch landed recently in linux-next as commit 3a4ceb89a972 
> > ("drm/vc4: hdmi: implement clear_infoframe"). In my tests I found that 
> > it causes the following regression on Qualcomm RB5 board:
> >
> Please ignore my report, it looks that automated bisecting got a bit 
> confused.

See https://lore.kernel.org/dri-devel/9ebc0582b0f7990d7df992a07ec8ef7f@kernel.org/T/#t

I'm going to push it to drm-misc-next-fixes.

> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

-- 
With best wishes
Dmitry

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B36E24C692
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Sep 2025 15:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757517394; cv=none; b=eOyY7TeIdUsfxXUQjZq7XokiWg0bK5PBQeu8b90wK9UT87Ei5gLhzVHPCUiKKMH/6JBxg35ddAtatS8UwNiBt/XHkTno9v0U7Rvo3BAA3YWXGnD8QsCrZqw25h7iYZTIkXQPf/GjDvvQbG+T2NGnJaww1B2MavvlM7bF2CuzpxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757517394; c=relaxed/simple;
	bh=CMr+Yyb64ouHjg8enQXwO9zPKrjmmn+0fLcun1xcNsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6hLt0Bp3dQyivaKrK7pMDQJbN1SG+tJ5a3mxQosFBz77zsYh84AxTzZJj1Xp9175kmYuxezrR+yY/fiQ+5LjekU/5tIrykuXZ6pmXnbFo2kkjs/Sg+7b9R88BXKFfnXH8s5J7PEFAIlrJCSoRNuXI71SE6hII+F0e9PF050s4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5Fq26fY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5Fq26fY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgDLe001315
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Sep 2025 15:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kKm0FaL1IsnsJ1lRYNU+N3Fz
	JdUYvVMh5dXRjU0QCk8=; b=p5Fq26fYWFQBv4jsqwoICAN3BPzWKiJ1nDETM99M
	qYaJAlGyDaaHmKO1z93fcVW5AWkmOt1ObtdBYRcfscs2Dt3fBbzvs/SnkRo7Ifc7
	7qQs49X1iUmV7tciI/bLswt8v/1P0apmUMCxq2pWlPemmfz0K+EN1BqxZmDlcNZl
	bLdSmNTQrd3J1EQJDwspX2Q9ESFL4yeilX8M+0j6cs5FnriK3LpIIxOF/IS2qvFW
	h2XMguo7EqCiriV+JKtDR6nQZ029MA6bgpufcFu2wyf6OrdEfBOOq63E4qNt7jkc
	OXyLqkyUxTB3D9koO2CbE2l2L4cEK+a9ar/TSU1vg9bq9Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhe12n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Sep 2025 15:16:30 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5449c8c855cso9885263e0c.1
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Sep 2025 08:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757517389; x=1758122189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKm0FaL1IsnsJ1lRYNU+N3FzJdUYvVMh5dXRjU0QCk8=;
        b=KUXcj1GunFOiKZNG/nfj8p9GZv94VDVfcJ00sfirzoRlKcvNvj6QKE5KhykJN7MHEm
         JGmpeX/Avq0pp9MQswoI2j/CAGWqSR8GxOWzDjTm2PG2DDRTv8nBGNahA1+QlETUn6Rv
         jr4hZAGecxktvS1D99HeZzwttKY4NpysfHD4BSWQ8gNQtxqXrQpwnWkj1T0Bqk5zVBtZ
         qnCGHMJL5nGGxwlZKZOfDVYk6aTounR6PCnqUD0fpj9ebBJ7QXEpGbMX4P21QAA3SMVW
         OPRFTIyHTscjYStErjkwc76x05kiHrAbNhBRyf0oAQNH5wUFK9Irv8f43TVmrn7UqiGk
         Upaw==
X-Forwarded-Encrypted: i=1; AJvYcCUnyTUQ+gxKv9P6pqHRkTBmkimD4KunrvyZzCcQ1MqdHguAPeLTr4rHe2U1bdMV9VZcwNsG8bk2uLZW1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzVRaS5zFJP6Sro4MfNMhbcCYQ3zEFgHgDslTS/SugFrQFspC4
	slhb5bifNSnHQwadKfVO0cKpH4bV9GFxltLQXzbzT23RBgyge0hng/xHODM6HiflKHVhxT282/2
	HlVp4zLqLfbDWKb+rU4fOlMTuxGvtixIfmozY6UE4LjQD0E65qYOT8deaEpu8N98Mpw==
X-Gm-Gg: ASbGncsnzhsg3SfZmKPu1OvKEnKQknBjTqTxaVHNSN/I5Nu1YtGYvxXidls6XeXAUWQ
	fEeFsbhrD6cF/D1qEWgdWua23uAOBQlZfhHF+LyMLv49CMpbYvTUMLjIwjmpDX0fyrDGQhwQP18
	KDewJJHazfyEILDzGhNvQ93CM3lpk3QwnNevgbDA0z1xB1cRszeNHsnHt7J8m32E9SZGRsDZarV
	91I8Qxr6wEIbUr2lzs9KU5XF/V0dVcd/LB4NKNiR5BqD0NNku5ehPm/Ss988rStpg/ex+yJH4D6
	dDoPPMqtO8ItyTnXmNymW39TOI7GKh6FFAtcnv4cXnYJXYlLobIgYRUs7hiNW1EfdiFT4LoLrhY
	aQWNFwWwd1v90u8bUakunJSkz60f/9h7g/IHatEQ5NwDtYsPXvk9Q
X-Received: by 2002:a05:6122:2a42:b0:543:6ff8:d6d7 with SMTP id 71dfb90a1353d-5472a0088bfmr5155437e0c.1.1757517388960;
        Wed, 10 Sep 2025 08:16:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV+Ok0B9ImEfUJn+5MDsBCd0a1EnbrepGzoV/kCIfMR/JnpVKik3JbAUvvY8M2wWHlz+5tjQ==
X-Received: by 2002:a05:6122:2a42:b0:543:6ff8:d6d7 with SMTP id 71dfb90a1353d-5472a0088bfmr5155361e0c.1.1757517388194;
        Wed, 10 Sep 2025 08:16:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680c4246c2sm1301330e87.17.2025.09.10.08.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 08:16:27 -0700 (PDT)
Date: Wed, 10 Sep 2025 18:16:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
Message-ID: <z333ysst5ifakomo35jtbpydj44epqwwn4da76rcnsq4are62m@32gsmgx2pcdi>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-furry-singing-axolotl-9aceac@houat>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-furry-singing-axolotl-9aceac@houat>
X-Proofpoint-GUID: Vo9H_RsdgGr7dXQwVBhMWv0aP1_Nx86J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfXzpLGpLgejqNU
 6vNer4nkd4FBfU8ziYQmWEclFlK5hfBgPGeSFqQ/05q4qwzs0YpYEK5ynMCxdoYZRejqSiPOFYD
 4j1oeYp3n9d6kFJIylOb2Nmjhv6z9D8Ih37s4WO/F9uAqJjENNmWqFLhYwp+FdioO/mUEKfroOK
 E/jIevDES6Sjc2MiiGHyNzkwkxDccnA+Qjprw0SARNtvsh5xaDjYLNd6cOCkFQPCtqiwzBfvFDv
 ckHS1dbYfb0iSk6h6gaKQvHvriYbMlZqaHQf3efNnyx/ZU15W2Up0yChFHbgEJBGOEh2gIndilv
 dZUJJkp/qBTlfiy22zugO55xXJpwrkBu7lkmHTENiDpJBdIaTDnf9/rbU647ThTrSUd5DrKUVOR
 WdaumqWU
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68c1964e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=Hspkq7dj2dKET-HI0ioA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=ST-jHhOKWsTCqRlWije3:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: Vo9H_RsdgGr7dXQwVBhMWv0aP1_Nx86J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

On Wed, Sep 10, 2025 at 01:03:47PM +0200, Maxime Ripard wrote:
> On Tue, Sep 09, 2025 at 05:51:59PM +0300, Dmitry Baryshkov wrote:
> > Currently DRM framework expects that the HDMI connector driver supports
> > all infoframe types: it generates the data as required and calls into
> > the driver to program all of them, letting the driver to soft-fail if
> > the infoframe is unsupported. This has a major drawback on userspace
> > API: the framework also registers debugfs files for all Infoframe types,
> > possibly surprising the users when infoframe is visible in the debugfs
> > file, but it is not visible on the wire. Drivers are also expected to
> > return success even for unsuppoted InfoFrame types.
> > 
> > Let drivers declare that they support only a subset of infoframes,
> > creating a more consistent interface. Make the affected drivers return
> > -EOPNOTSUPP if they are asked to program (or clear) InfoFrames which are
> > not supported.
> > 
> > Acked-by: Liu Ying <victor.liu@nxp.com>
> > Acked-by: Daniel Stone <daniels@collabora.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Again, I still believe that it's a bad idea, goes against what the spec
> states, and the framework was meant to be.

Please correct me if I'm wrong. The specs (HDMI & CEA) define several
infoframes and whether we should be sending them. If I'm reading it
correctrly, CEA spec explicitly says 'If the Source supports the
transmission of [foo] InfoFrame..." (6.4 - AVI, 6.6 - Audio, 6.7 MPEG,
6.9 - DRM). For other InfoFrames (6.5 SPD, 6.8 NTSC VBI) it just defines
that sending those frames is optional.

We can't even infer support for InfoFrames from the Source features.
E.g. CEA 6.6.1 defines a case when digital audio is allowed to be sent,
without sending Audio InfoFrame.

As we will be getting more and more features, some of the InfoFrames
or data packets will be 'good to have, but not required'.

> 
> So, no, sorry. That's still a no for me. Please stop sending that patch

Oops :-)

> unless we have a discussion about it and you convince me that it's
> actually something that we'd need.

My main concern is that the drivers should not opt-out of the features.
E.g. if we start supporting ISRC packets or MPEG or NTSC VBI InfoFrames
(yes, stupid examples), it should not be required to go through all the
drivers, making sure that they disable those. Instead the DRM framework
should be able to make decisions like:

- The driver supports SPD and the VSDB defines SPD, enable this
  InfoFrame (BTW, this needs to be done anyway, we should not be sending
  SPD if it's not defined in VSDB, if I read it correctly).

- The driver hints that the pixel data has only 10 meaninful bits of
  data per component (e.g. out of 12 for DeepColor 36), the Sink has
  HF-VSDB, send HF-VSIF.

- The driver has enabled 3D stereo mode, but it doesn't declare support
  for HF-VSIF. Send only H14b-VSIF.

Similarly (no, I don't have these on my TODO list, these are just
examples):
- The driver defines support for NTSC VBI, register a VBI device.

- The driver defines support for ISRC packets, register ISRC-related
  properties.

- The driver defines support for MPEG Source InfoFrame, provide a way
  for media players to report frame type and bit rate.

- The driver provides limited support for Extended HDR DM InfoFrames,
  select the correct frame type according to driver capabilities.

Without the 'supported' information we should change atomic_check()
functions to set infoframe->set to false for all unsupported InfoFrames
_and_ go through all the drivers again each time we add support for a
feature (e.g. after adding HF-VSIF support).

-- 
With best wishes
Dmitry

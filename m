Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A04251793
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Aug 2025 09:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755683572; cv=none; b=SBcsCy2mNVlbUro2nNxClCP11Ht+YkAgvOjsVII/Nrp0Fz2PYY8aTyeTHKPMF/VGZjk7BbXhvuHuuh/xB2SC1v2nyv0gUCmXFhJgE/e03YWACuvkXmMuayie/L7Oyi5DEjJBRtnRiwEwe7MKcP/62prvImzEn1AO/698uDsZy/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755683572; c=relaxed/simple;
	bh=jZ9TWis3BAW9HI350d7ISwxJICRACxAhsV+LVsXnFrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxcjja6mbnHrha3F4YLHuf+WKmljdee9sIwvw12HyT17j0/JAeUNoaHwfEI2W7Lx2PBm4t3qYl/41cGCCoensoiOV63dypO0vH7ibcR3DansS4oZV15kySr7AI64yABxLOS145Dln355sjUcTRHvuz7szmLVunw9zDZbcpEUKWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzYC6Chp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzYC6Chp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oUs0010407
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Aug 2025 09:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vS/mAyLr2b7OYnR7JU7D3yhv
	4WGKliyobGTdxLp6JGk=; b=kzYC6ChphM9DjkW+m3Y2ie9m0ho+HuIohiI6AXbn
	TevF+7Exk39Pz0riittMo0GLI+th9Te8QDV00MGqOyvKojU9uBUfe3/2I0Pvumb2
	VHbU4TvkmmWpIXSinhNVwY2JTGbRI45gddHGk6QI+/kVPeg9+PJm2c9JGgUtSenj
	RWvXOL6YBwLCbXPucUBE3uzsAYrJ0Db1Yb2s32sYJ5Q2ot0HE2TO3/joGXt251fg
	+itwixEEZvS1drv/pkVVivZEwULllBWP2yUyXrBQxXCnkyS569qOvlgbvPVaRbU4
	0q9Ln385/pTvBYksAd1HlNCUR7eaIC5gGG22ZdlZy4Mw7g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528s8wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Aug 2025 09:52:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-709e7485b3eso16569276d6.1
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Aug 2025 02:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755683568; x=1756288368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vS/mAyLr2b7OYnR7JU7D3yhv4WGKliyobGTdxLp6JGk=;
        b=VrCnBLnskoXWmaBfwOOSHEn6pLipBLIKuQyovGl99KAL99v6ifYzm8QcUGriFfnfXh
         wRJTFTn6Lm/+v7ZnRFeL++7yg3jQIJzdNwzvj/uD2LWY06RVPKfvRBkhTrNH6AqPegvp
         Y3wZf/x+Cr9lwuPO1kD/DEto6iuXpW29XU/9OboFIujxQUODlDtEPbPAud8yPFeEiyZX
         UObgPwv7Nli6AdJW0ZzwOUpc4pEBnh7jPxpFD7lxPIpMkwQ3QE86xLkRV+0PKUe0Q6Kv
         8ZqUk+cvKPMxbhkxcNA9+beCAZxJt7kaDc5TkOt7hyPRfgEWEy33mGoUmOGLsk8rKNJ6
         bdvw==
X-Forwarded-Encrypted: i=1; AJvYcCVlKAtI/pJBccFBOKAUwD9d79M5teWS5t4Q2jjFLS/Xsje+R47GyV0s0TKh8EvkVNi0M4NjsEWFPwxOkg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUO7CLEpunTMhlHtjDBZbfNbihRIbYfPLDNDIHP4MLKDH8nroO
	4ek8xKkiGujsKgQJ8MN10wguxJpu6gd31M0Cw0XpeBJGEB2XYuL9W/J3POCFcKI1LuVjNqbdM23
	dlKlFP45h8EbcEod7LVMDxFv6va87jHAM4IlD0e1LCDLe2XO1Vy2UPHPqHehTi0A6nw==
X-Gm-Gg: ASbGncscetK3nazgmLJ0u97Zi6wV1lmCbkHYWxfrtia+QN6TfTunGP9i4T/cYL2GLV5
	Hj4bacMC2ryefNMk+c3iKZrtoDBKH+2S+TkfD4qwGNfQLgi1ZBMSiYsrHGPevRAHujOJgaZkeJJ
	NKsvwbr0o9D4zwyTSUFEIPHOEhNoBviY2aR56YckhYekXOUL5mtjDUsal2P236eR9KfjsFEUy2v
	yj3/TypweQdFW+mPKCpVJ6HAfDxhgGgXdtgBOT2XFLZcQT17kwN9Xz0Py9A4mEz1irP2KZ2Cbxj
	HT2yLqxFUJteulu7sEcVIsK9yLsynb973zxvDBtyAHYhV3xa1KroGuFd+4TFlKy3uQpL05Lv90j
	ByNBjAZpeCZtM1DjoHFRcdzr9CTD0voV/1X+vIRQ2Ekx6cv8Rt6zj
X-Received: by 2002:ad4:4ea1:0:b0:70b:ca78:4f52 with SMTP id 6a1803df08f44-70c67846f04mr66771776d6.14.1755683568430;
        Wed, 20 Aug 2025 02:52:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNbZVfxSxGCwPd3oehLj8RTp0Pg/kMsu5jl3xY9Xrr59eonPeKRysDyx2GcL/dNxiu6DA0/Q==
X-Received: by 2002:ad4:4ea1:0:b0:70b:ca78:4f52 with SMTP id 6a1803df08f44-70c67846f04mr66771546d6.14.1755683567880;
        Wed, 20 Aug 2025 02:52:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a48b46bsm24544711fa.36.2025.08.20.02.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 02:52:46 -0700 (PDT)
Date: Wed, 20 Aug 2025 12:52:44 +0300
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
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/8] drm/connector: let drivers declare infoframes as
 unsupported
Message-ID: <v7w7xkefm6ap7delx7wsvxmc76fwptqhe4ehokzfh4baueb7hr@acrx36exv42v>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
 <20250819-drm-limit-infoframes-v2-1-7595dda24fbd@oss.qualcomm.com>
 <20250820-artichoke-silkworm-of-election-521b5e@houat>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-artichoke-silkworm-of-election-521b5e@houat>
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a59af1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lQ937gVn5cPVmAjJ5oIA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: osB8g2VRp9uCoQOn11oNK4XNKyxtslYN
X-Proofpoint-ORIG-GUID: osB8g2VRp9uCoQOn11oNK4XNKyxtslYN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5VIbndr9+Rib
 n1unSx8KuF6hyO0rirOaNA0C7Xp7MkbpIEbPJSNLH2umQhRmVj8+xadRwoe10PKYBRCv5VVGlen
 yfwbzcq6UzDz2I5kEqh/VrVjIpqbwnXHjblI/AHmxNPf1vtIsiScB4imkph9lbaxGXRd7XC7DNz
 EetwKKdIpvmnNsc75oGmQ3SSnHWe/yPIKgUNMuyc0IkrFPVVAfDxooO6pGkyxvkv7Z2BavOrh+3
 uc0x617YdSSW0kMtB6Xkk5VNaTrXPu/qFXWX0eXFkFmsKArivT0vIdl520unQ4MmvSQ4benAFzk
 Dp+hHtDsuZMubn3jQzy5o/haN/bZtcoVcHqIMnyN31oplSbQdM3/1dr/QzPpLQLCoQLVu0VUelD
 wBzGQXXPG48jAdqbDvPx8Wl6MbzOXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 09:15:36AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Aug 19, 2025 at 09:57:30PM +0300, Dmitry Baryshkov wrote:
> > Currently DRM framework expects that the HDMI connector driver supports
> > all infoframe types: it generates the data as required and calls into
> > the driver to program all of them, letting the driver to soft-fail if
> > the infoframe is unsupported. This has a major drawback on userspace
> > API: the framework also registers debugfs files for all Infoframe types,
> > possibly surprising the users when infoframe is visible in the debugfs
> > file, but it is not visible on the wire.
> > 
> > Let drivers declare that they support only a subset of infoframes,
> > creating a more consistent interface.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> I'm not really convinced. Infoframes aren't really something you should
> ignore, AVI is effectively mandatory, HDMI kind of is too, AUDIO is if
> audio support is enabled, DRM is mandatory if HDR is used.

Nevertheless, sun4i, innohdmi, adv7511, it6263 and rk3066 drivers
provide support only for the AVI infoframe.

Some of them can be extended to support other infoframe kinds (e.g.
ADV7511 has two spare infoframes which can be used for HDMI and SPD).

> SPD is indeed optional though.
> 
> So, it's really dynamic in essence, and not really something we should
> expect drivers to ignore.
> 
> I do acknowledge that a lot of drivers just silently ignore the
> infoframes they don't support at the moment, which isn't great either.
> 
> Maybe we should standardize and document what drivers should do when
> they don't support a given infoframe type?

The chips might be generating infoframes internally. This series was
triggered by LT9611UXC, which does all HDMI work under the hood in the
firmware. See [1]. The series I posted hooks HDMI audio directly into
the bridge driver, but I'd really prefer to be able to use
drm_atomic_helper_connector_hdmi_hotplug(), especially if I ever get to
implementing CEC support for it.

ADV7511 likewise generates audio infoframe without Linux
help (audio-related fields are programmed, but it's not the
infoframe itself).

Maybe I should change documentation for this field as 'support sending
infoframes generated by the Linux kernel'.

> Something like return EOPNOTSUPP if you don't support it, and we warn in
> the core if we get one for a mandatory infoframe?

[1] https://lore.kernel.org/dri-devel/20250803-lt9611uxc-hdmi-v1-2-cb9ce1793acf@oss.qualcomm.com/

-- 
With best wishes
Dmitry

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0865C31E0E4
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Sep 2025 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757511801; cv=none; b=YQ+c1i12n+8SRVj3VN8jEdzrImu0wLFSwQ8oxWROE0Iv34J2tKUDpq303p3w65HBXOhjRFF+O7ai3AgXE/FYnJvDb9T6fqfPf0DLw6CHoLW27vHifkSPGa2IIzliwIp4dBFbsMl7pRgDcY4/gJQELYcqKiEK8SQ0GdT0i50Eyf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757511801; c=relaxed/simple;
	bh=FaoC9FE73l9rVXL86nM2CVRZSz8t/nV5eIPjehZkKRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ogdm2NJ05w3gVpxv9IRVv9p1GoBwyYoUd7Z3WMoJgVeZsITywU22bycrditSlWGqvcwSDw5186GtmtCFbp6OLx3xC6ryYUT2do1It812RenM+MLODznRGAuhWt+149hb2RHw3DwUThoaPYQQh23PAYgNJgJIxOfEMaYAE75fpFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMj36H+T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMj36H+T"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgPjI001423
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Sep 2025 13:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5nQ4xWao/W1S9JuuivQg6TVz
	V1TXFvvS01+Hu/ewF2o=; b=CMj36H+TbjJBbjGtUj0Ww+XkCiSfcr453ccD4RI3
	hTtPq14K7WLeczHyI3OgAOvTURohBosbgyEm6KyyTR1RRzEjx7OtROVcxmf8UQLP
	0VKsVvp8OptJoxAa45jIjayw4Rwpnz5wXobNCFeoYDLZb3nZdYV95mTZUZwToUDO
	qW/9hCsr/xLIau/U8M2P76aKr/mPj0RtK5OTWevRpYpqqqYNkJCG3pQOJxM0n6oG
	UrIwfu6uMWp5ZqJjKH3ssj53PvqM6DXgXBWp2n3qp1ab9yS+3PK3cuzipo0xtLJR
	kdomeuFiz78IGAYiv5uzR7f4OsOvt7AbGymNwg/318RmmA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhe0svw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Sep 2025 13:43:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7585b6deccaso31879436d6.0
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Sep 2025 06:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757511797; x=1758116597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nQ4xWao/W1S9JuuivQg6TVzV1TXFvvS01+Hu/ewF2o=;
        b=s2JkC7b6ffMgUOEyx9yYTzRZcyGplPUcKdY1/Qvo6vwaPKSMzyg8vaBVisHQoEf+FY
         RZkB3jJQGwGPusgj8wqy+JYUqWt/wJS69AsCoWqg43XpqBG03ZAUvlC4qVIa+vG+naYs
         I56VFuubtg/SGcwG3AB9YP3q+LW2jvxXH3DhQgPdGtCK/X5n08fEBhGEmPrGG/pnifxz
         CkTspP7GQ3+DkKP0m4S56MhV/qGiaZDbcSG1ZJ0DpJ9l80qzl6fVuxtbg+CjPYga1yFY
         8CwNpnQtn74rObEzZPlo72/o/Ez6Kd10iHJeCju3X8atQ52/j7bhY3hEJhM7F4cQ5F1n
         WTwA==
X-Forwarded-Encrypted: i=1; AJvYcCUoSSHUNS8FPiNUUJT6Pj9gFFjht6l5eFPQmGR5OKhPU7HHTFvkOYXZjVRa6aCsI7z2VdjtBUN73fUa0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqR4POeREQd8ooNu2US1Pe7B6K1eAAqnGfeVDHMWVg74oxknAx
	u3OcNTq/oFqAhX/P7joBnpjO07fXqN+ezhNfszyFFdDLquTk5FrCUv7G5RJRh5Q7wzJZAnkuDV0
	IHqe0X/NbFatzXlhsR+P9a9ty+l2XqfEZW9E9fDqArbzdjbSmfSyMhOQxY+y2Gr5Gog==
X-Gm-Gg: ASbGnctfRroQXLAZxoBuv4fYVCt8Y9htYwJvhzACo5LGXixttTEijek3DWCjXlTdPTx
	j947OAw7o/mRlH/sIKLeZvDdjb0gHHbzNlvxGvKATfS1CaitDw/GDVrn7V5gAfmU3PbphkFrvIO
	D2WxZp16Zypv5vdxEx2V7I8vhx6A5w65KqeBuXRfV0997ZbWO31IaWEgnOPWXVIgu9iWdWJc/Fk
	cmowd8im/6R+MJpc9tWFrIC1rFIzzKggwK09abwTkCdf8uYGbfo/JUkaZ33DzAsTLpHUk4kCx3l
	lk4nuej85Hqn/BaKUA8DuAINemdeSsfa+K8DTRrtqn000l8/quqUv7gxkw6hoKqGXnm62xZQLUI
	EXxLM17dd7+RNNkcprSN/MATGOUbmfQS2uxWbfDRPXmeE1eoA7moZ
X-Received: by 2002:ad4:5945:0:b0:70d:cc1b:68d8 with SMTP id 6a1803df08f44-73946e7c091mr163021776d6.60.1757511796345;
        Wed, 10 Sep 2025 06:43:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6PHZIhUDI560woSHXbXEfXTfCiGlJ/BbPfkyDjwFSiQx7owU5WH313TRjCymTd7ql0gFT6Q==
X-Received: by 2002:ad4:5945:0:b0:70d:cc1b:68d8 with SMTP id 6a1803df08f44-73946e7c091mr163021196d6.60.1757511795562;
        Wed, 10 Sep 2025 06:43:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c4ed3csm43091651fa.4.2025.09.10.06.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:43:14 -0700 (PDT)
Date: Wed, 10 Sep 2025 16:43:12 +0300
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
Subject: Re: [PATCH v4 10/10] drm/display: hdmi-audio: warn if HDMI connector
 doesn't support Audio IF
Message-ID: <zjfnbabmnpopxy3r2dbpiiuhspoapc4mvpkha6bfses2mf6gpi@tmp4konlmimh>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-10-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-magic-natural-saluki-4aca9d@houat>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-magic-natural-saluki-4aca9d@houat>
X-Proofpoint-GUID: Dw61qaM4NVYmZdfBL6BysIaedS-E043C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX4OtggRJw6XnV
 zZieDDAAQG6tC34ilOjdyvSX/P/fB0xD4g65PvBY1ZjY74XQ2aRAOIhPo8fVakqsYw8/UcXFZCZ
 K+iuZn0KBNHBLE1JUBmJLjh9+NowvJT35K1OBYBc82bQ8/8hkRgzNrgPWV+T54eRhk7KH0Kv9/B
 Q8pgW7XEfjK7gUIvtnCX5sXgsC+HG9vnOjjMInAo/31ODT20CZsxMVlAHI/XSNhOmr/l2wIhe5G
 xzpaxaLJA7PhPmptd5/a+A5RpnBTRdGWc0qZ9m9zebHY/v7mPU32hwhpKDaAyT88HRaCtaai59i
 Fz0SU0JrIASIGAniC95CJG4D3cA6EWeVSMv/Zx7ymtMq50OwZ5GBhAvVVYfHlmIqkGPO7PeCclY
 WOWewvVv
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68c18076 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=41mUuBG4nv7vr-MJPacA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: Dw61qaM4NVYmZdfBL6BysIaedS-E043C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

On Wed, Sep 10, 2025 at 01:05:47PM +0200, Maxime Ripard wrote:
> On Tue, Sep 09, 2025 at 05:52:08PM +0300, Dmitry Baryshkov wrote:
> > Sending Audio InfoFrames is mandatory for getting audio to work over the
> > HDMI link. Warn if the driver requests HDMI audio support for the HDMI
> > connector, but there is no support for Audio InfoFrames.
> > 
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Acked-by: Daniel Stone <daniels@collabora.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> > index 7d78b02c144621de528b40b1425f25e465edd1ae..35e0e79cb683a68af813344aa86c154c3a5531fe 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> > @@ -10,6 +10,7 @@
> >  
> >  #include <drm/drm_connector.h>
> >  #include <drm/drm_device.h>
> > +#include <drm/drm_print.h>
> >  #include <drm/display/drm_hdmi_audio_helper.h>
> >  
> >  #include <sound/hdmi-codec.h>
> > @@ -178,6 +179,17 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
> >  	    !funcs->shutdown)
> >  		return -EINVAL;
> >  
> > +	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> > +	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
> > +		unsigned long supported_infoframes =
> > +			connector->hdmi.supported_infoframes;
> > +
> > +		if (supported_infoframes &&
> > +		    !(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AUDIO))
> > +			drm_warn(connector->dev, "HDMI Audio with no support for Audio InfoFrames\n");
> > +	}
> > +
> > +
> 
> That's not what I suggested. What I suggested was that we tould check
> the return code of write_infoframe, and warn if it is set by the
> framework, but returns EOPNOTSUPP.

I see, I misunderstood you then. I will respond to the comment at patch
1.


-- 
With best wishes
Dmitry

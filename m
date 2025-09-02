Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7183D286D69
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Sep 2025 03:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756782810; cv=none; b=YH9Ht38qxMs/emLFz+sc2ksKl9X5zU5Q5N5L1Lq+MUxWgFBttlaAEia8H27mAWRQo8cuNIpHRbZCDsZWc44idmFYedw+u4q5vvfssCxoaKKe4iKi0QPaTVu3myCqxTK2k9akyxzvwKhxN5utb8p057p6c6Ud+W51fA3evy9DP4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756782810; c=relaxed/simple;
	bh=F+g5fJsht/C9TSGJLLQ7xyKaR1WfawQvm9s2sMKpxHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGgwxyhFDmV6z0W7JEwO5orKbUaiEwHExHrxbgSZxaVxuKHnG2BMVRzlJBc6L21wHFXpc1D3buv631Y783wrUub9BJ6tfH2il9D8nz2dVE8/oh2xC9m91WYrAyUC5paNhZIaOlHO2s1TEhZ9OlNZ89TJMx1I6IzehTL8jPqnq90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWMSW4mD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWMSW4mD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SEe7022405
	for <linux-sunxi@lists.linux.dev>; Tue, 2 Sep 2025 03:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mFT7TaYN9yFmUBnkUS/DV54B
	AuRMajtXQdEYrtXcv6Q=; b=JWMSW4mD3PTluOAloZo2v2G5SpKLxOuXPtreb91I
	HO2B7mjqxjJB6HZTSE/JG8bM86XKEfm1+HRcRAGizJR1zv+x7kKsmGSkJCgDWBQQ
	hZuZfoYQgstxYme1EFXQuvAlb6T5459ib/NfGUUB/xYAxoO2tNqCndbAgmPKxE3d
	1oTL95XM0ElVnBpABJAOBFwYgig4M1fYxaSZKiEpR+lBWRrl8wbh9obSoNA22z1x
	XMM61AB5Lb+y2lYPLcYLOmBHqTufDM659xl+4Le2NcwcroQNpuDsU1XN0SCBNq6n
	l6IauTpkF2si4mrFHIiiGj1Vyh2HUa5m8BQ41a4jq74tZw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp6fga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 02 Sep 2025 03:13:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-72023d1be83so9876356d6.3
        for <linux-sunxi@lists.linux.dev>; Mon, 01 Sep 2025 20:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756782807; x=1757387607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFT7TaYN9yFmUBnkUS/DV54BAuRMajtXQdEYrtXcv6Q=;
        b=Fh/SQ9WVFZquksEWW82s8uVYYjJL2WPwVIDuXzQru/rQxNu88atYYJS11qgTNOboVJ
         1/ROAfW6oWDTpYPPXZRM3SPf36mnJ4r32FcPizuEG4JQpDIL3A96tqOs3Izd2Hq2bhHB
         FQeX8mRfx0I/BXoEDcZ4wp29fzfAswlK9sQ733/qlDDeoMK/fX7ZP4oh7pE9VLnkiyb+
         8z5bK3Nhrg/jMIGoAhXcVWp4xKkeUdmS3iBR7XHDBdswA+rTHRao1oUruiqE+xP5gHxH
         zzDIPVaL4Q+1E5JopZnkz7vhoUD8ZoSmM/o5al7urp00xgLbzcTHZEhIrfyuO97J4lzR
         EujA==
X-Forwarded-Encrypted: i=1; AJvYcCV6b5dMJD2j4VO7uIOqwh49OoSY1UZ/RlG1kOUq1MItogwbECQ85aw5PMdAV83/dxfl72bPoRrsuqI9tQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEirfOwOpDy5DDsft1othb1KdWpghRBoqiyO52OwYZnO4Dbt0K
	Bx4jXfESIDC8g49MSE6DeWQZfGmJ7R3qf1QgQE8IVXegpHhndFPqn+DTyqiZ5zCi4I/quYT/ngF
	faPuhkG2oPEGpDBQqTzhcGs+m+YbBGGr2prP0MkI6iGNB2wmrQQhEsFV2r2K1QjNNxg==
X-Gm-Gg: ASbGncsemUhFfQKAwOAp57uWIlG2inJaa4KddeMv1GZg5AiqNU1QxaISBAVO4Bv8cUs
	5X4dHOB9vHu6dN46VLjrAmX9v//x1K9KSajK19Y8IjoRia6y7aOHQ4dcM1agvDgHIhQj5N6/4MP
	qFm7ayCgG9foOSJyWPIkA7+Z4ji1xMTIPW5mKsQTGF6Ol2EyfGrNX3dCdBWOvAOMvRl9YQE75se
	g2puf+/GAItLkWmVmA0MRyTagbyWVW8EEnKyqj94MeHYZ9FxSCcwBNzXbwBlzyvhysDn2TOjfqu
	MgULmCzfGpbKGvr9a/9G0mh+6wogTtgGqn5vJ1X+UXgjWOmZgsXQba5TskuZ03oLXpcykrejh1J
	DlVfAyOwe5f8QdPxjVjwdfBrs3KPM8D/NK1lRDXTChmyYqrPem4EZ
X-Received: by 2002:a05:6214:2425:b0:70d:bee7:22a6 with SMTP id 6a1803df08f44-70fac90b081mr99124176d6.57.1756782807490;
        Mon, 01 Sep 2025 20:13:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx3s/TeSWd/gD8+0Pzv1Eys9blTUBbEzGio/Yd+gCc0H1VU32BQyJUk3uEjCaZ6DP8MJyUzQ==
X-Received: by 2002:a05:6214:2425:b0:70d:bee7:22a6 with SMTP id 6a1803df08f44-70fac90b081mr99123866d6.57.1756782807080;
        Mon, 01 Sep 2025 20:13:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560827a53bbsm309669e87.124.2025.09.01.20.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 20:13:26 -0700 (PDT)
Date: Tue, 2 Sep 2025 06:13:24 +0300
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
Subject: Re: [PATCH v3 02/11] drm/bridge: adv7511: declare supported
 infoframes
Message-ID: <4rzkxynpbe7j5uyfiqscjt6l2yr4teothqcga3js7fn6e4tap2@s6npztjtbjbq>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <20250830-drm-limit-infoframes-v3-2-32fcbec4634e@oss.qualcomm.com>
 <20250901-tidy-auburn-tarsier-e7b1e7@houat>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-tidy-auburn-tarsier-e7b1e7@houat>
X-Proofpoint-GUID: uPmB-fUYUAU01d4BijDO36ApjKvlTxdV
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b660d8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=u7Ex-Lb6nDjXBYZR8i8A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: uPmB-fUYUAU01d4BijDO36ApjKvlTxdV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXzAAn9k0p/uYt
 9GCPgybNoLz5qz4n2xhJo9vk6BDus8JRiifdKOqpz+rZnSEfWZMx8Taz1vrA2LrZvQknok/jq/Q
 3em+2uQzXAEGXCRRroUoft0voOq9zBv3i+tKFJdMEEpqNXuX5QXWpqMglj4Cjx9wdc3ayfEIVYp
 c6F7wv9csFJW6X06w5v9kpwWj3gwxZfiDz4jWOa8bBKPLXqDRrHvTKTlLmdlEr+JvcanQEPUDaW
 vAu8JxkicfOowRr4sYaIYQdWcFp9UMnUf0OdgNC0vJ8HG103+UlU99GivL+NeJAppxdQwXjHuPJ
 Xl+I8VS2DLPQ3Pj1w6GLpm7A9SxOIHgmg5a2N1zy+sWn9Zk7CkvJ4WMy2IO1om98O8h7YQ70Ii5
 UL6fq0rv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

On Mon, Sep 01, 2025 at 09:12:45AM +0200, Maxime Ripard wrote:
> On Sat, Aug 30, 2025 at 03:22:58AM +0300, Dmitry Baryshkov wrote:
> > Declare which infoframes are supported via the .hdmi_write_infoframe()
> > interface. Audio infoframe is handled separately.
> > 
> > Reviewed-by: Liu Ying <victor.liu@nxp.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > index 26f8ef4824235a9a85b57a9a3a816fe26a59e45c..fe30567b56b4f600683f0545ed270665e692b12c 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -904,7 +904,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
> >  		break;
> >  	default:
> >  		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
> > -		break;
> > +		return -EOPNOTSUPP;
> >  	}
> >  
> >  	return 0;
> > @@ -938,7 +938,7 @@ static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
> >  		break;
> >  	default:
> >  		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
> > -		break;
> > +		return -EOPNOTSUPP;
> 
> We do need to document that it's what drivers must return though.

Ack


-- 
With best wishes
Dmitry

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC3B1F5EA
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774238923; cv=none; b=qI+MNwtr5HBPWK3yzlQEZNqvjEdDaAmBqFN6LvZlVWeMFys6SH2qjQuEsTJqqXUhlTlZfBC/I4lmE+B9nlsWECXHg97wPE3vvAH1wCoMmX3VgwzGsRalgpyVTP2yExPbE0jTOE4C0upAhZiQ7J8YahQ3r+fWyctkWEwYaAhKu4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774238923; c=relaxed/simple;
	bh=gXOsuDYv/pxATV/Fl6DJl/y9YnNhToxXKHaxERBWSLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2s8sUcV1lYEUYuPfMutsdmsycKUbTu+Zz5nuOSb+I2vb4qUJg80YdnuqXh3Dn8s4RMuZHP76HB/2hubM8/R+1Nwo/OmR+JgPcSxPjE2jprBKRGJ2krllS2vxCrGzR8jNXJo+Y4rB7P8k/qwHalfXU/d7BjBI5jkbZncHmDy7SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hm87qYBK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OEx549dx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hm87qYBK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OEx549dx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MLrjSk1001396
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L0DNNdGHDR5wlsCt28DXVO7/
	ykGGtL6iZ7ih/B1pDZQ=; b=Hm87qYBK6EpqLzvsAKKiVfisJdYCA29Rw9vKImJz
	lU+T3ZSsQtEyN0sicc1mVQfFiOJsMlFjJdAn1ibQornp8c+1tT3rdXIfazxKoT+0
	r3paTKRMYcrOnDzrgpbSpH8tw/vChxTcx0bH62Dg3aYq57KgrNidMW8QBuaISVjp
	9YDOiKfjC+4FZQ48QIHNEtaGcdKhYgUIL8v1syDcBi7YbkbLuQbMbfbS/qXtxWnO
	xii5Fg3z6LruZZPDsJ/9otr4vKpZK54kJwDez+Wlgw8qNYeYn6a45LXb7YJua2dX
	FswqKzTSGkiGIaMaAod2Kfk0A9WqVRW8/qqRoxGYxhQxuA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9rbp6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:08:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094741c1c1so307653001cf.1
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Mar 2026 21:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238920; x=1774843720; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L0DNNdGHDR5wlsCt28DXVO7/ykGGtL6iZ7ih/B1pDZQ=;
        b=OEx549dxCwNse6G6aYkNK2NeigRfBYBhAlf1sQjryx4C9ikLyMmtBP/WtSuL//qHyj
         Az7FAy/V34cM3AJ4iZTyDEGovmhD4/SxWpcegts9Bhni6ZCzHYaVhQEajix6FYjduOLf
         xFFx8p2eSxIPeeLdgJ6nkWfFw+W74Bq1/Z4dz6Mlz/M6IiRG6iq+6MgTvLVeDHDA2cbD
         Loo8e1lAwO1IZUGHQBI2XMloQzBVToz+kf1LrP4u8g/bDiwJ0zd0YQdjEo/V50+KJwuv
         Df5GC0ANmIl3HZDbn+Rmj2QBwf7P43i+pSEY5JSeK5CyvdMFH96B3MXUdpYUBFPvFsNa
         +Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238920; x=1774843720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0DNNdGHDR5wlsCt28DXVO7/ykGGtL6iZ7ih/B1pDZQ=;
        b=o94sx1i9KB2Y2cH0k0qfMz7Ka2uWTmQ/lq3JwJovkSgX1fym7NvEzDMW+n8pD85OzQ
         k2UTGcAguuqjNwkd+x8AGRPDMEyS3kK7Z4mUCK/aP8LLQKqyFVUTtKkYLZCL9h3OmTp8
         kqkkjNISnmKtmuvMbF+rIl8kYvksSFV0mRdStemq8YirIqI3vWeJOqgn+BPMXTW49dhx
         CvwgcIwVMkz3nZY36ZBTVl6lHXVgMVvDUQQTkxJqHFxIBwiFWXMjZyX6R8FgiN2Hx4km
         vp0vPguQIFKaS8LufHhg3sMWh8Qzh2fOVJvZEG4PqhmasBwwRCJBoPDVdH1/ryZr7HUk
         s8Og==
X-Forwarded-Encrypted: i=1; AJvYcCVkvyvnQl8iHxmKUOukp3UIAQPlVpx22iqR+xklHxLoxKhJASFO+SW1ClaHvotp2eVGrGoJt/HRr01M0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr7KzjNXoGcVWnGZCtN9pbwACgAHWar4mPfGdiIShPta3ZhiZH
	ZCm+vONBM7dYS1Lgd7e6K4cYCmYd8xf5pJ0i+Wp0H0LkFajpFCnKva/fTL9JMZuYfjI3LBIHu2L
	qen5K0NvuGALJW1MOtvjTpjm/Gs7J+p5PNnFbrG+uS7SMylZIrTJxagrOB7tqNo4MPw==
X-Gm-Gg: ATEYQzy7CMFYBldJhQVZUDkE19SSI7JlizW+xPoUC0ICr3EAxhDcHiuoc20a74Bnc+o
	taXRw5u1Rb35HCdO+OVt6AMOw2WfrWJFPPZae1z1hitqP4FtOHfYgjETZSjQ2B559fnXmzW5vNs
	bevKbTthfluq7yUAkpnbbXdKj1GKW4Z4jiT/lEG7YAubzg6WTHmVFNHBwL3bjM7brNdP+filgZi
	iOTuu9QooNlFCFlPkTjB/z5eoi+UNqkzIR2DAgouJn22Ph6lUBvn+g1m5xMt5mUQ88h5aEMkLQe
	nm+lzo9zEaXrXhgNh1gCIfDW/8w3anqmMAx1JwSP79lE/8adTScczl1EWJNOA2aIY6br4Oc5wEr
	HAngMsZsOG50Gn/8qifsw4xr/Yaj8kaNbzmSPR1AnG66KAs6afgfzSnVBNGPZXNBuJ9qhRSsSDr
	UIi2mAmVzn+yjqPxTDtaMzYU6x1GQS56/fJJk=
X-Received: by 2002:a05:622a:901a:b0:501:b1d8:637a with SMTP id d75a77b69052e-50b37597952mr157491801cf.61.1774238920216;
        Sun, 22 Mar 2026 21:08:40 -0700 (PDT)
X-Received: by 2002:a05:622a:901a:b0:501:b1d8:637a with SMTP id d75a77b69052e-50b37597952mr157491621cf.61.1774238919820;
        Sun, 22 Mar 2026 21:08:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f73sm2204742e87.54.2026.03.22.21.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:08:38 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:08:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 09/14] drm/bridge: synopsys: dw-hdmi: Convert to
 drm_output_color_format
Message-ID: <dahh4njgirmhll7tttfxe6dlqaz5qhpyz7g2vztgvbys6xysyq@ord6abbyjt2i>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-9-f3935f6db579@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-9-f3935f6db579@kernel.org>
X-Proofpoint-ORIG-GUID: aD1XZwJbIfhuZJNyd-HsJRu-ptAgCpbY
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69c0bcc9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TUq2ns179Pknwtu5XVYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfX3OxKMnRcKpzm
 tI87pYPheKYsBdu2qJlW6jWaYPYLXiwlDPTX+sb8f/y82syoBARD9jm5vOCnfX5/75DJGt5XmpF
 MGAgqGudFAup8X5zWx4IuZpJsYlJ/AysG+44OcS1XkCY+RzySDwSr/GpzQ8CosPAYNgllwyaTIY
 88nnpEGArGg3t0kujLwosL5yap9LYQux6Sp00/zC/uegI4FTOme/hoABMFY1Q48s4whGXfogJ2q
 HYDINqf5KZX5krPIbYsZS2H2IaGUzLOdUWsfKqBVpgs751HDrU8gIHkF17T1qj6nTBL3+yVPYAa
 Sp9IvEG54WNGFimzgk9FiRaIVlRznu1InaVeAUsyZfVlC7kOXHRuq8EcK1t6nLxW8aLblJNk1Ui
 UAhlAG87EIfu59uqorq2iJRG7QQkbm3Gt1tUIb5yFcIEm7tJ3KdpsISaMshqjoz4F83eWegom3T
 mF3RNfKizHcCFoWmNAg==
X-Proofpoint-GUID: aD1XZwJbIfhuZJNyd-HsJRu-ptAgCpbY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028

On Thu, Mar 05, 2026 at 10:05:01AM +0100, Maxime Ripard wrote:
> Now that we introduced a new drm_output_color_format enum to represent
> what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
> enum.
> 
> The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
> drm_output_color_format is a proper enum. However, the enum was done is
> such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
> the transitition is easier.
> 
> The only thing we need to consider is if the original code meant to use
> that value as a bitmask, in which case we do need to keep the bit shift,
> or as a discriminant in which case we don't.
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

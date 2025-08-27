Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A173C2F3601
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Aug 2025 22:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756333716; cv=none; b=ES/9Rthsrttt8ZZ4gWUhwMSOqdKbPCqugKNeXfkYisl+ty/WaLonJTRW7+RRrSurshn5jVxbU6H3d44jilcOUGpvdNA488hrh4JKvj+cJI32Vv+Wf+3bxE8tZlARG5JH1LSfUTos0CfRgUXjzZhGh8uyb5W9gK+NdNpNXMEXgfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756333716; c=relaxed/simple;
	bh=Enfpdt0lrNqevhutRfiz1sNVpTDatf+D/XBiia59tWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oA3DWHVY8Rpe2RUM9il6QJFTPXfx4ByO+qAg/o7cw5pgRQ4E/IpN/QtnbDZ7S1ATw7VwOxFzEZq0wPYPJq136cYNEePhWYkdSqLpVEV75+FvjjBQ9MJuZI0UWbQjvv68uKYXuoBg+2lzRa7FkLR4hDBVRrKxxNmzmBxROcyL8GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ksBOx0Fa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ksBOx0Fa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGDvAl031179
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Aug 2025 22:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LcrLZoaMuieBwoDNhdy1YKKE
	PmtaqIZQcasiCx3hw8M=; b=ksBOx0FaLwkdk0t38aj7T0xGmpchr04zFiJSkZgZ
	Ba64KDw1scqklvR5h9sPhUMIU5Lm2ULbS+dB0sk27byD5zxz1LdT8vRZaUw1mIEL
	xh0i2qoc9SiowpsxDWLGj59eU9BUKYNTd+Lt+SZ/9us8XpkdePkPbROX9L0c1Nis
	xuzdRsy97JbgBGv09uGR8V2gtRSajQOd+AstxEjUOr+Q/Lp78EBk7+sbA+6J7rxg
	ssnXa5MEdmfrn2nI2mdVDxwzLzHHqhlfufrgyew42L4gAJrqTf9p2WsvRy8xNAKa
	HZ7JFU2mS/Vczvql0G9Re9yqBmoUE7SgnNjvTTRqpyeYxg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615p1gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Aug 2025 22:28:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109919a51so11583551cf.0
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Aug 2025 15:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756333713; x=1756938513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcrLZoaMuieBwoDNhdy1YKKEPmtaqIZQcasiCx3hw8M=;
        b=dTLdK5Vf7QkH3Mz7/oi22IpFQLa6I/lMnEbKyEgSmuyhrdXbGHdY65cs+lZn0ODax1
         pUw8N0ocDgGlJTphe2hjI9j3bk9tCasDzTYp7X1OG9rn7vhZNFdcbIbzNDzlWBo/WBWx
         LmkDx6m/uYdPDG9EkgqiVa+p65Y1v+2rcwxcdCzVPiWlf5YAfRbfN1qGwV3/Lm6VHR3V
         O+ZCEEel8w+f5UZzbRDgHfY8xTGLTVtBRNOrnzpg96yvKvJvhWSQOgyfQ0YTwermL5Z8
         WZT4JXDEFeRGpuIURQFZXpOi/WwjAm55PsF1pMPnRYsG75C7jk5kC6hpBNlZf+agVby7
         elcw==
X-Forwarded-Encrypted: i=1; AJvYcCW6FGfxzO7J1CVW77yBAgTeO6SXMyT87Yo/m7TF1EQox8w1kxC1tIQSuZFV/7F89AiaCzEr+1HoDlLYxg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKZq9PY50lQrQp6TGtO07AQw0LBOUzXTWiU4vqbwVrY44D712+
	63NRCCIo1uvkePDIp24zRjGZhXBd8pOavp+fMqJWWYLp4lohdqUoGMzlBaHd1gAUctHNVLmWMN4
	C/VU8FYFkY0ze6NESLaeYE25IQKpYzAm/9d295EBXFnTdPoc7upUlAYMSrMIlyo7bRQ==
X-Gm-Gg: ASbGncvkaxSVW45M6if/pP7eJAaxcOD6Y6SjoBWjJsrVf2Mr2WDKRyxJoDEzd4Rhv6l
	XGhYAPkH/QRKY2qErJIAZuojmOcr2/4E/9+AMwXSFIE5cLICEuBrOPwpzY2nKD8ODfg5io5eOZR
	b9UCiIu0fC9Aj1PpqX8ad+B8/yMRaby5H31z7GaXscTfC6YoculC/c22M3LVyJEVzIZadniZIvl
	zCiUP+vp2XVUsU/tbsJpwSCfQvZLrFJcXnULDCjx/kzjOQ6BTmPw/bPsOoQJU9+seI45L6M89/8
	7CxNbMsc8OSyHlcf4w7QjVJl5otLeUXCdJ+dFOCBw76BFF+TO/T6Vc7hPweuNvb+mS5aqlrKfD1
	niz6o6qyM6SBQSqGW8cZqqr3aijVYpwXem6XQx2QcogCzYTeRxL4z
X-Received: by 2002:a05:622a:cd:b0:4b2:dfc5:fbee with SMTP id d75a77b69052e-4b2dfc5fdb1mr105541971cf.32.1756333712554;
        Wed, 27 Aug 2025 15:28:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5nmdIbVBTqmW1BSWH9OY/lezBX2PorYOAsLp+HwXKOdiRgVyGEp2e8fxZ/9eVS1zmC9A+GQ==
X-Received: by 2002:a05:622a:cd:b0:4b2:dfc5:fbee with SMTP id d75a77b69052e-4b2dfc5fdb1mr105541351cf.32.1756333712052;
        Wed, 27 Aug 2025 15:28:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c13debsm2882288e87.57.2025.08.27.15.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 15:28:31 -0700 (PDT)
Date: Thu, 28 Aug 2025 01:28:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Manikandan Muralidharan <manikandan.m@microchip.com>,
        Dharma Balasubiramani <dharma.b@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Liu Ying <victor.liu@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Sui Jingfeng <suijingfeng@loongson.cn>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hansg@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 04/39] drm/atomic: Remove unused
 drm_atomic_get_existing_connector_state()
Message-ID: <a3hwkno4nemddbmaz6dayd24rmqcr3zxujrvsspnulrivntxjz@o3tm6o4mc6nt>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
 <20250825-drm-no-more-existing-state-v1-4-f08ccd9f85c9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-drm-no-more-existing-state-v1-4-f08ccd9f85c9@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX2msFgKm+DObg
 368Y0P9h5k95uUX74grmdnp+DLGMDMErH69RpiPUwapu01jFf0KgIAIs38ZSuQUP1kSeg31ucQZ
 FuQvuwgzYK0rM5/+WEGsBgInpcDJQjRqlsDRJgRgSp5U36CmlOkAD/5ra764t030PuIxdyubl/K
 4G6fwUatCJaPsMHLz1eWKOTvq0EkYZSg6HLzx8rYKYlE6fGF4Va/bUBUdoFI6Ir7KBUb42dV/5u
 oKJHljniP9GEeQwCsuXqbpwPzi+qkqQVpdEtX5HVe1j7X+94kSb//SI2pRimunjahFmIn+6Qlty
 TDQeNOaXG2eBwV+RusIxzlXt2vFFvTQIkMdmyNCgEJbPWot0lHcAYDXruh4LsWsnGEm5ohe3dBf
 RVtDziKl
X-Proofpoint-GUID: YzR0MPj6f27_3EGx4JEJVuM-ouEzDrGK
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68af8691 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ROUmOPvenB7E6LXmrzQA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: YzR0MPj6f27_3EGx4JEJVuM-ouEzDrGK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

On Mon, Aug 25, 2025 at 03:43:09PM +0200, Maxime Ripard wrote:
> The drm_atomic_get_existing_connector_state() function is deprecated and
> isn't used anymore, so let's remove it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_atomic.h | 23 -----------------------
>  1 file changed, 23 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

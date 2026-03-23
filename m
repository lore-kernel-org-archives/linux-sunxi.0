Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5176D40DFB7
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774238594; cv=none; b=QJNBKTh1flMRG1nio6+NIstrbeqtJ8FnfZ823vCDKyE3i3wIysoCIJnl8a7M7ZiAOoSUp/pxd882yyttNxD3aPp8I2pis0g7A1z9Ej8mQCR2I5PU1dvPvo0//dMIjwC2RWwtOj+4E4z9c01D6fpU4b+cHnqdI8kKf97alcWhmXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774238594; c=relaxed/simple;
	bh=PIQsQyN8uKl0yRV6jfVCBU1rf9KdAFTjTT8JZYLxtQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpvgmA0fQ/OZg3afvPCIsCMU+JU8ZLCkbDkox3+iqTKkzwVjpDyNVAVQed6N/ZZChGG+RXaxQQBiSO3Nazusl4KqO+5056OWxHK1G5fphB7kHnG2Q0bQLoeV7D343o5I0IyF+Q/JIM12gzSozbQtf4vBumec9UiBQL/V7PYf6us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ozc6CeFD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkg5jlNd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ozc6CeFD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkg5jlNd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MNKIHG1175173
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZjTWTO9LGKbNJnCdQR2t56Ga
	qKq39XkGtlvuZ5fybUY=; b=Ozc6CeFD6p1fCbrn7gsfAUtdjoYHKvbceDQNVeNL
	gdGiq572M53A7ankXVia7Q9sS7TX+Qu5iMKQjqtSw93u/AJzb2beekF0AydNlzh9
	W2SbJM4tROlHH2oUhRrdishXFoYahYu3BPMjSSHJca+vwzSbKmC8inVkmD/zcq05
	8inmKT5xjBX66/Pda5BYtqNzP0gLZMC5NlCLIt5NcEDdAnmabFiyp/YBPUQCcdDE
	rgWB1SvrJ9EsA9J3Mxy70Du2SDeI6qLM0fgsIUWErTgvZ0zp7FmeMkxRnbPrHW/H
	OCkQ/cwWHQ11kLfWcLankx3x2yH2KW6w4Kjo+PzgcEcMNQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9rbnra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:03:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b317c40acso27847361cf.1
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Mar 2026 21:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238591; x=1774843391; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjTWTO9LGKbNJnCdQR2t56GaqKq39XkGtlvuZ5fybUY=;
        b=hkg5jlNdMC0RekxTONmqa9FVDDBi4ADtUYCoEMQ0V83zWPon9JTFOLqHSEAVQFPGSD
         ALeaDtIkgri0bgLNniR1yLcxcVog0bQ43I0PXyFye6dIRX0Cku/UcFCL+xul5XKVe07A
         iGueSIOCrYq0fAJVgg8hYWQ6PDC7JhcLvqiuotJ9xlEiDMVWXUnz3tz99tI2+KcfCcsR
         yjLqu9Imn/DBHLQ2kPdQ5Edc0G/pOt2Vme+wcns7zSkrn+u6btM+MkSVeR/CHhVHtS/S
         LtnlUWs5EcY+Y3iy4Z8hXdTfk5f/TlH2SW/MH82q81zlhkMQAqlMnZTwanUASxS5tQH0
         b9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238591; x=1774843391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjTWTO9LGKbNJnCdQR2t56GaqKq39XkGtlvuZ5fybUY=;
        b=XRLBbJsGlQoK7czpMjnwmOPHwVm1MIbcDymeVh/NXH7rFWu9ysoiN7MVCex51NIyO8
         QpGiKKcavB4F1pY61k2XQj7F/GozjWFVEG7IKUn9fR2zm3/P/xE37kVcq4cYb8DuB681
         /BLHtCE3rKLykCgeKbO5TXNjtfApzYWxfrRUp4E5FWMdrzSkk82RKWmLs4WTwQqvrHaX
         QNPo2fhkx9LcZtUoFeqlBWsTYB00yt71G3V6hBZHPCwO6dpZP2GPF37DMA7yEXizVvxB
         Yeo6eZJAQMrkIRYewTNx4myVQmkqPzQNTAXiHIEX6WUgWCTJHVtkv7Eb3t8MIBu46elQ
         YMjg==
X-Forwarded-Encrypted: i=1; AJvYcCU2ttLih81STGG68flyNP7jWGLsVW3SkBUVAWB51hv6beWIWhGH88/v5jh/qjxXHVhCf609ZvjIOLYUCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsHG6bdzWGANnmBWEcQjjgi3Syirt4CFWQZ6uXz3cxwR7sIguW
	N1ItMY6uCtCbcQjt3ikaAqUWszV6MNDpX8HhhzQSqcsFW7nc4jFQQBb7J3xRi5nPKXvp3nWBbgo
	l38oZVF/rKtKhgIod7etdQeYnqEe40cmLGs8Q40olR6ytFv1bxjZxcyfhvIHCn+1Hsg==
X-Gm-Gg: ATEYQzxO4E/bHGobFGDllmKOWt1SdqGwf04LfmzcScz9FHSufQ+AQcrEYs2EvS92r93
	OcViTRCEBmlIiNJKcqLzGRQeTG28Hhzi/CG1LWrLRgWXwqnp8P5su9UBp8rvzKpFg/W6XSNq8i4
	G3ylrHdSAqGjPOepEh4fnnIj+APrM3jK01WesW5KAThEc4o/urGTLlo1RGw0oxnzTEbK5XEUiB0
	VCMBdZT0wWCjcUDbGgqfbhPl7cILIokIa9fSp/cal82XEfvXNOzQ1kOZROSpIdEygGomZNK4aLK
	fI691gg6mpKZ1G0kq6KlJq4trfI9LrWKp5DTeW/H14Pgc7AdvFbmH5X1s3UiOJRb8TZSWSo67sW
	hjN0v7eSCPDUE1J8TJ6yGCTbnLX9b9PW2ysvxXc+soxyg1uHnFAPxYTBm14twdD8iaEQBXMz3Kn
	PAWWrCXe3oqv+yQnHuzyHukAi9IPWhsYj2CRY=
X-Received: by 2002:a05:622a:7c0f:b0:509:3c8c:2405 with SMTP id d75a77b69052e-50b3744f6a9mr130275751cf.28.1774238591428;
        Sun, 22 Mar 2026 21:03:11 -0700 (PDT)
X-Received: by 2002:a05:622a:7c0f:b0:509:3c8c:2405 with SMTP id d75a77b69052e-50b3744f6a9mr130275571cf.28.1774238590919;
        Sun, 22 Mar 2026 21:03:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2853055bbsm2240569e87.60.2026.03.22.21.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:03:08 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:03:06 +0200
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
Subject: Re: [PATCH v3 07/14] drm/bridge: cadence: Convert to
 drm_output_color_format
Message-ID: <h5giabamrwbtuumue52iu45d2jiybcwbbw3r53modge2pfe5k4@ijprwzi2qx4f>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-7-f3935f6db579@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-7-f3935f6db579@kernel.org>
X-Proofpoint-ORIG-GUID: iBcJU5zgCMD1l2aZZlTFC1HnCdup8B5Q
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69c0bb80 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=CFmvC39ClzzmkW9Sp_QA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyNyBTYWx0ZWRfX6uC8Vy3kX/+3
 SRb6LmUE+FVlkiUSs3KizMZswm6rF3FZWj868cra67w/UUjuvjTCUQXUygelulcg5zK1xpgpTgJ
 y4RYfSvSaJmcTmnW2QuEoyYOvOH1EZdSvTp52jWkf+Fw8M9Gvp3hxgOimWi96K1WPlnaQsTfX3D
 EqmPFS7Wh4rB35s0FIfywBUMOCwSsbWwOchxwxJmP5vTULBDJq4jphxyX0lSWx/GcACyGmLe32s
 ae08vbUDSkaoqPU6xbR2SsVCvApgsy61rb2HbSCEhBxQLm4q4/ZXU1+CnrQXhD2zUX748z3Buoj
 KKZrrlDx+XHuq3blHXVbUov8qnern/PEFecFbzifRDdOm1Tg2UoqvVdyhCN5zuaK92+ny3l6TNo
 alHylL87OqXykEWPHOX3bo6jPyYpAlOAd4YclXv3CV0W0lCLmdkaqYSviUjNpqY89w0RiCv3oG/
 Bav59gTlnd51OlVjH2Q==
X-Proofpoint-GUID: iBcJU5zgCMD1l2aZZlTFC1HnCdup8B5Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230027

On Thu, Mar 05, 2026 at 10:04:59AM +0100, Maxime Ripard wrote:
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
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    | 24 +++++++++++-----------
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h    |  2 +-
>  2 files changed, 13 insertions(+), 13 deletions(-)
> 
>  	switch (fmt->color_format) {
> -	case DRM_COLOR_FORMAT_RGB444:
> -	case DRM_COLOR_FORMAT_YCBCR444:
> +	case DRM_OUTPUT_COLOR_FORMAT_RGB444:
> +	case DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
>  		bpp = fmt->bpc * 3;
>  		break;
> -	case DRM_COLOR_FORMAT_YCBCR422:
> +	case DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
>  		bpp = fmt->bpc * 2;
>  		break;
> -	case DRM_COLOR_FORMAT_YCBCR420:
> +	case DRM_OUTPUT_COLOR_FORMAT_YCBCR420:

Nit: where are those values being set? I see only the RGB444 being set
in the probe function.

>  		bpp = fmt->bpc * 3 / 2;
>  		break;
>  	default:
>  		bpp = fmt->bpc * 3;
>  		WARN_ON(1);
> @@ -2479,11 +2479,11 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>  	mhdp->link.rate = mhdp->host.link_rate;
>  	mhdp->link.num_lanes = mhdp->host.lanes_cnt;
>  
>  	/* The only currently supported format */
>  	mhdp->display_fmt.y_only = false;
> -	mhdp->display_fmt.color_format = DRM_COLOR_FORMAT_RGB444;
> +	mhdp->display_fmt.color_format = DRM_OUTPUT_COLOR_FORMAT_RGB444;
>  	mhdp->display_fmt.bpc = 8;
>  
>  	mhdp->bridge.of_node = pdev->dev.of_node;
>  	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
>  			   DRM_BRIDGE_OP_HPD;

-- 
With best wishes
Dmitry

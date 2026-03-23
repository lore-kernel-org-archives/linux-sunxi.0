Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4DC78F2B
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774238880; cv=none; b=YfVhcEqUoGXg7oVhGRJhHzLnJD15agwcp8UnR9wDpjvFl2/JqNOiMM2xeuZyH3Qxv/yZYqOggBXSH8d7KH9niEUY9fxOPZSA5uNO7a6YoKHqW4Te50C9REw725uchJC2sliJlLWF5xrExbjSCIEGT+irqhNzs32h8zWLAq7sM30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774238880; c=relaxed/simple;
	bh=GU+4D317GYOK/fBCWgsWsGHXzN1F6K9Uh84RfJlgpTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilIlem7YKi7KY2rdK5meg2LpcYI5YDzIRYuHHkNRy+RjlhywXtTB7/xAqjghKH137wL2ueJcDgixItf0+VqwNTI+Htz8vMb4Pji63tpMsH82ADAx51M1hg8Hufb+1kJkzMYocB83eZrf32PnSe8wra0DFHCabco8l1YWI5sIeQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgFuGqQY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9oPBPts; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgFuGqQY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9oPBPts"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62M7DA2o3432230
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0ieE8/etbiGBriPXk9aLuLM0
	adGVcwwwVV2c9dNbcDA=; b=QgFuGqQYpMk/v6+sTtS2E6AyyL6NO3xR8buOH2KD
	I3JgL+cLyjr3rD+QRimtloHVuf84G7DYRVfjZc/Qxf9yfzASQhU9ZBd16DDsgBO6
	vaFOhHq3zID9O+Ha5ORB1e9/Wua7BqsCXQHRipSHX4TG1eXT+w9VP/d1upa2ziJP
	ddhAHSVS3NzQAcUyIA0yvDZM019E1fuTODHJUMC2DRD23C4ba90Gx/VhTxXEv8cP
	Ji0TYJVfBHZR6KCpef/ctsORGlbMTjsWeK4J3pEai57inymGl2dJRY3fK5149XRu
	AA2Xsdw0/jLjQIpUTSqF+CyzbyH1vkyaESJ3DaUDrWCBxA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9rbp49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:07:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093a985e21so300720731cf.3
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Mar 2026 21:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238878; x=1774843678; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ieE8/etbiGBriPXk9aLuLM0adGVcwwwVV2c9dNbcDA=;
        b=D9oPBPtsVvyt+6WYt1RMw2Bwf8HcD2gq5ZjkqOopOduim7s9N2CoTzd4ePsjg5cUO/
         w5InY1/4KkiZ3y6EK+8yq1XgWJSXpQs3ZVEN4c4H/mTgafhZTZZ7rL7h2TexmV2aqhoM
         tR/7xeLS8bFfkzi0ds5WKFMkZrZBZvZuafCtsiEMo3hSagXZEbgMg0WKka2l1TD6A9kS
         HB0fBkYvArNxJn1iXGlk/6OLdtVEOi5oTFuLD330kivZXx83P3uApF/jYXBqTrCLZTKZ
         inDqO97iY88hBUBUbPaVvz6OHNNqynrKzi5SEfQJ45pgmbBgpeDnM5rhHmaB3qIfP/nL
         xqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238878; x=1774843678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ieE8/etbiGBriPXk9aLuLM0adGVcwwwVV2c9dNbcDA=;
        b=Q2jm1g4c0XJoEEDaR4PhhEconBPVtnk+tEMG9eLdsHJ+rdeJ1iuZVE3lxtYKlDIQNm
         iYhaDAhCAFRtRmLUgXTAD4ZAOgd/9U0AypIWAXI1f9QbfIujDv4Shnq+FFhPX4Cpxble
         fXXJrxGIMd3HwbODyP9dTCUpgTc7s1GQjlz9gKlroWzBGV+dQCK3Dn6ixd+IUqplTwW/
         re612WF5RQR2GlHJSmDH3xBBzrR3JKOsxRDE2iEWQCHmz2YEzzsnic3PYku7MGTO6Amb
         /fNFhP9PZsKaGh/DLABYxB3bJG3cs/1ZJDhLmlE54+s31OGyhq5GH6RRibTL3Ki3aFh8
         QNug==
X-Forwarded-Encrypted: i=1; AJvYcCUyDVn3P8QK8BgVqNMjREkDsmWVneCacuI8XQhigy11k5DxIESvNB7nKB1fCh8m1vyr55jSfTjgHCVGNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YynCFx4WMP8iDu0TkMdv2HbyLAZMaz8dxbyHcxk7pdVrJxJpp0A
	phhu3n4asPOAn1FXomEmwTShFelOEJ/CP5U/V/Z2QNnLhVb6g8w+ugGl1cfAyjIsMxy1eWVHaw8
	aShDg8mh5ROzTv+NbJ3+QI69a9u/A2ZPqUN4cjkBYcDS5iNZPxfeN9r20+SQ7qIeNTg==
X-Gm-Gg: ATEYQzylqpacvxqboOPFNwjzFqowuIOmKU+5JqVnmvR4JzEO9tWDGAQrVA81XfY5YK3
	BZUTvAREeP+YGxMNos1fJODuQw94eSeIToktQnGlWM2caSiEO/j9yj1G0I6CiapOpzYt3PV0dln
	+Nvfo/Z7iC/3s27YCVTjZ2vId3OSJ1NqmIuKzWhDTP+pPL48yUKqSIaxvrwPRLbklIxKRAUmmJV
	Kkg1f4XdnP7wk0O/f9+JRKBO9i0j6vVH1Fgt5dqU+806Vi7JbFk7Xy9t3Nfv8dN6Q7EHFacmnUg
	Ta33MZG3rs6RTa2qmF/zamDvQRvB8B3AwtxASWNb6+BKQfMfeHz8ILVOLxq/6XKsmhUbFN+F+Km
	19aAtqqT/M2XtWcckTUpRNyLa9MWry20tQvV3+gsI0vzrmQnImfzxnpxdDIH9+TGKKyVeiYff0v
	/sjiZX9p92dByIw+AYMTNXLsNH74aqZd59550=
X-Received: by 2002:ac8:5813:0:b0:50b:4e65:95d9 with SMTP id d75a77b69052e-50b4e6598f9mr88670911cf.64.1774238877904;
        Sun, 22 Mar 2026 21:07:57 -0700 (PDT)
X-Received: by 2002:ac8:5813:0:b0:50b:4e65:95d9 with SMTP id d75a77b69052e-50b4e6598f9mr88670581cf.64.1774238877393;
        Sun, 22 Mar 2026 21:07:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192b5esm2239889e87.16.2026.03.22.21.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:07:56 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:07:53 +0200
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
Subject: Re: [PATCH v3 05/14] drm/bridge: adv7511: Convert to
 drm_output_color_format
Message-ID: <orzixmg2drbnkygv4wz77ddlvbfbkmhg3hydt67b6xittdx3qf@2hghjym3ggon>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-5-f3935f6db579@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-5-f3935f6db579@kernel.org>
X-Proofpoint-ORIG-GUID: 4PvBVZcRBjwr0Dc_1PcvsKdAmaXIk2zW
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69c0bc9e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O2P03feSXV0Fh_yUmGcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfXwd91EePMI7LK
 /ljwAA8zKPimL//zLpjCZtxctacMWGSGu2Uh+iCtHVIIazv9TvbRUuLEdd8yHmj3V23O1V9QKhO
 wkNC0FmSICCxcmag/d2nKMMYgv3wXOnz39phd3b+6PD00prQ1Z3VIfKNYztk0vwL5uvwFVT3KXp
 gWrpr9vqo63WhswfHudrylgMw712riG5A73HpZBP1dc1dU9m00MMzIyC1uD47oWok4Yw0PabqDN
 TIGksMKMaHBAuV0wSJPvtf5Ig8bZI5tiVdWTh4EwvT4tjIc0owSZ5ExmEhhmKjzqf2J73ppB6dC
 VByUJG8Ty83qhMdtjBaZm5DPw7lM86Eyo8RoIz41wnF2MbhCi8Byg/jaRGkJdOAnq3i6kSmTbFe
 5ZQsoDly1RfbSCeYybQ8MvL6eNAZLsx2W/tG6jLTWy/+ua9Vi8u7bpfFe692iHAeYxOu4TWXgNc
 cjfesvYD2BUWiqiAJuA==
X-Proofpoint-GUID: 4PvBVZcRBjwr0Dc_1PcvsKdAmaXIk2zW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028

On Thu, Mar 05, 2026 at 10:04:57AM +0100, Maxime Ripard wrote:
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
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

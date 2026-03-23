Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55FA1F5EA
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774238842; cv=none; b=pbEqyGxZ0WFgA5e2VppTE4gYkdJjoTJ1rSlbYqMdWgp4k+3Y6iOTHOVWHcp8Y6PqMZOq0+EVG2sOjEbGRfzMpSg0D71bDrK6rGc3Byq2ygjtF/5DsQW3CwAtoky35Dka0nEwmCM4jEHumaUxv1AbVPSbXS+6cXVK4d7Gw8MEyWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774238842; c=relaxed/simple;
	bh=jpb9caVWWoxQ79qKatpSX7q4n5ueYUFtQRXG3aLLphE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SkKV4YhSwSQ9ff6GKWEA+I1vCFLacnI01AcNGirhZU05hCxVySMG+Irkn6Swhn1QFyb442welCAF0MVApgUl61pnXLe3GNdVkEVrIGDstgPmwJomjkZNVdVk9eos0chzK7NH3j5UfMIAl9T8CuIqcJpy9F0I3qYxjaF1oOEuKI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mkB7ye1A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XVwntUZ7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mkB7ye1A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XVwntUZ7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MBo2mw2173767
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FkOlnsc0EKvOIhkAtLnyw5lm
	SHO8rtw4V09fAITZLBs=; b=mkB7ye1ABcjRkiyURKA6wmiG8gu2qAXGJgZYQfvJ
	ys04tLxs4TicdQbJAnSx1QrGvOI/bS2qSouJw9b59PiEeMYFbBx6awIaPGFioOKH
	D9Fm4SNw7zNoaoz8bw5lDksOz0792gDPV4/hn/T+vmnCG0D+bdzNAv6vuNTo3Gfy
	yXK5x0dNxWoEOd+3l/QpN5OURspZ4R4/RJ7PIwIANXfMBzg8WXBs2kgWI5kPb8Cu
	Vgfxb9to87kSFRUIRwSqEE0/abOf7aYutz0S3EmGAEXZcKD/vhcAdUqinQ6hvxZP
	vzfZgAMXEsfq/dl1rJPcbYykgUoGgjt7H6UH3mx6Aq2Trw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8hkgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:07:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4031b86dso231123271cf.0
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Mar 2026 21:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238838; x=1774843638; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FkOlnsc0EKvOIhkAtLnyw5lmSHO8rtw4V09fAITZLBs=;
        b=XVwntUZ7fpDY7xmyvdZ6RzbSC1/6F7zIS6+5aLhsdX0rn07oUdjPdRgKvB3YbQK28/
         jbhJ6XMB8+AT3bGfgATVnnTffZ8hWoXX2YOb6xVRMRERM329Sc1INpuZu7hI3gHtpCn3
         n707wLeL2jl4q077owVoVGTja4xL325huorYqYtoZukO+uYaIAX8iqTS0SextlIaRphs
         2+0BlB23NRx9YEL5/LSQgIwTr2s6KrhMfSaEqjl+PPchgiPfbGso9pRLCUH5uU6+dVNt
         a4Z2YFOubGL52KHxPhf01Px+oEUShsknGgotSWI/Xe/0nFMK4KR9PrSsvf8VCKiiB/Ls
         tO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238838; x=1774843638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkOlnsc0EKvOIhkAtLnyw5lmSHO8rtw4V09fAITZLBs=;
        b=WPbNbR89/CiyqLfl/qE5icChcv8MZDDbaxT0QFszazs7XoswtW/t4EG2fTcKOiCUWO
         3TyjzLgtkJ+R2sQ0FrweAmxhLSWF3jrSVxhPlmRL0zbSmg8UgstNxkaofFkYnomBRgQF
         Cqfyl9lURM7zJNtVxqX/8/+WBUqo9zuU9S4Oi6Oh538RknYZBajlbtSUQJpTkwYFyGvJ
         athNNqR7+j+yqbaWWDWU02Jjmd/s4nfK89911yuSCgeXW0kczKB5k/jUr9idUL7iQVpZ
         VBlFfIVfNKV0aSXqXnr5FWCxIiAx16BQK0lk9Bci1DldRIW3Nbanw3mEQNWd9vEWzzLj
         wUYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCBb86HT9LZA/v2BrE+agw24XQWva0drn4/7SpvmG7JU7vHb/wmckTQuTfETsLQHC0CF5hBzHh0PGDtg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyx8z5iscjBxYMths9/N5EDT1416jXx7qwOVKrsTHdsMIpY9Tj/
	VlLj+47e2Ud3CwZmmpsXhEHqrYrFgxh2/tCz58iqjsHz7LYY18/zK1+yiWcDUyaOJpu+YpVXwZV
	KYnKXMaI7jzsJOFNmlSPqFLgTMlYQk7ZSiIpZOSwBfzSjBEURymWwq0bKQZTrPO0Whw==
X-Gm-Gg: ATEYQzzQN7erdN8wxsNX8O8g9CCt2GdV+odjFLU070iu7IlH40ZTt7/OgNec4lsJFuC
	BB0+L1t4Xr3EkdQYdZRJ35V/6Sibaqtw3JdnbRy48+m1279//K9nr1haCxhdwCj9lSyvXOuHQ2K
	7drA0BHPUExdDXW3GEksdQbUe9XYFOMAQXrpzYGyHX3CqKuV2ZwkHYUGvVxIc8qsgbFTxkJ1igp
	QpvF4INcfK+x8uxcG4X9Uc0Z/ueQzboZcNYeunEUMccOpvPWZxAzb4t9zuXk6NrksLkUEMFUUfx
	012Sy5Ejiyb+prIdFoL6pBTpt8nqMAq75qS7ycDPsElgPsGD5oqgLl1ejGFbL0+myiZsl2pqjwX
	rBiw2nyoBeEnjHb0JA8KhC5vnLS+3RSgMaS5UJi+sB7L9vItUwoSX7nT9rSe3/FIgDtb0YSX8Fq
	WvqPTKJX7y8U2h3HOlRbx/Y4nfqquXINniVbA=
X-Received: by 2002:a05:622a:2611:b0:50b:4e65:95dd with SMTP id d75a77b69052e-50b4e6598dcmr84026351cf.62.1774238838038;
        Sun, 22 Mar 2026 21:07:18 -0700 (PDT)
X-Received: by 2002:a05:622a:2611:b0:50b:4e65:95dd with SMTP id d75a77b69052e-50b4e6598dcmr84026151cf.62.1774238837540;
        Sun, 22 Mar 2026 21:07:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9ac2661sm22658351fa.39.2026.03.22.21.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:07:16 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:07:13 +0200
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
Subject: Re: [PATCH v3 01/14] drm/connector: Introduce
 drm_output_color_format enum
Message-ID: <mvur5pb6jjbvssdhvbzoekfy7hq4h5vketlzembwb2l6fgt63i@a5f43tecwecr>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-1-f3935f6db579@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-1-f3935f6db579@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfX1i+ltOk7AShk
 Z1xUXBCRpIwHCyOq89x67WS3bx8O2nAwF1geJihjfleMmyk8bveMRwCd3EiO/3/bDyEj2qIMeaD
 0OZ0TjBY92ipMl05/CdIldMVod9HEu5rIcbukdWQBj72SWYBMMoeT45JhS5NzfYK8QdX3PpU04F
 egqNcUCT9KImqt788xPUd4S8dntJg+1+7Oby8ueBU1L5+nIuSbUQTuH2F26aXCjyDnvZBitYwfe
 8T0xTLqz57hpFtxoCdnFSZMvE3qP0iiExOCPQZNCx584KAk29FoBKNp6g62cfItTewItWIcshjm
 rCOcoZmgTg31ZqEcswOjpnHpub1MftR9raNLMJ8dNrCpMqBcgXY+wSLG0PzuEflykzNcohekq2Q
 MU+Fah1Vg46NvHyu2jKxS0ZKpX8r1g13AIBattYIHDpGK9TxL7LneAHnMz2Ce/d4oRYpMW/vWJc
 6R22w12/5N6qycwY90Q==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c0bc77 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QyXUC8HyAAAA:8
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Myhj0e63kkGcRKXW9oMA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 6rlHFtl36yMljSUDPsbvaAfLPxKvrKYo
X-Proofpoint-GUID: 6rlHFtl36yMljSUDPsbvaAfLPxKvrKYo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028

On Thu, Mar 05, 2026 at 10:04:53AM +0100, Maxime Ripard wrote:
> The EDID parsing code initially introduced the DRM_COLOR_FORMAT_*
> defines to represent the sink capabilities. Since a given sink could
> support multiple formats, it was first defined as a bitmask.
> 
> However, the core and drivers have since leveraged those defines to
> represent both the supported formats but also the current format being
> used.
> 
> Considering the latter case, the more natural, and consistent, thing to
> do would be to create an enum of all the possible formats, and then list
> the supported formats using a bitmask of the individual enum values.
> 
> Let's create a new enum following that pattern, drm_output_color_format,
> while maintaining the DRM_COLOR_FORMAT_* compatibility to make the
> transition easier.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_connector.h | 42 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 34 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

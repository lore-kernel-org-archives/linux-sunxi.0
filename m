Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C676078F2B
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774238909; cv=none; b=S7OWZR9hjeD7MxvnHmGbic6Fx2kWPl12Ww5KogoT8ItVjWCKvfTmxseYM900Kp3sG5CUSXDD4qdJOYhGLrh65Npi6YbNfF6Cwh7wq9iZkGOdrID49w/FhGTN+kMnUE30MjroRKihGhF03uMWY1dhYoZfcZtaRV2STSniDmdcrwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774238909; c=relaxed/simple;
	bh=ghWCFbnBQGFsvGFs7zDifMLCGFvqtkf6ouBmLNuo/tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBaqmV7K2i/7j+/XLD3I89+mAxxAddg0Wv3P2LYViVd8ZfPGv71CdbQir8AAjVcIN3Gaug+jFDdNKMJOmuGMQU5pyKoVijLY1OyWw6TpiRTczSGvTw3r+19bklud8zMXi4t4tuWsHE9wNvK2RM5KraNV8tsYQL1fblYKk1GW8mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mmp2Iv7U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QMHAcScO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mmp2Iv7U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QMHAcScO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MNbhEU3588156
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oLpTgVGxCw1Fj4mzUbzinm41
	xv8ZtpXmsVNDwDSI2gs=; b=mmp2Iv7U/Lsn8vXrVk4G5/PqevSRVF/GQ2a682mW
	dsh8vBoTGCGHVz0180xz7QZ0lurm+hXLpwOnvgqKISfAeuakv33zx1/3ceqLh1hi
	G99OrHGzLduRuCWT7K6XEKdRpkXIAg50dMueywxC5lWJ6UqU5h+1FiLi1BYOLofB
	S3TPaxrLsqRpdIDXaDKFQwi8kJh7OEv2aG4VBQEypCFf9Zk9KKsEv/CLtbjViA3/
	SnJAZ+Z0rl9geb92WEsYOYVigUb8qA1Tovq3jOt2b8bMS28n7nv6aHKbvR6DxsYD
	FvG1PHdC5ZqJO0Al4684//nTxsN3ojxtYwenxmEFrxcPWw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8hkmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:08:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5094ba09affso316674271cf.2
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Mar 2026 21:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238906; x=1774843706; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oLpTgVGxCw1Fj4mzUbzinm41xv8ZtpXmsVNDwDSI2gs=;
        b=QMHAcScOMyJIZKkUnrt82W0HjZlGi0CCCJEsu9odkfR9w8vNnetz9+NFXjzdJinmo0
         3wWCzcS8oCthwmKqdACNZ37wpYRc4BzxNUpq8IuH1fJAktTpR5ThH7hLLKetPDWaZdPd
         u2EcfOIADDgLajAWzVqQxUdYWRoQ4Zc3TyWkiU+6mrdaj9X9UuZvoeEiOCGpJ13GrP94
         h+Z/4TV7Gs0sngvukNVbaFBZTbuKwxqDwaYq/AE1ztN/92rsWi5wA0ixlI+c0mDwl3Qk
         xjIp228WOGPaotQQmnIs5NNOUHNmVv+lzfhpG33W/nBA95WBkdiI8LgVuP2IxeCiWxyI
         MJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238906; x=1774843706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLpTgVGxCw1Fj4mzUbzinm41xv8ZtpXmsVNDwDSI2gs=;
        b=lJImP/Us+CY2xAjxrhz9jAWAhac/iDeMfhn1OTJzH44v8wobHqyLaYmDdeMu1R7D4g
         IgfVZYpRKd6RP+srEILKj3HM5kCW3qmuGHxtqK8mIwJki2VeqYjLoz3zaDBsTloq7RHC
         g9W4RZu2Xi6GOw2iTXhF2e0f6i8r+W1Oab6yP2Y2lvAemrRtkjptkX6+y+VFUTxWr6FU
         p9AHUynb3WpwLSAsFLCEOb5KolnHOK1lBf1KLCFNSoSGAdAe0ImfAu6VI+VVxZChAFQl
         YLrZPrmFI76Kd30GZ7vtiBB4BV4gWv+u3SUC/wlMcx7Kq+9a+pfvDkqvf0ivf9bSFQm4
         aDZw==
X-Forwarded-Encrypted: i=1; AJvYcCWAaohnCsdVHuMTGUyKvaRB1VeFIt965yogDJwlu1oTO05YmC/VmpwaFcpE5yovuO8lDZ0tqKOBFpMPIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFkH/7YflPbOUy/86W/JL6ye5Pd+pl84n2Wvk20ieM6SZ2px12
	G98Zgsyk+qc9vUUK0vqBKGvMXmqX/ZEuuGdyQpZDSgRailWpXzM0vKTpoF7IkJ6gy48O9ETPt6X
	FZCw/Zdp6z8Od7q6KuBDCQY4fqxEb1cBAE3M+udJ0G2yZkAjJqMdQOOPyMo5rHhmFQA==
X-Gm-Gg: ATEYQzxxEt5HGZ2ZN/CTFrkF/o68+dVNR9mm3JM8+azNx7BpadiI7BUEJxIdAdG3g5F
	GO2cmagADAJZpx+Gdz7AuZVK89jPQnWD96cGexl4lyMEGcKtrvaCC8kQDjH4iOaDzzOM3A+zwo9
	y+TtpjAU0OSdW11x7s3BWyzNeRA/XhMYkEQjyCDXcyquHi4dK2TDPchCizKpSE/+2jwjUUg0rOL
	/gd5h3k8YWFujHmwO/hT6gSf6HnD6lx92sRVDpc5bYPU7EO4a7XIRMPWCLargh0B9HfoGECHxtq
	a6K4IEUQCuv8IIgCzqI/6ERojLODqDlijdPIkvO+j6RK5P7nchRunSlakysuWQGgMMs6osBtQ1y
	ZvXHy0Ss6FTiVNf16pBaj7F1YAep/F3kziI8eMWdGxb40BZCQfjnkQMS7VLo+nQ3qc3iu3mxYJd
	hO+kQgEJpppfxJka+P21/STWvoIG3ieMaZRPM=
X-Received: by 2002:a05:622a:8a:b0:50b:5491:ddd8 with SMTP id d75a77b69052e-50b5491efd2mr63479961cf.58.1774238906036;
        Sun, 22 Mar 2026 21:08:26 -0700 (PDT)
X-Received: by 2002:a05:622a:8a:b0:50b:5491:ddd8 with SMTP id d75a77b69052e-50b5491efd2mr63479501cf.58.1774238905598;
        Sun, 22 Mar 2026 21:08:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305e07sm2236969e87.66.2026.03.22.21.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:08:22 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:08:21 +0200
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
Subject: Re: [PATCH v3 08/14] drm/bridge: synopsys: dw-dp: Convert to
 drm_output_color_format
Message-ID: <a4k7m57gx6gevmip3pkhpoxklzhki2r4ipjwftpiwefmoleomq@2ycnpl55t7ne>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-8-f3935f6db579@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-8-f3935f6db579@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfX2QYfSNULzpxb
 /pBwaup08bBTJLrDuako5cbsA/3G32iK5KyWT/astg/ub50JWT0o0N4f9sAn6vClDhaVy12VCMp
 fjG3YUoWom6kMdvtC5/E6CK+QCybwFZtNUHCOd4zW5pLB+6isaktOAXbAXQi4SPk3PUZ35M6S53
 nRe9cdoETA7p9yoLU22exCuYKveOkJRBv31fE/RHa+p603/ZXiqBiddfih/U8kTA66vb4Rv3DX4
 6uEOkwKeDZT0ryrSGPP24kQCCNIXU8RHG9vLNq3FJEreTl2YWWHNikzsFrQdt9QUJ9qAnWrQXeJ
 JP2Azx8sr4LB4RhH9pSSRFDANwb7P6e0l8JNLEHtqFVvE5mNvXI7BifGh6m82BmVndFrNj8OFEj
 T48nEqnLzGi1jRMaUsni0R6/3nRHv4x81ZsrZsyJY2LaWlMbv2SKPtOTHuoJ95trjaq/xsIZDvU
 mnPJNz/uV1JMfMz1LOw==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c0bcbb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CKux1-rmGPvPLlrhUF0A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: DRHEOfeXNx-vwrRYpHOpZI3TxkgoESCv
X-Proofpoint-GUID: DRHEOfeXNx-vwrRYpHOpZI3TxkgoESCv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028

On Thu, Mar 05, 2026 at 10:05:00AM +0100, Maxime Ripard wrote:
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
>  drivers/gpu/drm/bridge/synopsys/dw-dp.c | 71 +++++++++++++++++----------------
>  1 file changed, 36 insertions(+), 35 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

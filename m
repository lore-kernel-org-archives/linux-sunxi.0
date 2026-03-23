Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462E540DFB7
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774239030; cv=none; b=iJl5XRrVKES4G18W7yu+/ctR8F5V8YNqQ76TQsKLzG9/9MkGUO9ijsclbDJ5jupRZmvUHWsE6LYBHe17BvDcQkA9QBgbO3YAWu22linkhTqcs6mD7yyTKiNAEM40SGpCHpKCYce9JS1iO7EK3Gq5VtW8yDVWv7cix/Q0qePlBn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774239030; c=relaxed/simple;
	bh=j9+M50t+pI6iBPq0+o4dG1KKIIWDps1TSpQeZFPXDaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSgAzUno8cUUGiJcfZ49W0SWf9mX4V9iXLeqzHRqt0sgo2JlzAFZOOokJiImYE4mGcW1utKPSjoKlpfrPSQKBPxkhHeGEJkEiAKAeeqrfi/CZH3lQXn5iK8eqg8xyK/OvNF2XgXEjdAkKcR3IXdIXx3PUX2p2/U0q2y+KP+lDvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7kecrEV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ha+yiY75; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7kecrEV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ha+yiY75"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MNvf0p795889
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sQGEJXGCGP1VT5nokRdn3QZg
	aBAAwrlU3lx1pdI7M98=; b=i7kecrEVBLxO1WNf+l5nmTc2n+Uzo/nysllO0FnQ
	hbeqyVQsO9lmxoRPFiatAESTJXCA8eVSpw5OfaSJbcdhkTF/N1TPrtV/f/q0FEYl
	VlWbN2Ms4pzCJGQp0A4A0hnIfUhYvgig+FROqZ3fKWWu8EjxjsKBg7+fzAaBis03
	GEkWpvszzEevqzO8lVdYQMInB4zOdGLjJgW7M8nsg0VsQnzLtoIKQz9qNccJz67X
	9j0TO8uUebepnxQM4MMlABNs6ApY1DEps+N15UmcVqtj2IaOXoHw/MG8hWlNRAfT
	vOekq4oJi59jpYJwBZnCYkszmNMG9AtJDnL5BsKdqUB9yw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvkpnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:10:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093a985e21so300905151cf.3
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Mar 2026 21:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774239028; x=1774843828; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQGEJXGCGP1VT5nokRdn3QZgaBAAwrlU3lx1pdI7M98=;
        b=Ha+yiY75M0pM4HkAfoq2XXNVyDFgielGbr3AGED+v+L7R5LzTQbDJRPJjj3wrtDo6Z
         Vr04ZX63ICOIeO/lxBCQ9ALoWjznIETK8IgoTCQD886U8/vQSpdUpmPrGDEBBAhn0TF7
         l2VayjulyIMcbbRVBKxd8UkzET2P8ldQtVDMogkLMeUyOu7y3la6Xd7Gg+PVF0DjPmOa
         MNHUBky1J1J6d642oh5/2L1Ct++UPy/59shFeuA4x32J7CWNBIKz++Qjqr5J4yMzOE2j
         3EzANkV2UQRXAKzxBUk+eaJqfPPGKjBlWf+VDi/tRHIdXdQScP8iCozovUO47dw91sSx
         70zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774239028; x=1774843828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQGEJXGCGP1VT5nokRdn3QZgaBAAwrlU3lx1pdI7M98=;
        b=nAI29UMXlR4+Aut4g0HuoKlwKUhbowL6M3AMKSGaUDvNlQ4PCsDjc65FadgUBgeJyp
         Efe37k5qnFeDoG/pbvPTQslODsoS+CQdkeJ/7U+2flyyjvMIVK7xu6EW4rpHf5wUCZ2p
         k0O+jT81Nu5WT7wUXFXa1ITXbF2lEhxSPlYVRYYyyWI7uN0a0f7BQHS364UdW6lEswoD
         m0P/RxYrzFqDSqrn20oEIBdRs1jjRNXxxsorIzvQv9PbpXmVFPlLG5j3nFB8GZcP+bil
         9D/auaMJCUZAO8+NkVOvDOQl7k0N1tyaad6Nmsosfep4VVgk6u17LYHo9bWPt5ciUajw
         AaXg==
X-Forwarded-Encrypted: i=1; AJvYcCUpvMGhWDTNhG6ziffMNRFl7JNgYvVRuyruMFpxPEvH9J0FWtEfRb0r8hz1aaS2/kv086w6G0KrJVTa3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyI/q17QH5bKCni4un6Y+OqYh8CDBWARhuJjJG2tOK+3sJoH8AG
	C6fr9Fw1DHjL9rJ1mHhdV/Z8jmbBnsHjYcOdXqiVKsqnWAE/P9VrAgwsc59CBzfYm/uCN0uJr7t
	iebE4pv+7tYmxDusDxrUjfVepN03rALi3IKEhzKIfgz0nT2bzpXsR3BhuD2MRtGUQAw==
X-Gm-Gg: ATEYQzws/VGN9OfYupq5axt2a4UvTnSYjN2VaVus2biXan0GLSVT/fB5ogfjLw3GBL8
	OlU5cMbfHLPvEyWXLM9lhssrI12RQM/2B0YCjVCw0wRkwjR2LXKK+YB5y/46D8Xxe4VQG84d8it
	9tcr0PkECKERqTLeej8IdM/lIW1uI8lP0YoXsONJshzNVM1gnO/KUO+gePfmGMpwNaFqwTphmmW
	9Eddff54RsmNfCtEl0IRdDNNHb8kbGhzrXfVcK2WGWvIaqovptEd0fpb11eTsfWojl/yc2MiUDI
	6lwCiVietyro5tlTFGU88ecaW+CCShjBqc9prBubiaoydaiCwIMKHIriF2xquRh8dX6M4iYOkwK
	dr/X+mUu5Bl+F1jKW9nAFWBGd2yeQxoUYEZGcVp7HsACdRVtlUj9Eg9qO3gbQmDqqtwY3cZVPwP
	p94yoMQp7XapBGHvltlqpzYvfqcUUG/vVMsek=
X-Received: by 2002:a05:622a:4287:b0:509:f36:497d with SMTP id d75a77b69052e-50b374a7a76mr157306201cf.30.1774239027579;
        Sun, 22 Mar 2026 21:10:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4287:b0:509:f36:497d with SMTP id d75a77b69052e-50b374a7a76mr157306021cf.30.1774239027086;
        Sun, 22 Mar 2026 21:10:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192b44sm2215746e87.5.2026.03.22.21.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:10:25 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:10:24 +0200
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
Subject: Re: [PATCH v3 14/14] drm/display: hdmi: Use drm_output_color_format
 instead of hdmi_colorspace
Message-ID: <gcl34au4vrbew3gtr7z3ui5tpkiehiatiicrawe7ls7ulq5vk4@tecy3vwgihcr>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-14-f3935f6db579@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-14-f3935f6db579@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfXwqsoAZhL0HvI
 HVzbyiITUXMZW5oQOh9FToonaiFIYEt+XmkR5kQVaR/wm3YItVRf1kDbSl0J6GaPp4miqn0MmVu
 XWVKiMkgL1iE3SFN3m2syx46ctImgO4gd9v9SAZEXDmRXmyU2gPDVvTva/z2HFklMh0N58B92zK
 u/ukp2ITKMMYLpoa/GWAvkYWeamNhsgIuMMwew/UyxQhmIr6IfYlOTqKKm2s3DhS0FPKgNsYHUp
 77BU1DXI+omRZaHOBb/M3mv9JtM/CXijjdSK2JUq835P3bqUMfZbV8zfcMg4ovBDYubG7TjwoBQ
 7UJdKMt9e8ijSy+3NPLgs8so1U6NnINDw0qm4GQGPVn7jDWSXgnkplZvWWRRMwPtdwx/Uh6IfKw
 rM/gUAcSY6nw1LrppOqSXKZK+js8pN0Dj1etTydEExb2KwEJsk920NbMt19uGuvTyFgRb1pGA0u
 vwvdZkObiig8AV/vJCQ==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69c0bd34 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PZBe32_PtwNt9AllZ3gA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Pky-KUANZLkKwaDluuEZND2MHJ9Ylv5l
X-Proofpoint-GUID: Pky-KUANZLkKwaDluuEZND2MHJ9Ylv5l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028

On Thu, Mar 05, 2026 at 10:05:06AM +0100, Maxime Ripard wrote:
> The hdmi_colorspace enum was defined to represent the colorspace value
> of the HDMI infoframes. It was later used by some HDMI drivers to
> express the output format they should be setting up.
> 
> During the introduction of the HDMI helpers, it then was used to
> represent it in the drm_connector_hdmi_state structure.
> 
> However, it's always been somewhat redundant with the DRM_COLOR_FORMAT_*
> defines, and now with the drm_output_color_format enum. Let's
> consolidate around drm_output_color_format in drm_connector_hdmi_state
> to facilitate the current effort to provide a global output format
> selection mechanism.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/inno-hdmi.c                 |   6 +-
>  drivers/gpu/drm/bridge/ite-it6263.c                |   2 +-
>  drivers/gpu/drm/display/drm_bridge_connector.c     |   4 +-
>  drivers/gpu/drm/display/drm_hdmi_helper.c          |   7 +-
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  52 ++++--
>  drivers/gpu/drm/drm_bridge.c                       |   2 +-
>  drivers/gpu/drm/drm_connector.c                    |  16 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |   8 +-
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   2 +-
>  drivers/gpu/drm/tests/drm_connector_test.c         |  80 ++++-----
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 182 ++++++++++-----------
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  18 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 +-
>  include/drm/bridge/dw_hdmi_qp.h                    |   2 +-
>  include/drm/display/drm_hdmi_helper.h              |   3 +-
>  include/drm/drm_bridge.h                           |   5 +-
>  include/drm/drm_connector.h                        |   9 +-
>  17 files changed, 213 insertions(+), 187 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

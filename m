Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5749A347FC4
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787128; cv=none; b=rMF2rcF+Qmz2OLi9qkYCIcwyQikS+zm/dRJ2xIYf3HZThexcZvHAh/Jmh1MxG7qrZKcUHgNwsjehglGJ2LVMqLFdjdqzcoT1/1T8vpd61cjqE6JID+L4oJYtW5Snt8lNfVT4zMDmntAU2fiI4/MPtidUxWw5/mQ/HAUdzXJIhpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787128; c=relaxed/simple;
	bh=w2PYSKSQEUm2HjPn/LjJUHhEU4iqxj4SQUHJiEAXPq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFWqpWMAXT/rtGsOgxZ7djHF56gppnTkIskpKi+yByvgMVJKgWl+MvgPVKaSfaxefVAL3IKx3Wu8oN5QlKV2G1Ay4wFGirg4KcVSSaG+OGtHroNfD/EX9iddgYn/NE1eUTzuzWhn8Vv+aSIKS9U/uPMJlFIq9gE2uPhi5cnLKsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0SFiySz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGgduYRh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0SFiySz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UGgduYRh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LCmaul3257843
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 15:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2rlmangFWK+0INg27+5z36YD
	N+j/0s+7d9Y2woRTfSA=; b=T0SFiySzaezo2/7b9AmZz/YWbxYaR8QXZFSTRY9E
	GIJG6FUoGiv7oMrG/MuhO1luUIBzqDS9Di3R8cHZkheeVvtY9tnXtBv5c8xdqnzO
	mQY5VYjrqIGt5qiBU1i/VnnwLNYmhzPWxcl0Ag0LfyOa2DlgIHfJ3ruMbJh2/K79
	iYHNsmis4GWjcHz50PQ1pjBQvjUWhUAvlQ+UD1NQBZVJ/Dm2vTiR4tx45k54ZUDk
	yHUW3E2/4Y8RmVns3vj9kkK9gIjhyoMvvdEsmWPAQ3vUB0GDzHqMOFcmp9mtBVmz
	LvGD7gdvz4gUMMwCImnYk3adl2OhMTbdM3y/L4+aHoDtMQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp3naa2rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 15:58:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb3c7b989so15274621cf.0
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 08:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776787126; x=1777391926; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2rlmangFWK+0INg27+5z36YDN+j/0s+7d9Y2woRTfSA=;
        b=UGgduYRhaxBNFg1NAfE2H4ho0Kz3JuyhkkFpRV5YRnk0ZGBmr0KEWwkrNOfy6qFSrd
         Db0ECQW5zwIkkT8yJT52IWBa0Vo8bYujxQ1RKk+vNV76bdDjJXxdKxdPDKRtBIePg/fx
         tezLxi0kqLmiaGNNRkKlEQkoD4Za9Tz2CRIgR5SwdkE+KzPgNMpVQ7HcZRs+nm08X9HO
         rp7KC5uIx2KYQUTsfF4kV+BTvmYML5kvy/H5QLb1z0tB563bMC5s8t42VIU+5njRomU5
         epiR3XvE8qRi0g6xpKk67JnSZNShjlJ3lmBIWlwpGYhJhVxDAfsxB2QxwSR+skA25/yt
         ccuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787126; x=1777391926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rlmangFWK+0INg27+5z36YDN+j/0s+7d9Y2woRTfSA=;
        b=Pcaz1tV86u12YbA6hDG/Na0XSYAgmKbZ8jyF1XOjkc/IrJX/IzpVqoUMK34CvO5E57
         4B8NherYPJJpp4oLlFcuuzGvq9rj/M6o3+qqud1DPtULWbSZTZLWa2M53oXXizKujFdh
         eUPYzJsPA2kF/M0tCDpvvybvB6f5pS/g0CrgNmIqQiWkFZXFGnM6RMss/VFxdjVg9qXg
         C0qtsdVNEEiaftVGdp2gmL9Urzuync5EPtCyhyShMhrOaH0kxc+jHmnhgT5B0BypT1gS
         428Rmvpoo6odTjkgT06A/1cJPtoRuygtLXGOWBvfuv+531WjgkGxy5nj8P3ZKfYQ7cpf
         QAZw==
X-Forwarded-Encrypted: i=1; AFNElJ8TP6a29LUcg7P8bl3fe3Y97k5TLfv4W/Qv0n8QM2zI9ylqXPhBhOotf510fJB4PHI2G/ShWxWzqkippw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOU4NHk+WUlw7jgrI3wMpYBIpMHjwI6comOEl/YH2IknJ7jywR
	CJGlg2+1x5LQBhEwjSy/gWmuakxjmmQfJkKcJkkO5hfQL4bhyRotmCKXizy0XkuBxLRheo5v4E4
	2kWwOjlnGyLg0GMu0F+HkYXXPtrNITp+suV5GLR5YECCfUQ+Rj39eQ7WpUSWjGBuwZw==
X-Gm-Gg: AeBDiev+J84S1OxHs/dN7GITc4bM7T2fSiguIvUZMxzNtFhiHOX63MT7fYTf0vPSI9X
	qNUGgfxvcEyTQnC30NEL9xbFagIspZDeS89LlxVfXRn+Qgra1Wgt9wJ7C8Fgn82uPsdAycWhK6Q
	pTV+otnJDtKMf0+CZlbnHGHV9LP2s3NpsjgeZ6SjXgjsafgREd7r8YF1bT7Jz7TZs/8S7EgW6ec
	LwiXTch6eXFi0+G3tyeD06qeg9nqvFQFDM6IdsLLVR06l6SqvYN+nWbWMjqpIgrvpE0Rs+alOy8
	qWQsZTWprp3F+HE0Xg615CxPp1B+f7zxN0rPz32KuXEk/lFxLC6p5sagUXu/jbTDsPb/UGa9jjX
	wz7tncQ/sQFDnx4G2rZ28RG8rB8xnP8Qxxt7iCyoBaNceeCg6NaHtm9Jo8ye6e3Ya/tGleR/YKL
	rt9Pk92zi4hI7c7j/AujvFxZSJ75r2shzwcvOahfZw/jAsDw==
X-Received: by 2002:ac8:5a0f:0:b0:50f:ba8d:8b62 with SMTP id d75a77b69052e-50fba8d8caamr24329411cf.0.1776787125500;
        Tue, 21 Apr 2026 08:58:45 -0700 (PDT)
X-Received: by 2002:ac8:5a0f:0:b0:50f:ba8d:8b62 with SMTP id d75a77b69052e-50fba8d8caamr24328851cf.0.1776787124912;
        Tue, 21 Apr 2026 08:58:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e12c8sm3767238e87.49.2026.04.21.08.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:58:43 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:58:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Simon Ser <contact@emersion.fr>,
        Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>,
        Sebastian Wick <sebastian.wick@redhat.com>,
        Alex Hung <alex.hung@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 20/20] drm/bridge_connector: Convert to
 atomic_create_state
Message-ID: <b7heherpjabs3xbgzxvaznyvfk5ok45uqrjotgr5esy2ctuvff@t5o25d65j37h>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-20-c63f1134e76c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-20-c63f1134e76c@kernel.org>
X-Proofpoint-GUID: BfzqXh1YcLTyw8By7MNksE_wRTEpsVap
X-Proofpoint-ORIG-GUID: BfzqXh1YcLTyw8By7MNksE_wRTEpsVap
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NyBTYWx0ZWRfX97nziPtBA0P4
 cbnAn/Hlev7iNnvUmY/KE29lv/YoupAzF8Un+G8hAKjSR8vRsgV5TatKJYntCayVBG8XadvzSqX
 O7JxL2+ccPCOno5Tc1AXVsloe/CgDCNNmtxmoppkF23VnK7y8lbN8SUf+XZjnEZqMzjnFwFS/1i
 3mxzPcFLhpZBaYr74m1eH7yPb/EQYSVDaI3gS+0Cc4SiTozfxUS0ArGgLPUwbwnalyS/dHa5GHA
 NHtGcFJLbmYaPQZQNekuvX9+zFhbz+aZF5+ImYsREqefaB6v3NpUSJaVqF7emqRPF6O9PSs5r6T
 sCzUT7wQo2OVenF2JgKmJeYL/12WZHV+h4YzJgKUDjSFrxglSXt3eZFetSByn1z2UrelPNwD0Sb
 wZIWZqwertAJfeEF6n/Cet0G8L/T6dd9fc3xIn5cKFNfJ+XJRHCc+4zZKwxeeE1fu2KUkikHWcV
 LWTov1dW16TdQVCKR+g==
X-Authority-Analysis: v=2.4 cv=O9cJeh9W c=1 sm=1 tr=0 ts=69e79eb6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=P1BnusSwAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CGuZyk7pIeUWItkfYpsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210157

On Fri, Mar 20, 2026 at 05:27:27PM +0100, Maxime Ripard wrote:
> The connector created by drm_bridge_connector only initializes a
> pristine state in reset, which is equivalent to that atomic_create_state
> would expect. Let's convert to it.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

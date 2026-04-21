Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514A63630B5
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 16:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787332; cv=none; b=SXxNeMKS2sGGB2mOaO6aIQoW+sG/aa4UcNR7eHQZmYJoSygaG3tDZCmzLKzgo8YR1Die2SaqxtlKyMu/BR0fNUKsymUyCEoMr0A1LGpptWUrZT1VB/RE8dGmXyg4h4FEeBcDiFmR60xhlzGfbzDclGJSGseSUpI/ZYtE5caaOBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787332; c=relaxed/simple;
	bh=vT1w5VVaoDof8uokCQo+xengm4g71tyRJzvxTA3+bvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4QKjeb7rrAM9e34ySXn91it+fwWKUmoF1DX1Mci0/4MRMNghl4ncy4/U+YDMvF+c4iJcAvxsnjZX7Ktgmv+loeg2o/JBzCur93KsF2yCXoa1iCkGs6Hlx+1H2ClOulzcjrIHkuOmx1I1BuKR1NIADiD7EetFYBiC/wJuG4FrQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoC4TJD1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EHJZr35p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoC4TJD1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EHJZr35p"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LFbRil3337224
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 16:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=laMpQ/PEThA++8VKoCP5uoEG
	KvqMhipe1NJOiXj6OFA=; b=DoC4TJD1tox6cQCMrbUYn1E6UWT7nQKw64cl8O7+
	NPINHQmS86XXE01DFnSK+4Iq8z/cJ9md0LTLnXSvwDY99fNJEnGBBEtU2hXt8Tns
	X/oZu1q8unPKTYt/aULiBdGGz4oxZot83flyQIozJYQI7cHemjuH9wj7Nid6f/Ul
	8YZSwK+xIBYxPGW368kAHIHy3ICmMhIMt4BK9nnyTlys1W/VZdyVlJkg4HrkGdVW
	z/CGvbjYIFmHKcpRDrDGBTGKC+OKGu+5hx+6iAc8n9bZY8VbLIYiyeQRd+HhqlTi
	y+Afw1j0QBfYxjVU8jsbrX3BtzHQ4NhIhObbJwTXckxD3w==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpc1jg361-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 16:02:10 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-479d900d222so3975574b6e.2
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 09:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776787329; x=1777392129; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=laMpQ/PEThA++8VKoCP5uoEGKvqMhipe1NJOiXj6OFA=;
        b=EHJZr35pHjOEOeElQ/r4SUdxNSh7HuFgUgwql87ij9FTE2AINM3A+dWVAjEo6KnweJ
         /KQJZr2I+peH4EYSyndzShyoaB0PpxS20hpI5RbFcEPkeGZQD0sXZoBR75IqKBA0ZJ3P
         UaNIIcaogkj3qh3AygQovBY1v0Co/bQFkr2dMwbzWCIN2nB9vfLM5LP0NQv97uOPDFf8
         yuQHflK1Nz8VNrjig8q7AmbH2w3QyCj3nO0RJ6aIxk46ZZoWvneD3WZQOlPIiP+IKrKg
         w6EoPGlm8bJiaaG2u1fiMJktRUA5lr+6XtZBbNRk3rynPFPTT7isZ0zsjyPA9s0kLDx4
         cJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787329; x=1777392129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laMpQ/PEThA++8VKoCP5uoEGKvqMhipe1NJOiXj6OFA=;
        b=YKNrKAWUOchHhUUA6ZNhOkz0Pa0hNIzThM8vK3yjAqthkPNQy1YpVWH3OOFlmCoZ/u
         WFtSQW1VUsPRpKkV9+SEBq8oCGNVWSziPDrFrmxSF+rY7qIzzahZJ6kzVo+hAtvMK/8+
         HYAwXG4wdH0cS8wCAwe8qbvRH4jHgC3zV028uqp80hG7fxT64/tzDjWbXIeMdqqUiC0V
         jcyESeGZ1QwvcIipiMzfr47X156p3w2LNI2yhfenwzEWLUtur9gh+Xsd4ZUwm1GFh6Kk
         kU6iNR9mDcDRWTOse1oAXFN9iXpBuJkJZSI1A4uHZ88rALAgoCoLzz6mEQ7clxJfZIbR
         zhBA==
X-Forwarded-Encrypted: i=1; AFNElJ+jA9MHj/uih/X9dewIiLeY6idUm90v81hd/+M60fHSCCVpcjypQeFNAopkHk+FWTNAuQQZk1iXPeufkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLotoOMxSyDvp0o1flYBArZ79BO5X7TTAk0uK1xxr7rCznrerB
	8c3rviJLr1AzJCHzMQaKA3ybrJ8ht6w362QHbHveF28C3MGfvkTTMD/nLY3Slhn2ahA4mLUCmEz
	qOS0nt0Q6GYCpHuDObnxCPD2LuCMt/Omoyk0ISmnohiR4ZHg+SgyFl35KGB/BQ+6H6w==
X-Gm-Gg: AeBDiev6FokgrW5e4BhuarILUq/hcMgKCvZnrZ6MElVStN554RUUJYjPYeQemM3F/dg
	UcAmRslW6hrezjw0jOP62E0sQHhJw7LPjkysitMJxGXRdsQAVfBy7foOav76jGruJ3urop3Toog
	P/TUFEiSODr523HT10iJCva2cXelHeaEPSrZ1eCuyV2Ps4ZkCxLt1I+P46+9lpCD92u0gucSY0N
	Nux73gf1l+ilm/ceReyNQKxmZoJ6WXHY/WMb5Rrwcv70D3smJQcmZsfe+tkkfgH/75YrkPu4V9J
	IlPPk6JdvQbnDDGG+euXwGcxElMq5rET1+Iiwc/F4ZcbzdOQWf+LKQW6xDmLTLQY/tWS2wRZ9Ne
	q43EneJu28MBZ/kI9BWGL9QvzMT9sbE0R7DEcGZl61sOyYUaVfe2c0ER/RO0QRCBtvzm7dZKBvP
	e06lBh8K0oKVKgkx2Eu4F+NYoZUQN5I0YAOj6T7EWLgXps5w==
X-Received: by 2002:a05:6808:4f1e:b0:467:1941:1f18 with SMTP id 5614622812f47-4799c951609mr10816740b6e.14.1776787329125;
        Tue, 21 Apr 2026 09:02:09 -0700 (PDT)
X-Received: by 2002:a05:6808:4f1e:b0:467:1941:1f18 with SMTP id 5614622812f47-4799c951609mr10816664b6e.14.1776787328396;
        Tue, 21 Apr 2026 09:02:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb7613a9sm31882641fa.41.2026.04.21.09.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 09:02:07 -0700 (PDT)
Date: Tue, 21 Apr 2026 19:02:05 +0300
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
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 14/20] drm/mode-config: Create
 drm_mode_config_create_state()
Message-ID: <uzfggjuv3yfegfnzjd4jm5losp6zxtxzrhtbncappzekyrcdzs@7awi7qw4kchv>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-14-c63f1134e76c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-14-c63f1134e76c@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1OSBTYWx0ZWRfX45OCU2DGhaIJ
 rpP0sOxOuW4HX8+f4jwss2b2sN7vNHS+/WtI6ZKqR33v6v9UtSxwhp7wvwwKOX+XqWts5p2dQk8
 C8b0s3Q0UKvnLTx+I4lapmqcyuP1bMjP5GAWOiw2IElrNovgBb31/+6Bci2zOg1rSjAVLGRjovK
 UbzS4FUbFUl0JgA1T/fUkrRV+0B7DPjhOOnmHILy21E5gbjFtA+2iM7oWKHizT/n3neAtnhmu7Q
 k6b/siUu99WkH4qdVevnDSwGyckFU/pgCoctklqjVEfTExNJrIvSRgwxlc+kmvcoBVEzHw0GjP8
 vR7xat6IKYhMusA5ADEsQtMy20s4AhwtTTl7UiCB7jIAZU+arDuXTHlz+coU4K/pUqx52ad+XRy
 ygc7Oy7dGJ2AZGkmO+ypz7aNsCMgCs/xahv622ozVUE2WvE2DRhq3sl03KoZk9mNNFe4cKzfueI
 ukRJmVgLe/Wc9cHSAMw==
X-Proofpoint-GUID: imhMop7EW6gurXN4W7TzbfdPddc6W3Hj
X-Authority-Analysis: v=2.4 cv=IcG3n2qa c=1 sm=1 tr=0 ts=69e79f82 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-GMv20tOWX2ILgXXLssA:9 a=CjuIK1q_8ugA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: imhMop7EW6gurXN4W7TzbfdPddc6W3Hj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210159

On Fri, Mar 20, 2026 at 05:27:21PM +0100, Maxime Ripard wrote:
> drm_mode_config_reset() can be used to create the initial state, but
> also to return to the initial state, when doing a suspend/resume cycle
> for example.
> 
> It also affects both the software and the hardware, and drivers can
> choose to reset the hardware as well. Most will just create an empty
> state and the synchronisation between hardware and software states will
> effectively be done when the first commit is done.
> 
> That dual role can be harmful, since some objects do need to be
> initialized but also need to be preserved across a suspend/resume cycle.
> drm_private_obj are such objects for example.
> 
> Thus, let's create another helper for drivers to call to initialize
> their state when the driver is loaded, so we can make
> drm_mode_config_reset() only about handling suspend/resume and similar.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c      | 12 +++++-
>  drivers/gpu/drm/drm_mode_config.c | 87 +++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_mode_config.h     |  1 +
>  3 files changed, 98 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

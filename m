Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF28D3358B6
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 15:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776786750; cv=none; b=hliSi3QuY8dxeXrFyUv4bMDSFLuuWj4B9H0mvTRSDmDwphrUYYWPuZTIxUg1ZOD0vijyrV9zrcWu3EDhx5Wh+jDXY+dii0fBkBIARn8Q4mIKiXzQ+Ev32z00zwgUe8bvZr9B7I0wfQH7aX21dMa8PCWBO3CfqeV6Pc/VzVFToa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776786750; c=relaxed/simple;
	bh=GNs+gPCDV0nnnPJigbuhD+D05AfAFH7qyRS83GJl/hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g1B00t+HqIqjXBP/3ngwUuwSzi7G+3KYBSGJXJAzU9Ny5MMZkS3akohFARYpLYrgzSiBsDJBPejZVI+hTLMlHwJieeCWangaskGrzTRM+F0I280/YqKwtQo1pmiTPvhCtVqSJ+s20To9ToBTsC8N/qLqjNDwj9bn9oPQiA3yvoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FzMpBM44; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqOW1ayE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzMpBM44";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqOW1ayE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LCLETb3257313
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 15:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b+TpPDtb4A8gF0EfZG351FvS
	a4dKKMV4oqQnvGwrL7A=; b=FzMpBM445RAAHk5vR+lJe3EuQLfi6pcaUmmL6Xb9
	pkqyCdRuKRhZYAeqdBBJ2p1rB2QhDqfjc4uESrNlx8tLhu9mFxQavV7cIkg86e5E
	jl1qY50x6SO9v9RStaYY3lHz5+nW7bmI7NcFSslRK+7b+S/0C9IUrmJqcZATLUJf
	2A89t2dcihv7AiNmjqqmr/qGXD8xwxUGwSpTeLRoWZi2riO6PFahpYkrbwsFUpRl
	XBQZJyIiY/EUvf9DgVklf9v/P3PRDwS/API4JnlMpTcAHWX8nB71fgG+GogTQYds
	S5CZ8df8UR1qDGBLUvIErjMWyL3xS3pbyYK5gM4Kf7TSbQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp3naa1yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 15:52:27 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9539bc7e2d0so7424139241.1
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 08:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776786747; x=1777391547; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b+TpPDtb4A8gF0EfZG351FvSa4dKKMV4oqQnvGwrL7A=;
        b=HqOW1ayEY/2RhNzFMV8CbKs2qY/4WV2DRn2anwdB9GCtl66m+aXpQXjq38che0VWRL
         Pgx1gTRlPGmRXHE7G+qIB19yxhmVlRMPntDwaeQSnunvDqXAGvvhU9KCWUbgrDpyETnQ
         8Oxy2ZUptL6Q/dwcW525+QV9PG9386/DBRlI+Sn+1K0UvdOk5oSHjwTkY9m2JbqwjhOm
         YOtfICvqCN+2YFSpCcFBiEkeD6AF5Xc0FGKEFQeSW1lbl6spi+CNcu5p82HvAmqBUcBF
         ApIYzvr3LQYMpU8V7a0D2rbb93CirGYTQNii0ft8PXJGQQuXjTOaFg+x+R4Uqs0MnI19
         Z6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776786747; x=1777391547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+TpPDtb4A8gF0EfZG351FvSa4dKKMV4oqQnvGwrL7A=;
        b=cHtk59LL/8rMtGSzcBBi0Adt1IzQQTeJVTK8z/Hz4AK6qGBpGFFfO44K5rEtlf9J2L
         RoNn8kBO+PJTm6catQXVu/zoF+pL8pbtlYFsfFvmVqdZqT5yG9QA9aR3e4NjUwtF/clX
         Sp43dkfmT4ClqBCPSL5dVlVsiUNKwFOHQwmjSZKjvsOloODAt/uEAnR1ZjURMd6tiVeA
         DWfdLENe7LRwo2leJHuahERft/gxA8ibjWkzfwSjfHXC28V751mtpLA1osrGrrv+5YKz
         Jv3UsYbQ+41fqy0djWesoe/nrSMp/5kQe1lApMpg5xDUV1Lw/wjQ6f5vTqWqMlGyIDZU
         ZXog==
X-Forwarded-Encrypted: i=1; AFNElJ8QyiJBRGvvRDxUnWA0jylkgbAMM+aBSIBR1yUmXhW7aGbL57ISGhIX6SU2LvaK7e66USA4bEIs/N44zw==@lists.linux.dev
X-Gm-Message-State: AOJu0YypcMBnV2OgAXYW/DFI5ktTewndD4GXBUeppYYCCEDxG4h6sfEC
	0MaBYQPJMBhRjdo6US3T49ocq6qGYJMJ398Pqj7TP3QfbqAka6sqs855kEU06k9YaoHnyEhyw4F
	LxDj9UTfqvLN329HEUQI5k4IJYicVcpCxSQR3TP46r2SOFUC93pTo0Oq2+jPjFaEgRw==
X-Gm-Gg: AeBDiesR9k9U0Tjv2U6zhT+ov+y79vmNZDdOD9EY+ohEWHeOzyEsh+UIzd45jfs42Fi
	e/1l+Z+UiHFCvIAXPV7SXvBLlimp6L50M8YRcelJtuOMIPjp2uvPGPVaVvYKObcdtWmFlZrdEWl
	LpbL1E31CNhqzgryX1yhRS/oJXiXL1HLx5SPhLRoJ3Vj1yJFDDq/+/DqQrVPdXexiElv718llXq
	nEP0MPoQmWqbhTfTYSf9suJ8i6xdBHNyE1zqpm7LAV4Le3+mWDhznQhRs10qxgCCsfMV2PUOeao
	R34PrbM5VlBWbxt9WIT4uq/XglZ1s+xKA1RO6cvJljWpURzHE8glsKX1n6BdYljqCvLYKShflnM
	DIv56qKYBIYdvg2qefDWSraf3g8LBhOTpb6UeMr5SOIkpnDtuhnXiQQ+9gK6r05E8svrDgGEGLF
	YSLXfpUGQsxDVkHipQKY9mW93hUbcRNxUSGkyl6Bc86AapCg==
X-Received: by 2002:a05:6102:5492:b0:611:959c:86b with SMTP id ada2fe7eead31-616fe259128mr6807903137.16.1776786747174;
        Tue, 21 Apr 2026 08:52:27 -0700 (PDT)
X-Received: by 2002:a05:6102:5492:b0:611:959c:86b with SMTP id ada2fe7eead31-616fe259128mr6807884137.16.1776786746729;
        Tue, 21 Apr 2026 08:52:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f66besm31845671fa.13.2026.04.21.08.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:52:25 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:52:23 +0300
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
Subject: Re: [PATCH v2 13/20] drm/connector: Add new atomic_create_state
 callback
Message-ID: <kxp5j2tsermgycxq2wtxsvfml7etawwc7mew523rtkynp2x6oi@trsnzjwlnjto>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-13-c63f1134e76c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-13-c63f1134e76c@kernel.org>
X-Proofpoint-GUID: 7kdowbfJuiqEelMjFzluDM4pF6n92GSN
X-Proofpoint-ORIG-GUID: 7kdowbfJuiqEelMjFzluDM4pF6n92GSN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NyBTYWx0ZWRfX5sxUcRv580Al
 kq5YysrOdcabaLcG+MP2qFoP5Ra61qpWfyqigRbUjAxTo0qQcYHHmnTYvW9mnFiA8uG+UU+U2S1
 Y0k3bsbYP3pcs8kzeR5+VrEnNq5Y3+bTKvA5EqgYLLlquFIC0Y9a8KOI6dLaXvTZslgFVnGl/b1
 SY9Ri9agXk7iU/49P9vH7oPjAqUOri7tFiaruqaJv+/CK2cu/nj2ytJsj+MeDa6bxGTL/D5WM0m
 qWwxKnf/JpHliVNe/IYgV6xG0DBGQbqO0Lmu2LbsljkuKI7z0Px2XoXs2/pzkvZYomV7mT1toNc
 y6F585CsIRQIYWTNzZYN11FGc9UkMugbsoW5Ni8dDdaPBuxLgEYTRs57yrZfaDTSIO5LOg+a6uy
 b5vfqwzFy4L2czQH/QOWwbVNMa5PzSgtfgrs5u22zLGpmsp7ktdNmAliVXbwnKGW7m2wGyaQMfh
 LrE8LWrJowr8sHmOIfQ==
X-Authority-Analysis: v=2.4 cv=O9cJeh9W c=1 sm=1 tr=0 ts=69e79d3b cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sh7rbVFwc6wKdXg0ZAwA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210157

On Fri, Mar 20, 2026 at 05:27:20PM +0100, Maxime Ripard wrote:
> Commit 47b5ac7daa46 ("drm/atomic: Add new atomic_create_state callback
> to drm_private_obj") introduced a new pattern for allocating drm object
> states.
> 
> Instead of relying on the reset() callback, it created a new
> atomic_create_state hook. This is helpful because reset is a bit
> overloaded: it's used to create the initial software tate, reset it, but
> also reset the hardware.
> 
> It can also be used either at probe time, to create the initial state
> and possibly reset the hardware to an expected default, but also during
> suspend/resume.
> 
> Both these cases come with different expectations too: during the
> initialization, we want to initialize all states, but during
> suspend/resume, drm_private_states for example are expected to be kept
> around.
> 
> And reset() isn't fallible, which makes it harder to handle
> initialization errors properly.
> 
> And this is only really relevant for some drivers, since all the helpers
> for reset only create a new state, and don't touch the hardware at all.
> 
> It was thus decided to create a new hook that would allocate and
> initialize a pristine state without any side effect:
> atomic_create_state to untangle a bit some of it, and to separate the
> initialization with the actual reset one might need during a
> suspend/resume.
> 
> Let's continue the transition to the new pattern with connectors.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 45 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_mode_config.c         | 21 ++++++++++++++-
>  include/drm/drm_atomic_state_helper.h     |  4 +++
>  include/drm/drm_connector.h               | 13 +++++++++
>  4 files changed, 82 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

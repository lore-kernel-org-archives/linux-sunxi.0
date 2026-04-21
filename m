Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B73366054
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 16:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787270; cv=none; b=BtbGSj6dWtzfWdplW3kSvfCaFgQCa+ucN68fX6CEQrnhr85lI4CwWja90bdzeDsfbCXqetvaAC7LZnR2Oa0XpVOJmhHPtR17MdMuZ/Q0rLx3hpnnlYH4KY2J3mruN6Qf7Uliw1PLe1a3jkkLfoOlRmSzHz+Fnc7/Gtj3qdfE/wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787270; c=relaxed/simple;
	bh=K5A5IBj81U0pWcmLlm9AaUPwcY4KMqLy3IiFW5rGiTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAA/vl3T6/Pm38xqFiWGWKyrKqjn93tQs1Q/7c2s4rznxWwB5Cxm8J2NoMCDoCr/Ui2TFPJZKZXaU0FTzUWIByPyHFcAluHozOluY4MlW68vo5w1QV6/cPt82iRKIje5rZbYcWifshlTlPs/gkBYDMvqz8cUm/LrZlarYn0PgQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzbnoL2g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZ8JQv/y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzbnoL2g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZ8JQv/y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LAkUgP1011865
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 16:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xLFoe4oGDCwTz6b0lGYMIAWT
	Rfszp9f/hXCp89ws9Mk=; b=BzbnoL2g7OaAxndjxnbTnrQXShsD7Wz96KcjUSvZ
	6Tsi/MRp0ynlWCK3xvISh++rq4+7VR3d4KxiUGp5YwU1KKObEivtapREcPNEd0ML
	9LsVPbRM6PWULYn7gISno1YYB4nIyRkS5zUU6y7Qse/xBRmki1c+KmEc6x/PpNHu
	WpwMDahQ8BWa4r2R1VEQW7r9L5xiz5hClS3Lh8YJZ8Di1Rmn/uUoACo5ot7CLtQ9
	R4G/ylpBTDdx4hMXttsZkARlomwjggP3jXUOzeY0jyJoRb0sK7hxYrVVO9ptY/vN
	TbwIOOBIlm7oYSFE04tdIxEIYSrRnpR5Fs74YVyVMxMbpg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt903wy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 16:01:08 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-479d605705cso1801885b6e.1
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776787268; x=1777392068; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xLFoe4oGDCwTz6b0lGYMIAWTRfszp9f/hXCp89ws9Mk=;
        b=VZ8JQv/ykenAfcvSjMyiwltB57fbe0rJzEPqPbYkkJgMzkCCn/JB2Owrzfhiav27Ye
         IM+PUde1ZXA7hP5ZBrUozOz3el01v2prOiC1maImSz1uwG+wApf8oyd8heGq30U3D+Yi
         U7P9Ub0mVpZB6ZRdnfSoNAK7Hjx6Ghq80t+WhwTxa/2KO5NDgMpGXQP1e67n9Qw3e+uF
         uwgtSKxBzmJ/saFqnw/FiIIcbvgb+edJJCPs1dBJzlE15Xm/C4hto+hIgRLvoWGbO6Zw
         BCgpaNsAElT3T7VZaJ2NgXabT9g4Itnoa4+WdoOz+neAc9hHRuFDS0qe8sM58K036NFL
         9NUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787268; x=1777392068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLFoe4oGDCwTz6b0lGYMIAWTRfszp9f/hXCp89ws9Mk=;
        b=kPo0hhgiMWCUZvDLFsxm7VA8uUdeLBfJpf4RJhTQihljfR5Si2Ws0K/C7YUAOGUUYk
         +3YPYRVb9YVRuYKi7AIRtQacnbrQ0hOz37mPxWJDw905kn4s4LPhr3bWPbvxx6+9cBC6
         FvU8HAChP5y+c5AXSJXg0yacS17loHShZsnYNDf4q9VFPKW3YQfq+vsUF8vS7zhlQYtm
         vv45uWvT2gl8HTXdQmr1PUxeWCJQdAvz/uW6HRWP/8QJu/MbGmU1jNWm7qsZ2uXNAtzk
         xvlN1FUTqAnrVwofpAwDMBHavj6+BLzpL58tzG0iBN2HTNuCzVNdmun0HlUkcubQt8Lg
         wbxA==
X-Forwarded-Encrypted: i=1; AFNElJ+afn7s4jHUuFjsZaPTrGmmgd4a69OyvKWyb+4F5F1AFsa51XfvKEGaAMdIVCf6/Neo6K7Beg4gtZquAA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFSNyvG7/6gTPs3Le0PGSaaKpr3qnu1vpqSTKl9Wx5GGOvUe8n
	K2waoQbemSfK6zddz8cU3Zmzy2I2teqJ0o5/uEZLvHrdW0Bu2KxbNBSbQEOBJU/c1niR6wEjJKx
	tuvnzOYxK/Ba2IZ32u+zugStSX766p3sR15W0zS3KJ6k8ifywuwvVqsRAADGNg8OctA==
X-Gm-Gg: AeBDies8gmPnuN8hltx9yCBlBe3Vghx0ljLQSx/mp6b1bYv2GklBsc24BX4n8ezOsdY
	T/hK3pobZMnmygXdg/NiFsk9UWKECoO8x8TRGxt3BxqkeZ/LgMvRbghnys0YjgRJ2K/pddSQFCo
	bG2OxiPwoBEsN6pWUXrDLBumvOtagsVyJ+mzPFGdMnaSC8S9LILBJMkhl9T5E6hQakDLNuSClWD
	FMQYZ9tvNi9sfIcAym2cMQ0ZcnaemZBZ4PrulVaCf1gJ5KTxQQz7aPjZLfXnZ6QhNJ/FWAoiW0r
	mPg1PTdakV1T+691thm/++QaFwxQV0vFQvnFHPs1LQvCtwlAaG+c7eoLe7G79ESUOmiQtCv1lmm
	DQlJwa0yOb4zN04PNiqLjQm6rAsvoX7GeZ+8NRgx3rsxrNORxFGaMwGHvpyocaUVx5UxZjGssca
	PAeaiGo+erwFjZMvrXYAyOQzs1yPzaurhcshV0MxI5J0cs0Q==
X-Received: by 2002:a05:6808:1394:b0:468:2a6:e32c with SMTP id 5614622812f47-4799c914da6mr10924381b6e.10.1776787267346;
        Tue, 21 Apr 2026 09:01:07 -0700 (PDT)
X-Received: by 2002:a05:6808:1394:b0:468:2a6:e32c with SMTP id 5614622812f47-4799c914da6mr10924279b6e.10.1776787266651;
        Tue, 21 Apr 2026 09:01:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad143sm3806113e87.7.2026.04.21.09.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 09:01:05 -0700 (PDT)
Date: Tue, 21 Apr 2026 19:01:03 +0300
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
Subject: Re: [PATCH v2 10/20] drm/crtc: Add new atomic_create_state callback
Message-ID: <bmw2xqyaam6rr4c25ccxonvd5nglrw4iihiy5naznozcevs67h@ub5ycjvfrxjd>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-10-c63f1134e76c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-10-c63f1134e76c@kernel.org>
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e79f44 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sh7rbVFwc6wKdXg0ZAwA:9 a=CjuIK1q_8ugA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: LJTj-ubxceUbICG3cPT0ZNg48i5BPD6Q
X-Proofpoint-GUID: LJTj-ubxceUbICG3cPT0ZNg48i5BPD6Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1OSBTYWx0ZWRfX+WGQYE62jcFG
 LVmGYajHfgU4Y4yws23VCmemPL3fkiguAUIyfy9kijQr47Agmi0CQURfFPTpRHY8xKXNTSPtv61
 imsJqq4zZzKCSl/N8EazZTloEnmpV6xJ3ZiHRQK8o59Vdm+fbHl2yiA05BIJeu8NNYFf/0AZDPH
 j13n9UJF6vaQiAEhJyyFWSMjrx/XUGoPQv2lkA5Y8vOCSCzfdfCfhCV/cDJ4ok2gzqGUKATiHlx
 GacuEQyg8Cj5FzChlDDZ5OtPfGffYiQWwRL4yFT3p3tJeEsmoEATeHcHIfSaZWg9d4vWZA17soK
 J4cTcBI3YunfxxlT1toLw6V1taKZNC8kk5zIL5cnuMjeJD/VPWbgG/FpfLA8C+/r49nHRX8BZo1
 n4RQz9hcjtt3J0lxDAOct89q+HB8OkMKJdaKbrzGT5leJo2ipMlbgLhSO9LvPmW7MBSuCk/Wf5v
 DYfaanIfZ+uX8QzeFdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210159

On Fri, Mar 20, 2026 at 05:27:17PM +0100, Maxime Ripard wrote:
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
> Let's continue the transition to the new pattern with crtcs.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 47 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_mode_config.c         | 21 +++++++++++++-
>  include/drm/drm_atomic_state_helper.h     |  4 +++
>  include/drm/drm_crtc.h                    | 13 +++++++++
>  4 files changed, 84 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

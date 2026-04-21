Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5D0286415
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 15:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776786629; cv=none; b=e3fD0Tu6xPs+7ZojloMa4kt14iai1vWb1kIpe64oMlqWGheLJAuKb6Sm7/gptxTmjqScrGKNJDlfykjbW1zdz754Xhq3ETjFGTLlcB5PsB1uS1jQhBq1M5AaOLD9V5cbhmV1rhfNqXXRwJeRmK3y/qSpqOXXHmps7Sp0FGhO6DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776786629; c=relaxed/simple;
	bh=e5GRbzNci7FLYPqw8slP2lmds4VlbUQwiLg1BD8H2tY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emAjPnKi3+qH0qE0jNEVkC+12gKl+kk+cJYRH9J+tbgTzzTa6LHFFhs48PU+g/2C/YvBf/IeKu0px7/cNzzRpepvqkCGDm/Q0tGtAjBPqMRMJCNQOfcP7Mi0UCk4dtE71K/RmY+lCHE9vYC0TJrQDyJUDyXrXCqETCNXl3Svws8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oK9RP7f8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dy7Gq3+r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oK9RP7f8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dy7Gq3+r"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LD6xAK3574144
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 15:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hto5MsLIcmZUVCfT6iG1LCNf
	XNnKxNxx4T+khh9MBY0=; b=oK9RP7f8lu1aYiEjyHk0aEqVOStaTYP8ae8V/J7A
	fzg+ethVOI9SKF2wkvXHoNExyOeQHiKBw03ubwQ0ZkxOuxchLGZaDFZD/6eke1ER
	lWh045Gz8CLO1BgAQernTvNiezf//bRho1r23hw7uvbfJWka/ZD7lTQ/l3Nk+3K5
	fsBJ9vLY6luVvAD3o3j6arPyJnsZmRPdwdM1yA4Bxa88vQleeuL8u+64rbv8TAog
	uyjMUw9MZx7XXEO7S+8paqmukDnwv6a9YWK9iQ13GwdEeWKUjB9WG2TjV/FvCe1T
	jdultxl8/v+ktl/VbRYH0wCB+VxraY7Tog1iwrufH9q4DA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp465j1dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 15:50:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fbc49bef6so5616751cf.0
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 08:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776786627; x=1777391427; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hto5MsLIcmZUVCfT6iG1LCNfXNnKxNxx4T+khh9MBY0=;
        b=Dy7Gq3+rJsOgL4ksKrzPhlVxT+Hy4tgmug7rlwQ88fv6/LlK0jEgNfCCAjNkJZRRfG
         oRJHoEvayCxUEUftF0WUxmm9OmEPl0mCesi/BOJlSQCiOlR3oHk52J+omEqvFEafQnCt
         mDuqqh6uI5bvD4sxLE0MIR88JM7kHM9kMvIB39vFR1Pb4jm+1bw78cE50y5/1F5bHc/T
         5R/cCvF5sYgKeWRZUpnY8uniQHoVKlZXs6DazxOeou6l5Po6YrIAy+L2ShsUWcIltp8P
         DkSnbRO89q6u+ioxDqcFugo8AXPQWIqslceaLqpzjCzWqF1UpiWq+hk4X/vu5GXhnch0
         5v+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776786627; x=1777391427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hto5MsLIcmZUVCfT6iG1LCNfXNnKxNxx4T+khh9MBY0=;
        b=Mv0v3z6N/UhJ221z3+/bO81n7Qg6/np/tExuEtvfOHtYjznFU+1Qa0Lo263/wppa+u
         20VOl81gsD5WExZycLAh1Erse93QnoJ2HOLVEl24v9rjD5u0XztbLkL2LC2pP57QuLBG
         hbKgxcb44OfFpbf8wb8BZcelYDzO7WGd4sVmlrpLkWShbhSghed/TGtUwmMuTR/1Y7mh
         oikBmflV8ylju3QRwteAKaApblpWQxPDkYFGoqKGecr4FkZu/3fyaHjKnQjcbpvufrcN
         uHDgONSWrwT+WuCWey07cYQVoMOUUmdpAuGKqGqHjcND7UE+eGoItraD68cZDqFtB2Df
         eGCg==
X-Forwarded-Encrypted: i=1; AFNElJ9/V7tGejMJRmtMNDziInZS8u7b122SfAgKSr2FZYdRjhxGv4GICIXZljDrvm9fAuFhKUyNqAJzv6HcwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp0klcHtYZJB1GMxoKTyAcK9otTRY716O1KHduJRVAqCg3oQAK
	nbvq4sr2utHP1aqeEW7GtMeoiu3wVELjqPLbO/zEcnlakBZXdcRzB2dlQVeILWDYwraSFZQVvfR
	DjnhtdMwSnnIy5GrSP1Za+YNl0f5lI26/FooRtMBX31L6UK7I0mlFuYpd10e1r3x0Tw==
X-Gm-Gg: AeBDievcJVfHjyFqkBoF5CxIAYI/8EO8l+n1oymgfIhjdqQGb0sDWkYZ10lfM1K10M4
	Te8cwlcGOLBBybLhxLrecXXEYLijGJwkYbljTcO11rXTBmX47DlwT7wgHhA4NxonEcQswDFZC/V
	dCDf9bqTiN9IgbyWW1Xl1v/LbAeg1XfYS77SddsVhRdik+7PyHiwRItYYHHRnFPmKI84X0hwDYI
	fAEOSJfnQcotOuNSMgq/JAbFu9QPV3QC7+AD9voy972ddTMVIrOjwxajr7BQuHvjj14KSf5vajt
	ARvgLi9VOe2mfatQ8yev60ZF5vN94MVo7dxKoV68vHJs815gVSvUSigMvjyhg6P0dEcTeSctOsC
	YWlbmwr4S8MzRnAJF901GELBVNmDwZxJvKYhF/+fsudCd5Nc738m9Ov3/hbrZ5rsY6mouNHXp5u
	0yb7085KQTEDdXddGk7198XW+OUWWnZ47Mph0oMzTWixl+Yg==
X-Received: by 2002:a05:622a:5c1b:b0:50d:a71d:810d with SMTP id d75a77b69052e-50e36e9c5bdmr268929841cf.28.1776786627044;
        Tue, 21 Apr 2026 08:50:27 -0700 (PDT)
X-Received: by 2002:a05:622a:5c1b:b0:50d:a71d:810d with SMTP id d75a77b69052e-50e36e9c5bdmr268929381cf.28.1776786626578;
        Tue, 21 Apr 2026 08:50:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad11fsm3739915e87.14.2026.04.21.08.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:50:25 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:50:23 +0300
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
Subject: Re: [PATCH v2 11/20] drm/atomic-state-helper: Rename
 __drm_atomic_helper_connector_state_reset()
Message-ID: <ogjitbayzgefsouxgwhjia4vzmmpfagupddmmoxokvdscjouqo@dyaz5v7c4lyh>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-11-c63f1134e76c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-11-c63f1134e76c@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NyBTYWx0ZWRfX6Ne6bCroAirg
 w5EeSrWMvgr/07au89A+DW8OjtgFKMAgTMB/It5QJne5/kgTJpYEE06NGnF4nuBJcrwbkl53KdI
 PqyNWvL3DnULwaPNSFj7SshZ0mtrW+LTqJFsecPdgqE78kz3d5fleYYBDhzWGSM4oVTo4kWKXE1
 Sc5azI92aPgt/g2CAsOB3po6wLiGXWxWWFRmsZ45eaQLiwlngBepotbqbmtRwgaTRYylMAkoAAK
 qrWKduI09YxqPApDrpXUHli27bweSuVui9MpiDqpfXg1ZTyMuEhrRIyLXjSgaljunuXKGtqtaGJ
 swJPYXDJ3Q1ovAHisu1QVN3GNOLhCldR2HKdvgvY0ZZ92B0JSimnbLi4xTYjYfgyiiALluzavdO
 dNbJ+Szs6ADGzzHsLvgWKQoyNGPLU+RGmuzJ8nKoC+sZFxecQXX3S9sh8LqzEOxvRhDGZUZsQOW
 xka4cfT/gxqv3xHIBfw==
X-Proofpoint-ORIG-GUID: fqRbibQzFG-Xy4YYS6LYEs5oSPWxLFON
X-Authority-Analysis: v=2.4 cv=YOSvDxGx c=1 sm=1 tr=0 ts=69e79cc4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=P1BnusSwAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fOc9-Nj7kuNS0fQUIscA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: fqRbibQzFG-Xy4YYS6LYEs5oSPWxLFON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210157

On Fri, Mar 20, 2026 at 05:27:18PM +0100, Maxime Ripard wrote:
> __drm_atomic_helper_connector_state_reset() is used to initialize a
> newly allocated drm_connector_state, and is being typically called by
> the drm_connector_funcs.reset implementation.
> 
> Since we want to consolidate DRM objects state allocation around the
> atomic_create_state callback that will only allocate and initialize a
> new drm_connector_state instance, we will need to call
> __drm_atomic_helper_connector_state_reset() from both the reset and
> atomic_create hooks.
> 
> To avoid any confusion, we can thus rename
> __drm_atomic_helper_connector_state_reset() to
> __drm_atomic_helper_connector_state_init().
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 10 +++++-----
>  include/drm/drm_atomic_state_helper.h     |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

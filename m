Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5335F2BE7BA
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 15:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776786614; cv=none; b=oeALmJWNdVQUncQ46z0xgKlCxOMacxOZPy+rfYx7gnorGBIMoGWX3SDv0jrpBD7mhvgPMKkDtH1pvqbNhmC4o23soJBou/8ND1ihr+4BHXXiJmqYeFeyxj9NzpMu9CedJxnSB0X9fVSIUPHa3SlJdv8d1/s7dPSsaAViRm7/xGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776786614; c=relaxed/simple;
	bh=eX9z/nS9NLqTAk07+rarrdCjtxJOf5SjHqSwKmwuoEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YH6G1dvQH3oDYJ1QsYe8sLMgnHbqUzpGqiFgMAVrxxHR12eai3dhpdpQq8kxHij4epjDqsYw4PAV7VZTNxScQzsqyFkewQuDSY3JVcC1C+ILk4nBqXWR3+HzIo2tLy93UKDnPw9YQ3D3wc+V955myrauEs5tRiqzHbHrtclqozk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3JfPtk/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDONJ1Zr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3JfPtk/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDONJ1Zr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LD6xAF3574144
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 15:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mo2f7WcLf3osCcteJk9O/SCd
	aTHE9e4ZotSTHgD8zF4=; b=T3JfPtk/F9qTRPbRfkl7o2BZSzyv+JBhAXxS6ttT
	MOSjxvRnI4i77iSapmiJCFDnVsEq0QW/Jtnw0oP+13HCbJQZsbIl4o0nBZ7BM/Ak
	dIm5WQtrFpcHBrWUTfX0DPJz2/3k1CpYkjeUEJsBotxlqW8cHl4C1IzB9EukfqBJ
	WziBCJ4gy7miFoopX+oh4xsVOQF0GNzaP2l4PhxJYGlrDMcyomR8Wgf+5BvOL2B9
	dB4LcWEqOCSN3Mkne/6U/Pgvif/ICIcmjzDdVgPKjCyZVEtz3mctUrd2bbmrhx6Z
	XFkpDlnDUmrRcpSLJdCXg+25TftEYna+RLl4BXLJNiiZyQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp465j1cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 15:50:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50edf0245b0so46029651cf.1
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776786610; x=1777391410; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mo2f7WcLf3osCcteJk9O/SCdaTHE9e4ZotSTHgD8zF4=;
        b=TDONJ1ZrpZR6m+VgBwd7ntSn17GmfX+lw5OWwxNzm7tXlpeeZGUvDUc6lisW9MilZT
         HzU/Ngd931DVwyxTJ0ZTq0KWhJdDjG71Ie4OhI/gQviGexP37LdmAMH9z5zozndBx+92
         weaMS24Xd19SS8/wjMutipMufNlaM6/uXJxwlyod+qyOGzMwhuT4MAHj7FrJFkQJK5YE
         2KTwdQhnkVlLIe3JufNcF57RQEKp2NM9ohPy/fF9VwxiSlp+4rMjtFwYuz3mkxX9xXDe
         DhR0ZT083LtKSQgMDYeNCJ55mWHpk84ev2MmNEWaSkpS5J/WcQfjr708KP/YukTmSlcf
         esHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776786610; x=1777391410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mo2f7WcLf3osCcteJk9O/SCdaTHE9e4ZotSTHgD8zF4=;
        b=QEQGIw8TRI1Nt/eizMjWqtN5R+xB2Yr1uGGTjCuM8clW4nrJGNp//CobKR1weUmbD4
         rJP/yjPKoyVZY1aI19DTIKXYdGo4JLDUXohOD8km6n7JFK8Om6Xq9VuvDwSNRgzbo1vB
         427GrMLS5GYSkLnI2cAH0dsFUxo4KplJC7gnVeR2QoZrnlpbltm/z0mZWQttZ/d0MCqz
         Cw1HDuTYYrVi71z9hK44/Sw5RvaQd2aizts6a3Vo33/bKRZk9YCsfY257K+ihMJ6s6mE
         nZ5LZQ5+m/zu7HqNsNNUwfen4iwMqfCcpXphvEvJ7aNddXVXkyxvGInGjSTeR1UZ8oG/
         BL+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9FMkD+thSx6a3pniXDIhgf2rcX6wWSkCcXen/IC2fU51pM9opNLKBiPwwgxAN2zGhqvmOv3tpii3xkzg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTawxGYhMu7XU/X5+HK8g4IvScHnvWcKTTv6wJliP5dp5WrYNn
	+AmZ5V5UAGmBtSxx+AwNoNLB4B+EEKiymuYa7x4wMDisfSDxA1hdQLDPacjCdhS99p/j8rPGLv2
	JJWM1hQ/Tksl9Oxtd7fhJ/oDoPZiUPwoAshrH+p95OcizVJYnLa0v4/uJgObUzKUXzA==
X-Gm-Gg: AeBDiet/zeD4KZs10iC1+3V/2uUT5FIROLChN+IrWjL8TbQZLEeEiz3sUfw+qMRq7f4
	2xSrDsNyAalBIeIxX6SiCGh8/vbgkGyGJmH/a+DAPZxrRTMD5321r0jn6wzAvh6N76eoIqNswYc
	GvWdxnUxO/xW8r32eTvhu7KAbHGU+O6pZEarGgG4/JOVli395IIaOjhsZi4BnO/nX/bIhH27Coq
	Zq3pK50ikjUATbVh9e0EFsQaoP4i34BRp5SSTEqPK+YtZJekaCfhKibxnPPQE0Vo2WB0l05KnQj
	jrdGxnQCukmHiF5kjWidCBV4az+/HqdEfw0iZNhgVWVSYOKMD/8kycrSlHVDcTYtDqKJJ1mqdU/
	WFaR+xYv4GIXUGFPEWyrUBq9W8Ferb1fl9cRTA9OdeC2DtClZbTrK2TPXfyKgd1hg+LRh3e4mfH
	2Pcdbw2EHmMRqspiOR4WLSZ2G923vdpf+Ii45PK50FlYyWvg==
X-Received: by 2002:a05:622a:11d5:b0:50f:b732:202c with SMTP id d75a77b69052e-50fb73225a9mr33343481cf.19.1776786610359;
        Tue, 21 Apr 2026 08:50:10 -0700 (PDT)
X-Received: by 2002:a05:622a:11d5:b0:50f:b732:202c with SMTP id d75a77b69052e-50fb73225a9mr33342531cf.19.1776786609679;
        Tue, 21 Apr 2026 08:50:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c8a33sm3824506e87.36.2026.04.21.08.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:50:08 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:50:06 +0300
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
Subject: Re: [PATCH v2 12/20] drm/hdmi: Rename
 __drm_atomic_helper_connector_hdmi_reset()
Message-ID: <5me7yklungth6sss5okogfwtr2ed47fwaq3rxnfbhjqgauefis@h2c4kbfk2sqe>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-12-c63f1134e76c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-12-c63f1134e76c@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NiBTYWx0ZWRfX2ukpjJGdrOd1
 qS9yFXBiMhpSk/lqTM7LuEqh/Jp32zizGHnmAREOQse/wAdktnMrboza39+qcvetbxK5Ek9hrHM
 2/pg3DfSI2ROxIZkHqpK62a/3U4kz1877TLGMGh3OwNxnMTh3UYGNC91xcmUMBSOM0ic3mfoYb5
 B3a4otfsJtHYR438rbAVjuerWh85iq8cnvbw2YGYRRDvawibL8xExh9GXsmreTn8uu1nUMeaco1
 C5Q2+XYzfpFtNcuAw9G1da4mX5k4WFN+8i6XpYOOVes85dqfomK4Br8VCH81IpxqEXV5pwfYSVg
 aNadTujn/PLqmh00VxQ6f43xgG5iszkc/NEiOksJAfQ0Z3E0TDCbErkQkDOr/XzOyhBlQJ0wj+O
 LkzwzEj+e2O0D1DHYea4k2WDGG34KAmnX/qmK75NkvlInM9gekzTe0wcMx5V/09TJvPykQGgkoe
 HREHVSoqWv1IlbRA9bQ==
X-Proofpoint-ORIG-GUID: F81Vzx2XoIa3kJp6nH_cX_SurI2E8FPf
X-Authority-Analysis: v=2.4 cv=YOSvDxGx c=1 sm=1 tr=0 ts=69e79cb3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=P1BnusSwAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fOc9-Nj7kuNS0fQUIscA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: F81Vzx2XoIa3kJp6nH_cX_SurI2E8FPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210156

On Fri, Mar 20, 2026 at 05:27:19PM +0100, Maxime Ripard wrote:
> __drm_atomic_helper_connector_hdmi_reset() is typically used to
> initialize a newly allocated drm_connector_state when the connector is
> using the HDMI helpers, and is being called by the
> drm_connector_funcs.reset implementation.
> 
> Since we want to consolidate DRM objects state allocation around the
> atomic_create_state callback that will only allocate and initialize a
> new drm_connector_state instance, we will need to call
> __drm_atomic_helper_connector_hdmi_reset() from both the reset and
> atomic_create hooks.
> 
> To avoid any confusion, we can thus rename
> __drm_atomic_helper_connector_hdmi_reset() to
> __drm_atomic_helper_connector_hdmi_state_init().
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c     |  4 ++--
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 14 ++++++++------
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  2 +-
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  2 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  2 +-
>  include/drm/display/drm_hdmi_state_helper.h        |  4 ++--
>  6 files changed, 15 insertions(+), 13 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

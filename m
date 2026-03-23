Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD731F5EA
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774238892; cv=none; b=G/tZQTPlpBKXAs838/eJSfz0l1ZSLbm4JKzO6+0nU4y8T9RHcT5cSTu6wrmKPvYKZ02V5WJ+aiDOfcXF8fVdStPo90wo66P5sUnxXML68NnUkBbo7UaXZZ+8YQLmyYcfcXXYxVfQw5Q6wBpffc0Okz5kb/5+YpQ4lgtKhPhsz+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774238892; c=relaxed/simple;
	bh=M9xsLMNo3hXRbNwmOqn71QokWs7Z9T24Sscsu4gv2fI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkasuY+bU+4mWHz95U2AXa41CWZEgVT5YURQGCZSizpH9jFixkJDc2GRW5nqRq0U/OyD3B0HQCaDYmbCHjSqtpoKbqXUUQKLbyd2Xc0N39SsBrqcIIPmM7WSnscfxyxXkzYVkSAPTlsdYw0QzCohUh0DWXvo6CWwH6YKWbkhK+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1R5o6Sc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h2g1Vu1N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1R5o6Sc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h2g1Vu1N"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MNmsN01231689
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AqeC/roitS7lz4atrPMGBHkG
	fv3MPIQwtd12I+kF8Sw=; b=d1R5o6ScrRpvUSm5twz1BpFPnyTr0nJI+3j9WZjW
	hauYc6RhhGiqd+eNOVlzr7CAZVGa7x8+3pn0dZP+a22f64h1IVM2t7WminprqPl7
	RHOpEQS3XEmmJiZ4Z2+lqufwyhESST5agXuk8EfBE00yytBbnZnQ6k0u09eo/Ic9
	3qVS96LHmLZFbHfSXr5GM6ssgvlgL8Ayw17+6O2sg2GqQN7jVjhYjs8S3NwJYO8h
	BvmS48hH80OR5xzCb7XjLCdOEZUQQgCGVIYKKrTpOREmP2onis8Dz3+/TUkzNarq
	szGpXPPh1RkCsb+Y0Z9k+UKIRga00lpmIy9X+lEYgm0crQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9rbp57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:08:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50917996cfaso36632751cf.0
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Mar 2026 21:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238890; x=1774843690; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AqeC/roitS7lz4atrPMGBHkGfv3MPIQwtd12I+kF8Sw=;
        b=h2g1Vu1NbEBGfbEnv7eqvqBHX727aY7u+/wfSqW7I29k1I+c5iiNAHOTVzh8oyinLU
         Yd34T6ppI/ADeVhydwM6llukiruNKnJWeccCCnhYGnvaXiD1HLw/TzQeXAwoMEG+jscF
         YphHDaDstmtpbRlqsmGQV0/tIDOBBMR9gSrO7+gkpzTOCZHVX3Ol4DzG5vs1K+vddwB9
         FQ6wsseAIrtr1fEa5Z/5kTop472gmDCS6jWUwfJewA+s8tKn0YfHe6h+KQLFaTAbnuhj
         bKG9q2OCp4QNlYM4z0kuexQPJD1MX5xvB3Degl+6I7zTe3xfGFLzyrmxl0G48RFWHuDJ
         Odig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238890; x=1774843690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqeC/roitS7lz4atrPMGBHkGfv3MPIQwtd12I+kF8Sw=;
        b=Kjq/pUBECuNg08JsWpChcTXt2jrWyZMhFciP8cfwXdI0+GEsSBNQEzaW7MXvHT2NCO
         LPojpAWx5MIu5jRKR9JtBUynZUPRPkTdix24t1eL1ZNZZNXFjDVYrYAh5ucKvJ+lHCQM
         qfEdQTp/iCnT7ab7Ciqa2dXP74FMNgbSYBPTFDtvSvPDeCtvxTmTL06iMwsbGk1chmEF
         Qr8aXmbU6NHNYpKQGgU4Bdd4dxjORWd2QC9e2yba7mxH4lCTq8AgpI52+hpkWntCMdvx
         tOK57t/XwnrRZnZzgEmQGAkq5SttPgqDBsLHhUMCu7ou5Hg4Ji9rTfMqAMLdVkNvzVys
         nDdw==
X-Forwarded-Encrypted: i=1; AJvYcCVBrRP3OawVYx3A+5dJXW4davVFz3UoklagW3fzI/byJvh/8Cs0sTIM15Tf5AxNDTQAotbU49RxrinkFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxY9YZ5CqffqMdgRpYijGMwiBj11+ldO6ogwto1K1Qf9eK88GKr
	TajKtQh03CxOtl9gpAsh2z6ykiKZVE0f2eEbOJUpOo5cWRFl5KTPfI9latI8rTnWDCpDWVUHySh
	OWx5h0US4zkn5CRtPS7vRYxI2iygIugyoT3BQh5ldjY77q+NSGeB7m0enmK2jI39bPQ==
X-Gm-Gg: ATEYQzw9YOqMyaDBVhvKoNfG5D3ATajXNrTO3fVMeojq3rGRwwPxpWVT76wCtHNtsE6
	Ut1eCB20zg9LsmF7OxglKnM4BVw+likTWg+NPfncifQBQBlZhSNVRxcMZmXJMaJCawLhfPo6/Ct
	YLK0QNzzKOtGrZFkr5FUKZe61qOoMSXWGAtTGpC1YLUHnA4f2JOo9KDu4ZfAxFusTpJXcLNOy1M
	FGnuGKUtP+7UBq7zNUgyhjqnMgg1XnbBeYnDzlYWbVDlgIkjMgttBhfuL4/Si+Nt3RzFCeEkhrH
	utW7vdqmBFVFYz9Y2Z8x2rjWAAAf7N96NRp8YvLFcYb4FZwwUL/O5/fZfqBBYjLmWVXXHo2zuVQ
	JxNj5nTLFcVWUhRI0BCdo9ksdcKL9htXKSNGEDSyjpdXVfy4H4VZdVUEDY24JXxrP7yh6sszzwT
	VHE0b96g/6f6Jh8R3b5Zrstpajc1AaTKtBu9s=
X-Received: by 2002:ac8:7fc4:0:b0:509:2ef7:7034 with SMTP id d75a77b69052e-50b37538e75mr168613581cf.50.1774238889738;
        Sun, 22 Mar 2026 21:08:09 -0700 (PDT)
X-Received: by 2002:ac8:7fc4:0:b0:509:2ef7:7034 with SMTP id d75a77b69052e-50b37538e75mr168613281cf.50.1774238889243;
        Sun, 22 Mar 2026 21:08:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99820ebsm21316001fa.20.2026.03.22.21.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:08:07 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:08:04 +0200
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
Subject: Re: [PATCH v3 06/14] drm/bridge: analogix: Convert to
 drm_output_color_format
Message-ID: <rf7nfbpyc7ce2t4c23melurn226egzqfhk35wt7q7yaurkgeeg@yu4qhmtblpit>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-6-f3935f6db579@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-6-f3935f6db579@kernel.org>
X-Proofpoint-ORIG-GUID: pwYMhWOJIZb0d178vKSd7Zs5cvquXYZy
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69c0bcaa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O2P03feSXV0Fh_yUmGcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfX2Zkx28r75a5b
 DxvSts7DvRpbgRQGzGbog5GTdwNeuJUy8rRJ0qUBEEhbdT+BPZEmHZKlok3x0jqKCO00wUupGDE
 5LKdQ7UC6vRVkYbr0CY/rS1QNMPLJpRBtn9Qr/Z2hhyWJ6LwggzcazoHsyKI4uEov1Sjt/7ja0p
 uPAD+k5eq6+BLaUfQmsTv3QJu1sFYXej81ljqCFqQaOxAjboZbMDghIG79BLpjkoKLIfe7AujMX
 uptNPV4x507L37n2pVhymENGGdvNefTSBy4puscdrOprzJPT6meB6F3pSdE6jZuPh4aPqJ81RDw
 +1vrSamuKuYoWUTAU7AYbKgT0OTb3fpwDkyhBuTb+QNN4/yLBZhNRpaeAG122UgpNN4LuR1Ueam
 uUe2W021GcgEo/xaEK1M9/07oclVd/xG2B6RWbjMasyJwRmFKTs1lOKE7LBuAxMgvq/3khYHr2a
 IDT76TcqwXg+jeJkokg==
X-Proofpoint-GUID: pwYMhWOJIZb0d178vKSd7Zs5cvquXYZy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028

On Thu, Mar 05, 2026 at 10:04:58AM +0100, Maxime Ripard wrote:
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
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

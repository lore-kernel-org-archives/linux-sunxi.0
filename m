Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896921F5EA
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774238853; cv=none; b=q7BsrXLiBw0zKlWs/PIvV8PJGmoCffpIyK8vi50yNs6iPgzQhRHWBvzqe+o0WowaZ2H5QdECzv++D3cw/c/j9LYnBWwvHwENNVzn0Ttft7e8pc1wbfxOt5owTJZlPbjCA31FwbwBeohQ5jjtfMqtggi2hU+IJzwj/uF2eJEQctE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774238853; c=relaxed/simple;
	bh=8fWQQXZDDZ234lfsCAqkWcYndj7BQxtlIMpjWCVmQog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpbdhPfAOmxcRkikW20IWsBvXAyzZgk04tZrY4lal//WVPTV/bujwNhiMTX06XIzfBCoxC/sJiy0Y5crcuqo/8XD+1QfqD1/BZ06sjoYVPRc3J3NlafzpMZ3urafhaxHAQ83vOKUC4MlD2yRngc5dJCTNv6SIgFc6IJkMWB1N0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zw5SVhqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTsIUjE9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zw5SVhqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTsIUjE9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MKkXO8075280
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W5rwiOXF2FFDG/kdjyCGCZaP
	JLF8PoP6ImoKwsa95hs=; b=Zw5SVhqkPq2/cw3ADnBJ5wgBRbhd6YTXpPGmORtK
	L+Tm1dVCL2518ekIBX8K7LtOeS4wZS9pEig/W4AJFNe3Imk0sxFuh6st7w+CKMK9
	AWI7rERcfwXLEQMjLCzdN9cNk5WWl8SvuE4pgOyb5YQ0AjsxQlWyZQaFFoEKfHSa
	YSt6n+fVlQsmvAisWict0zJSnVNwpn5puup+flKkn7Y0GoOKdLjxqwv1lb0o5TV9
	YNyCil28mxaA798c2WvD6qRBObe8+XRZgFlKBNFRS4Y1QDhxC4+0Ps9QhnrdihZU
	m1tnxlVkDv5GVI+IyRuavtp5B2C8JIubTyevpXEnYAIf/A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e3srp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 04:07:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50917996cfaso36587541cf.0
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Mar 2026 21:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238851; x=1774843651; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W5rwiOXF2FFDG/kdjyCGCZaPJLF8PoP6ImoKwsa95hs=;
        b=eTsIUjE9UKb5GOu0pT/cu0BS75SL685FPmHl0c3e8Gfzm8j7G2xbGuv4pfuOpnwPI5
         woEL/tzQbSNNQsJeZM+S47P7ST4uW+RiwtsGM1f4CAGo5yQpjZtEUjN1moU593QSfPzA
         zBd88h2orHHmobv16eIDNphkQBrsDpY5O5KGlDlP9RhlrADaYUTB28Pz/aW9q14+H4i1
         lMMb9yd9KKHSWmPFQ/siv0spF6G3wIDMXXPlrQSDOyQLDn6z+ogDqaDD3Em+6HO2dVol
         MnQ73XzYfkC+Gf6ZLnNjN8fUOcoSbJPLieBcuPnn3scHaatUVtPrDyoSsClfvPsoAT+s
         I89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238851; x=1774843651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5rwiOXF2FFDG/kdjyCGCZaPJLF8PoP6ImoKwsa95hs=;
        b=Vw4h5adr/0qfQMMnAZFQYPEoUXR+DiJGzqKajkkZoluUD+a3iMl3RwYSe9/oMwd00D
         gjNV9Ay/V8a/p2JSzNqQ489s+PA2Zda1GfyfFkoCy2YnGiduCkdSU5fL8ZJk+mjY4U6x
         8ZvmXh4B7X149lzsiI/8cl0y9Zn3XvPpJaBMC+FHccHGC1PjL2iz/N02Ky/BSyS936q5
         7epL2KMPDCUYUhq6TWj54GV2C+bX3fGs0UaSnBvuQZrXEWiBky2+vYyKZZzRlYEObww7
         texfyTbaUB1VihIvlhK+ja6URFpb4P4J5V5IvutMNDgQ4XXaqjClmrbSk0MqBLJWjy2o
         g3Ng==
X-Forwarded-Encrypted: i=1; AJvYcCV/k0TDaIiGKw3yykIox70fvMLq+fSGA2Lby67I6fDu7hWpQDdByjjXOeFN9F4cTn1jGSeIGXsc5/y3xw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwkOsVSYdutayR5J49p1cW5ATToqtk1dUUwEEc9F/Avn6SMMUHI
	aW5PvOarOwEvGTyqQTEQkvpryCmyVpL48SggeLj+1xYZlM1fH256D4YhOiPT+n5Gyw/mHKKnHj6
	H68GXzlWxzcZzU9YgMrhDqfG+5258uLh5WzhIwjcU6FDeEb4+G51NyL1muoMdfFVg7g==
X-Gm-Gg: ATEYQzyYaIY5rNPUL4Lqcz0QVnEb1lco3MSIYDyaJFIplpde8lkBFFDT8D6l6ZMUCVn
	AHVUtH6fYlsQ6ltr1vOoCHCcnEybk78dg61vnAX3St2z/ucne8ZZ25yd+O81/uts5WLZA1TivzG
	JAQ2rTOKKXS4I1+R4AJg3dOYlo1ANOaYeFQ8BajvaeyPMGiA3dN7WJ3C1kmRixndGFVZ0afQvjP
	rVkwj3aVah5MeQFJBqVlCSB9Z8nkuN4yQFXdj1u6H5mvRB+4IzyyUvbOAGqRQ2yHWbnyb9GKbT6
	sGxpqHhCTSBYItoVt8nEwtFzivW+0TgqiMjJiwn/SdrlJC2NBX0IIX7r4PQDc+2vexzi3cTFHWc
	u56ulvWguYxqZy3sHSqP5Caro77iSSeM6gzd+GQiFrjOA70EgQd8isotXvOdhXNZsaWxGIx4Gko
	v5qvItl8UOL1WtMRHDcw+tdoEXGFEOdlwqibw=
X-Received: by 2002:ac8:59cf:0:b0:50b:2f1f:ffd3 with SMTP id d75a77b69052e-50b375682d1mr166637681cf.59.1774238850831;
        Sun, 22 Mar 2026 21:07:30 -0700 (PDT)
X-Received: by 2002:ac8:59cf:0:b0:50b:2f1f:ffd3 with SMTP id d75a77b69052e-50b375682d1mr166637111cf.59.1774238850280;
        Sun, 22 Mar 2026 21:07:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9981ecasm24919121fa.24.2026.03.22.21.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:07:29 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:07:26 +0200
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
Subject: Re: [PATCH v3 02/14] drm/edid: Convert to drm_output_color_format
 enum
Message-ID: <xip6aoymudbdakietc6qrt43irdajp46jrsdi27m36dfqfzqnz@y4stxqdxdjix>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-2-f3935f6db579@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-2-f3935f6db579@kernel.org>
X-Proofpoint-ORIG-GUID: 8I7ICH44ELMv6SutVF1WA1TK278A9FRf
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c0bc83 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_wym5JX8MKgHMASIHSEA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfX3BHFyR14H+d+
 OlELbj/lcrKGrC6e643lnQmW72iqNyUCr5KqhdvSK/Orug5qKT8lID1GDnnvhV1eEOi8Cnt5fp5
 8HSkb1kvTGoHQt7BJxilBu9qf9GditQFP/wRd7zwuVwqmj3062/4IdZvyaVMRPdQajAEqN2gOtT
 HoWQpWJFpKG4oLbFUtnAON6MMdiYzASWYp1UAnv1qst+8MH2FElwBnAMWDYAIvi/l3AAqMGq4ea
 CGekf0EMqx6XyAX73xYSFCo6hNlj1XjCt8zb75w2Z/K9biJj/bjOSU84oK7otDRclS9ccltaiIN
 U4tz9hCdjsKGFusxjHhZGLq81Ud6zLQ4yyAPjwK1s9iC4GsleJQDDBuDOthOB6ipyvbezI5ms98
 7d1H2Qh1UdJCE0n5zl4AAlQ4/ZPYji3uaJT0gz3tQv2BHlFSupbvj/p4eKMT1/+bsNSMo8HUPUs
 8OZfwQVOq5ZoAiUi+NQ==
X-Proofpoint-GUID: 8I7ICH44ELMv6SutVF1WA1TK278A9FRf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028

On Thu, Mar 05, 2026 at 10:04:54AM +0100, Maxime Ripard wrote:
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
>  drivers/gpu/drm/drm_edid.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

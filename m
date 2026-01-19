Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542A22E8DEA
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 20:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768853367; cv=none; b=azPOn4W8XwbZ7rZL914W7zLc7dZVu8tK4cZG0CZrzT++fBV97lZ9dcklHSUkFqw/GbY4NCdztUOf+r8eZB8Q5zr18AXu4vvJaJFZL1w1xKE68iKNoBNAPIHlzKY02kVGtepL62Ciz9LR867XPnueRcnCdMz6p510UnATQLQ1JpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768853367; c=relaxed/simple;
	bh=ngs361Loc/jMgUpdocrLwzdACWMo86/Bo8fgeUekqCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mtg2SR+TWjQnvepI3cQVyNkQXhze5VcxW5SYWsKeP8KfrpKugLlPJUvZ7hK3rFL8CNkg3TLeGoxeIKPSG0YEURtBPXa4lE5JpdhqxUeWbHSfX0LM40sqZdGvdfNiZ4volB5oShzVTLaVRL1pxgtcm3dlrLWKidqwl6DYabbGk3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HixMDnQM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ISGmFG96; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HixMDnQM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ISGmFG96"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JEoUc52305843
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 20:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8EhI3ALlg7ECBWd34gMawxDK
	MfILVf5/HCKOnC9/hgY=; b=HixMDnQMF+xXzNTOSJNpJXDSLJiYmaS5XEPdXgLO
	dK/AjiEreIPJaL1Ezcuvgsv7hKbCabzhXQlrgWBsEHBjc9Fm21mGAFRC0fmT2JwI
	YAxz7yPmS5RT0f9UyMVeQ5wDP28MR4Qz/HnWw7hPJc8xQPrXAo4OIl6jXNbuiPyD
	Q9hD5k4PezuXChJGxSYd1utiBLTjRFc3DPdmsJXERgF8JkWJcloqRoRR7YwXEBh7
	aaBomgaz3NiUYwXN1ZOdtNX3kfbII79vPd9n7/H3/dYJxP626ITyVpG9u/pK3qLN
	i9rp4oGmKHlwtoEG/qxPJIFV4ujJhG1VW84izBgg/3YpNw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bspqv8tvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 20:09:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a2f8e7d8dso134045216d6.1
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 12:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768853364; x=1769458164; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8EhI3ALlg7ECBWd34gMawxDKMfILVf5/HCKOnC9/hgY=;
        b=ISGmFG96PTAXdcv1jZJ1SeHtatLhKuvJvxHdvnYACuhqZ2y9nv7BZf27oQV2QFN0aD
         6retJDCarqkneeHWXzhj4/Z3DbjBAu/Uf5zlL1gfsUPgPzcV+7xMwfMQ3HApLmvV3OD8
         i8Pli3HSgVHpRewrZwPJW0xIhIMIZZJ5mdw4g1zTxcWEK1rVAxK9GPC/5DvVBnb1NJZZ
         gxo0t592Sipknr5JQDrX2QvEy7teG7xa2B25aXcENGfHV7+2iN62hASZg8L4MAybnqJD
         JgQMzZccGZ7N86kpzYuOGCfmdv4jZKEy4J1WyxA9/OKJuqaDg9hZ4Vp/HIbCSmEnsX1F
         dwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768853364; x=1769458164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EhI3ALlg7ECBWd34gMawxDKMfILVf5/HCKOnC9/hgY=;
        b=i1whxdWy1lQ1H3kmsUgRctyaBbpSPgpn5CJjrx48YOpJwGNiATRa4bLU4waCPQ1RhA
         GsHDRzrKxgceweudcDMtGrZLoBvNG9KoVHM/octItAnRkrkPzJGbnhhARV7lFTfN0dKY
         qIK+CvfBwEt2VtMS8N6sghgDEpAE48IyzeFWzHGRMPvxEaef+ysAGLvZlsFBK9wBk4i0
         8Q4rrvC9Bc7Xnan2CRLGnW9HI23Fzxi6wKasmPtZuMyeuhLZcMPfzS9lK0wvkKzmaCkn
         p0hkpRdHDkbwzP8GQkkbJYTPpO0a9GareJmvXwvU0GaZXy2wx1JuQ75JI4+LxtQTngbi
         GVVw==
X-Forwarded-Encrypted: i=1; AJvYcCW4uide3mK6v/gzo9g1rrH8vh01+rC5kSrS1GRSK7Peq1m+a5tnrXSIu0XfgtHhXqueMHx/uD9CISxZmA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4AGGGRvC3e5kNlLgKfSIwU5I0GLjObErZBc3fDW9Hu3o2uxAZ
	2rkswEfUY2AlNYV8git2vUwemXngWmufMIqH6p6wnwpMvs2RJxOoNASViI1vPrx4g+gy2DIpDEZ
	nCG3XgzBHratczIkmTqnY8GKucrw4RiH9b3x9V2Yrm5DyUrkmjVn7T0rcEMkMFvgJ+w==
X-Gm-Gg: AY/fxX63jmVbml9dTLqjPXfl+GpUkbXrYL93h2oxXijtn0FVGUdG3pKN9qzqbCo1NAL
	uXWlUtL6KtopkT27XQfSU8vGB0yksVSdLKqtPfGq64o93YncaHJ2Sg4aCTlJT+zxlx0dWe1LtFJ
	l/feRy872+9sVzgP1/Eba43WBAGE6mzz4tv8dKHhFKCFxyn5HAR8s0hQdMS9hjPqIaabRd+W+7E
	E2qzJPnQZQ7YMouOO9RXh72C/VUBqavF2ADqoPw6kiHprs0wdZlmURqo/4f28AzZcS886+n9//h
	efdBqx7UP9IXvLDK/NpBAdLh+6MvAEPSQwlXgsGwLJ4rFta/fZ2EhFtbdv3dxjONVf9C5rxBAIe
	E2NYbieVNaG18/V3amgr4mnVEosWCTI+fhkRMfIVHHzpWvVP+T7dx8HSVp84VGbUCnB1pjrLSxs
	hoG7TgFmHeCzotuz6Tt8eKKnE=
X-Received: by 2002:a05:620a:45ab:b0:8b2:f1f7:b867 with SMTP id af79cd13be357-8c6a66c8527mr1666861385a.11.1768853364419;
        Mon, 19 Jan 2026 12:09:24 -0800 (PST)
X-Received: by 2002:a05:620a:45ab:b0:8b2:f1f7:b867 with SMTP id af79cd13be357-8c6a66c8527mr1666855285a.11.1768853363895;
        Mon, 19 Jan 2026 12:09:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790fdsm36641481fa.23.2026.01.19.12.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 12:09:23 -0800 (PST)
Date: Mon, 19 Jan 2026 22:09:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
        linux-sunxi@lists.linux.dev, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Liu Ying <victor.liu@nxp.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>,
        Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 01/10] drm/tests: hdmi: check the infoframes behaviour
Message-ID: <couy5kfkofizy7m7c25otstyitq7ods5tk6kgk6vadqaku5vud@oy6bhofo5arf>
References: <20260107-limit-infoframes-2-v4-1-213d0d3bd490@oss.qualcomm.com>
 <2fb910198a3be542215592ac3f22d6b2@kernel.org>
 <yj3r6d3azwwfl5g5yo5wj65qy47f5hzrio5tvfmxhgzlc5bezo@ij4dctwhswls>
 <44a39340ccf7690f6458072eb886e6a658b981d7@intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44a39340ccf7690f6458072eb886e6a658b981d7@intel.com>
X-Authority-Analysis: v=2.4 cv=Js78bc4C c=1 sm=1 tr=0 ts=696e8f75 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zvl3gqy6_dqJr4sjycUA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: s_hc1v05xQrr3VUsiQ2KbwYR7AcKPKj1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE2OCBTYWx0ZWRfXyfRvJDm2gZFG
 +0ezuvuwQnykoJSwUlkHpaokteYk2ci9BHPZyvskV2WGAnpB4Qp0WMd4HHSqWwbIi+Jhr2WUiHB
 pQsjywSBVEPAJdPMeg3t2IotlcluuAQEUXn88EvQGHxNhwD9tzEARSSwVsQR/V7/Jy2spGQGEWI
 RGm/J2/emKFw+brQoN/eS0ZQDfLw3+h8eFFrtEmecAEypr2qu023nhgktg17jPfDwxgeAyWPUOk
 Za3Fu1Dum9xomlhmaYwGf9APPtRyQBI3b7Xh7i14fZd+bb8MG2PfMY8kmIFGsK02VNJSh0lLw2s
 JZ6arCxC5HzxcYnvQ+pXPOuaTvh/Wv4WoHA2Mhu6EsukmS3Ni9rpFkR+Y5QjPZWOPk1tn8AXGlh
 RzoekZrTuXRaPNLXxvfQdxsgSQINPHNx3Db0ni4+ab/ffEHhFUtPSdryo3LPcjJt6jCYD2R6YM4
 mAtzCcM4ZGYew+KMcbw==
X-Proofpoint-GUID: s_hc1v05xQrr3VUsiQ2KbwYR7AcKPKj1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_05,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190168

On Mon, Jan 19, 2026 at 03:10:21PM +0200, Jani Nikula wrote:
> On Mon, 19 Jan 2026, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > On Mon, Jan 19, 2026 at 10:13:43AM +0000, Maxime Ripard wrote:
> >> On Wed, 7 Jan 2026 20:14:58 +0200, Dmitry Baryshkov wrote:
> >> > Verify the InfoFrames behaviour. Check that reporting InfoFrame as
> >> > unsupported doesn't result in a commit error. Also check that HDR and
> >> > Audio InfoFrames are not triggered if corresponding features are not
> >> > enabled.
> >> > 
> >> > 
> >> > [ ... ]
> >> 
> >> Acked-by: Maxime Ripard <mripard@kernel.org>
> >
> > Thanks for all the discussions and the reviews!
> 
> Your commit ca59e33f5a1f ("drm/atomic: add max_size check to
> drm_property_replace_blob_from_id()") added a new parameter and this
> commit 7436a87db99d ("drm/tests: hdmi: check the infoframes behaviour")
> still uses the old number of parameters, breaking the build.
> 
> When applying patches, please make sure to build the code before
> pushing.

I build-tested, but I didn't build kunits (which obviously is my fault).
Which brings us back to the question having pre-merge CI for the
branches...

Anyway, the fix is posted at [1]. I'm sorry for the troubles.

[1] https://lore.kernel.org/r/20260119-fix-kunit-infoframe-v1-1-5f2f9b066594@oss.qualcomm.com

> 
> 
> Thanks,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel

-- 
With best wishes
Dmitry

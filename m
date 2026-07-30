Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E8643E487
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Jul 2026 14:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421202; cv=none; b=TnXBiWhyihn83vZzD4pdfMghA0ApvtUHkAdCnc0Jp5Pc28Ky6oAhGFMV4fFJ1ePBXBgLNuAFiah7M6X2Akd8ZM0KHk+k7ejargOWxWdnaH5fqvYt7LxRtd4iG/cZCk1mqG/RU5Zdxoo7cCKm32CYfBVK7uIgLO5Rz/pXs4HtdpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421202; c=relaxed/simple;
	bh=DPZnMRHGIK9EPdIFNuGGMcLFXd3yf8L8ZyJ3TyATK1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTRM7huwEKAVRtIDN56CHHUMQ/YLIhXlDTTUtixIoIYtFcGQujWYdYBSzJVTt+06bvLq2dIMQg7GlvBQappJiBoo4FEMvTyZ57zgdBabuz0jadqEmISVElEepmgHphUS6A9S1wsy79C0caKTrQvjcM+QFj90S0dCs2eBejwSHbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKdDpD6x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNvKgKkE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hKdDpD6x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNvKgKkE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UE85if1301758
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Jul 2026 14:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6zNtlF6EBgMK54ivwKze52av
	mGMNXevbSu+B7Qp9w/Q=; b=hKdDpD6xOn8RXByoH/ONerRf5R+Jo27skbtrQrx/
	ss0wVqgwcl5ckE1d84Ql7bRz6BmWViAJZK3nv9m17ZeZ7Xebh+3tcGRbXYN4Eq0k
	+7XkjZs/zVIlzeoi4tiAxCQGXnaLA8SGAtvhW2mh2tWS5lkMgq02Ck9cCuCiTDjG
	fOqrzIK3IALpgKVpZjCeCL/TDiBzH+bQS6aKn9SMPjhabvys0NWyeqrr4KDrCNqB
	McOpVlxw6MVkaDEnj5amYRoYtllfnp9mAwAwg0jtS3LmqI+zLL1wSOxM70Bhcuae
	xbyDj9wTnO3em5nLep4STve3Fsez81Z2VW4OJUVajB936Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr83y82fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Jul 2026 14:19:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1b4d961dso7573781cf.1
        for <linux-sunxi@lists.linux.dev>; Thu, 30 Jul 2026 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785421199; x=1786025999; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6zNtlF6EBgMK54ivwKze52avmGMNXevbSu+B7Qp9w/Q=;
        b=UNvKgKkE3Jd7vC15WEbuxsW5YhpeT/m/xEi+KmRQfeLfvBS7X5amk6+eXDSDBWIFSO
         U2iEg+N2tNgasRCtd6fBCRZEo6Q4xyr/tivZzmNGE6P4TKh1IBwcbmizx+vwN4C190u8
         /4QVN/P5DSuonLtTaT8vZNELB1peujKZfCo4el9pd6ZboWy5CUWJjvM1V09tNxVx0Cvd
         nvTQXzhi6Gvk/ZPKG3YxPXn24fE1cRooNfx3XTtme7vbHHamzGI9aV4lP7JKxxv5+yTU
         PwZ2Q/ogmwIQbCjqSMtCuhbBvJkGldEKZ9WUOaOObFPQEoH8hRysWTXYrAyXff+rck4I
         IMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785421199; x=1786025999;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zNtlF6EBgMK54ivwKze52avmGMNXevbSu+B7Qp9w/Q=;
        b=gMnOYWABgYQA26GqraNax3dIbbcSjMW3gobjpEYvGxjPI1ytVgQXOL67R42aRk9V5E
         2uihA+ZtVNFoVGZTV67nRCuX9Q/EvLSSFCW7BAFsj1H0ILMdQS1p5n4BUY4YIWW+GDO1
         tLeLrH/mFb7iq/ZeJToBmUOi0/bFdGIZGwP3SftEvrDA6D+jEBiFG15psCpvxtkw/0zY
         OBGbySEKZwJgtSgciF9HDTjjRynZSD8HmbnbIv35Sa3Xw2VYCnULzqMfeV+eyxU15Mp8
         iRDP5+6jcLOUzYb+LYM/iShRIFagxkf2um3hDGLXWg3TZDNB6iJ9Kga9J49uAkf5fW92
         CYoQ==
X-Forwarded-Encrypted: i=1; AHgh+RqoX3NznuIAtGnUKytH4TemU3FQ95k8LsQgVVzvmwpCb3WWF/J2HM3HJkOsFsJBqgtdJI4y2lDg308+zg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNqC4YcutvUtcA5SZE4QX82PQqDAXrBb+9Lyaz7iT3zxBeP7ot
	StHH0/YR778fVWCP9cqpJBQ4ro1xMF0/GPqE+luIzTCdyjhtSPe9puZMSctfu4glzDjrvMK48Pa
	oP/HDQ/CcrBKPbaZ+z388386ewIXsIzCf/jUe0eBkTozvrO338SX1IGo49CApiYmuEw==
X-Gm-Gg: AR+sD13kRM9EPB/NZJkkYePuJ1F9h4L8zHhQosm5tZkECb54C0wLZnvZrYqMlxpMc6z
	V5eunVBeloIC8f9Eho06GomzjRHGXGwoh8FVSo0Q2jf0OWmQ0hYZSJNFwHS/ssfDZlCNpeAYdzS
	pBJsFIW2fsNJwJd3SannUE2tgzSVHsyrYsIbjMEvGBWgrwniG2IpvjUOPhU0a1rypYIUBJWsoWr
	kFbEjA0vjbMMrZeB6sdQxRh7jFggLOcFaZmr6v6XJ8oTCzARRJNEe9B65KfMQbU97jAmRI+U1Bp
	rQmEsBBAIzFfY86qUhxVvAlKukCbPuFXpBc4uB7WbuX36pbkGof6X1bXasA21HRxH1nPqNXjb+6
	//YXetJk1xYcTLTwnfp0j6TGVyNpnwA8k3fXlOMVU3AV/qJ4xlp3KPsymW7/DwBqvdy7KEAxTm6
	GPzN4VwIdMbJCWRA==
X-Received: by 2002:a05:622a:4c0f:b0:51b:feb2:3827 with SMTP id d75a77b69052e-52b42618677mr6293341cf.32.1785421198986;
        Thu, 30 Jul 2026 07:19:58 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0f:b0:51b:feb2:3827 with SMTP id d75a77b69052e-52b42618677mr6292761cf.32.1785421198521;
        Thu, 30 Jul 2026 07:19:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f6ac5ed84sm3374311fa.25.2026.07.30.07.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:19:57 -0700 (PDT)
Date: Thu, 30 Jul 2026 17:19:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Algea Cao <algea.cao@rock-chips.com>,
        Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>,
        Phong LE <ple@baylibre.com>, kernel@collabora.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v9 02/61] drm/display: hdmi: Rename
 drmm_connector_hdmi_init() to *_ini2()
Message-ID: <e4miagjzyvyxxbhbznze3ht4vvnqx5whe24dl3w5sdgasafdmw@gblajrkqr3mc>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-2-4fb12ea22ac9@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-2-4fb12ea22ac9@collabora.com>
X-Proofpoint-GUID: NEj0xXsuCAuljNKEUddHNbW2pgiAlRpy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwOSBTYWx0ZWRfX5qIoZJAZsWfY
 v9fEylZA2emVa8hVzGapVGsgYM8nG+se0p3f1mqZQT33BLckCwfaARd601wvqlWQ5vhAvLgtkT9
 /sEzhXrWYaCDGQWjRYtrisP7++pSmF4=
X-Proofpoint-ORIG-GUID: NEj0xXsuCAuljNKEUddHNbW2pgiAlRpy
X-Authority-Analysis: v=2.4 cv=O9wJeh9W c=1 sm=1 tr=0 ts=6a6b5d8f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=uf52Jz-x5RUOtouhqywA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwOSBTYWx0ZWRfX43rNzKw3Dw8G
 JmotcUzLs9jK1gYKS6Ls2WHZx0hr+mMFcfp6HRqTOIbFDTTgxZHuPQDMkFsLmAjA82MSUYVtk/8
 fPemfcbHXYsZmOZD9jG1VF5K7qNGBAA0YlzQPA7nD+l9EME3Qb+b7WIIqoR9yPhYwejscp9cMZK
 u1i6H6HdKVGjKxc/potaPtcqo/Umi5nsir5dKxES3xVv/+XRAp+nTugznQRYT2GOkoW/CUOPYwl
 GV3vv0O/vinqfbyzY0oTJmIFD391Dl3YrXAX9Jyb35i0Is/NCybVPfeTJZQLx4b61BFmAj02YG6
 fzc6OcKeOM+MTrw+ddKZZpOrbV7FiaVYsy2sIlUMzzlUCJP2tGQ58hm4HMWc0e1aITlfSTkgQk5
 eGTAjx1ob3SoUF+l+DQXH9+o59y/t5cntTSro7CLctAVw/lyiQhKgreTFSzD7eGWZcvIv7vwXDI
 +Zu6re4lJjNx5R6nW9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300109

On Thu, Jul 23, 2026 at 04:34:51AM +0300, Cristian Ciocaltea wrote:
> In preparation for changing the signature of drmm_connector_hdmi_init(),
> i.e. dropping the vendor, product, supported_formats and max_bpc
> arguments, which are being moved into struct drm_connector_hdmi_funcs,
> temporarily rename the helper to drmm_connector_hdmi_ini2().
> 
> This lets the new signature be introduced under the original name while
> callers are converted incrementally.  The final patch removes *_ini2()
> once no callers remain.
> 
> This is a mechanical, same-length rename performed with sed:
> 
>   $ git grep -l 'drmm_connector_hdmi_init' -- '*.[ch]' \
>     | xargs sed -i 's/drmm_connector_hdmi_init/drmm_connector_hdmi_ini2/g'
> 
> The transitional name matches the original's length so continuation-line
> arguments stay aligned to the opening parenthesis, keeping the diff to
> the identifier itself and avoiding re-alignment churn here and in the
> later conversions.
> 
> No functional change intended.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c     |  2 +-
>  drivers/gpu/drm/drm_connector.c                    |  6 ++--
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  2 +-
>  drivers/gpu/drm/tests/drm_connector_test.c         | 42 +++++++++++-----------
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  2 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  2 +-
>  include/drm/drm_connector.h                        |  2 +-
>  7 files changed, 29 insertions(+), 29 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

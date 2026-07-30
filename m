Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66EF43B6D1
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Jul 2026 14:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421182; cv=none; b=NBu8+Jk+LBetY7xpXdxDwnrvNlJcU7432R7Ikp8T0HGio3d5cpRU6TvmOQHd6nisgm3vXjxcz/ld1ST9rDaLx8LnbGPVnDekMStltEBxlfdexspigVFYLxHJpt0bVO65/U8bzy0wQCZUuJSjhGg2C8AH0n8HnuOizUwbT8OrVZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421182; c=relaxed/simple;
	bh=gBRq4V0rqHtpnOL+CgbzA39eYQGBjcZfjaG+bfVNPyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evc9dTLvzyLgn3O5Be+4NDarQr5o9/Wd2wOSZpk5y65clQ80VbXwvqWlFiXPtuaByezmyLTCcvmcfTYw18vrqgb0juaapGo20qfO0bIEazmCwXmwmiP+LkpcPVnD1+EIG6lToZ4JuOzX17G0Nue1ncR1uYTRfjCfSfb6fg6kG74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DyhAbkPL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aUAASLnB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DyhAbkPL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aUAASLnB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDbxtT973050
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Jul 2026 14:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t+oYZclcsoyBpPMuFhCDB16e
	voi/Be0njDL+8RrwXAE=; b=DyhAbkPLmpDz8Fk6GCx2bPi/DWaEufFRre0P0qxE
	oSMzgKiDTv/oYWO0lZELMQXXGz0x01CutRG/PMREYYomKABL0d7coL7K0wfCO5VN
	zQlRAt63jNpzcvqNuWZWpmMD86Xat2tca6OQwkgRzYoq/wEHhJIjqtMsnpKHi52y
	z/eg6y4fNBGzhy1lr1owiqHBj0y3RCd5PlrHDRMGtyY8pzj/KWtxnw3ZdF1mH0dk
	r2/SaHT4TsR7yHCAqSnDY1lv/GhSEGEhoSw8q1zlhdsrHbfgVvgBgHmh4b30ms5m
	VY2Ag9fqxyMcSa42xaLufu4eNOrAGNzTvB03nuc522NcBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr7nv0675-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Jul 2026 14:19:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bec738909so18505571cf.1
        for <linux-sunxi@lists.linux.dev>; Thu, 30 Jul 2026 07:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785421177; x=1786025977; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+oYZclcsoyBpPMuFhCDB16evoi/Be0njDL+8RrwXAE=;
        b=aUAASLnBUoA1BsdrA4KtGqxxP/rXvjY3p35c7cS6UtGWJL4hWUvLvwmbcQAwCdGuIn
         8nSI7x0NUoVmY5U8o/2k3UuFtoLs65osYPndQ1odjB9aKXeFI84bHE7aXoTNSgYmAhTx
         ZyIfiprPScOvGpSnClwCi1zR3nc/+KBSRG0sikmvs6qbeIMJ9asdk7zTEm60kyj+/dEG
         cwaf7W8+XkRyxnRsVLVHHjB4gbnonuE6ykXLGCuLIXcqU5epGM6JGp8T3ic9uRVH2qs0
         V41+V3tWKHmaeW94H/il60VT7ZaGU1zKqDQbxm81GL/8kg/RYH+eN50WpZpioCbdrjj/
         7lPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785421177; x=1786025977;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+oYZclcsoyBpPMuFhCDB16evoi/Be0njDL+8RrwXAE=;
        b=XIWEPgfUe8GK+7RZFUTOtrL0bjgOHHOMwbsPDUCkHQEIvgkQ5+5idpBDrRoN6WHAFJ
         MDrPNw4JPbvtNU2Tmo2lW0S990+jIK/9RkC/cya9Tux3tp04nqFQJHw2DiOvvo65Ygxk
         dtXUOQ4aETf8FftEDXvrCZrtLGpfBVA6ZNyqeVLbZHPbTtnsCQLux2p7YmSh3C6fvV3F
         tBlmGZ39I22xm+bIself7ar5ByFEXPhKmWt/hDqtfC+9PLaXNcLnB/qdcr+dF5STZv+q
         L6C4J/ABeszoLbgJxk6S59h7i2R2tBusPEulaiB09DJ54/ExCrdF4L1EQoESrwi7hxrj
         RlsA==
X-Forwarded-Encrypted: i=1; AHgh+RoKoHYJvByIpU5UwkKM2FawqCtKxpykJ/lCtJ2EgLOvsqYocXzvz4aShgHoZxZmoPCkPGpcMxO7Las2ww==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuK4d0jQg6rB0NNrXiwSOJO7rk07fkl92k0iay09qAm/cqi2YD
	A+R5oqHguLU6cjv2iD2Wk5QE3mkHss5W2zSn1eThkjrdZ7Zma+tu3+H/1i3zYAv7zBSD+awtuDJ
	snxTe+ThDITt96HDMW15fb+/vTD5kqwwCf+UW7POF9bK9Y4YQc5SEyemBe09ePU7U0Q==
X-Gm-Gg: AR+sD11pCFcI+URLM26B5ZwwHRKWg3Xvq0j9SB8raoZ0PU9bvpYrt8H3IxfpvDcRRan
	PnXVZbZu/MkMe1dLVyEHe+0czPICzYKcczJ81g1VZ0HRULz0gJ6bXEvFY/n3o5CffVE5iH2wgw/
	q+0Tbq8PnyvpQ521OGhWklrIyvy3x4DZr6GEMGXNuz0pGlcBnbY0aGS8squPdbMemyNqasRqZBf
	vDxxPdeoy/07ovBotbOAWaorMFbnscT8GPUBjkNDbw6qXWVhSSC3Z831Ib0VECBmAlmnNCe5fdY
	NHlfI7hqJPoofZfBAPIWV79mRcZkKWHzNZcGqFmDIs7PxctCkhOT+8P5pD5+FLHn+9vEirx+hJ3
	zY4l4ytZ0EW2R1rhBZNhVqB07pCdKU7Li7upADoLuqPXyDLJR0LYKyfjtwAgZR4r+LhcCkBXyQK
	v+Vg3HUIbu89dE/A==
X-Received: by 2002:ac8:5955:0:b0:529:bf39:f1a with SMTP id d75a77b69052e-52b386be80dmr27854901cf.71.1785421176434;
        Thu, 30 Jul 2026 07:19:36 -0700 (PDT)
X-Received: by 2002:ac8:5955:0:b0:529:bf39:f1a with SMTP id d75a77b69052e-52b386be80dmr27852851cf.71.1785421174000;
        Thu, 30 Jul 2026 07:19:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba882sm368911e87.43.2026.07.30.07.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:19:32 -0700 (PDT)
Date: Thu, 30 Jul 2026 17:19:30 +0300
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
Subject: Re: [PATCH v9 03/61] drm/connector: Add drmm_connector_hdmi_init()
 with new signature
Message-ID: <exkyukl6jnkwwoap62v4n5j4obyhoks5ysbo7iqjdhzhb2ltsu@nyp7csbmzott>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-3-4fb12ea22ac9@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-3-4fb12ea22ac9@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwOSBTYWx0ZWRfXwAPAK/TVrcNn
 lxeoK/YBDP6SAxptYytDh8Brxqkiue7Wy4xliTmgvcHYzYuIQLkk428uW9LRz9RJKu54c0cpedD
 7RxnMlbxKhqXnj+9j2xG0ziqHukX4lCxjvIWdMliS5amJsN/Sc/veT3h8+N8B7bYxSdDFGkNQD/
 Pj7cPk3WDpVNuGJYKYA87xDhzEqcwdAb1xxaaRJWOlVOUyjc7iAbvS+O/z8utSCJgu1nScUwQgC
 UtZ9seoS0HE/2RMt5nuvvA4fX2cN2ETURIM0UnduZP/vTC4mrTxLjTr/QI88lCSrnDTXg3536ad
 jZWnp6ji7xI4r8/lLlA+dM7FTPtYaVjwTDtINx8DtsaZCu0kdROUYEM5oajJZ2SPt8579yaNk9r
 3ncLiuPtGbpAAbrC0KXRyPb5QNKyXpztGFK/4AZMbKWxp6PS+vWmyaqWZOoMZlpWfiSPBUEYqF0
 4kgBc1lVpppMBhvrg2g==
X-Proofpoint-ORIG-GUID: z3NolUK0EViZcslZnZ32X1jRWbQaz_6N
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwOSBTYWx0ZWRfX3YqxwVO0Ca3G
 VYwIWiFFJyzUckF577iOrN4xn/IImVs13K+NFcmhLXZNinYENzXPFPojWVsnRHu71d5GBx9S2ua
 4vjRWbuSB9JHw9XMvKxEXYkKn95kDiU=
X-Authority-Analysis: v=2.4 cv=Fpc1OWrq c=1 sm=1 tr=0 ts=6a6b5d7a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QX4gbG5DAAAA:8
 a=L-MVhf8o2HZ0jOEqR2wA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: z3NolUK0EViZcslZnZ32X1jRWbQaz_6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300109

On Thu, Jul 23, 2026 at 04:34:52AM +0300, Cristian Ciocaltea wrote:
> In preparation for providing HDMI 2.x source capabilities, move the
> vendor, product, supported_formats and max_bpc parameters out of the
> init function into struct drm_connector_hdmi_funcs, and add new
> supported_hdmi_ver and supported_tmds_char_rate fields there as well.

I really don't like the idea of putting data into the functions. The
data might be mutable, it might depend on the particular platform, etc.
while funcs are typically static. Even for the drm_bridge case we have
two separate structures: static funcs and changeable drm_bridge
instance.

I'd suggest populating that data in the drm_connector before calling
drmm_connector_hdmi_init(). The only exception would be vendor / product
since they use strtomem_pad() to ensure them being properly initialized.
I'd suggest leaving those two as is.

> Appending more HDMI-specific arguments to that function would not scale
> well, hence introduce drmm_connector_hdmi_init() with the reduced
> signature.
> 
> Additionally, add the max_tmds_char_rate field to struct
> drm_connector_hdmi and use the supported HDMI version to determinate the
> maximum TMDS character rate allowed by the specification.  Some
> controllers, however, may support a lower rate than that version would
> imply.  A non-zero supported_tmds_char_rate lets drivers override this
> default with the actual controller capability.  A value of zero keeps
> the limit inferred from supported_hdmi_ver.
> 
> Callers are converted in the following patches, while the old and now
> renamed *_ini2() helper is removed at the end of the series.
> 
> No functional changes expected for existing callers.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 134 ++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h     |  62 ++++++++++++++++++-
>  2 files changed, 195 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

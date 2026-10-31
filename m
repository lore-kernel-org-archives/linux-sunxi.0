Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463587;
	b=Zft7URl8EtmsbyMMfklQoxD0JHVo96MRXtNO8/aT0E/OdG5DhcK6I3AvYYJq3CeRHEyx
	 zUOA1lixYRBVUYW7p0NlepEpx+Jnkf51pv3M3PAQgTxAOdsZ7dZrW7AHLeHwW9AFZX24V
	 PFVtcYO2hktovronIHI+9vHwgwV9Z2jUqqvKzt/a5JGPyjjv8AYY34b/oZm0djQJAJziE
	 jwALOnfGPubGwupKfUqETK9l9o6ckc/AHui2kzTvHVvLLsG5RxUNpMulBJGQ3i+aBbzSe
	 Jirq7aFw9G9wp8vA6vjSIWxeULLnE8MIJpm5Ja7MDmGN59ehSMmxKkn6KHWt/vBuOnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463587;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zvoaKP+xUkSGJRscR5IFcdreCABepZREPTFbnRV1kJ0=;
	b=xnUMzBj5nVZvU/2kgNKaUZguovtRlErB2NcubFptdyif55igY8liVcOjdFDwxf9IMAp5
	 hgCoLaC982Zpr+f7k8Xwux0BQ1Dzms+jT6fPmW34t/PKVDWSLIlYN1AUnq7FC+ZEr1jBp
	 HEDGqA7m28D4Cs14zbGilL/6LVEf/cBA3XC+gpSxvyKE3fDPSLpW1yUgibfx5OFE+lLVO
	 p0Q1LJwPch83PiOPR4LBa+EBYnXMYnhR1Yx0nDFg9rOtP4ew957oRkETsFjgzFlVr5vlO
	 62EkF/xBwmrNvWfyTVUoHtkVg+4PUk/YnH+bM97QMDJyNIXMzbKnOTCLsZXumBFWqyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mym7SJzv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cpzv8DiA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254B8606A31E
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Oct 2026 16:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 254B8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mym7SJzv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cpzv8DiA
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0RRV2766349
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Oct 2026 16:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zvoaKP+xUkSGJRscR5IFcdre
	CABepZREPTFbnRV1kJ0=; b=Mym7SJzvPJhBrW8cTjXDr3bK0JGoqkt9BOS67c9H
	AZsqbfCMihN1+Nnb64lqybfcq1t6P3fuqhRNPe4cbhfvNEsAwr+aXeQz7KIiVmOZ
	y6hpGPvDX/0Tm6yC8PcRy37IPLDwoGiLsX/G4SlKxq7/kkk6Ac6MSmXubqc3gwLE
	rVFQ3IeE1FRc3g6As8OjO0KUeklXIsmdvXMj8p12gJosHwJMgVb9r9YHH429jBqQ
	kQrIUFT+6LBDdr/FdpxCEWjLCfqiYFCBXo0lhlwQ6OnNsViWUejIKg1eac7xszF6
	8OcJsSUAO+yAIIg01Iw/gZopm0LimI9h4jcFJYlYQpYKpA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6hn10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Oct 2026 16:19:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so423107185a.2
        for <linux-sunxi@lists.linux.dev>; Sat, 31 Oct 2026 09:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793463584; x=1794068384; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zvoaKP+xUkSGJRscR5IFcdreCABepZREPTFbnRV1kJ0=;
        b=Cpzv8DiAk+Fxz+wFZaTfG/OZyvzT8780ut3+/M4TJeynM1bGVODtR15pfB0ftsiOUF
         0KKwYoLBWup8Ud8paXSwCJhG/uSgoOif5DEnKrMkjzs408arTBW79ApDzWJfgcn0bciu
         ukQNLiv3BuVvQoElDzBa1leAgcIFmHsrxqBlpGIUg6fN0cGjqkTgp/U3Mjh5HhllzZ3a
         uTYRCYuN0f1/MZpaa2Cf7o7DVH4xp7Fr3e+t+baAH1xOhxnLoecmGiOdBRLanPCE9C2E
         AqB3NsEjI/C4zPI+31BmXtZNIny6jbqKfyCdcIsn4z68EPhoFzMNw1NqzvpPup6qNZsY
         cHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463584; x=1794068384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvoaKP+xUkSGJRscR5IFcdreCABepZREPTFbnRV1kJ0=;
        b=xk2kU7VQTxMMIry1pZEJw7S5BGFC/F3QYAtdIFFDCfaklFr9d/4wVCQaWAxFKY4CBo
         MCSXg7c961VtDyT2Y9hF9HIm+4fSs0tUT8Jz3jdh1IIyLvu8EjtywpjvE5BqTHfkp106
         /ZpvkOG4xBtyQhy7Tu5iep/EjmV4TpU5v+rwOp1t//vSIioNtgTxcZ11eFr+p0ahlaTD
         m6dfAjzFGPOB2+uCbmq5Esc5tteE2NCkTZ/4UR7TW8FAbGS36zqk6lRF5psShX3hIv2G
         PyAmn9i6O0DKI7UImL/AKF2AnpSqCe1KZKrWHYlKIvjyfD9gmb22yxnKJ3gguR8FoObG
         qrPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOMCFfixVqJ28ygVzGNC44QmeklSdDFG33RB3KUlq5VoLdOGis0UaIa2Sf2Vp5ow8dZUlheZrrFM/X1Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYKZXkKOsjMDVLlOodZo0+XW5ffFB8n52nFJtCsX0C9+nulAfVrv
	edFA/mvcwUPVGaEGy74CGIt3z3YgZykSNRKhBo1DkD2YRxjvdlHSRTwGNk3VRvhGnckfwEPNCxl
	UXGUzPKYdqr6HKaEiiYtyAdZezOVgzdRci06wb6TQf01bpWE6XgE1d1YOvpzpOElGjw==
X-Gm-Gg: AYBFou2s6jVn0OBgkeWinSKZzGSskrv5KNaRZnnTdBOSFnS24SEbH/F0Lv/bAEPExYm
	bMzmGnVvI3T30Ygr/oChJcvPLjdswofboXJVu7tSAoRHuMZqau6I18G0CFrJk0rff+rNmukWZl4
	5Q2UtkYtxBJP2XfpoIAM29KilVTp7AgCFO2WhV6nNPSnVkEP5E361/qEDmKLeD9Nk0dZ2n7IJn+
	6ChGfwPDU9kLhMbEzau8muzScZ4TZJE9XIN535raUazytO0VkJVWe7qv160LWg087cgC04J1RLp
	hqijkR/prAtP5npagQiO6jRe0AXe40+Um7kaGq1gEcWKA6qUhhcaoiaqqnmiLMojQ095V2p2HH0
	swfMYTeCJJmwQq0EkUhZXV0wHybkJeNlxkM0q4jzMzgcpf4yZHb1uq6JdJkj2/o9Vvi0Te0krip
	GJF3iXOeJXztc9mZFw6QYnehXZdfXJRQ6C3LemzMFFzbGtGIBLmlhiJrSpWy0NCQ==
X-Received: by 2002:a05:620a:1793:b0:93e:5e2c:8c12 with SMTP id af79cd13be357-944216f3483mr979227485a.60.1793463584125;
        Sat, 31 Oct 2026 09:19:44 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:93e:5e2c:8c12 with SMTP id af79cd13be357-944216f3483mr979220585a.60.1793463583497;
        Sat, 31 Oct 2026 09:19:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbee0094sm12126731fa.20.2026.10.31.09.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:19:42 -0700 (PDT)
Date: Sat, 31 Oct 2026 18:19:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linus Walleij <linusw@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Alison Wang <alison.wang@nxp.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Igor Reznichenko <igor@reznichenko.net>,
        Michael Walle <mwalle@kernel.org>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>,
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
        Purism Kernel Team <kernel@puri.sm>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Junjie Cao <junjie.cao@linux.dev>, Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Markuss Broks <markuss.broks@gmail.com>,
        Artur Weber <aweber.kernel@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Yedaya Katsman <yedaya.ka@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 15/35] drm/bridge: anx6345: set the panel orientation on
 the connector
Message-ID: <45e2lt2ngv3ozvpapexui5gicabcvhsxfhrwwq3pdakmdiyxnf@mag7bgkjplav>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
 <20261026-drm-panel-funcs-v1-15-5e3070a3478f@oss.qualcomm.com>
 <179344372467.9825.11469688608855257522.b4-review@b4>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179344372467.9825.11469688608855257522.b4-review@b4>
X-Proofpoint-ORIG-GUID: YqwJG02KVDevy9X-Jfik190d2htm1zLa
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae61520 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=1b4m9KtQkR1i_e9s8qgA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: YqwJG02KVDevy9X-Jfik190d2htm1zLa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfXzBdxdbYR6uwZ
 W2Z+HCfhH8n4k8MjO5WaRfkjS5RPUIncCgsksJIHYMwMgZvPlRTkgQi0ya2CiClgQAVXrB5BFGl
 lf7zRdOkPomM1ozvD+87zJoK1b9WCIU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX6U04klLLT/2o
 6fhi0kcAPwnp+uhpltVZ1wucYiIVMK5KtTrIY0qDydu2+DWbtCLNyl/nvzD+xjkV9o8ZDG+4y/Q
 Ykd0r0RLzO3oOofEQumFtrKGwVeGckBfA1wvwsVN9teTYho5we7zXf/NQZoLHPf2mU91cDLFw+a
 ft/gsR2aB9C5W77DF6x/7Ji2ctFMC/AsEjIEQ6OnEEKUbuKvSBZIb7rjU36btEBCAKFD6wumjC2
 Mk23ngbZWOLJR1Kb3qhf6bFtMemEzJYbWsI2RrtAwA8syaK+dh/KmhUD7SsEHAPSfgVAdmqb6jL
 dFOmMp5BPrJsM7hyiAavu49G9TpE9YwjWt2GSl0XtqforheK+nGlr8dOC/TFAPdc1qIyNNRf+3c
 f04U2yZHihu52PDMTpEvmCc6XKJAq2TT8JvXid+qrXuzotqGBYa6H077YU63L9lddwC2wNJJ9Xv
 Aew/ZX4D99LNW5RXTTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310064

On Sat, Oct 31, 2026 at 11:48:44AM +0100, Luca Ceresoli wrote:
> > The panel is used directly, without the panel bridge, so nothing sets
> > its orientation on the connector apart from the workaround in the
> > get_modes() of some panel drivers, which runs too late.
> >
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > index 407834a03b63..91ce1a877bf8 100644
> > --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > @@ -525,6 +525,11 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
> >
> >  	anx6345->connector.polled = DRM_CONNECTOR_POLL_HPD;
> >
> > +	err = drm_connector_set_orientation_from_panel(&anx6345->connector,
> > +						       anx6345->panel);
> > +	if (err)
> > +		goto connector_cleanup;
> 
> Muy understanding is that this driver, and those in patches 15-21, should
> be eventually converted to use the bridge API instead of the panel API, but
> that's a significant work and so for now this small change is enough to get
> to patch 22 (workaround removal).
> 
> Correct?

Yes. Refactoring the drivers to use bridge API is different, bigger
project, which can be undertaken later (or in parallel).

-- 
With best wishes
Dmitry

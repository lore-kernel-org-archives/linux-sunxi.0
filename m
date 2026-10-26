Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013025;
	b=moS9U0g0x1BM26thFLRNnWYMtib5nJtl11ilu3kXZfeqIifjxyn8vG97og7KUp242J1K
	 VAfaPIBeX3a5qycvrHGW90FrkIm0yfKvFhBl/jXZ03FB6DbSVQsI4A2Eh4OZpZSMDHKAq
	 T7SLxpTWeLbIN7ogl6Cu2bFfUaKlWb9XJxoXyJuOcKgzxMTMdI15RRwFjXtFQBGMZ3izG
	 DD4AdqaSkfji3vYAnK2flPWIy46QcS4O8acSyHLRHRRZUsW1LECvI/9cT3dgCxGwACPVf
	 dt6BCQQlLH0ojsqKvfMmj8sWSh1xDFO+qPo6rT/Szw1Yv3Ego2ehib9Ft3jRh0DII8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013025;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hTtxD17fDeW72YOw3DHdOk7y8aNR2m8TdFLwBF4pj4Q=;
	b=2+EUv8cj5TyqwBn54021Bzopqzubit/7jmciGQQdzyWn569xtrS5Fl3h0DR53+XuQGdq
	 AaYfVuAmjVaLsefHwvEqNkx4FMPsHfQVvz2bYftJR/YgRI+eWttHWY/oNl0ZYoF+7hrsD
	 NVAJn8DzA++E1ntsT9A+Z2TTmnML1bYE2nhEGwupHgRSAarRec26lZ3Ob+RCMp+nEFHpa
	 cdzIUn+kT57DlD1CZTGBgpvOZF18caPDmvhldLyqvDDmyF9yVUSSqqtDjOaYamJQijDw8
	 ExBAo9MrP4GWNs75q0orwy93yUBmDR5amk5icRGh6KUBdRSMGhqKuOMKxSf74Xlpd+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0YP207V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJIyQD3d;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D7860A260B
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D7860A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0YP207V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJIyQD3d
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt2Xf2733255
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hTtxD17fDeW72YOw3DHdOk7y8aNR2m8TdFLwBF4pj4Q=; b=J0YP207Vsr8a41lL
	AjZTyKZDrAyn6bMHQJEp6Ht/FIehVV8eEF5YoNyoeaCmc+rNObWKjQv04DCUX2Cl
	VzBO5vsuY1C0jjwasjHYfSjKhp+pYBppemRDlZLoeyl4HiG8CbqT5feR0nzz+DT4
	EXdRZ/rt4k08qFVuNJzDRn3JQAYr2ZH/EkhSsvcLfrueanalun4EA9pfys3hT+JN
	cPyncc/64E8luL/m3DfyPGWFUjze2XB0vIJ5q40Hz82xHoa0llHpl5i0Ghdq3WZ7
	RmliTjsI0u41dBQAdUx/R/Q7iaj8HSOhMQhLXhNVQYIAju56QTXiXiaS6x8FSj28
	SDLxZA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8b7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so679838685a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 04:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013023; x=1793617823; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTtxD17fDeW72YOw3DHdOk7y8aNR2m8TdFLwBF4pj4Q=;
        b=YJIyQD3dVhBnCwfDQc4vfXsE4bg0NAQxfOLrfTAFKnssxMKpyEx/2qrRVve2aZyq86
         p2r6gQR0a94eV5WAGDb9PlaRqg+UBZUfnD1QvIDvst8i8C6mILqBnsCcyJrZW7y7yyqb
         a3roXfPERVfsx9qilPvXU8oGsTQjExnWGYTxZ4/h4f7d1YGq0f/TKJiP442afIFZIdY3
         WMt4IqhxJSlyx1a2VzXcKv2PavOUKt0N/K0rFGEvvQTmG/6vVX+xw0b8IULfQjW1SQHV
         qhJ7L5EZ9asFcdmcx/gyAYGm4nnrpmYIfEyt2/w7abv3UevBxIxYiEVoooVHUsNx4A4q
         JKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013023; x=1793617823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTtxD17fDeW72YOw3DHdOk7y8aNR2m8TdFLwBF4pj4Q=;
        b=f4LxY1lnZAecmGq3rIOjW6PLk0zbGGxiToNanKFc2qmEwOxxtDDknPS6x8gGT2mk41
         GsK69Mt9mFZDRMvvaQCGjsOSeAMDgM39+5IK3m5o3ensUWhx+jZqCogTgHRY1Yerc7hq
         mn+CqNFHiqyLwJtodMJYsr91Y79nwuwct3efY4trlTS6GbPcENTcIApTNEHP5Sq7mbzB
         00zmUcBeTHHoOvBZN+FFpYG2RRBmRYbqyolz0e0Q5SH5R++oArYvxlO7+vb717wyBKZf
         wmkXI1b4oZjqoKst9r3iwEUDlSuXSuu6iAFl86WrEg9lNJdYnAi04PpNJTUs5JeEqlq7
         MqHQ==
X-Forwarded-Encrypted: i=1; AKwUvByCwXijr9CfaEkO930xn3TyldNZFwR9e31ivwwTho80QVJTjg4l70/qXa2ix+BigYVsUCCUTHMljElJ/A==@lists.linux.dev
X-Gm-Message-State: AFq9FYKGFfAKOMFZ6MuUGRKYVUwJuxq8r5M0CT050S6yFur4bsWUbGYE
	DCePnVwzcqxHj5XpoQHt6pyQcqDPQ+Vkhc/50HELg6s7veqjBYBTMBO/WzFNPhJk3EuQ1202U6J
	v+krNlBjsOY+9pS2BkSDBdNOudMqqkRRdU0InxTY4gTUXoJQX4AeyHOiLOAICu/h1uA==
X-Gm-Gg: AYBFou1vh9nt1t4lXJ+D+b3LQwNEKWCnhCuu7oRj32fHJ9viuBnALlNn2sd7fJBMEjP
	Te34kMpViZjrHgXca622zw3tktfWCOVFE/npBkosm8Iwp/nH/GF486A76n7/+i5sQFfRfGXsXM1
	vbVhZTnxjZ59mh8LfhZ4pPNfKMLBLDwnC/aiKGJqSqZOPnAPg4HLsbVIY4SY0Pp28hny0oGvWqo
	yyqc9h1Bk/nrpZblHEUsFM3ZUQU1jXbYsDIodHV9qqo/Gbf+HUzKrtNXmawDg5XDCagE605j+31
	IwR2TikHIzj6e75WjME8vXPKKjLf39B3NvnelUtYgs5vZ9Z/7JEQAT0K0jZHBVLrayPBjpiYdNS
	4oGo4Cp4KyJXg2OPSJRo3SLe6rtpWyEW+k3GFzF6Dtm3v6eucZachwbYq2El9QlpRO0/QsTumyC
	kbMoGUTgVGRMDs
X-Received: by 2002:a05:620a:6009:b0:93c:c2d5:1ae5 with SMTP id af79cd13be357-940ef79f4b8mr835908685a.7.1793013023282;
        Mon, 26 Oct 2026 04:10:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6009:b0:93c:c2d5:1ae5 with SMTP id af79cd13be357-940ef79f4b8mr835894685a.7.1793013022577;
        Mon, 26 Oct 2026 04:10:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:51 +0200
Subject: [PATCH 02/35] drm/panel: remove the unused struct panel_bridge
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-drm-panel-funcs-v1-2-5e3070a3478f@oss.qualcomm.com>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
In-Reply-To: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
To: Douglas Anderson <dianders@chromium.org>,
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
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
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
        =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
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
        Yedaya Katsman <yedaya.ka@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=919;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sZu+gCCAPK/+XC2UapLGIknKvJV9j0SOSwR5V3S29Kg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUGKchAASinmtwtPvMmwc3Sq3F9KCOYzdxgN
 pt0G7G3yiiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81BgAKCRCLPIo+Aiko
 1Q8ZB/9UTlwRaNEBaGZxc0IwmW24VtC9wkBG+oXCJSl5rdTbX9zSnAGHOPU42S8Nlb1GuDWUcCd
 u8AC1Glm1GPXlGJRPo0AbB3a7ktQTdDgK6JaD+b2r9Hoc47OdhOBGIVXM4vYHqFgZiSHqjhnvzx
 Dhv7BjRRQ3C0W/HD15S/GIPnlNoNiLX5I8xbdFlTSl6S5wJ50QKkOO1Mc9a5yef6o+FVeOZDDE2
 1OOg1OrJ+lx2dkO0aE0ZEz3LFOlpM1pJsE0AeR+twAepe3OIl00+EzUnqQKGESS355y8wohb7lg
 43i2QjbtSdWp/qaxCdogJSgBLYlMQGzeD9sI+8HSJPnUZO0R
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX2oXaKZir3UUC
 LxWGBTYRJiRmKkZlY4FYFLbeQgW5jQLZslfFlB492w5pEckIEUr57kLHIpjWAUuRSzyh7337M+r
 Lmt2we2PoEGO5QuvnZiVEE/yECC3/J6olZUQGw3gTkzLrxGHArlHOYHpWc/Xt1pC66Ktnl59TT9
 dEkCatpde8WAfMcatlgsCpB3hf5sd7aX8KIEkInH+MWCi7o+/cR2UInpVrMcuJj0EIHshKcIqw+
 NqCtxYoAs7aLjoFwxydJc4CmtkNAnDTNNiJbod5UwhLH3MQZNM9euT8piCLKv453dFijMC1XkV9
 B2I5gtTKdin6/65slnbOsx6avQXVgdSs27gtpJi+0Fo/ctE2opa/0wGPwmt3QnUqiNpVSYPusNE
 kaCBjup4BJ2AxR0fjdNqGnQlz2Henzgms2W2s1tU+6gOdG3cFJkzDVe5SDGijKc7gCdCbFYkAxf
 AmfR5zDRSNbjkPGdQHw==
X-Proofpoint-GUID: gaXmoyPaipDDftmQIb2lQ34TyDSMZ6zy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX3uU9tNRZsVXn
 2WyucULTdYtGVPyfIo89BAuafCD25EhRKVHM+NBqtxGPiG8g5p32y2bPoWvNvkQF5JyEes3i7U4
 8tH3BeVlNhLkFlZa1bTSi1jpy3xLMR4=
X-Proofpoint-ORIG-GUID: gaXmoyPaipDDftmQIb2lQ34TyDSMZ6zy
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf351f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=a_a0KNV-W32lKMFKthYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The bridge is embedded into struct drm_panel now, nothing uses the
separate wrapper struct any more.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_panel.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index c00529bfb706..268e655140ac 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -50,13 +50,6 @@ drm_connector_to_panel(const struct drm_connector *connector)
 	return container_of(connector, struct drm_panel, connector);
 }
 
-struct panel_bridge {
-	struct drm_bridge bridge;
-	struct drm_connector connector;
-	struct drm_panel *panel;
-	u32 connector_type;
-};
-
 static int panel_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_panel *panel = drm_connector_to_panel(connector);

-- 
2.47.3


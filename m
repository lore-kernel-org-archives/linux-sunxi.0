Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013061;
	b=UWlGDdg+m6ZU8Vqf0kuwPtkJliVg1uCYWbjIFJ4aYFkUMGVYBe5sLVX19yATctEMCu0m
	 NH7+Au6Mg9oEmtUN2ZEwQh+mMLVFc2Im5kiN/6B3IG2ygT2nW/xpBtHW5oSmF8SnAmK8p
	 PXecqfZL8+DkbTKd0JFjH+nR0cQzG5ccYL47OlO+NpNVoL8paUf3/NlMx9IJuAdOEubBL
	 pJy9XnHeOfJsObU9NOXyL7kMNeW6Axxxo857OzFjM37njWczM3dLZBd4FSxmkudyHZRja
	 PWc9BAzaS6nIGF0XXFQsfoyEqGB0nZHtP3EFJxn9dTCFXDkulZBELr4cBV7PPDuBnDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rebvWxCr9+Ge0kDc28vUG6xfscS8hdlfWlfBhz5l458=;
	b=g2UjUfQLS2fjREBCE+0XBbW+YfNUa9MGBl67VttLxIqg3shcHePxoOK979qUOEdqlz64
	 z13l3+UkXX3zuJ0elj+hyRhLo6DdWW9lpYlYSRR1xu9gV3UnyQbCE3mWxGhg2WTNZits8
	 sB/6knzsfY8yBlqNnnw5I2T2eSx7cMClTFJs+gfW9OU0FvadAvoMGJoyt6aoH+ov1nK0p
	 2BEUUxrZlQelZfKRZoqy+bDIpOMpBZ7fE0uOgOMjMBDoJIN07fwk+yOlknsS3Z7FasauG
	 xNpYtuBAVRLW0VZ5sYMQAQ2vQe1VWYPLrm5iKLTAiNZUfw0rx98Rrbs70BXXR82UlCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CoB+I2+S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ilm9OMO0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8EB606E729
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED8EB606E729
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CoB+I2+S;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ilm9OMO0
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt0xV3631949
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rebvWxCr9+Ge0kDc28vUG6xfscS8hdlfWlfBhz5l458=; b=CoB+I2+SWv35Qtor
	L8GMhL+b7WlxecdNbWGNx+yPxRVOLK747fIkTb4GgJSaAtEkXbxeXhiDg1sCKBD9
	4ovFGGB5v7fFJ7Q/SWsjoy7VwfWCJQJDO8jP3dOuUhGRuAk+Hv8gQGqenkbDF6/X
	u209LROl5Vi9P3ypaj5N97DDDNR6gqlGWsxlK2Yzi9v64uvLwZ9Lw5SULLUWxqRP
	9uuo8DNb0WntR3VxigvtFclO+9Mp9sOhuBXQ5iS4Xy4diS7cD2p7uiZQZ6rcZ29D
	XZAQ/dcvi5uXNTIQcvr2BXZRVZZE7h+SkoM1YIbFfl3dhV+aJKIm7l33YVTtUjDu
	+X4QjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf07mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so640570985a.2
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 04:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013059; x=1793617859; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rebvWxCr9+Ge0kDc28vUG6xfscS8hdlfWlfBhz5l458=;
        b=ilm9OMO0D4XHvE6CEfMx27miFb9LG8ARtL1D2ZqJEP5BaN7k00JXQLVZaEA9rtqd1R
         RWFXY2jbjn7ePI0bEyYJLse8OUKf0YsEqLI4Bw/sTQUxBqMZpku22ita8SjNt4LzjP8p
         /4MyOhCz5+mD4mDphaxnGzCGwr7Fx036rkCPqabCQthTbixGV1nHMwbrVco7NT9jc9el
         HYIhpDsaB5OsISfHx1uSrmUV55TvJDz4UADV4rZ3LLID2pNjPLFbWdUUrkdAbVx5+nBP
         klgcgOF/dbNO26Imq5ePhZN05w0TuM382PmBbctZ247NmZwoGImgPeiSevxnCVyfRPQW
         X3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013059; x=1793617859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rebvWxCr9+Ge0kDc28vUG6xfscS8hdlfWlfBhz5l458=;
        b=jzefVDqtNyQBPPjZnwiv/6fxbe+j/l6Lmp4ofs3WNAX/W4gZVgrZzD4xZtxV4SnmQZ
         VMXVd8u/b1mlu11JXPKc7sWOpTEhp709gTa9DEFVvRBn1zdENcwOXjcUEKG6ons9ryP+
         49+sLExuSM1xhi2Z8GqlJ+7WGMg2tXKG9XHNn+yGM9nb9xUoql3Fj2p8i8bm/G4HLo91
         XezsG/B1lhXiLbQbrLLDgGkjg41gv9SzxemzUawZQKqb70BYcTMjAXe/M31AUFTnW9RR
         PTBgwz8AsEAPhxCDVKzQOZhBNv5zbN4hAewenNo1TrB9u0H5OCDN+xM6R8U1wqeIyMOi
         RLMg==
X-Forwarded-Encrypted: i=1; AKwUvBwNMAIZgtSoBam6EJ40VWQ8gCNWcSGHq/VrOAWSLVgUqyrGqC8frHWliRs7XSP3RrEHMRAiSrvR6KVB6Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYICuusp5BAepqFEq7hYa6Nv2EwQjbvIzfUUuInzbapO0RDjGLCt
	clZlw7g9eTdBIBFVk1ZBJQIgWTZEEoD0aQ2/kzdmadglBerKGStT2cwtQFVNbKaDuzcenaikP78
	5HNNqccIFxH6/WhXLMnM3cfkqL78QuTfGw/l9mA7S3JmnxTjHgRqtByo7/loKyb3PWg==
X-Gm-Gg: AYBFou1f1FUX40Zm5WxieAWeEDIsURI/keoHGLrX/6Xuc7qBPwCQhgHWB1TKjhnfrF+
	A3UprQKjME/YdIeE/4VOG53KjJuUq0mHPnaUDbsDW3R2iVrIgzLKMVjLucugBTk8pVoqq7eqYhw
	GkHKRDn65iQTAHAm71KuZqUVRi6qi5/viSN456bb/iqllK/p198TtClTIdSbkxf6Qk4pv7AzmIU
	u/UlKZFXdr+a8Iusiw5rHBMpPB/W3ZQ1nBsPHwVlrvFTK4aM3PRf4I8c7ipKlG2MnmQRzqHBczG
	CzrwXwfoEA4srTzytnIG3nwpq1naLeC1A/58a5k101vvc2jTtV8MJMc3zhzZzC3PPhplttDCr/X
	Zy7BYvHCt8jq9TH5FSAUcLwFtYqD1WAABKuBQEAa39gDMHgY9ombYmfNGkOv5sM2Bm4oaRMiEua
	RcIJ5uufkwI1Z9
X-Received: by 2002:a05:620a:4720:b0:93f:5519:5e87 with SMTP id af79cd13be357-940ef7ac1b0mr958734585a.4.1793013058986;
        Mon, 26 Oct 2026 04:10:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4720:b0:93f:5519:5e87 with SMTP id af79cd13be357-940ef7ac1b0mr958725885a.4.1793013058439;
        Mon, 26 Oct 2026 04:10:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:05 +0200
Subject: [PATCH 16/35] drm/exynos: dpi: set the panel orientation on the
 connector
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
Message-Id: <20261026-drm-panel-funcs-v1-16-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=928;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CZFt1bBeZJSZQXRLfeILapG6+I5U/Cgs+hD3WY/o4/o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUN6YdtgUzCeo5T63KQnD/ShNUM3twfrzjxa
 JKBXHlhMg+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DQAKCRCLPIo+Aiko
 1RaJB/9FjTGyNUxqB20GbVEDkLZ3czC9tui0A5a81YkHH5yOQeYmEHwdjPjus3nLIDjcc38vLCJ
 1HNPw79T//9xux606CATnWJ3HkM/CcQQG4ErEaZ5jcYplsMFqFCRWPJQF+wkiVXllMb4VnaRZmc
 LMeYEvSlnozCScMtCAgma9qOqczJpeMKvBe7CJ/jfyecwQjCui3sVY7Co3VjjyAYdqgltGgnclm
 6XlCriXjWT2SPOezJDZ/vrH3cMoicwlexf5eF1V6V/UZueqvLExaKnhhJ7KziQqNDUDWoO2rV8u
 euxMxnZ6TNLYBs2ynsod8Yf1sYhlhfEoUc4CeK3326Xx80Wy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXzNDNe/yKLMFE
 XFeFttRS9QiWspewzmQc8pyVPEmf9+5pcLgAhgmjuu3zdZhhDwKnfJxXoJIBEhTcLgFruHKbQIW
 5Yj7+GhMQpcX9kqxqKP4FghpIgcRWSY=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf3543 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=-iJ8zVrSboFU4qp5kIsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: XSVyKJwGucnzD-fvmsMU0Ii0_0t_EaS_
X-Proofpoint-ORIG-GUID: XSVyKJwGucnzD-fvmsMU0Ii0_0t_EaS_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXx4Md5SisauuA
 AfdO97NlCXylOvAgLnjZcLbgFJG8km2r9vu46RxYtvKTpikL9zJImcqUDt5AZ6IGRX1aYQGPrUF
 IZMaBO3LvBQGDHoXGEKYfJmzTft74Jp/kqADTZFs7iiuzC5v7TaDMTn5IhaAiQJGkNxaWlFPZud
 Kq08u7aCM5alp81OuWMIwA+H4BNOGlvu9g8ADq82aGHPBHO7h6TWDvEn5rXl0THkkyjNegPWIg+
 q21ybf1Ku+TRUeC4IdIFx+xHeNLBuFxOLuUhjq+CEWlA+bNnW0mcWg2n7v4QCXWTWaIIn3Zw5NK
 J8LrCHxZ3672Z3yf1vfUvW9W2cSvRIsAupBEeiCVuFDX358kY7Xw9mHskcVpyMbaAbgCTghiHYv
 E4wbJaohdGXhlQXvGLY8VEt5gk6EhbBn+zeH2TJU3dXLh339Mo56HqslzYIX9IoCYGSAaUCdMTO
 CANSZp7tmLdFkNeD13w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The panel is used directly, without the panel bridge, so nothing sets
its orientation on the connector apart from the workaround in the
get_modes() of some panel drivers, which runs too late.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 74d3a2bebb74..05014c2e7d92 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -109,6 +109,7 @@ static int exynos_dpi_create_connector(struct drm_encoder *encoder)
 	}
 
 	drm_connector_helper_add(connector, &exynos_dpi_connector_helper_funcs);
+	drm_connector_set_orientation_from_panel(connector, ctx->panel);
 	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;

-- 
2.47.3


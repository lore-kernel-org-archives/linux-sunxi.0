Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013033;
	b=p2Uf0i+krsdVRo5JneRtm0sGbsGvUWJdy7TP1dadht+yiuZdijNy5bXA3YedMQiy8J/X
	 KEYujKcU3i6AZRkJStAChnpBfzMG7MQnknL6Nk4mDYiM+N3f0fgNdRQo1VkOgZ2ifZK3H
	 f9SIEyFxn4/hgvLu+dju8djCDfOubVR6Y65D5eC4CUFo8UzQV/2liHXBtmIsjITvoUcCN
	 mzbdFNmY1jyfUCOEwNAcA+V+zR+utTeOYhcy3GU5kFOXPFcp7r1B4S5cgt6LINn4rmYYJ
	 nGGDy/jYLw275MzxQvPdsmjEa+1yXg6q7yStf5FawJ2dubhhZsQZRcYTphpVDVFk+WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O/NYPa5aoqcu91RkIOpDv6ECYq/Y+3u1TbX3D34wWQM=;
	b=3xtkPKICOnyJjH4MHvlgVuv3FDA8JD4sBatFW3AdvadF51AXcBndxMnyaeefYHy2B/U1
	 Hzl6BAlbWrNtrl4OPvIny2KCF47je+U6w0k9F3yeDUxBRvV71KzfpIcBgbS/I6FBWQjJK
	 kyj9RbgXgdrAVj8TjIP1Vppfl0FUz4tcBmklvoW0ke69Tv+ZD3EwYdHauYYh/i3zle5JM
	 NXqhAWlnHpqogkzfeCkvlcXG25ORp/v+pfUTpZD40fzktSCgNRSdk/kXZPu7BypPk8i8i
	 NRglXu8M3LF7mTAxY+OMiJ/2sn5MlFXNd9T10OuhVc0741MXnCBU16mO3zCQi1ly6Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="IildK/Ik";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TgCkCeiK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A8B60A381D
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72A8B60A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IildK/Ik;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TgCkCeiK
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtM5b2009906
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/NYPa5aoqcu91RkIOpDv6ECYq/Y+3u1TbX3D34wWQM=; b=IildK/IkT1oiGAcO
	0rkDGnQSndd5h8/Flx4igfFmv6pb1kJjABNierxgdw062CeIZZsS4itr/PuYBGhW
	0sTZXPCJBcGwBWbPaQ8Q8VSP6ufEvBUc0Ggn0evLqywRZ8yJY8HHHQ+wbP5YMXY/
	g6XOWO8oT4DQ7LoSVKtyPE5vA0brd/P9bZ3/gUO+tzpuOyqGSYarKOZeCbAhRyiC
	ERFl9weGsSjnEdxrZBC2vB2uw/splLIYdaDvCKFWRE72cUCUmBpwlWpNwJARIytv
	AKB5MZCK+LmWfuRcti8lnqbwGEKZUeEneqU5yxoY8xD+4+3dC0rhIcZGnjNDEnqv
	LeEc/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27x2r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so657678485a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 04:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013032; x=1793617832; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/NYPa5aoqcu91RkIOpDv6ECYq/Y+3u1TbX3D34wWQM=;
        b=TgCkCeiKMMk9ydygZr8g3ASxGwKt+iQzCTRWJOOfjPs5gd2FdsaAqjJYWzQo/kwIq0
         obHiY+lGBbUxUq36kh5MqlRgspLyD5HVlEPm7aCeOQdyf/OlAihTCOGJqXfMpUEP0rg5
         zYK1rMtyhk9KE8SqfszzZiP1ma/+GyS1K5zYwCthPU2lY2YoWtTyG7E4WztmzhTQZwat
         3IWgGC4rOG7vWQnoIVFBGeYoe5Muc8udKANcfIMB1k+GyRe66RHlHrgbkvfzbKkXidHA
         XGBHZRwE4TAGSE9gvVua7zgYwB/oxbwOzMm4UVsQFhIcC7JTEQ6MLzTs8cFKIeTg0T9A
         AQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013032; x=1793617832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/NYPa5aoqcu91RkIOpDv6ECYq/Y+3u1TbX3D34wWQM=;
        b=0xXxEuWyFL/NsvzwSbiDPWM16RqVaDQ6lsBxBHO/KKvk895epZsfAQstamZ0zAoADq
         EEHUBMuAVwkOPpIMDcvi/ix3M3QuGGFFajKo1t0U9cPsu5uZCRcxGoQ6lyx/XHzikS1b
         KQX8L7eLv5AltI/8Sf0T1eET76O3yYnZW2wlgOJLCKsBTRuEtH6y3tAwQXVaz434qFQw
         aV86Fhy1kSBmzCS+zpNSUzpIWGJlzmWc523XCWPvcaYR1Kaich1FBtRUrcFguylsGcfj
         UwWnW1VR7BMyk8gCnbfr6NfLslxqumGUs1dfSvyEDjbNNNlNcPdKmFpFIJ12iIbMafrD
         ZEjA==
X-Forwarded-Encrypted: i=1; AKwUvBw2IuSY4vQ27kFcZbp2h2rPpisXlyN2x4mY0HkJCvNUWNk2BICavyfVWBSUaro02ePj8tJRS7DGRabzog==@lists.linux.dev
X-Gm-Message-State: AFq9FYJjUITjsc2jgTslyvph8DXMFHxC3KKFqBM4/gpnoW7vigVFK1Kx
	e7o+gzLx1WlUtDj2bMTHK4UfvQ7kWxhCy+CGcWSpYMdCd4cvhhiSqGDATM000bfZNgnyH2bK+WM
	nL6KW43UZVqTR+xGJTkkzlSUn6vl9epGmFKEd5s1B1rCYUzK8jntANKl2M+su5eVxMg==
X-Gm-Gg: AYBFou1qUSSornuHWjvU7iZQxOR72Kton7rvMpc/n0GJuvoAIiL8cchH2XBCf31C3vl
	tXAeTpZm7r8q9DzzPi6DyHHlrlw+H6zkaRVFIausOhwv40pGHRS2iEyGZUCYCpZifVAIFm/uZ+z
	gp7GomUZzHw5kWqbUfzmSCreOKN/7g6+auLK192OfqS5jTOwqUJIf0cNzmtIVmvA4yA32chkwZ8
	QaxCinU/MIEwvi4LAxBr89bLNCY/2gHDIqhwAGYoI1+ExgRL8zoepQx5ruCD85agsuKBOn1aQw7
	b1uwS5hGPhkQ3EKtJhHSW3ev8mLMKZZ+ipFMO1Fn095+3mHMMfuM+nt9fH1oaCZCIPsPE7YJcVd
	hBL8md0IFpl0Fr3A77GqCGeePwySSA2Rb9/oFAkqhuBHW1ffQAxiuFPF4xwUmhIBarA/DzFvIBX
	INQHEPe8XAkik0
X-Received: by 2002:a05:620a:2556:b0:93f:2b65:593b with SMTP id af79cd13be357-940ef9dbe6emr819420685a.38.1793013031564;
        Mon, 26 Oct 2026 04:10:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2556:b0:93f:2b65:593b with SMTP id af79cd13be357-940ef9dbe6emr819414885a.38.1793013030960;
        Mon, 26 Oct 2026 04:10:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:55 +0200
Subject: [PATCH 06/35] drm: mxsfb: use devm_drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-6-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=974;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=a/x7dJOBA8FZd0WveKfgICj2FZ9z8HimB+uvZN8QIWU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUISjjZ32quLsYppeLFnZUubyw89xz2vLjqK
 a3kaiRXP8mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81CAAKCRCLPIo+Aiko
 1VJ/B/9LPMsd5msSwfbNUnNBey/TrEJCBg+N3SgDXzl24HorxEMN7u3LYz/NyZ1TNOd/pIxFBCM
 c0okzzGsnMswVRglGXqaUvX9vE5lqiTny2ZL8obWRimVF1xDFheDtJ2CSeNm5Y3PnwdPV02HNSv
 29s4K/p1PBi4kRNtnOyr1JA0Qa75YEf5wk4SxSu8CpIJz/d2FYGtEJJw8E2wK6wa3Q1vtbh5kWC
 aDAwkLp3U1nKh5fpbQD1Do6o6BQ5S2krzDRMlNc1l6x/tX2Osci+bjKcYnSBEG/QnSX+74m6PMn
 xg1urETPEc65fac+BXQquFP3uOsqz3Wr4HYj670K8yOIqW5b
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf3528 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=JPWqk69mNThXLZiqCgwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Nnq65Du5e28ffWpdSenJ3iHRUaAG4JQ_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX4/3XzpZDEKei
 heNaKn+tMIopBXjsVbiqQwQYpy044gDbVq8tOYHe58Y7iGc3yE8aSWaG8TlYFW6h/B6XtkDv0ZZ
 LOjyZ7oL1Kz1VtJ93EGJH02/18uFdeU=
X-Proofpoint-GUID: Nnq65Du5e28ffWpdSenJ3iHRUaAG4JQ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX5yukWjotf/Do
 hb/BJyFPaW8TgGFCMN5k/JnDo3qkokfiBlP/tk2l42iPInJN4YnoteyVx8gXBsSch7FUyM/YzuF
 Dp/AzsHJItrIBanEIaJAlau+uYsmguqT9Yb8LhbTx8PXYmxVDKNeUg5M9toGJNPnbi+uj8yI5Zn
 OxYJJY0yu+AUjCvEp6g2DFmIJ8JnRl0mRPHSEPVwVRxLQ/IGgRz5P5kxYF/2GsT8C7h6XgO2gIp
 IqKOK/r1Sju5GvWJ5/KP0WOrfyVnJ1G+n9L8rMnOjAwQCvPLQclsELhdr68FzbZaMxZhe/5/Kvs
 lk+kbJDAd5CbNuztLsDK8ufyQK7w29zWzakcmFeGS+s7LI90UoOOKKhGnM8D5ni6Nyiox0hVJpz
 KpjtYUo3mnGsopXJLD6ENqjH8bBTMeA1vCOXxgIsRJFXr0NrIdMFi65rOOzd3/YmeS+m/H18Diu
 Uby7dV496Nii6sUU46A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The connector type passed to devm_drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 641691fc92c8..75c7e869393b 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -129,8 +129,7 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 		return ret;
 
 	if (panel) {
-		bridge = devm_drm_panel_bridge_add_typed(drm->dev, panel,
-							 DRM_MODE_CONNECTOR_DPI);
+		bridge = devm_drm_panel_bridge_add(drm->dev, panel);
 		drm_panel_put(panel);
 		if (IS_ERR(bridge))
 			return PTR_ERR(bridge);

-- 
2.47.3


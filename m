Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013030;
	b=wjlEpesmV+W8HGdcTa58gyq7yh0LVJZaP4oqn/l6eSdtCaueeedddsyjFA+l0r8NBX6/
	 LuyPilQQnTPeUnFJKPWDDiKU63qmpOVdup/Vrv+0i6A1mxSOC8e22VCaq/Gt/XzYmsOle
	 Jc15haDlrrZ7vOpTiQXJQY8q5iYm4twwIAtotBQHQpT8mtb+7gomW2bOMHxAoZyV7LZDZ
	 CtqG9SxLU2t63L1haHCNKXLWErFeigpQA1Dr2QiC7HhXZP2lWteIttI9AXnMu0OfrlZnf
	 cTITFRSAWhb5qXj/tDMTpU23IdJ1i7qJA5vt4aDfOUunq6TCheTUGg6/skwkLCwasPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013030;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0zCRm5eG3ghIarbZ6FN14YvdHRzJTAT4yr6CJ0tR1B8=;
	b=M+/W2F6KbIbgpKrzoMe/Lbf2aQZbhGUA8A8nQNCKzKseNQb9KjIntwA9gF2xezO2bVrE
	 UYuc7CzJTE4iecNzRb9LTu+C+HIzbngZ8mcLkKHsXORPcRSYI75WklRRxcOmg7gRWZp1F
	 3jSmGMXHq+qDX6GuyVSkzCKqPblQams2/xYqMdettA62CYvHzaKWnJNj8u5I9o9YXYizX
	 +AWiYlATl/dzlAfHfjZycrCZ7yvwBa7fPMGscxIblKMclsS5lpNBSNWtpWn6IGw6gyQNY
	 yuubbNBEujmxNMF89kBBEkILBJZxmapdCdzCO1QawM00+/c2IAnB8/GZ7lEW7nmufgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFLsHc97;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OR1zgq4c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8AF60A263F
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED8AF60A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFLsHc97;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OR1zgq4c
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt91j3049902
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zCRm5eG3ghIarbZ6FN14YvdHRzJTAT4yr6CJ0tR1B8=; b=CFLsHc9762okA6Xe
	DNNLTbVLT51S7Ldrrqr0IctC6YeQgidEeOZBhhNsl/MWtO1jEhxkCkW1csJeDnks
	dEGBKqWdZLh3r3PfpcqHaTbpz6kbzTOqRpNhrtCstwQyKT4mtqeKmfyztmWkHyo1
	v0uYoWoNVrrHEdqPB5uqmvExLgP5d2rIjnvCXUlOn+JV8xbF+lLiPeOObjADwzM8
	2Q7fiH/fSOgpM9suw6evclkNJbrx8+td1GkaofdOifXgCla9rJ3/nlgs9I8Q+K6D
	Zk1gS+pDJXg9WE5kvCddsHyCk9zxUc1z7WFKRbXUOVbyLIGAScUrRVGqcQbXyhRt
	slU9eA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9u2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso683006485a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 04:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013028; x=1793617828; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zCRm5eG3ghIarbZ6FN14YvdHRzJTAT4yr6CJ0tR1B8=;
        b=OR1zgq4cpzMyKoTWVOplLgKMMT3CiRn5PlY/y9H3lF4pXhJY05Gwi4vZnAdTNZ6bzW
         i+7iySuqcw2HlpvA0yULvh2f+mNp9gPJSErUbYU5FRB/BfCYJn8+63hcwMUx1MDfZozC
         xomipg6vnrGfUzNESNEdGML0VxGAm154eV3JmPLqkzXse/yDbfoLkjxHRridXK+DkdV1
         Fpord3ibDdQLDouj21IozQvFAeijzjPEeSK9424RTPb6eacCPuN1zXuggMcb0LL+BbWr
         nmSiAyd/6EXtv4aAnW+MFnvkHP/rf0rm7tvrGzpeiuUnjhKegwTCUxq7j+AjcpRvJ9K/
         cUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013028; x=1793617828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zCRm5eG3ghIarbZ6FN14YvdHRzJTAT4yr6CJ0tR1B8=;
        b=oEra0/OQfHKicTLkYDHSJ3Aq9lLAQhbUJD2wrAkPIwuMYrA9go0BAo7/uvgDeNllpG
         8enk6yRsIaypnMUghmGaW2W/CfO81+YThDDMBGzL+BKAYR+sKidTu7bie6ju4vQuH/Qr
         iHdf+OhPk+ArY3EuySj4Uc0SiOotunUgfQrPid0JO9rw18BbZuQdypiZUYFEsuYw5Rwj
         XPGfMYyD8BxaDIynJxWNTSkY6mFs347aV+JZWvhrBxIatlqnmvxR5x+7GuNKdwpb5zVl
         I4cbQlF8iSdytbqFvJiQYtMdk0vQCLq5zDtcxGD1e+jJbGstTedoNIvCC5QZ1AUtl6Ll
         5UfA==
X-Forwarded-Encrypted: i=1; AKwUvBw+Q30feTPBkE4zHTltyNP6RXsU1KjDgK2qAGalSFZ9MgBGVaqUB29SbW5wx25Mz1jlktk5+T+v3vrh9g==@lists.linux.dev
X-Gm-Message-State: AFq9FYJVcbdYm/CgyX5YMjiF1HIV+MBRWZWqSFAxxz34krPrnDyw0ELL
	njmHFicjh0ITYEwl7DtBNQEbQjJ1nTjGOb8dH3YumvSNmqzFJZTOKGCdswaOWKl3o5zgQ8y/3Zo
	0gMFPKsF6cQ14DpoxxB+Wt63M4r8vwGkNW/mPpuu0qyrNbitIo1efFIDM97u1XXH7hw==
X-Gm-Gg: AYBFou3/JitIOOut/IlWQH+pQDGIA3aL+LHHAZ7XRaXH+yAr1LbymQLJpgDjuhyuL/e
	QJeW/gI/oKWTslAGQIXebUuUbcw6avrvxqwckPtW0q5Jo3annsy9GAMKxH2DVOrQOhnG58NXapW
	VOsHPsGr+GtgtpkQl26PSvjBUEiZXhQCwGBckx0uwFpZC2dYLfewGwpfcIsqj+a/uRp2Ui4/qAQ
	pOGpcIR2jiksm2T4aCTExcMRVaux7QXQznFPQGESJeM7mAYPF2WTltkCEYmVuwwun+5XU5xZmEy
	r1wT0E1OwezrAiLYW3TP4hxgD99HOZ2aSTTrHGJ1hpzPQvXCrBT5W7HjIaZRR0AFX23B5z5Shfd
	axV0a2daSkmouo82P7zMZBHRNXZhnlWHB1XK86TRqToUyGv0pVl9XHvB/jJqyeu5844uq50bStx
	gi7oh200r5Te3s
X-Received: by 2002:a05:620a:1724:b0:93e:c12c:f11f with SMTP id af79cd13be357-940ef95510bmr878849185a.75.1793013027634;
        Mon, 26 Oct 2026 04:10:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1724:b0:93e:c12c:f11f with SMTP id af79cd13be357-940ef95510bmr878832385a.75.1793013026763;
        Mon, 26 Oct 2026 04:10:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:53 +0200
Subject: [PATCH 04/35] drm/bridge: lvds-codec: use
 devm_drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-4-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=85YHjZ0NSZtOuaqrsrlX6K/Q2s50Gxv3BCx9uKSmNk0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUHQaGfB5ccHvaFcoPYXa+Pl27bdNQhbZFQD
 EINHRC3omiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81BwAKCRCLPIo+Aiko
 1THIB/98urGNh+7LGcBXOGMeSCXA8j7jtuAjYNCtyogGq1Wgbt5YuIKgB2QYd7KnsyyIdv7g77C
 gxtAVLIC8OVYkdE2p8ulQt/i0j6QaellGDEk5S5npgvR0lqlvFjlwQOifUURtyY72RRVWkE7LoC
 W98XVFMsXP0XUKWriDGM1x6UPhlV+kCNSR5gfsqVsApqnoQsSUMvePhUoBFEK9CjRzOvPkmwM5E
 1VmboRTQ/GPNOQ0oLTM5IIqLUjZJn6evmk+ierH7n84183noH2qlgGEXO02qFJfVV0j9dJJSs8N
 EzwIZfX1H6kcdX8RaQP2fDm44R/fZkL5gChC6NBJ7pOarn0v
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: VjZtADdTcLhY1WEyWlY4AYzAQcau3Ym0
X-Proofpoint-GUID: VjZtADdTcLhY1WEyWlY4AYzAQcau3Ym0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXwwm0CQ2CmI7q
 njMetR5691JCZNUnRES9bT2ZZX6SmB6hj8n6LcSgHWZELMyQF2KoyHgHla/nWtYLPkUDyWyHrDO
 svnoZ6OGOUFSlnmst095PNFfSSdCjVHqeBHq1LGYRoBI8I4qQR7M+z0NC+UVusE04gn6DRG1IT+
 ucOcQvN1+flZfpnRIHNczoiYFiPR69QKefPos4UznnCDR3jHUM4sTvLAlBjzrNbj/9ZACuodDCb
 U8BnJfXUJL31N+J1IXAOpRpqgKtClAJtibqItcLhAkyrMKbq+EFdNsC/wSerw2o1HhMEDAvs9rx
 qZe+hsd27dcvVPUeFkCnYAmqdD2I9/gVO++H6Z+eSbgXAlokcB6YseQnDcR1WLkj1mPwgjHWNMx
 mHACV538EOvuxPuHQdSB+/Kfvvgq2ryEW62/vR4WlK47FQPZz4BjCVstR47BLXrzoO0HbI/pIe1
 MH5nHslhWgrTB2dQhRg==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf3524 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=BDj7AndPpwv1RkrcsKIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX9rj1MGOZJ3C9
 cvpAgunZqwhFc+87CbMFbLDqRG9RuvUYux5aDtEyH/d4vZammpeum2Q6j09pIoqkC+oNPmeGHHv
 aFmiOijnitqNf4I4nprb1L9GHRMkbUU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The connector type passed to devm_drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lvds-codec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index f97c8586273d..d25d8d777191 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -154,8 +154,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	}
 
 	lvds_codec->panel_bridge =
-		devm_drm_panel_bridge_add_typed(dev, panel,
-						lvds_codec->connector_type);
+		devm_drm_panel_bridge_add(dev, panel);
 	drm_panel_put(panel);
 	if (IS_ERR(lvds_codec->panel_bridge))
 		return PTR_ERR(lvds_codec->panel_bridge);

-- 
2.47.3


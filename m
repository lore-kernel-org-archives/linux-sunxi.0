Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013055;
	b=VrikqlvwZtnsGybzmo3WRWYv6nDLY7Ngu9ImEILJkUr2TJ5e2TKu0vDtMvxxCoHsDb0y
	 jP3nveZWH+q6F0mS4QFC9JP0N8viPqUDu40PvWj7gB7WciWJGNS8V8zdwxKnVf8r19nvJ
	 UYLaHdrbJJcwRQioaSa2s6DT7+DN3enR/INgKYT6yqivtgiPYWWCHY1gXe8hpFQ1eKUoa
	 dREOc+udjSdaD/YUp8EYmjMiy2ROyfEvmVlL23QbLQ0dojzpAYIMCudIg3QaxNpIbZ8q7
	 zu/Sy/gZ3enmbpT7NbHNMbaoaoSJ9484rXQuuqYvXcCETErCkJLj8Rl6OmudbNa81AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013055;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1Yae7u4iPTCkVtrsNrlio3XtykQ1rkcSFoZWaTvI0TM=;
	b=wbZa/icY4GrTrW6skuO3MFG556ZUcUV4IzGKdtYx+uagSDfwPJEGqX3ibmaZ53vDMFv3
	 MQ/OfbwMkG925cJuESQPZAogwC7q9O2rCFQPH8zlsKA2oheJ/s9XpYiHO7aPEiB/2kJQX
	 XUd00CP2DEiPB1/zUf9swEjRXSqS9nFOX+rp54zib9oyaBoUC6GG594rTZfQj+pq+N2K9
	 wbbLGyOaPA969sSw86d2+M1+kAoxd3YjCVwR2dePC6IRKzETRq5NrHT//HS/qEzzQtvNU
	 /LOwEP1gnIV12h+RzmS1Lj9xBcFQaZuaHTaC4E4oGJplkBT4JHftoMCh2Qztoqy1/fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Te8CKCwt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTCXYzT5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F5E606D889
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34F5E606D889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Te8CKCwt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTCXYzT5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsuu92732735
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Yae7u4iPTCkVtrsNrlio3XtykQ1rkcSFoZWaTvI0TM=; b=Te8CKCwtC2Bm7wAV
	075aGMUOaqQaJUofzvgg4bXSfsGt7kbwDZ+zX1wNVMjvYGBGBxhGTMNvboDKhaeK
	0Q71MC+PkRCjKS0/nSVt78bvOr06d9VforfYXaLdet/RXEHiArN2sciG0qCBEQA0
	UkpXlF3c/LwDNtDmfGlhXurTMcgy5fEg8cjso1DDkqMI0OAbT5BC/a3o7A12QHuP
	fnZJOmHlJ6V5ygi2Apxn+O2mUyZ77hO0HNCsFaczuxFquCKqR/VfNy2HsqqSvMZq
	JLj6kTn8Igk/rAHhMvjPcGv0pNUdxLS+RfeomuBBUfkw0Wr0hS8s52MkmPb/5Ka0
	Y2wIbg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8bdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179a556c43so67260956d6.3
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 04:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013053; x=1793617853; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Yae7u4iPTCkVtrsNrlio3XtykQ1rkcSFoZWaTvI0TM=;
        b=eTCXYzT5KrKfC8KcjcjSYh09mqHC3GMi9lkqtQnv5+08zBRi4uPjlt9W+BEYiL78YL
         waeC3LCC4yuXZblvUuBajEHfWJB3b24eD59nG1INxCmbbZCwASlCnpCNky/kGmUZaMm6
         N8J7qpDDcm/cCDmpWoagHYhGsG86bacIxmw8943iCzF9zOgsfLpUq1EBNYxSIJrxm1kU
         WajTu5RKq6vXrE8GD3yYDiwzigxHLlxxLgEH+L2Evu2AV86beXjjJf8V9nCxsXoZh8yF
         4K3+Yd5BwdX13WUSCZS8/ZNXFit2Kl2cnEoUVT3rl4m06Ehp556JocHeh0qkZ1eWnn8L
         KcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013053; x=1793617853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Yae7u4iPTCkVtrsNrlio3XtykQ1rkcSFoZWaTvI0TM=;
        b=HQKd4r/b7lFscekDwNb59Ftz8jj8WjyimxeqoATGcXnI9yt9IcQ9HJBGPRHzSYR7Wn
         Zb4/z5GullzbCciO+N8a9SmrwhHMKnF4aTEwC76tMJQRQH9sGyPewHaF4r/OgIleBJSP
         zqQ4m5mrEnZJwqBz3g5O+8acPZlmlZmTEVueed3pQDRdha4xbt5ftg6BPufMxNmG5qjo
         /i4oKCdQY0xs9JFuk5ARKc5O/DG53B0065meX6A4b331HeP11WDKeImPUb05nAHJx2i3
         5hF9BZ/dH6SJI2NEW0fSmvGjX33dChjHh2xZdzXO4qX8NW1U+YA+XObS3jf2bm2Y9BZg
         DAiQ==
X-Forwarded-Encrypted: i=1; AKwUvBycj0G/8PoRMsQAMHWXnwJf3+A38WaMKPl2dvnKafza+xdKTvR6q9/5WGD/liGK0WSeQgEZSqm7UpF8CA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKUZGYNiizYq1PjddhOmSt2w3A0dCMBs2bFUUdpNPUtsVv0q0Vb
	Z9RDZo0MRqX/lyzvMaN8ya4+vRxAuZIY0I2m83YM0gkrNzQuXNovxKOydClSblgFyKo+gq0SlBK
	vaBRZykYi4euvoEiF20V164IdZoNF2NfrjfIrap5Rco4WOnNUVGVy3Zel6Vw8CLEErQ==
X-Gm-Gg: AYBFou3OJZEgS529hMkL+5YSVwB8raXUL5qe+vhfG9qq52nA7Th3cWSR9HFETbZVCAL
	2LmTHaXbL8vElMBIYB0fbS7ZlrSTO3V3ddZltMCPhN/VKrs7OWRw9Qpv38FeDGujMnYgSkw5wpi
	YVlZMOFhB03ZOjFBUru5lRK+vVZCLIFoix1i4vMeNHTESxn3+k+Yh7ZOntw2uoG0/xOfS1nL5TU
	nyBT+d1iLhK9ykpFQH6Ghv4DEgQP35/us9qJ1cNCkVENFsHvZPLyKGq4SoMAxJn7XciSdZpVYRQ
	RN6sR/zzPFH7MoCNQqaR2GFGoKcvUmblJqsCLyf1Fjf8xrDQ0Yc4rE83uwBOO04xi8PJsJJt85u
	GTu3C80oeljo8RVC3LdTgtHzwq1lXrwewR3RfsZnu4KzP3JNTk0V41bt1U1zw3dmdLY2JI/rqSn
	/QlFGvacbqka69
X-Received: by 2002:a05:620a:31a1:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-940ef956c10mr863559585a.46.1793013053280;
        Mon, 26 Oct 2026 04:10:53 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-940ef956c10mr863550085a.46.1793013052703;
        Mon, 26 Oct 2026 04:10:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:03 +0200
Subject: [PATCH 14/35] drm/panel: remove drm_panel.connector_type
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
Message-Id: <20261026-drm-panel-funcs-v1-14-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2843;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=H8brYvr026sFwdBTY9RxWvYdlcCYPOlDmMVuJvSD6JE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUMaqizdITs0fda3O8tKBo3xGuCEiu/0xJEI
 ascQoHtgWKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DAAKCRCLPIo+Aiko
 1Wo+B/0WDUqJzv2IDDyhx8xOzsIKbrawnNRv7+uNpMh8u5003kuuc17PuW0A21ddRPPc90JQBQu
 30YOoTNAl71shHXaRzstcHpab5AMmb1Vfl7kVdCyRzYmP/o5/OSuCwVRYyoWfmBZE7kR+bEVeNJ
 IvrNKFA+Hrrv0BIaMDEBIi0K7Rf+tioSmDTSX1oHCQ31fXHzctnmK+U/WK+nUmXK0GX82KykNnj
 gmqIrXn8z7M4wyfK/THNuJgQCeB6SlwdIyWTOPo0+m5T/E6DkqSJ69EBR7pFqvw4RXhAmkYBTs9
 iTwXcvZ/5NUsHwK1FDqsXQFKICNjNGOp7zHGJQxdaLXiWkIb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX3LCmEFDhnNzN
 5hi6MwI0uuZN/SZSbLKWVON8bsb1ZSrky5wux16DPejpPsB25QfhdrjltKlgB4wrtc8XFUZcktU
 TaAYp96oCEhjQ5eZ2r2FTCQm7dlcPUjxdGUcE0pNZi4pDg0ZmVrL5aOM3g5+eFiEFIKsPs07a0e
 t/0Hz1/W9EMBCDbdQThwTAMo3AMd5G3lhl7pvZBefD0QQvx2LjZlwQ73oKkn36tcQQAC0gyXRR1
 /K47MDItw7CkphjzSFt1CVi0Cw0fjEORPgfUdUdv52XZGlw/Zb++e/BnsTZwWWtYI+374+sMnHD
 mbQ0BbFknib7/8QOoQaVxUrOch/wP1BMi1hqRcMXGJf3KArlpZhi6tk3dT1bAdvJqmGyqKIbmSo
 wCHwbpMhs0uIICG530WfJWLF1nSosci8ab6NNUdn6Yy17enSOAKdEQiMeoiNsUmQwXtKXp7SeT/
 RwN/b6sZPLGaDH8D9WQ==
X-Proofpoint-GUID: AqZNYJeJvBZc3hhQlYtDcqXeuGHlLWBm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX1VaHozdVyFE4
 aca/+vCSz1U0pGMR4agv08753BV9eCiYQQ0V3sr3i2P/83tzyU0Y4/6UUDM7TnDXR0F9qPHVAS5
 k4fNSJf9reOwowz8yXliR/XB8te2V80=
X-Proofpoint-ORIG-GUID: AqZNYJeJvBZc3hhQlYtDcqXeuGHlLWBm
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf353e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=T6n4-d-I4O9jgBeP1XcA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The connector type is stored twice, in the panel and in the bridge
embedded into it. Keep only the bridge one, which is what the rest of
the DRM core looks at.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_panel.c | 9 ++++-----
 include/drm/drm_panel.h     | 9 ---------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index ab701a526ef9..5bc97166bcb8 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -86,7 +86,7 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 
 	ret = drm_connector_init(bridge->dev, connector,
 				 &panel_bridge_connector_funcs,
-				 panel->connector_type);
+				 panel->bridge.type);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector\n");
 		return ret;
@@ -258,7 +258,7 @@ EXPORT_SYMBOL(drm_bridge_is_panel);
  * drm_mode_config_cleanup() if the bridge has already been attached), then
  * drm_panel_bridge_remove() to free it.
  *
- * The connector type is set to @panel->connector_type, which must be set to a
+ * The connector type is set to @panel->bridge.type, which must be set to a
  * known type. Calling this function with a panel whose connector type is
  * DRM_MODE_CONNECTOR_Unknown will return ERR_PTR(-EINVAL).
  *
@@ -267,7 +267,7 @@ EXPORT_SYMBOL(drm_bridge_is_panel);
  */
 struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel)
 {
-	if (WARN_ON(panel->connector_type == DRM_MODE_CONNECTOR_Unknown))
+	if (WARN_ON(panel->bridge.type == DRM_MODE_CONNECTOR_Unknown))
 		return ERR_PTR(-EINVAL);
 
 	return drm_bridge_get(&panel->bridge);
@@ -527,7 +527,7 @@ static void drm_panel_init(struct drm_panel *panel, struct device *dev,
 	mutex_init(&panel->follower_lock);
 	panel->dev = dev;
 	panel->funcs = funcs;
-	panel->connector_type = connector_type;
+	panel->bridge.type = connector_type;
 }
 
 /**
@@ -547,7 +547,6 @@ void drm_panel_add(struct drm_panel *panel)
 
 	panel->bridge.of_node = panel->dev->of_node;
 	panel->bridge.ops = DRM_BRIDGE_OP_MODES;
-	panel->bridge.type = panel->connector_type;
 	panel->bridge.pre_enable_prev_first = panel->prepare_prev_first;
 
 	drm_bridge_add(&panel->bridge);
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 07612e9791cd..579b6be855c7 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -236,15 +236,6 @@ struct drm_panel {
 	 */
 	struct drm_connector connector;
 
-	/**
-	 * @connector_type:
-	 *
-	 * Type of the panel as a DRM_MODE_CONNECTOR_* value. This is used to
-	 * initialise the drm_connector corresponding to the panel with the
-	 * correct connector type.
-	 */
-	int connector_type;
-
 	/**
 	 * @list:
 	 *

-- 
2.47.3


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013080;
	b=AGhAJaK2ZjvF6JqzG4JCJfS5uD+4N9y0jXcjsTBrFDvuNyFpTbtxXV8uwoPxlYtisroG
	 lbSOthT5XArSsfBd30PfF6U1cx04g9oFBt7Xp24beInEgTlf9G5kHDX18iRkBbiTAI4N8
	 bszMRAhJEwpbhk+m6DUQ/Us8x5sJKRu2GPF/49bgzNP6AoKQtHITCYW1k27zJEjzTzak7
	 UzZ/D21IiQRu7Y2hwivwH6/OW3F4GhKAhPHJTkEMGoGCPbQdWjdFZhmJJGXgZU8AbT3r5
	 MbpJ4ipWSV9B0IudMC/NXPIFaoqH2LtG+GcBjKFexsuI3mGI5jm6YOnAHXjruBbqZ4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dg5zkY2HMaN3S1LQ7C2wxwVeSCWjIGLxXjphKAEg1Bc=;
	b=EUmgPXr/F3ENUZhl4oEcs4nXtxYjGqORtfEZG2Ju8CO649L5Rjw9NboQdgBhjhP4hpWr
	 jlXSSkIT+frDZfAhudsxI1FUjfwRDAwVyP7r/ZWwm/WBvlzYSoHO0U9W4dSrzpIXNIzKb
	 hZj7DbkJJv7gZlKlsdIF5k42ytd6tdc2KJjOO9EF+BgY9fm5ok7TE6uaCPVqC02NR26rT
	 bLNso6ZC/4fDHHpcpUVs0a0rRfiTJS5JsgCCiC/X98sEAg/8CQFhSKwrGkMk1ncm7K52h
	 JnAUwbDHoN6XcrL9GycFgt4TaH68Y6XZaGGukuIpS2ekIwBpyPRwslLh7TDQX4Z1xVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="NT/pTjjt";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LkvLhyZ3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA40606F81C
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEA40606F81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NT/pTjjt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LkvLhyZ3
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtOoC2009963
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dg5zkY2HMaN3S1LQ7C2wxwVeSCWjIGLxXjphKAEg1Bc=; b=NT/pTjjtrT8dYnjF
	WH6qLjW6kx2wD0tAa1EQLt5mJoBFBC278Sstl3FzSsSLBoPXgMOCnzIX09ifooBv
	7pkRxd4fS7XPQ7JUM4NjjZcmJx19Y7WHU7i6jtMBXYyLPC9T6rwbv93In7PMXpzi
	QPJAkI+be2BxxA5zI5XamOE6r6O3Kr5HDZwTNTv73jT5VrWnsFJ77Yi5yzqT9yFn
	o45rm4LsQsYn7vmIWTjo6iqt6X9ZYuPY0W1pF4CdJNLN/FLKlxEq6LFKnF2+K0UB
	5kXQZ/lskryTSgbtibVEeNId1StpbWSfS21DPbH0l2PIcYPWxAp1dLnqntim7WL0
	OGOMwQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27x2w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:11:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e49a1d3b1so364914085a.2
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 04:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013077; x=1793617877; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dg5zkY2HMaN3S1LQ7C2wxwVeSCWjIGLxXjphKAEg1Bc=;
        b=LkvLhyZ3o5a+N8Py5J5bx2LK5EMgT9C2UdzTwZRAmpVQFdRsMkJrGt3ryYJSZA4Q7w
         uGKRgmYYHjMppjwZeP4fwWkFOYxUa7MRA6Fc4UyocbRTjLerTCuwlPHN0+CsTUJONkTW
         RlWPz4wjNxeCRxw5ZjmR++7JDxVx1vK/TIeYQhnEja3tqOIt4udccdKniax1nU+DFxti
         5LgIuIOWsoH7wcPuzZJuupXax6+rX0xXy6b7v87XbY8QHNKk5ZNRmzJysI4dHPVNrLcn
         /OXNTSRBMIRzdk8MCfidvJCxVrsUUrC2kUYBDhdf4Q89XAIM89JXR5bOwcYYnnudTpcf
         Fqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013077; x=1793617877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dg5zkY2HMaN3S1LQ7C2wxwVeSCWjIGLxXjphKAEg1Bc=;
        b=wC44GLXXDadt298U7yqycurCUv2IrCZqPU4d6H2gGnllPYXXayOt7w2JlCaYDneEdP
         ++A8OyplK8u4bBoj2Y6NpkZWi6ZLp3/JxkVUc+es/IQxeiUhEhQ66EnSRuhdq8d4W7YA
         A2QFW4RN5lZB1BZBPlJScW2oSWO4yhFm/njTwXV9E6v2sAVkX9texqUCAbIJpWCBnBMo
         QP7Rw/X64hEMqo/SzOX7clZfQwz86ww4DrWUA/cMYT/GH/DdL6OS9OiEZ0kOKZWoDnw0
         j+VBHhR80AlZTMSleCP1dQbjy2u8Jk2SqK/7Q2tqlAWzdaIIjaEcMauxtD7ZekydJ5A5
         iPtw==
X-Forwarded-Encrypted: i=1; AKwUvBwm3rqyKvz0mBOWaGZCm1I5tt91H5TNBYVMnDgtOcRfUrz57+ax2ycwwVxEM2nhLCYssH9djnXd2ZGCrg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLn48nkOTWnsqSP0epp66Mr6xlYF+V7OfSd7n2mnqNegxTcdyhG
	rO+NOWduKTDYQffYpmftoyBeuqybo0DriP5Y5kj22XyG9f8nwn1iRPpSka8l6uccD/AWxUC+Pl+
	sZBw+vOR4qfQOqgQCMQFoVCA9pygkPgnVnGEXHgsS7ZDUqzQzOIj3YmZZJNnYBlGihg==
X-Gm-Gg: AYBFou1KtESqN8PSz8zFpmmZdcClOxJwfxeDMhEGya9iz18+gCYQiNMDeLea1BA+tkD
	GF5ZAfX2fTus+4GGkdJmy8LvnuZXvVRH5lwgOc2yN4tpJhU9cuSkuP8cSnUxhfhSPg4Lhfboyw1
	U5T/NIn9V9Y/5ktOu0AyW1kKwmqmBbCj3D715FIuoQIStlXkCFEhBECOMF5YpnJcNnuwGEfzWLe
	wasB4swjzONw/cGUDh95cW/CifaNy1w7KQfVJkOCoVKJ00fokNlGQjfQRqI+o6cndgom6jcGeMb
	RBCJg57lwGyBxGzmTNUs884Aa2VlqbvTmUkjRrNmQ7CalGbTavVAfJH1uePwI8XUhCIiRH49Dq4
	NPEkcgO37adTIiscvNRTVEVX3pN8yp+ll4Ry6kz4Ytr3iFm6xjewkjg1Sd8d+hUtWM8CzmA5CCt
	Z+Q+s3GZnzyPOu
X-Received: by 2002:a05:620a:261c:b0:93f:707f:28d2 with SMTP id af79cd13be357-940ef8aed1bmr994272185a.26.1793013077061;
        Mon, 26 Oct 2026 04:11:17 -0700 (PDT)
X-Received: by 2002:a05:620a:261c:b0:93f:707f:28d2 with SMTP id af79cd13be357-940ef8aed1bmr994262285a.26.1793013076523;
        Mon, 26 Oct 2026 04:11:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:11 +0200
Subject: [PATCH 22/35] drm/panel: drop the orientation workaround from
 get_modes()
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
Message-Id: <20261026-drm-panel-funcs-v1-22-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6347;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pIOB3uhyuBnIv/4e7qIm3qYvTrQqV7MkFySAJKsupco=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zURNMUbn+OFPYO6Rs5wHYoMvPXWbHnPEQw+S
 eR2by97mJWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81EQAKCRCLPIo+Aiko
 1ZJmB/4pC0z3MOz+MYOvygaw89qOLA80ziZqdzL2JsocIt6Gdpqn+jXgLiKeKzfpkRqe93yynNS
 6w72Miunger/6rdcY7rRGrRlFem8FTSpCJtamc5WacQP7woDC6T0A67d60V0sA53pFs6mnPcf1c
 wmG+kc/TZizvHfgHcIsV3ojeaH0YdfS0Uw0jd5DpNQMPz4+FJ4SEOdO0N9UsSqaN8p99GLZ4wnN
 Eg7CEyx8XI/MEu4LI5iPg3mHptZfQ+7T8GOdDgkhLvNvhyz24Lm16Y6wMSjdIQKPau5mwzUKf2R
 8CvwIbzO6VH8PVQTzIyeLMh901DD8wek/BCPDasQMN/5pNtU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf3555 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=PL5jcg54admUc1aTEAgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: SSmWG-nqAfGExg78L29HUEPPE4srMegu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX5dEawKs5yxuF
 ihbesmQYTGNkO332hujGFK0E77J+23Ax7GTMAWywMZeGJU+yd8VddriuJUR8KvpVlZSEzLEjyhj
 zeCL4j6YMhRXkXgjias+SkciM1degts=
X-Proofpoint-GUID: SSmWG-nqAfGExg78L29HUEPPE4srMegu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX5ICF+8wg538q
 NyT87hRBujSll5jwcXNeVBzLf2IRPF0+IiKK+eM0sdxd1bpwZSIZ/6S3MAro3MUgr5Gl1nrLvD9
 Lh7cWU4fbz3TMT058Mi/eL6ZdM7auLG2t6Z9rxYC0iNoJYbwT85nrFn4HPsfa7ZSJ56hBpoWT96
 lVGt/Deisf6vOw6X36ISiJejXwljClKo+FN5NqUOoQ8d5mBNhCVuc8mYKYjG35+H3nyuGeomhB2
 UE7J45aBAVX72sW9K0QuYubRUyXJVWFXoZtiBm/D0voO5nP0LLHuKvteUSvuBeWfGLNbQctVtep
 aEqBy2VAkynSxLBJFSKD+7WX3VOVIYM6cJ5kRYLQQ9eChgwXpmQ+5QiyIWRr8PTPyc/bqMaNVYF
 OmjThOTIVrSk2ijdpx97wYpKcGrfocwEOb9LUVLj8Z0XUnvckhtve0Y5gv6hYttukb3lNI4i5F3
 IaIxhormVbip2uYjzaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

Setting the orientation from get_modes() was a stopgap for the display
drivers not calling drm_connector_set_orientation_from_panel(). It is
also too late: by then the connector is registered and the property can
no longer be attached properly.

drm_bridge_connector and the panel bridge set the orientation on their
own, and the drivers using a panel directly do it when creating the
connector now. The exceptions are sun6i_mipi_dsi, sti_dvo and the Tegra
DSI, which get the panel only after the DRM device has been registered.
None of the in-tree boards using them has a rotated panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 6 ------
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c       | 6 ------
 drivers/gpu/drm/panel/panel-edp.c                    | 6 ------
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c        | 6 ------
 drivers/gpu/drm/panel/panel-lvds.c                   | 6 ------
 drivers/gpu/drm/panel/panel-simple.c                 | 6 ------
 drivers/gpu/drm/panel/panel-sitronix-st7701.c        | 6 ------
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c       | 6 ------
 8 files changed, 48 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index a70a2e58f88c..a67e0e57d8c3 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -318,12 +318,6 @@ static int boe_th101mb31ig002_get_modes(struct drm_panel *panel,
 	const struct drm_display_mode *desc_mode = ctx->desc->modes;
 
 	connector->display_info.bpc = 8;
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, ctx->orientation);
-
 	return drm_connector_helper_get_modes_fixed(connector, desc_mode);
 }
 
diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 150dff3ab6c3..681a2418f154 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1666,12 +1666,6 @@ static int boe_panel_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = boe->desc->size.width_mm;
 	connector->display_info.height_mm = boe->desc->size.height_mm;
 	connector->display_info.bpc = boe->desc->bpc;
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, boe->orientation);
-
 	return 1;
 }
 
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index d3a4cf9b1760..493a76f7416c 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -637,12 +637,6 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 	else if (!num)
 		dev_warn(p->base.dev, "No display modes\n");
 
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, p->orientation);
-
 	return num;
 }
 
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 7bf38e96678a..9e64bdb403ed 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -2520,12 +2520,6 @@ static int ili9881c_get_modes(struct drm_panel *panel,
 	else
 		connector->display_info.subpixel_order = SubPixelHorizontalRGB;
 
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, ctx->orientation);
-
 	return 1;
 }
 
diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 37f7498449ec..92d397b131ba 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -98,12 +98,6 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 					 &lvds->bus_format, 1);
 	connector->display_info.bus_flags = lvds->bus_flags;
 
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, lvds->orientation);
-
 	return 1;
 }
 
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index e4629428b1b2..0bd0afbd562e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -396,12 +396,6 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 	/* add hard-coded panel modes */
 	num += panel_simple_get_non_edid_modes(p, connector);
 
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, p->orientation);
-
 	return num;
 }
 
diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index f16e0de1ea60..b6e62a4c67fa 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -635,12 +635,6 @@ static int st7701_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = desc_mode->width_mm;
 	connector->display_info.height_mm = desc_mode->height_mm;
 
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, st7701->orientation);
-
 	return 1;
 }
 
diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index da6ed31d151e..4d28efeafd64 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -361,12 +361,6 @@ static int st7789v_get_modes(struct drm_panel *panel,
 	drm_display_info_set_bus_formats(&connector->display_info,
 					 &ctx->info->bus_format, 1);
 
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, ctx->orientation);
-
 	return 1;
 }
 

-- 
2.47.3


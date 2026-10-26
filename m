Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013082;
	b=z4dlMNzaykIw+oqI6BQBGM+x93DjRlEawsA5M6oa/XycV64YV7lpJfzidudIllOYpStx
	 cOdJsbMkio1S0BzHYxfQqCK6cSYu+ILxvpPByzf3s0yubmPddZlx30CBHoKBw/cSIca6N
	 jHJOGati4a3Otb6bdhB9/U508rA1o6WHYAyfqVa06sZsnKw1Bnlaa5TO8FlCVFiS44cI/
	 bYKsR68cW8Lq98aGIdVO87aXEmC1EGN9/gUFXPSFOATqec7+zDtq7ZvyarkF9xviH1D/2
	 hrlf3VF0lCGFUR0tYuI+1ZJrMYCmAMgxovC7EG7lWZJp57e4LoqRTA+cAnqSeOEZ+eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013082;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E2vd1zU0crihOsV46gq8VNj28qagdedntjkY+3zV8OY=;
	b=1ykGqT8c7YHO1PTxnP4qI6qiaoN6rcrhmOnRBGEMlo046KjjQoGq1t/b1vM6HXoITbyq
	 RfvK60dLILe+jMXpyQUYb/l5pv+1L+y5gikk65iu3ZhVm1AvYbWtr7nZNvtBmBGQ+YMKq
	 argNkzdKvtWQ9bHlkiemMydJqnaADbVdZYJ5rcGa1zCv7CRdeDlI11OH9i2CWZvFtTHol
	 r+LgIu6eZZEAzWWZx5FHNUXzV4RvRZ77Lm/K8jaN0/i+9f2VXgybICR27jXSRXo4TYm3v
	 jm0YOOmlsZT/fzfVP0vbC4Qys0eSQ3lA+6g/uy//Jlf491P6cX1fjh61UpXB8/VJrNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pX9pQuBc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gTTI64N0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52442607067F
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52442607067F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pX9pQuBc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gTTI64N0
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtNmP3050888
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2vd1zU0crihOsV46gq8VNj28qagdedntjkY+3zV8OY=; b=pX9pQuBcYrrTZYGa
	IR+22GFFnxSXkCl4+r/Zm+k9MfSjpf1aScGy1/DAC4ZCAjvC528Rpe+c5+Y+xvrf
	rttqsAwh8D1k9BcXnB8ZtM9pMHkS9M66mTm/R355I1jtVcrbHrqCt4f7gTm9xTO4
	IO+wGHOOQrl+NTJ8ntssQC7uBwZGhN34/T+NMGacHbNqWbGg41VgJj67E2ff8T6o
	W4haZ4Ts3wym37/js8L+6lcr/mALsb/hHS6NcJ+wDB62BsWe2I0mzLNIWocDbQGD
	rkdz/I7wsuwGVuzIkCPqUfW3NsocbL+89jEfi6MmtMdDnuL3GBNlqWgoDXnWK8Wh
	AkVzkg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9uap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:11:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so274732185a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 04:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013081; x=1793617881; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2vd1zU0crihOsV46gq8VNj28qagdedntjkY+3zV8OY=;
        b=gTTI64N0GPFJ/J3Q4FyydDZk13NHqWw1JP7zdcUzadzyrzheeKjHU4C8+bstELQEQj
         cz6maEGG1yKPUGjhJevjEUZLVfuUb9obEXLHlpLxWgGgfqivIrTdc1tUmMXUqu8dy2sA
         3ZbAuq2n7nOVfuIWv5TKGE7WEGh3sXAC+/haKvXC8jvJEA4rDB+JIuFj1gGrYKdrfYEM
         rUma9v4PREy4JERlV4OGtPxud9T5DRymqxW5Ni+msecKg2u9dYLOVKpVQh9gQJhfyYlh
         k5BlrwkyvqNIN0BGBauOZXYq89dybKSQ4SHVxW+u9UuQtLA2AJT4h/E9BRnJjbmYcxBJ
         eMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013081; x=1793617881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2vd1zU0crihOsV46gq8VNj28qagdedntjkY+3zV8OY=;
        b=CVZVIJBR98lElJ6NKxqT8vzciFOjcFH1UbUD1mNbeZDrrOY+HSYTBb7horUYhNiB0O
         dzwCi+LH/4b+mGgkcM9ZMFKtlIx5N3A8iMArogpxgrd8S0WJ9yp/3VYpiDA3g1wxzfGU
         IZLNrO1d/cFKiT9b+3+YZzNB7R2TI4fQkW1qbPwATM4HmlhrogmwhB/QemjuKPfauuti
         9QDc05L+3hedrP7Rrjb1Y5O6TItdASET9ky8U6KrKUo3QbQkAS+qhzi3zUsyEkOpvjmh
         ZNsu/GPNWCOEjeJSNYoHjfCXZ4DQqno6u7hiNspWS0kj1RMrAf8MfXqj+CzxShXkUYSr
         b53g==
X-Forwarded-Encrypted: i=1; AKwUvBwjKzSTmydtYMnZUpVBas0lFGbW23IW73GzWIhySoDckQ4rTNa4UIDQLN2BthQPWbtcb8BrpsqEQuOSKA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKx2S3VZW/qG491M3dTK/RewGNn6jYuMXMSRqOBVYnzSdgxyc9f
	qSvIYB0Jazhr/2XTl6Wa5ylRdRIA6qtA2YjG8Wmv9CXTcBWSozGymgKffDr6+4fh91twGlUGRNY
	dlsdPNgPoRRxNbL9R5EoIoBLLvEKxy/mPgz2cI/MvJWSbp7XUtc27cYk3OjoZdUI2/Q==
X-Gm-Gg: AYBFou2dWDqn3uoyftJH1n3yq6Rl/0mVgIhgKtbBtLkwLfReZUkCVSnhtD10wDbEahB
	IXzjvT9PDj21GfkQPmWBstKmrTlWUH7qKDVDvVBK3+QKlGQToBrbiF5Ojz1lpmMKUStxvd6wJZj
	KuJouoqnXfMFluf4hgTkEQPWYu34QuZIk/PXL3A5VHaAR2fbgKK9SqebXR3P3tKYT7xbpilLR9X
	xpWVOVLyYd/mKobRbcB8zms0ZeG4eOjH4XHgewWu3p6Ti1c3ye5i5SyS0dCuuvRTY8+XWceXF3V
	HHyiOEhB82I7WPPEsHEr/oKLRNS6Sf6V+Ct1gv2JApdJSJu3X9nFWg44FEqToe0RS/XunmiGF0a
	cmTKMA1wdnJC2gPKUp467wQYcdpqAn4uSe2FG9ZII3AMrRkibmuYiyoEaWc8mwwnbnFujlpH8cq
	6dGg+DMYQm1PFc
X-Received: by 2002:a05:620a:7019:b0:93f:61a6:b89 with SMTP id af79cd13be357-940ef795b32mr912449385a.7.1793013080481;
        Mon, 26 Oct 2026 04:11:20 -0700 (PDT)
X-Received: by 2002:a05:620a:7019:b0:93f:61a6:b89 with SMTP id af79cd13be357-940ef795b32mr912444185a.7.1793013079978;
        Mon, 26 Oct 2026 04:11:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:12 +0200
Subject: [PATCH 23/35] drm/panel: read the panel orientation in the core
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
Message-Id: <20261026-drm-panel-funcs-v1-23-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3280;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZA0xjScANGe4uXdzYZMdIbyDNkhj47OSIZft8eKozp4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Z9U8Hj97lb+q5o/M1s3STd4Ol0RvJGQ6JrDPe866Wc8
 5KYzkh0MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiBoHs/+O3ed60/KIuzfDS
 47Di5nv1s2Tiz0n+f7L37X/Ve0vO3Y+VsM7wO9knuIuJp3eGlVHekwX9WksTVzyJ3R7E/mR6TXA
 SV4PwHb1W4+DP5ufMZnI3bY1eOzPb61B3hjjTf/esiUKzeSoj7NWuiXcfk9wisYI5huXOVOPjj+
 c3LT7N+PgHV0KXmMs/uQe3c2RbTbVWtfeK3HJIvFRQ8Lde+abFtO2hJvkt4rXv2699LD7G8pffJ
 pM55c97/Z0HnzoUJu9g1rm1fqZc+hwXh8lMc9dLeC/8wsUYkz3LVU5XvHjfjcBmvsKnd65Nd/r9
 3GUKo3r40nsWzH1nl8iHNKa5Gea7Vyy84pLu9k/SuEABAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: VG2uU2lAiuIaHKnugLt89iav2OBLB1uy
X-Proofpoint-GUID: VG2uU2lAiuIaHKnugLt89iav2OBLB1uy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX0sZB7JssskuM
 P4TgoYIEfIpvPgbcfstFRjKNpTd1u9RWvOUJUW4C2ews7igLVK9iy8W4jFMNl5Dp/tKuQCXk4la
 ohsE2Xf8AIWMuBD7bp/ge+2GONPYdkmO2GIMQrlQvdtxevCBOY5ctzWlXVCpYvLlit3x7gTbUT2
 Xan0tQe0AF0/WDB4DorbOgfw7LtyQx6ZRZdAgt1k1HVb6br0fftu0+5NPuDE1YCaIg0aFnVURws
 8nA/Cc1fScrKAGkE7U88OoUb602BByjwvd02Ayv/QY9NAXEyZeWJrBkYFUaYRs5Vi2wOQlw3wdv
 8HQNGzciqeoQLWcE9vXK5s4G+j03DvjCOfOYUXN6xK+iyhnq1KOOwNWm+zuiMjqH2cSibv9mynb
 2TQop0C7ZSiDKyucy0KGOUUyLgAyCV5vj6At9HLxLFe2uESqWpIrBtHITMuV/vxyG/mcI1JEO0g
 s/BvWWzokh8m36yyppQ==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf3559 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=fdq7EawpxR3WxEXJaCsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX1nWowT9iznwO
 1jAWG+uPaw8Pfog6wNB8Zhp1w8iaTPccwOvi+CCBwq+FyGq+YR7y9LX3wOUbXIecI6ctsehYBom
 Rm1pSJ5pmo+FCRavJ/q8x8bp/xTAju8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

Panel orientation describes how the panel is mounted and comes from the
common "rotation" DT property, yet each driver has to parse it and hand
it back through get_orientation(). 24 drivers carry an identical copy of
that code and the rest silently ignore the property.

Parse it once in devm_drm_panel_alloc(). The callback still takes
precedence until the drivers are converted. An invalid value fails the
allocation, just as it fails probe in those drivers today.

As a side effect all panels honour "rotation" now. Among the in-tree DTs
this only changes the Motorola Mapphone panel (panel-dsi-cm,
rotation = <90>).

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c |  5 ++++-
 drivers/gpu/drm/drm_panel.c     |  9 +++++++++
 include/drm/drm_panel.h         | 10 ++++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 893716a9e489..efcf1ce979a9 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3397,7 +3397,8 @@ EXPORT_SYMBOL(drm_connector_set_panel_orientation_with_quirk);
  * @panel: panel that can provide orientation information.
  *
  * Drm drivers should call this function before drm_dev_register().
- * Orientation is obtained from panel's .get_orientation() callback.
+ * Orientation is obtained from panel's .get_orientation() callback, falling
+ * back to &drm_panel.orientation if the panel doesn't implement it.
  *
  * Returns:
  * Zero on success, negative errno on failure.
@@ -3410,6 +3411,8 @@ int drm_connector_set_orientation_from_panel(
 
 	if (panel && panel->funcs && panel->funcs->get_orientation)
 		orientation = panel->funcs->get_orientation(panel);
+	else if (panel)
+		orientation = panel->orientation;
 	else
 		orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
 
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 5bc97166bcb8..1b7ff0bea68e 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -925,6 +925,15 @@ void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
 
 	drm_panel_init(panel, dev, funcs, connector_type);
 
+	panel->orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+	if (dev->of_node) {
+		err = drm_of_get_panel_orientation(dev->of_node,
+						   &panel->orientation);
+		if (err)
+			return ERR_PTR(dev_err_probe(dev, err,
+						     "failed to get orientation\n"));
+	}
+
 	return container;
 }
 EXPORT_SYMBOL(__devm_drm_panel_alloc);
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 579b6be855c7..dc4fbeac796b 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -236,6 +236,16 @@ struct drm_panel {
 	 */
 	struct drm_connector connector;
 
+	/**
+	 * @orientation:
+	 *
+	 * Orientation of the panel, used to set the panel orientation property
+	 * of the connector. It is read from the "rotation" property of the
+	 * panel's device tree node by devm_drm_panel_alloc(). Drivers can
+	 * override it before calling drm_panel_add().
+	 */
+	enum drm_panel_orientation orientation;
+
 	/**
 	 * @list:
 	 *

-- 
2.47.3


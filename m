Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013070;
	b=gMsq5pfbKuO4MoTgqQ/zl/v7iD8awHwXoCpr7UDNvU8hlKatGKZVplgtJHdJnwfEwJnt
	 VKeJv1zGG+Jd8/ZsY6kzwEbZw0CaeLzN8kdrdZengDFpgQGsUm9W5GB2iEJQiHgZqvrhZ
	 DHZxP26MFRvNPdYqMk1b4uNVlOEJTRIP8s+QXjL5j06HaoWB/YjlUxwOuoGg8kVeufq0h
	 6XikYxeLZJQ1VgzaZTUNKqPfbwQDWYp6SI512u9pLhO3ypCaHSSBKsTRvlpeji5YNZcZp
	 TO9rjmV7QMujoTFDKUZZ2QmKbj1IsEuO1kX5zOFmxIaQMPzhbSwbLkUJn/vi5lGcKZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Koy6XZWUO9sFV/HU2DhmXsiI2S7zyst4K9ZFcBiDlAM=;
	b=FEpahpailB6VJVOxl4/yBpDsu90jRQH7PVDnMjRhQ1NwWwv5RBzmZ5ZukX0ajFF0dIqV
	 fYorWGxtNwhy/MkaiIt54FtvDHlT3UNH0pdfQvVWqV/YoCA9txLcNe/XZFdw0EU82FWyo
	 AMUDUACFnF/XjSkxPtvaKY/W0Ik4OcZEOyGA/jCAVio0fG8NsxjAKVvuFCEanV4g2cAeO
	 k4OAEsuZ20ADyUn4JK1xvhmv4+MBW7+tlIaDEV7zjxkqQRFIbhu2uIG+vSij0/PsjI599
	 x76/U3ddHHHNXLy9FygRIwTaNKRbHB2MHgHPxlX8DvzR4ZeiMN2zUgds8n5o8KfKh6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l8pPE3ho;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6XF4iif;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7400B60A383E
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7400B60A383E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l8pPE3ho;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6XF4iif
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsxS83631941
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Koy6XZWUO9sFV/HU2DhmXsiI2S7zyst4K9ZFcBiDlAM=; b=l8pPE3hoE/kyXz3L
	j16UZazP/mmVe0gLaLrrseOQLCb3LVDtl/dvZzQO5Yr8M0BpSXk5lMGUU2FcZ9sj
	8D1UScd8wpdLe18x0VNkC7Jb8kYQyBFHLG4y1m6MW4njJXpcy+QEAWrml40jJpau
	Za6RMBq6Tlr1jhLgsaUqWOTwSgiIbZCwLL9WwzG3dkt2uWEVgj00f0+p16GxiyfL
	KA5UaZcuxvN+V8IeRsWRfrT50gRIAts0V5pGUxTMEFptscgaGM9GmQ7Pangaqzr3
	+CpJK0u9D34PWuuSAvk37/k1F1MOS+K4gxI/5jqm1aQAM+XBwW+C5WEEH++MYlXO
	bp9lAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf07px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:11:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so720111585a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 04:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013069; x=1793617869; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Koy6XZWUO9sFV/HU2DhmXsiI2S7zyst4K9ZFcBiDlAM=;
        b=Z6XF4iifP2xXKXpf2pC/IXZ5tleI8W9P7DX8E5s6pBojwlRbdNmhfaeo5Jp7LGaKQ0
         Zk5Lvc+x3Dzbk3oegu9kJ6Pbh6pCvAMZpuADyCBU0N1zZPX1qlscc90XLzH72AToFuaT
         K1vBOMFNeWnGXkfAknbSn8NcNHnzY21fXTJ4AcuvrGTg8x6EwNsp3kon2Oy+l3uJtERq
         0fOoL6eTcxwG1G3WD2cu38JBBUw/Rd4H/guJGxdL6ahNdUoDzVhi+JaMVZ4+/h0Hn2A8
         r+pOE0caherZzQCxyLLO+YOWGdCIagb/4LWa7pPi87Y9EeUXEQ/gLIxotHN2CpeDPWqV
         qW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013069; x=1793617869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Koy6XZWUO9sFV/HU2DhmXsiI2S7zyst4K9ZFcBiDlAM=;
        b=cqTD31CK1AggYk5eLqj3FZdpy7IR14+EcJWtHn+qx3ntsXYTf1FCLxhaOIcjuCyHCc
         Gmt55fdrYUDO+AvZFKRATB9TwvMC3TaEpuUgV6BRdrSObwpp1tvGOdPfH9qrQoxfzt4H
         TKZyChPn8b4btzIRg+gOuxa5n/CgF1jEDixWLaDmJ7xUtGDrvMg/jAE9+YrUX8LGzy9w
         oD4HBpy3VtaF1HZM7KrZ0ZMYZIH4VTe32iBZlLJM8CqbM72DOXSy26IJGriJS/tdOWr0
         3iuwoYyk7tg3wy47Of8xh76gP9SM4IDtk7N/ZdcMH85hXfIRiMVAgVgslxXrh6mSi2oY
         irfw==
X-Forwarded-Encrypted: i=1; AKwUvBwgqJB+Q2gtW4WqJpO+FWG5lbWFP+5havSGGdy2tV4lqzOCY61m/GYzRhqJ/ifiQ/hIPOGShOfiw30tsg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIicJBVyEiOlCM0S+IaqHFkjLKKH8k3m+fN9nlspmXutsxqpOlk
	fWcXcNqLaGNsa/CuDh7DnCk54c5ZxS7jgFYZpkxZUZkbu30m3/UxSuWEUSfUNhDME+l8N08v8kW
	1yA23jDYPy2hR9WtgIPKlYNGds1/3qlyTxeBioMSDtWsjt91uV+RoDIR7w1DHgIzHFg==
X-Gm-Gg: AYBFou14yD72FBpjhEp2YE7Yjye5A9CoiNnSHRE0kBr7t6b7K0AOa8aT7Z/2p3HOMSl
	Cp/7/AgGTudRoR4ccVIZs3MfuETVfXAs+JXsSUIBhJRXrY+j9vdsue5QN96fjxsdOsTgWFnWkMS
	HxZphcdVmKu7JcV8J0FG/mB4nm7C6S5pYjpJic8L3aArhhdgsSju58f3ipkd5L73TLBxuHrg1SQ
	doCoWLEfS87TuwtERXjbvgNaI8d1cOfvgr9a86z4i6/xkxt9Tx5EnNwc41WpgLaFMJW7AxFs5qM
	d89WgedFQDtaQyHF2YlUtGxC1B9FT03wSbvXxO8BnpGvv/aGGGprWeFOteE98xf7Qdz+zGy49bU
	5k6taOodqZNDcDCt4SyX5CW3VJx2+ratVOUCYJQeDKNarAGQ/wo5hIN+CvaU1tmJvrAUsLADmBV
	cQKQskBqm31pdK
X-Received: by 2002:a05:620a:7008:b0:93b:ef24:bc8c with SMTP id af79cd13be357-940ef90e385mr838036785a.47.1793013068413;
        Mon, 26 Oct 2026 04:11:08 -0700 (PDT)
X-Received: by 2002:a05:620a:7008:b0:93b:ef24:bc8c with SMTP id af79cd13be357-940ef90e385mr838024485a.47.1793013067738;
        Mon, 26 Oct 2026 04:11:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:08 +0200
Subject: [PATCH 19/35] drm/stm: lvds: set the panel orientation on the
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
Message-Id: <20261026-drm-panel-funcs-v1-19-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8r2fYcoIsJs1j9rHuz5/0flsbVyRvFq/7E3ho1dMY8g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUP6rKa9ZJALcKGd4Q94uEkWWivrXKdGILwM
 WTV3LksCzeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DwAKCRCLPIo+Aiko
 1a7MCACdQuwUBC4LQjD8kSXjk9q+SL6jBfO9Vw0RSOYzTPZYfzN/mWDaLnY8OQVsSW6sYtHwZZu
 MGpaXwzyywrGYtx8O99zSZT8bSdtjpx+Jy0BgqASzEUjuMZwjTFk7J+tnbe36F6VEamVYfuFsfz
 IETX5ctEX2PD7t+g/ZHw7odQvPfMQgNJlC63Fc3aar0Q0zVCm3YpAusg9HhRbgR/GKAJ9/xpMmb
 gj6q84GCt4nruRc/ZwLd/QKdjhMPMGgGzZu36wGtHoM5UlDYHz79ZUjJ4AOGqbcGHo2P9uoQPPD
 EjnamVi7cEBFGHqiWYL9ljkqM8WW1Hny6uT15fp/4S2A5cBe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX8LBadd4WKxk4
 HnG7FmuPI14s7tLs++9hjjiW3IfjXNEfjdfbbmEOy0KNnKQIy7Fv6tK2f6jjp1eNywbO1Ey46FR
 UHb+FtZ9Zz4XZyJmvaUxnC7GLj/KwaM=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf354d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=xd2H4mkyy6EiTJgHJZMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: zb9MuvTe62Q2Jno4zMSOkYWWD56Paqln
X-Proofpoint-ORIG-GUID: zb9MuvTe62Q2Jno4zMSOkYWWD56Paqln
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX6ELDrIIJORtQ
 ym4s6q4Hthu6154S4OpeynByC7mxO4VHS3pW24ih8Ivfto5xgOuJFHTprms0HYlGqmSn+Iu8dN4
 xx2okXakwK83FE8sI6ZM1wg+NDRtc5kBRFXlSCL/RT3JsSBJ0IVquK8oaLf8W14LrfqqnHBI91K
 XuDXW9GW1fdY+1vBFSIZK4uMARLwV6reQQYlQSKKXY5iD//f7lY3OhnbdlWaiLx6huXGF/D1tpI
 1qR4A2quC6oaEGJbjfu+8cNxucmmSFWyJB9UsArt1q3WnaYOVhzyGaUUJNTmbOTVPMe4Dxa/Pai
 hG3JZ279wAcTUQcfdTmLQxb+Xu7THs4ltuhWjInpNpOY1yv/zEcnVBU0IbOoSWqKgD7uUvfWd8R
 A3Opv/yryt50Ja5uWjS52fvvUpbs+hFjd8KXciMNLpKh1ujiEALyxiCNgco10TDIL5JV0woNVy0
 JypVk8trHlis9U7S0ag==
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
 drivers/gpu/drm/stm/lvds.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index e72a64f14f47..11d32a8ddc58 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -975,6 +975,10 @@ static int lvds_attach(struct drm_bridge *bridge, struct drm_encoder *encoder,
 
 	drm_connector_helper_add(connector, &lvds_conn_helper_funcs);
 
+	ret = drm_connector_set_orientation_from_panel(connector, lvds->panel);
+	if (ret < 0)
+		return ret;
+
 	ret = drm_connector_attach_encoder(connector, encoder);
 
 	return ret;

-- 
2.47.3


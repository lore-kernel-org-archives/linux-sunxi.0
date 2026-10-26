Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013058;
	b=gPnkGd0F/3Q56f0OTj9enwGOCYfdYDXuRxw7nI3HuNKp7UfRr07MCMT+SaG6L0cqLGL1
	 nNmnA57DrNnlDI8LCCn4X31kvjUyWwoAeh1gPDqnTIzrFeg8D/FA7TLUjPaT43go80J3C
	 EynVaAj5Cxzs0HkK7MQXKh8m67qP/JsoIGGy+qJd/Cy3xw4QyKgkgVtTHv+ZAoHfSFFcO
	 c5TX4gp+WkvkqAe2MoOhUDojygSKG67cIcEoXgh6TL2jgY5fnKupSaiKcLp+CVUB5Ih1z
	 akSFEuvyx1bSuYhVYtHSrk+dMVAUxhJE23mMHrRGMUxqfQv051I+T1pgLOjiFU8N6EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013058;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FM3kXGDco5NtVmAs596vka6zixIm4dAJF2g35IRPNFY=;
	b=h5EZ/jtbxaxJOILObQ9xEuf+biP2u2nJx4ubaf1wTKZ7JesSkiDAmz1L8skJmd2MM9gW
	 G/jbPzsWlnIHjomCGVC5ayqDkY/lYEcVuMBPxi3z6spMnR/DoV0G8CLJAWdUP/p1GLSdg
	 /QprGdHsMr/4g2xigRtB/hY6UbQ5UsUmtyZGB1W+I5XfSXMZv9obKUCTEIev1DuQa9x1U
	 EWelmdebxpjGoPFpoibgOnyz1iOVqtQl8XFo62mLYM/9u4cvB/tQMVXwOYwuwsBt5t+e+
	 f1LvI4LML8IadRUqmyXqA8w9fCMR5ancBFzciv+ezVf5CT3WQOyPG+7H1fsUJs6Rc2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="d/YLm8iy";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ctl5YPaZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A6F60A3813
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7A6F60A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d/YLm8iy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ctl5YPaZ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtWnT1547929
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FM3kXGDco5NtVmAs596vka6zixIm4dAJF2g35IRPNFY=; b=d/YLm8iy70QciDI1
	xsw5vntiBKVjy58tjQk1wWQ/sDVM8phUMfUO0fwngs5ZyPdG9qnRlebNMOtv0272
	94Uo/PKJhTMs1CmcIJSqzTB5hZxMnjMROVCnNqJGSFhUy7fD0MdpmuRm+V9pcUzN
	eQxdvvFRwwfN7zKMxK9ZsskkVOHVZZSGedoPBeuVtKbdQ48x+lB21aivDHe6GAEN
	IFruFR7LxogZWdq9fj1dYUlFSuUXrEfVp9gb4RpRXxNMAa5VCsjhTvEdnsbXx/nj
	wDOulrki7VLjV4F6KhSj4kpYi46KQeo0Sp8FkMtZi58Vv4lPBw18pvESrxwoKM9d
	ffC7Pg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgst5hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso465433985a.0
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 04:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013056; x=1793617856; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FM3kXGDco5NtVmAs596vka6zixIm4dAJF2g35IRPNFY=;
        b=ctl5YPaZ+WjzYdOjkJpE6RyQqoadu9aOQxxdL2xThnA0ZFbBEaU56r84fkB5E8pjyL
         ISxggHBodfvMwdT8j036glD24jcG7ZKLPPns7UT7y+l/OWedPdJKLDept+OPPWEXwYZe
         YDgTE0ZP2Qc29Br4mqemwAZUEzuRs3vDTvJv4hLY4PLu6ytQ0f1Od4qLkrgErfT392jc
         M3gi3E0pkh4NB7gdybdDRRaidL6kTHaEL+7/2bxbz6U4JYLBDTLKBxs3AV7HGoxS9FqQ
         mg7GYyE+sNgLZdxge8T26IdX2Gpaj9zu1MzsIao/iVsChHS2VKtAg0okRb8lRLWZgE20
         wrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013056; x=1793617856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FM3kXGDco5NtVmAs596vka6zixIm4dAJF2g35IRPNFY=;
        b=MfT++TNzhejoRR1ZyrOAEdT5gQNMhwnPe6pXeuyXtJXEYPWR3IOjVOgrbGJ/BRi4uC
         MH08AiswynkFPvJJdZI0TfI3RO9eepXw10Sp2GWVE553o6Bjamy6J1Iq3oRCtaPmjgZQ
         6vo29+3HUgpaJSLxDtw/nvcxZTxQfSWkXvru0tHdiLte2PlxkXCAOX6ij2V/xcp3RH0j
         zxuvhSW4qZ/Mx9l7jUs4EQ92RikRNeyEzHECJE6EbIvJE/l6aWtNFIGN21nVlQVH15MO
         yCU5sApIvQ8vrss89GjYCOOdy56tkqlGnD1rm3xLC/MxqIVmULnPDQ46QhcdIXjisM3g
         vqxA==
X-Forwarded-Encrypted: i=1; AKwUvBykzygD67or/LoTFnxgnK7L6LmrZ2M+hHhhkmeNrsTMnvMDeeNw9ZNCZpBwwssecboDKeyOEm4Nn/2dNQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYItvDf2QsYQz0+yHDz/gTfeAYVgjX3aDPU5KLOLhE7W80NL+g5T
	HFLYMgOjVSIEYNhj3WYZRAHWo3Yi/Kijzaycqu1WRR0BNDsCDHuAbB8c+8GWHkeVpqaDhtr0GSd
	GFewZA4NoM6anvRgMy00xc+A5P4C0ez2wJpWkb/3TveSv65vjFj0A1rP+hCmPOPV+sA==
X-Gm-Gg: AYBFou3xSq2GNHyyKrMsGuUsvRhn41O/ZJ4PTl10RfXR4CAsHC4c9YL9uTcbs67//PX
	AbZvaAYDUqq35MNi/CdmSiDP0LFp4VcQuo5lXyn8fkG1RNwf+anc+9UIPnkuIXZqCXeTI2fmAiw
	eAJiUlmlV2azmVJzFQRHyc4/cBwDl9T906EDnsUzzUoVQsIrobPfLdJvx/JlMNQ3g+LB+Tv7gYs
	np2UQG1gog+OY5yVdvum7gq24O5D66AdkmB7tJvLcGHfsFiWiddIpMp2RKA5zJ+PW5xFP+RaRmr
	6prWn0hprIlpxi1XXJgUnS4EDX2uo9+QeWSpoognk95EhbRAVlFG/1IaYAVMFoldhlI369z3r+Y
	gXi4u9ZvophzNvRF/3Lb6/NJk32UqHS7EtQgG+C0/kIIgYPRsETW0N8tnZZ9LQLStKnvPwx714b
	9M6zfx2SW9CuPH
X-Received: by 2002:a05:620a:17a2:b0:93f:34b0:4880 with SMTP id af79cd13be357-940ef9143a5mr985779185a.22.1793013055834;
        Mon, 26 Oct 2026 04:10:55 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:34b0:4880 with SMTP id af79cd13be357-940ef9143a5mr985772685a.22.1793013055334;
        Mon, 26 Oct 2026 04:10:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:04 +0200
Subject: [PATCH 15/35] drm/bridge: anx6345: set the panel orientation on
 the connector
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
Message-Id: <20261026-drm-panel-funcs-v1-15-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1060;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kJJulWe9/CRUqjDC8d07GB/dA7Y7k7bAfXwncPVPNF0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUNFrhKRJ1vs1GyUehHNBtb9FlnqJoPMquu8
 8BkmoB71QGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DQAKCRCLPIo+Aiko
 1cqpB/90Rev4Ra9vC2dyeOIrhnPoNQBSYBLQ+4cBwkJptbtGfyOsJEdf36WL78sBupyXy7mvm70
 mOZiZb5Q3wQEUFvvldaq1SinnSkM4ZvLYA54YtJe1e4afUhZf1zdxxxN6uzG/nzN2MtX4gSeIko
 27jwwr4T7EZOInS4vGyl7UvrpyOVrBrxx4Of47Ux+urG8HX9CQPn65jITmKLsR4Q+mOYk2/cr0v
 I5mHBhdl6b9iwkCJ5w9zK11X/Jvpm5Go095HO/8NURfhBKLsEmjAFaijW38uz9L/Js1zRLqM/vp
 BmmaJ4tz4ggA0u+jYpCBNPnIMBEjR1IObkJrqpE7vpMy82Xe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX9q9n/1Td4Yvk
 rzihMoBQrdSKDLs8ed63atx3Qlh01bN3ExMXFl4Y7C/RCxLpYn30XI+pNX7xSbxukDU01/OOyXc
 Tq8qR2JjJnhubrTWX6S8TuNqhT2cIaE=
X-Proofpoint-GUID: ZB3LBSSNqlV7bWvTeNei_I-vbfxLC6fA
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf3541 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=oT6YcSNdPRKyStaNtX8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ZB3LBSSNqlV7bWvTeNei_I-vbfxLC6fA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX2DoXpNe0LgkD
 MiwhJ4+TClIsUmKFRn5JzidLwtz9bgXxPvJzhCaQAa4KXUOviEXlWgS13vyb3iBie4WmF95X/K0
 egmwhdenWeqsozjf+wQeFqNM04Ag7IBeoLTh8cHUFnlVSiRe/vupYz0Bqo7lqTVuUFKXu+eywA/
 ZjsxflNORj+4BBpW+puUtlgoIbri0gm+C4rrjzivJQnsw7FweVDigEUejVdBbiAsdvvyvB4ZaYq
 Yh5sbf/4uZcE+lOUymB7aMeJaMZCek5th+fC/OsJG+9TBSRScQfW0uxZDxPGDAL3zh2vYAV1h8P
 fyPevZH8nuXWlBbrGwkh/FY70im9Bgoj3BkNDwkIs+4poR+RbkWKUpRFgnIlD+xCK7FBzkfGXl+
 pyCOKqgx26/d5IQ6m6ri4JtZnru9PZGTLO5APOTw5DTBdnuQw14u20obM4YgiXODCKNH/fulczL
 /hiRMvoMOYhkhq3fAkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The panel is used directly, without the panel bridge, so nothing sets
its orientation on the connector apart from the workaround in the
get_modes() of some panel drivers, which runs too late.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index 407834a03b63..91ce1a877bf8 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -525,6 +525,11 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
 
 	anx6345->connector.polled = DRM_CONNECTOR_POLL_HPD;
 
+	err = drm_connector_set_orientation_from_panel(&anx6345->connector,
+						       anx6345->panel);
+	if (err)
+		goto connector_cleanup;
+
 	err = drm_connector_attach_encoder(&anx6345->connector,
 					   encoder);
 	if (err) {

-- 
2.47.3


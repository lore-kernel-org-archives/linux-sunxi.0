Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013046;
	b=ju6qtzoGnIfvZLqbh1HXZM3Hk9Q2NCk0Oib5CrgnNbM49WXHHe96+xrInqHjkXNIa4lb
	 q+M4EnLI/3p56NRKeI9x/AmXblwlAPO3bXx6z0XdGSp9LOvj2JNvFdEX9cVzJYp5HvjkF
	 l0q+C2VYaXf9MQwaM5/aOm6urVIN+5UoRCp/iyNNpqPBV3TVm4a/ejMFe7uD++4DTkeVH
	 9cIyfk7PHOWs/6HxZm0br8Wtv3uwuFeJhebJ8ohDmFLug8/AeOiJq8IF2v6T0hkPnBTD0
	 V7V3Kd50pQgjSM7Je9U9Wsmh98iNNVBhlt/Ap/GFSeFjcBA07DAKts5JSG80lKqTUbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JDdjP3ZvR3+u7GTATP7ekWKxiYBGcGUtqHhNUpZYJAU=;
	b=zfKimPxGz6q+BjbTVSKAH+cWudoS3ua8FFMwWs++dKU6DF/g4vqE1sX6Yc0L/lsPyp4y
	 HVWVbq2/19fteo7MBgdzw3+gPJUwsPYgN6X3h81QNBtvCdw17xh57nXyf+LzjEbINlSda
	 hyZ4l7bUTdmJx7uJfj4v/i4KNEiZggOcbu4oNRtyLWV/29YLJTxckLNy1O9YbUWq2/LSy
	 o3hCtqc6W7hPyORRMo7WhXlccZHkHXQ4OrwxFMBm92MkRcqPFsC+Xcp6bs09joBAeR3qt
	 BR/MSyUQnmkpghHFlZ8NKxwEEe+kLDrlnCcIreD5BSaaZq+1j3gS+dxjGfeQ4n2KXlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F8wy4+CX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BrQpiSVb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A838A606A973
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A838A606A973
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F8wy4+CX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BrQpiSVb
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsoJZ2168542
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JDdjP3ZvR3+u7GTATP7ekWKxiYBGcGUtqHhNUpZYJAU=; b=F8wy4+CX/rG+lfZZ
	Lyan3IdiIs/84Gys8owEbGXfJk34r3CcF+b+Q4mmInADgr3eWsRbVJRNoe3mwtZs
	VsYyArKxzDCzwHEmIoYcnByfO17CNPFncRW770DuzziCcwveti8XS2tC1/lSLo8L
	VcYAwYtiaXmUyJ18o38o6ju/1YtKbApXJwjhwyMJoWlo97KMrZIHjSOUWj3ce3HG
	HZDtvZAaUCdsdJBDdPPY/mjwYQldfdKv8hWGKkBABkHzpGCi2uBWHRuFB7DPdLhO
	lmcr/DgeJjlEfhQ+cH8SDfA7E3E5NMHxb7kyjKXT7eh06NVWeuu1TbmHvDH7JPnV
	0YuW9A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60fr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f322ef7d3so645194185a.0
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 04:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013044; x=1793617844; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDdjP3ZvR3+u7GTATP7ekWKxiYBGcGUtqHhNUpZYJAU=;
        b=BrQpiSVbgVqlPaOOXUGjnDoGZzvhDPp8IZdYEc977bknIlDZGHBT92M9FIq6TxWTjT
         GpudIUwcQY72LIL3Iuu+k+y3yHyLEQcwNinGv+oQrBXaH4yS1T4AVpjXy2rob1nQKL17
         tUQ6HDil0mY/Yvg96X0wsEtz06Y6UzVCabQu4jwYq/9OoV3HkzW4zC4j8MnT6TgFciA8
         IgJiJzzG3UvmQMlk98sLtVJm5o1nQ0ohNbSVo6AmjdnporO1vwnYR9gLmKlRj56GGikm
         7rPgM8vSjTN3J95IQ5tXtThMa0VuR74zylqgbyZdCbCVMNVCIGX3ijEzeb+r1r92mTDK
         r2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013044; x=1793617844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDdjP3ZvR3+u7GTATP7ekWKxiYBGcGUtqHhNUpZYJAU=;
        b=AWg3GacMD0EssHp8zKW9FFVaFpLhb8AOwnycv8XwJ8DsO5zxPyS4Ia2eCxLEJKtSUs
         HTgkpB9VtUZptMja6THPGpLpTo/vG923PlSRt8EpPAIBib+lfXh/X6wiqzsL8Z1G9t88
         1HuCdqsa/8rpl0WWAxZ+x0YfOLHn31+np5j+UgT+hjaRIbdzikZIuIUR9gmiWUF/tVni
         QvAsYBQlBAsGP+6nxQ2ZN4objNrzaO5aANvzOx+V6AHWUbjHRPCYaHxRrzeD6eEACRdj
         xHGGWuKLSf7jZCWufXg0PSl/NxukmcdBIG4WJg/VCvPV4VcZQhDo+vjxukj4jOAU2vU7
         Fh2A==
X-Forwarded-Encrypted: i=1; AKwUvByeqUxDARiv8lQHj+Fg3ENA/S5f8E+YkRprcyret4nv2YCOxe56UeUxgeqWaLfH3Tz2PRI/s4G3jGB2hg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKI+OHzZgYsmxZ1mv5reU2aNbBvabdw4WR36rXWye2zAAQprCMA
	/dLELeHdBiyvKiawiZbQx5v+EXwPGLt5127YKeYFFcVNagHwf1MFHonbnMTja7x59U8onK8Nbwb
	quJjOOX8R3J5O00L5TzMwcta2xIrc1nsMC/iX+IY7OUTmH5PQiecRI7g/b8i20JO72w==
X-Gm-Gg: AYBFou3ThLyfAHvJ8dLAb/dpKYj6yE8a4P/nLy0eTuAkR4ml4PP16I8nnr+nvqb+r0f
	00/z4HT3HXtvU5jtUmLWGeZ22S3LokSM7kMKdkE+hZ89yVvalhJp4Oin8nzxomM94j3TCOK2LPp
	DP8hCV0dRaNenzMhjEvGgca9i933CeZ+FqM+RZz20ic6f105JY2Ln+t26LrW3U7zdvse0iyi1bY
	zxp+QNBNpaV1hKlVqfj/g0+QJB/ov4z2u51YeE3skDzXLLdp9MlwqMiC3RhAM5rsxau3bNDKisB
	4ucSa7S1WNmJ5XrvSgCeizBTQy5qDZVzDgn1NtZnFW1Wwz6Be8+acUaPZMwMEcLDiC9ilL6Teo7
	cvd8MJT3loztuPg0cso2LhQc68sPtujsKOw2LzrnubScCpsH/qRtlHNWdM26Ez+U6wAvmZX+Pcc
	TUSOtKUND8ORiH
X-Received: by 2002:a05:620a:17ab:b0:93c:bdb4:2be7 with SMTP id af79cd13be357-940ef999832mr820048685a.60.1793013043971;
        Mon, 26 Oct 2026 04:10:43 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:93c:bdb4:2be7 with SMTP id af79cd13be357-940ef999832mr820039885a.60.1793013043412;
        Mon, 26 Oct 2026 04:10:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:00 +0200
Subject: [PATCH 11/35] drm/rockchip: lvds: use drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-11-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VuuvMuByE/5au8TNoJGc8h1xnsMCd+SMeZ7MKGuRyyg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUKIUVSRGzZfc6qYgyaD9nRGfx+H/7o4CWdk
 wQOpg5J6z2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81CgAKCRCLPIo+Aiko
 1QI8B/97uFs9wHHAcLSj02SUi5PXzEJMksmcQ7qKZIjNn7GfH8bLoBKSFnfP49YqCUduisOEhT6
 KTKuTU4S/KuVHEJBZ8F/LiOMPnVQBnq0NiQhbfywWC76Ly4pg+z9waoN70q5DcXEhbaE9tDRkX/
 MYkXObslKB4jt+l4aynd9Jnr6SEAxi0/kA+2541TxyDmriKD+P5IDDweHYYyiL0PKyYdNKx3OdL
 ZCouAJsrqTPTCfki5i1Jce4Kw4n+85mVUI4+LTmH77ya3K5dNFMJsfHdvnOYkmDaqyBghuWU49H
 T1iAXG1ZbmbO7m6dyfFHITSkUzX8Saqr43Axoe2knMHnYoPk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 7J87P5Z9-dbQPXEyXx-33aJpwbWWrn0M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX2Do2m0hbJ8ZH
 tN4ivRDPjOUhZZI9KlRA3FMEnDzUJNvPCmgAVd0vxlzsWQWKfovD5Mz3FJ5oLZid/fKYlPc7+wM
 IZf6mmXtUe8t2/sKoHh3JGwNVT8OXJxEYYcBShtbJDPZps0E5HD9a3sAv6IL4SOPWNQ9BFZ9VFR
 WzdtZN3JRsT1TO61HMftjvBadPsEEGj0pkxz+QLHLVM1JMuUZhLGKolDJWyP3XOtzDnEJXsOWdx
 bqWv3ApM+yfwIyyW3COdfn4kHEo/BdE0t+d2dAehzYaVr1k+K7oAi6rMsriocFSW67S61U6iRdp
 hB7EihAKXQAwot+AH0S+U1rYMAtQF9WBo6d6RH8+JyOS6ZoEKbpQrEtLYLkhJ1z5Z3LYxxdi6mv
 Y8A5UlBU8KHzKaJavXGpCiXAo+JaBYkkAIJIL+fbQedTi5voGfUDu1Heh78CSjUlNkD+qJlqyha
 HXVsanOXdwvlyGdXIGg==
X-Proofpoint-ORIG-GUID: 7J87P5Z9-dbQPXEyXx-33aJpwbWWrn0M
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf3535 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=BQQ5wuhf5moQr-eOkAQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX0AqJMTV3skm2
 gphoKfq5I3rKpbUVNO/bAGf7hB6t3MFcSQeQmVCSSR783xioDXLyLMFPbKRTcHCs7hOJ+5Vk6zp
 Jw0pXIfaR52UPHjDw0Iw+BU+jlTvl0s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The connector type passed to drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 505c6c56736d..d49870cdf906 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -609,7 +609,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 	drm_encoder_helper_add(encoder, lvds->soc_data->helper_funcs);
 
 	if (lvds->panel) {
-		lvds->bridge = drm_panel_bridge_add_typed(lvds->panel, DRM_MODE_CONNECTOR_LVDS);
+		lvds->bridge = drm_panel_bridge_add(lvds->panel);
 		drm_panel_put(lvds->panel);
 		lvds->panel = NULL;
 		if (IS_ERR(lvds->bridge)) {

-- 
2.47.3


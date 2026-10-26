Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013089;
	b=ip/kGbJBYFm+2W/urGWV3t2Kr7mgRTeZZutyK+ql7v9oH4iUtindU9piM6Px6lHXGfJl
	 S6I5XNa8TfdUJSM9KPS2OZvcKpk26T/afMk9eF//JgA4fXzZF59gmstJCxAtIu8KmAi6d
	 R6HVaQfgFUC/oeTEM+Hom7dWW73LpE1FgcMZVLF1V67dYWdoiCHD+zoPVn8BFUtdSKeij
	 MghBIVivehe7cxz1Khd4iiVYxbmLksoJ10YGq4i7aTdAkK6gHfTMbveUyqde9ZO5qNXZ7
	 hrM82UQi0qsI62glt3zms9JsHYTfhfF4AZV/jnB+VDR37B+nW7JNRvCEz/aY/D9cF7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013089;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2EQ/MiWnWG0HlXQbsW/EZMMH51V/jq2046f8+siL5Mk=;
	b=Fu1J1lE+t5rQofkra2SxEoPhpwYeaO1ErAgmdXUFQUYZJh2xT1yIJoVDxLYOvzzm2PAM
	 i7wFkVoQlpBUTF1N9RAqvDx6oIiaugPZirXjXHEg+I8J62JMOpfiTP8IbOPDwlUxBcAol
	 0YrYODeNYupK7PtCkBHJr11zVTjmq/Yxrjm4+tiLtnQEQiomgZin46H3lWXGiPIkqooNb
	 M2lZRwG4fDze6ctChgoow/cf9RxHBlHsn8dbEJ3f1a+n+UlsV/yb/oXKU2dbwndPjArT7
	 FJiS1/Y9ZsR3kkjFfa7+DBDtHLDV4gscdouTOEccQQoEmItBQvnKOejb4PZzHUsvSUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DlfoBBMQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xq7ILCTp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D04460A6F4B
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D04460A6F4B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DlfoBBMQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xq7ILCTp
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt7HF3034474
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2EQ/MiWnWG0HlXQbsW/EZMMH51V/jq2046f8+siL5Mk=; b=DlfoBBMQdu+gGpBp
	HLTsmsjMT+cbwrSvkEyj/YVEWR34HlP8VGa6IPytShHDFswEtICWVO/mOuGvCLB7
	SSqcmkfg5Pyv3vCFQqr3jeubg0fA5H8OXxXyUEg3fR7s4zxN4424clUcrIbbYheu
	xppxXBdrQaeJT4wkJd5nBYu9lJAH4el8agc39XXo80NAwDova8QMSxp571ZvUzzO
	dB+kECVSUh35GpildXscuG7N+qwXX6COEHqPUhWQZEc0wtXGQT0m4cT802a5a/Xy
	oLPaQxNH43SixV82JSNLTDQBJgJQArY4ctWuAHebEbQgAPfoDsXiBQIhRgkgNkA/
	YkgcpQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y04b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:11:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91bc57d4d11so72515706d6.1
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 04:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013087; x=1793617887; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2EQ/MiWnWG0HlXQbsW/EZMMH51V/jq2046f8+siL5Mk=;
        b=Xq7ILCTpEz7jXP8tkxalGaQoutv7wxoOs3H+ziY7dl7ZCBM+P+mqNS9/QoG11fjq2n
         ohDgXA1elSik46uYSONRLJ8UkrIPow46BTD4rgXQ5AmGg1zPwaWdiN+Vwr42iNnDx9Ev
         laYe+Ngwc6BbXwimrMGG+0r6sSpiyEJ6/a9T/ARV4DW42sa+100ZdJ4wIw/CZxwxdHJn
         u6JaGrdyeS8E/M6ac8uOTFGNVO9BY6PbuTuEYMVR4v07bCzH9s2J7mvBP2EgR+T4Cb8P
         6OCS9ER2cMh2iVhIJXsET9LHHFwvZXGq1jrOOEAcSXWhSG2Ho4Lt9AInKF+uKxRbErIh
         MS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013087; x=1793617887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EQ/MiWnWG0HlXQbsW/EZMMH51V/jq2046f8+siL5Mk=;
        b=KHkO0EtiemtM/EaDOuVTdccVAel0MVo9aJWOQ9umtKbhvs+UBRd/dMljmYdWqcvip+
         mT4CoUzREpF8TjLbqdZRd3sSHY75cB+kFty84o/D5F/oKkA2xNCRFIGSpBQC7nXVsw3z
         Yr2aEeMYpEYIKqQj+ArEXBKDXkgSGa5NbS2JsQ+L43FMnx+izhiEbDEm+USy8W9xH4tl
         PPxDM63hUJXCV0w/EnGI/IsoTUdB+XGu8aeHeFiph5/x/KA0JNpJtKIs11CU9I9jW/wn
         DCgqB8V3nHkAxKqcIW0/4IchTZp5+K+tXQ6pvcGWIzRBswPug+ocj55a2Bv2ToZSnSTG
         Uaxw==
X-Forwarded-Encrypted: i=1; AKwUvByaGq2fHF2IPyvwxnhTDQg4i2n02e3gTGzTrEBhyWCpmFB4vRJKhAg5exXxJ6ETBXodcht55Ow7zmfxPg==@lists.linux.dev
X-Gm-Message-State: AFq9FYK0bBxU3JuJ0s1W6IYI/XPVotSmS6XLMs2cc9u23nRMzvAdtds7
	/HsxkWnssiDqNVUc6AIyS1cz9SC4/MJgth09bWeymAo3z8iqwQl1YpbAc58/dNkRB2s9+eIM9NH
	wYabTe9e/SN2tbOwO1MrH+ZAOjG2h3vznI3eF/fvRMHaHeudmWzUIsq/8jULzjKvUxg==
X-Gm-Gg: AYBFou0ywLB0grOtHDf5e034Kj8jWSvN8gdI0Db8lJHuU9zRPC33je+mLnmOyDLG3uZ
	Q8sY8BJKeY+IvJ3W74v1ycgt61AGivhIxZ3qAW+FFALZZwGUKdmnykvx0Nl1x6ut+UTvPm+wEgM
	EH8KmDQf/5Fm9DFwGvCOYEc66MLbOPkDV41rqIlyW6Uq+t+OugysFRk2H1Ij+FdEQawfHz23HLL
	BpdRGcTOsy3F2xk9nmq9i//clsRYbakjxPOc7wDyyTpYp19zljK5MoDgwOV80xvikRh4ycB9FWo
	Jmz80goLTDsFL6g9mEWhTstvkvJ+RZH8VdjQu/Wu07BkhK/RS2OMVrNEJ/UayUXegqpYFvJ9k9o
	hmZDTmB96/puWIfxlPJE0uxSJ5ayxrk8mTHXW/DwzOmauQxV/4+p8ufMTWX5hYQxV/2l81L56lU
	vEo4xlEw0u9nt4
X-Received: by 2002:a05:620a:470d:b0:93f:1af1:7952 with SMTP id af79cd13be357-940ef7b1ab3mr947043685a.4.1793013086624;
        Mon, 26 Oct 2026 04:11:26 -0700 (PDT)
X-Received: by 2002:a05:620a:470d:b0:93f:1af1:7952 with SMTP id af79cd13be357-940ef7b1ab3mr947033785a.4.1793013085856;
        Mon, 26 Oct 2026 04:11:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:14 +0200
Subject: [PATCH 25/35] drm/panel: remove the get_orientation() callback
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
Message-Id: <20261026-drm-panel-funcs-v1-25-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2246;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=memBQqdrrl5gcxOviNjOVq9PVZkJuaYQ1rBpSIUkLCI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUSN7gXcQBFypwp2wbYmPQOc6iEpCWG/CNlo
 kn/D0pCyeiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81EgAKCRCLPIo+Aiko
 1fcCB/9gZLyPxzsZldrayRHV7F5rm0+1qyUFB8jDX8vfiOt67qT3HspHI8OlWm/FeJztv+a6pWR
 NZi/SaDcdAdzcoFoecPe5f955PMcqmIc7W8YrxSTjTJXgXUVCUD3aB7foCr3F22dVWOUMPPpBDN
 0INFvfjJf5b1Vf6BI4QOsesiEXm8dje/GftQMPt3WftrY9aXIEk5wVzR50QrVNFpww+7oXq8qLX
 EM8lKIqcgs1qg1F06ctP91i1DL/XvHJ6WDWR8c1FkDFMV/6vh2KROf5hzdd7QzDbPCJxWIrDJ6r
 63RbPGf/yxG80b0e7eaBfscwIPmhMZPu4tQcIyPztXV8vcNK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXxIpke4IrHnCu
 6jCWGTxHkzoU3YMYsRArng0Usen7l1iipaPAcRIqRH1Lj4mF3T7Hx6xm3vM5LnPvn87F7/W1rwD
 puJJBs3WZD0ELdciLl0/mZXYSMmngyo=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf355f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=NYfc6Exo7QqhNbPHc2kA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX5cw/SqaE3RA3
 +VVLRBlvuSJaPYIs4KDjdrr7tv95Ir514d4EtqJ+ePcUc54zANVgcA3THsaYge0oB0u9KurLzpI
 mJ59pMp9KUgj6FdHlqKCOopHl70bAAEV9iz3LLsK3IrgmOtajgBtZKcqGf4LCuqJz+RR+iBpfhN
 7dZjcXNFS24QzEMdZvgoGep9HoFP++7hlsPHIItO/MYyEpnDtEYluj41cIeOsbiupAI7gOmH/0w
 f7SIj/qsN9elw1Ij5lefbA6pX2BVBTcslEgbsOGOBwbHxZlqvJf5rb9tmV7AxUPTtYmZF5I/4cM
 rphAeaz9Dz8TuLVAFK7uFpoIwSoyE0esYL4fW9bCAKJ8RI6smzIlH/LBXOQDTuYM2McUwkTMEW8
 hiYduyCuOjDZFkfnoP4LfjgRue6a7vT2GilsiNVE3raGmoe44hqnKLMlERj/n4AOzwA4qtenmMd
 f3/oYhy2H80tMT4NNZQ==
X-Proofpoint-GUID: _w5QioZgERdgDasbk0jv_yIXtkN-c3vT
X-Proofpoint-ORIG-GUID: _w5QioZgERdgDasbk0jv_yIXtkN-c3vT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

All implementations were copies of the code that lives in the panel core
now, and none is left.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c | 9 +++------
 include/drm/drm_panel.h         | 9 ---------
 2 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index efcf1ce979a9..f630c9cd7a8e 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3392,13 +3392,12 @@ EXPORT_SYMBOL(drm_connector_set_panel_orientation_with_quirk);
 
 /**
  * drm_connector_set_orientation_from_panel -
- *	set the connector's panel_orientation from panel's callback.
+ *	set the connector's panel_orientation from the panel.
  * @connector: connector for which to init the panel-orientation property.
  * @panel: panel that can provide orientation information.
  *
  * Drm drivers should call this function before drm_dev_register().
- * Orientation is obtained from panel's .get_orientation() callback, falling
- * back to &drm_panel.orientation if the panel doesn't implement it.
+ * Orientation is obtained from &drm_panel.orientation.
  *
  * Returns:
  * Zero on success, negative errno on failure.
@@ -3409,9 +3408,7 @@ int drm_connector_set_orientation_from_panel(
 {
 	enum drm_panel_orientation orientation;
 
-	if (panel && panel->funcs && panel->funcs->get_orientation)
-		orientation = panel->funcs->get_orientation(panel);
-	else if (panel)
+	if (panel)
 		orientation = panel->orientation;
 	else
 		orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index dc4fbeac796b..d643434037d9 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -121,15 +121,6 @@ struct drm_panel_funcs {
 	int (*get_modes)(struct drm_panel *panel,
 			 struct drm_connector *connector);
 
-	/**
-	 * @get_orientation:
-	 *
-	 * Return the panel orientation set by device tree or EDID.
-	 *
-	 * This function is optional.
-	 */
-	enum drm_panel_orientation (*get_orientation)(struct drm_panel *panel);
-
 	/**
 	 * @debugfs_init:
 	 *

-- 
2.47.3


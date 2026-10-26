Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013042;
	b=KW8N1HqR5FTFLFhnk30CoMqNTFjv8tQxBhbUO4TvHwbN/cIqp8jofReTOWnHqWpm1n0f
	 lRUZTyGNjcvsjlXEkuds3MZRKq3bBvefItbRvBWZ63HU1HGG+zOD6YTAR+aM8JnF1Ceww
	 O1du1x+q1bwDSFB/xAc1ejrJacZBmunwa5rQ7+gZjAEr1Qqgw45v9zf2pGEtsZ5WiOQK9
	 +sL7Ft6aWhgORzgW0ecDf7mFEzJr6ExXBSO5eteBZurkby5lU1ejo6k2kzhf3mDrWeCNC
	 VtV54H4uD/pPYj9nFMV3t2KOHz9lXA+i69/+ixNsX5apttf+gp3nMpeTGhtgZaV/JSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013042;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6GdmF5pi7yEsCg9Rw0PC8ebq7FPRGO6BmW9vfgGGb8U=;
	b=424cblGlBOL4LZHM/OK3qZxKdx0zGj+Rp0TywOOExv3Aje9lJpN4R22x+pMkTCbHLR7Y
	 6PSm3bjOqc4xtq2KnKKM8cWjtJhof7mIlJtGQHzB6z8PFSEkYoudhTJcWvESDleQfpDuy
	 63V1n9Ne5UDlKyh+fg1V71L6Gd6G2bYsvX3v8IRgzIVFMDuTlDhW37r+cvPJwlzuE62ST
	 lzacS/TaQvtDbEyprml14SphxtOU05bnQkAzXSwkGIroJvUXwdixzlef/u0IWKgZ1BExo
	 eWlm1FsU1usDiA+a1TLudNlMuiji0NPr7xCix+Brcm4wkGpOjBUrrL8ww+Nwc/yTavA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eHC0sjpF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LrWKksaW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7944A60A6F51
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7944A60A6F51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eHC0sjpF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LrWKksaW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtDot2734116
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GdmF5pi7yEsCg9Rw0PC8ebq7FPRGO6BmW9vfgGGb8U=; b=eHC0sjpFWy6lZkCF
	g9ttsTSmQp/2J04MhM4gBm4sr3cOzzALY6+oTw3QLWZj/4XmP3uq3nnH1s8/pG/p
	sYwvGCDFKelPEYdRlvjslA4Z7p8xCRKJqy5eLLiizfn8HSQvILMH5W0z8ZuU7uF4
	GoJ0BaG4R3DkoUJvxqvLnQlp0BDI9AgaeWyi27on4wywqrhYX2w/Se9rYwSEKwPc
	CZDjCZZKyge9oU36U2QtOmw58F9V32Xn3QnlpHlVkTZhtxUsJNaZeV1iwVJIdNHE
	99X8QqGEY77z6IuYIg/r7/N8nKJJVbR3+V0Xmb5Zy+tpZ4x0ExYsest1Sku6pV+q
	J04aTg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8bau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso609133385a.0
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 04:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013040; x=1793617840; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GdmF5pi7yEsCg9Rw0PC8ebq7FPRGO6BmW9vfgGGb8U=;
        b=LrWKksaWJ75ZI0qAxnZysMEaVd43BfDKUyMD5vI7s26th2FBYJxudJtGFTUrM2E15t
         jMU/v/vQiy6pMDz8QQLsyY6MSSATf8F4FOZj+PqolcCMbRpZN0jO3K0mECCF41OFfZv5
         48epr4RwKpgoHkQcoF+r0cPyWRJ7g/hH4AA1tILy47haRHWU2/26bnHKVRqHPry8TAvR
         jAiOHb5i3HLuOJjN1g6TN21NwFcknwHgmUBvqfd4BScsMKsB/GsFsJIe7clWUDdUQWP+
         e1cVtHrCKRHk4/Fezva0LkY2AIQQJGqFMPLAQXs0HG8EDbcavfVAzvUMEp9VOva7nITO
         pChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013040; x=1793617840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GdmF5pi7yEsCg9Rw0PC8ebq7FPRGO6BmW9vfgGGb8U=;
        b=QjrtpMHrXxsDmOkO/w42tmUIr9cPb5IRzQj/3v7RKPAPc5IFHNEgwLv/OjvP0qh4ss
         4ahTYUDfxcVAFMQyCwHE7NROk8uUYCLlbDpQU0JAYKDLil9+vTmzhgDnesxw7UBUHtjc
         FcC1QxYPfwRBdtBEdW5uzpRCholAmiSg8pCn4qlk+W8X6MkvzGCQ6miqvuqzbzylk3Q6
         J26qJZdp12IZYWeNLkNUFXebP1WJQorXbGJ4f8PNPU+9QsR+9RAsamj5hCkkKah8s2QF
         LZ6e+v/eT67RlpFqvEK8bPi8otKDQYkbIDg0Faf7dvO52ObBXIw9KcUCeL+kOX9V0KU8
         wg8A==
X-Forwarded-Encrypted: i=1; AKwUvBy9DhQrdpYy6m5bSrAkVYTQFHyEElJWBTPPg6NABYj+wxE6MKqLWF2RQl3kTq4RcgfT/UVucbHZ7NypXg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLDSq0RzeWTHAY8gQoLnUWyojUC5hSh4cudu6syixNbmgBwu6QX
	hXDaEYq4Smz165bjIPY+jjssH77uyHf+r+gB0eDnS4EXA+8rrUoK6i6eh4F2QX8heVkLGbFJeHO
	ltj0yzcqJtg5FJO//EF/Po/aRtkz5ZdqrEFQViNPeNI2FHywjjAKxD0N9N0brCnFhaw==
X-Gm-Gg: AYBFou202PTCjMXtQTF7N28EDFXagqemFxMDt5ugefGrnVzpmoTxwt+n4VHAwx4fBEt
	quvPVVubFOKCdPfB03n6rsIXbiDRG4/cHm8yt8N1v2txKoonoMCCdSXO+7bmGt6qLXiYchCVjVv
	NnOHF7LwckA9J7vvD0cHVVj8nnmGdxQ7W3TD0zzZuLGhyn8srwUZzXPrh/V16MGi/HagXrCHhE+
	H8SLh+FHGGVn+zX84SQ8HiKxIkgjXsfb97bnuYAPtIKKNqq0hfiOj9AbltrloNUFINH2WWgl6Hc
	4LHroqG/n6inESVHWLzj6m6+ioMrMw0Ik77uW6GYjWG7kWqt+gSfRLsyYrtL4eeGN3KWir9cy8/
	AlmTC9eLXniuZ4wAVyvD4sCz1VEi7faNg/f0bZBlgzoKXI8wTlQ8WJ091ROs0sDs0ODCRteXPB3
	+qqsZrd2j79Ar1
X-Received: by 2002:a05:620a:4586:b0:93f:5ac:14a0 with SMTP id af79cd13be357-940ef9b6fb7mr901750385a.67.1793013039668;
        Mon, 26 Oct 2026 04:10:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4586:b0:93f:5ac:14a0 with SMTP id af79cd13be357-940ef9b6fb7mr901737785a.67.1793013038981;
        Mon, 26 Oct 2026 04:10:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:58 +0200
Subject: [PATCH 09/35] drm/mcde: use drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-9-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=921;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZbTGn0s45rat3TeuZ2gFUOSQlpst/5WgxsMTCJu8VCc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUJP3v6BZfeC4OFDrgkWPjUT1uCkaMqjHRVf
 A2tXDwlDjmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81CQAKCRCLPIo+Aiko
 1XkgB/9JEwLFkiFvNLtfnxESm9XEbnCBOdIvIQKtoxuj4kTs8hnTLXQlTz5Hzr2kUFMOQlpSqRf
 xv9ERSCZw9qYrIrAuufxZ2T8vMs3Bjvii6zCKPdB2cVNjXz+nuCWQYKWWcpXcg9xca++XYSRsE5
 awcQqb6mq/YRDLPMpnbnCLP1Fh1zY38bjUeY56X606lSWioHGxZKxNjqC1ByedyyP4NsZFiOK72
 feZ8/uEcdZEbry73xa/aVOClo7qCAto6buhgLmjhnzbaAleT80MWB7YJGHOTzueYLr5/DSHzjJp
 ReU4PLvlOtFhS5w2Ytx9LA/4RXok5fGUyvuLce8MIiC9khXu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX4B9Fl5fNxKWy
 /GxzIoshWFw3/Nt/WnQ4DV0BgQMzUGJQJEpAtRAb72YzSpEp1gkmr/Pr2weWB7767G+yUwEhbaZ
 WCecx5TBmYw/npQubaLLkvBIFgLi3LuYMEAj71p9eFKskfVNISZX6jjaBJ9hhn8vJOFMM1t6vGB
 zo4i0mvhQyTJSsQ7abGKgllRB/2HEovAlhVb7Tm5N79SBotxISWtgoMvS60uI18YA1x+w1xf2d0
 dOcZRnayX4kDPsQvzJpoOQxHwywrle9WW7FVI44avRJqzYT6BJHb3a+ok3uN3h7WGoqWLXqjDZM
 uOm//Xrr1IkXMin1X+78IxdLf9hXMg7F27RwAe61nSNeF6QmTd1N8xhJOYIIVJykDmoO6C4gaZZ
 0hundu7hDiE6Tsn0APmkVLzwBk1s0KoDVeBsUt9NV0BU6163YZGze9zxAKxJ/kB6awVqG1VGThL
 3btFfNXefFY9o5yDX9A==
X-Proofpoint-GUID: OyeZisvbYZTlgGfEdm7HmjEFHKF7Pt2S
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX/Pf7RnBY+W/u
 bf9qE2x5xZbh6dQJBV1qNKiOwd3914KXOxbjrqgS3gAJ44cwOlDFs+mVmSXwtN7g4W0DWn1Ni7f
 JWvQGMIAUSYveclDMj0Vwj+ZtDBlpvw=
X-Proofpoint-ORIG-GUID: OyeZisvbYZTlgGfEdm7HmjEFHKF7Pt2S
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf3530 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=icLbHSj0goCFzy7tGMwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The connector type passed to drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 759e279b645a..b5bceac608de 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -151,8 +151,7 @@ static int mcde_modeset_init(struct drm_device *drm)
 			return ret;
 		}
 		if (panel) {
-			bridge = drm_panel_bridge_add_typed(panel,
-					DRM_MODE_CONNECTOR_DPI);
+			bridge = drm_panel_bridge_add(panel);
 			drm_panel_put(panel);
 			if (IS_ERR(bridge)) {
 				dev_err(drm->dev,

-- 
2.47.3


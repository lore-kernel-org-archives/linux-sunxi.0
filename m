Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013039;
	b=wwBAWBHQo1veckaSzyg24dz9mU3vfrBCekqE+SAEOypQdlLb4Yqo6X/yMAi9Vao8uFEy
	 jdITVSC69g4NzTxzhnq5Ho20Ad/3H/NFoe10rf87m8ja+skNARwZ/D6tDBH+E2K2iZEK8
	 rd8iFxNE64U5ZKItO2LZcq+9UHLZkSeb4Pf+YxnuwRIxZM7LZ52A3aQjooebmwnyUxXrY
	 sYMaOAirCKF0F7nrSMRKhFUcY5O8IwC6mkIWR9YYyCtwf8Ne/Ck6Fnra5DsTWSh/g1ymV
	 xF/9/SI2xBYso8STf+HnGxThl69bdZf09SgmdFUWZy3RmQq2DQ4rWxXvQokHPAv5hYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rfPhrhw7QqfVInWRHaGAOXWVQmPErff7bcKudkQLqU4=;
	b=wxKS9WjSV/SGXeGgBmkqLcocDw1YUY1iKEiWa7go2HhakYUSxHRhvQcmaz+Mx3ZL17cN
	 kBl5FnYecco37IpeyG9SgXeR6UOwI/jU3k8bnue1Ta3xWDXRXkj0EKXm0K29PVjhpPEqz
	 eeqPAZKbnknOp73IvBLTzxAgBy23G1SI33abty8jMn9dK5C7oSlOq/GI9/hNBAGJAq2lm
	 +E1i9CAtpzH/NCuxY1EciHGGqkaUZ57eVNEB3GbNM7whRE8tWIzYGIcAP+Olsfh2a2hMD
	 OPfT/8eA2F5ELSLVR0iG1OiylRmgQVICMEuzaCQ+JIq2x24If8akC9GgdHuiFIxWvEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o3SeSQGl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WogtUX1d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5DE60A5BD3
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D5DE60A5BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o3SeSQGl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WogtUX1d
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAspFe2168616
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rfPhrhw7QqfVInWRHaGAOXWVQmPErff7bcKudkQLqU4=; b=o3SeSQGlxlD1ZlZu
	j6N6iic85w2ONYT3wC+38Oi7/6GVPFFUa2+aL4sncrS1hprd3DTTHJvg0o/lOrUN
	23PQliQylUfxjXA+2TxQx2QUzEtkRfXJx0yJJixRVeeqaF9l4l2sV8cQ5OUGzNM2
	bB/7Rx4DfJAoOA0KCBTLzr+nmrQ9bRTnbN9ysYrRExwgSp6VIssuPkjH8d7tXj+r
	c0bUzyKYtzgmm2WbJGRobeAtN1PXuE6AqPibFFQZpnBYYl8tD/ETvypPB2dz0OKM
	ys1ABQ9mswzCSZIe2mn0enVHrO39EpJqwP2UGBOsnqaouJ/BRpt9dToAR58j01BZ
	6egJBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60fq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so719961985a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 04:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013037; x=1793617837; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rfPhrhw7QqfVInWRHaGAOXWVQmPErff7bcKudkQLqU4=;
        b=WogtUX1dGHj0JY3zYichZb+qmBK7WvOsvK9S+wtb/PhqCWa9N0NsFYR68KsXJJ1vdW
         ojwq+XLJeX+gHHsKq/1IgDvKSBok28mcemuNwf1R8P+Azx9PQNexg60B0Y+rCz8CwY7u
         ixDQBUa1vrrGGW+vb5jWcie+iQpehux6HDrPbyCTHOS0m6KsTCbzSLdmQqzoUSEFaVyC
         WEMY4nn8M0ykfUMEe20/+CrwTZqH2iFwaNYhYHYL4SjLP4OCfKFlmVJR9RXYMQNL6VKx
         jAz+aMCIk3rQ6gIamVswaP5SHG7jOz+dXU45ujuAFlKiMAxDtYboy+Zv8xTvkheqF1cW
         uBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013037; x=1793617837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rfPhrhw7QqfVInWRHaGAOXWVQmPErff7bcKudkQLqU4=;
        b=S0LKDq7SHV3Oa8wBOBEuoAjVIC6EZchNfI/j8a3lzsBAVRgAKcoQtNeGJHVNVk1Z+G
         zGK28Db6AyCPq9plmDB3S/DUwNJNeFg1sbfx0qQKqKo+ThqBs7ESkmF7XjiGTOKic2r/
         kLTkB0UxEjH3suLxRB6ZX7Nk1kGkK64htghANh8yP8S0WThL04C3L1rkGxFYm0wxw7lY
         TXyWyiQHJcQ7NkSOTCyrCYV3bz5i/86gvXdaMg4OcdZkrh++rgEsnoK0xj3zP7DJrMnI
         OJbNTNvUjN4rPz1q9skV7MFTyDSU6VQC8OtUJMTcqjm8IWTCJrWT2o5vlu7bwOcmRbjq
         RESg==
X-Forwarded-Encrypted: i=1; AKwUvBysFztHq6H0MQl4Y3rDW3/LLvr7i8W3XfUJ608XwX0fBxDPZK9xJ2PNjXr+3LZs55+I43tn5XEnwcFNfg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ2XsXYs+PBl/hBUY6C72N39V/GlPIjSqqg2LE32GQBVABNgg4M
	6VPeffJ3KfW5e4oDt2zf1sHdgZeC3zzvESskcAnB/jTBWl9AMkIzh68S53qQdyxrQFL9gEKm4iN
	TTGiCiiYP+IBmAxBEWfoF/4vh6726IxPNcu9l8qXqyJ9DX4FxmT9kofBKXZeRpbGyww==
X-Gm-Gg: AYBFou23+7McvFPpy/f7sgG6SNbg9d0AhhwVoYZprNaiBo2ZxHtD2Y7WEEEi6n7/bf7
	gC9NSZiEaMf57kWgMfmxvAWfszUmtEBFGrweNoHSIh4IJWydDzTs9voBoOt8ItZkEnniHBV10dx
	QBOYy3DhUkEIXgQJdGM4PuQ0RtPUqunGgKWffx+cMDcFvY3Zg5OVd7d72HwqnyuuweM2MYrl9OA
	tZXROrNA5+3fn4E6zLuigpIZ8BGWBSA14SpjSWVlb1X9haXG3l/jJ6qhDuMxZyouOul56vCyISd
	Aex1iwGbb4M2SiNA2xKar5kxns7xcrRlBp0/BZOghKhOOaajGWuBQFUhIp/0hXtNCR2Ws27/hS6
	101iXE2id2aiCwhfSQ+fr0J4TkIChqEJFbbVKzUcMPsmn1XM+ps44BzCB6Xd5RWxRvxYOm2c9c9
	Icsl9rx3KP2MF0
X-Received: by 2002:a05:620a:4043:b0:93e:c12c:fbbe with SMTP id af79cd13be357-940ef9559b3mr968999185a.75.1793013036667;
        Mon, 26 Oct 2026 04:10:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4043:b0:93e:c12c:fbbe with SMTP id af79cd13be357-940ef9559b3mr968986285a.75.1793013036065;
        Mon, 26 Oct 2026 04:10:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:57 +0200
Subject: [PATCH 08/35] drm: rz-du: use devm_drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-8-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1332;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=L9QBqBm7svfVSs2q4h7czZX0v21Ts82vCTLjVtq1nVg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUJhK2bkP8mANHdq/N3ftOzv7WccIKtt5ZXO
 6tCU0MGEKCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81CQAKCRCLPIo+Aiko
 1fz8CACOTwp8mMz9LdCKLCqOOuK8Qd2qaZB1SvSzCPhwgD9Ian8Zauhug0X+fdkmI4VjKEebyNl
 6eIlHeO20Qt5hfXfqdwz/ezKE4k93aAYep2wG1S2hfEEQ+crBeN/yowHzi8TR+/iO4f//86+EnD
 e0M8eAye5tkII9M0Iwm0aO0L+FqC2IIBirkJUdokHuBjpGeGSEjleYPkCsElUY+37QjY+2bDkGK
 HbDOBsf0Ey9N/Pv62g7KU2qjneW637Tc1H/TcF8lQ2elO1nM3Pcf8J6NxmyOSPxow7TzT8yi0s0
 MAHYZLVEY9W2W9Fg9FwCn6im24F5casNbP6xXhX5rdBCStUL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: xrA03Aurr1P7LqgI325g3Wv9g_Csw5xf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX2udhjkwvWUAP
 wYEq/NRgYWKYTzevdPbJvZ7UZlgpzH5syW+WLKUOcl0Hm/lt7dTqZ54+f4k/XofEYmH8VlxzW/I
 G9/NzjjpLu4EiOj8BSyoW8rtGWgiSZf19H/TBsAjgkO5WC/dAHy9o0nigHV0L69h2X+B8zRNfFW
 5znLIUGuYvsJNEB+6LD0lhW29QBJNpo35bfv31FB4yLUa02QTwcouxz/h2nf5J66wFPFciFTAfQ
 pckJGZT55eJsVDwwnhzcCnbPqL3Ci1avTlD+j3QE1XIkkmPNVgUd59pFoRIfZULvuhQ2G9udcKx
 SLVLMYYVz5z7JVSsUZ3Wx8eR2bNaD7Wo6DCj5BZ6A03MRlgLNCusnhPZP4/28LgAHgb3qKmkIKU
 UHlfOaKnfrrbN3Q6qoGjorP1k2p3djD70LbRZrZ10NlM6O7K/CmiB+6IRVs+TZkWK+/MLoXo48S
 uRcOUZ5WiTGCwg+yq2Q==
X-Proofpoint-ORIG-GUID: xrA03Aurr1P7LqgI325g3Wv9g_Csw5xf
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf352d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=BQQ5wuhf5moQr-eOkAQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX7jKCdtkER44d
 +wOPJU4Ripn6QN6dW7QeZ5OhlFXVpBZCof1nKeyC2ITU2udcY/aJV9eSZt6m18fPfLk1/gIps4w
 5ahfwoR2Ce2UelxpV/yTfyXEH0Zss2c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The connector type passed to devm_drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index a1b48973aa8e..3ba28496e948 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -112,14 +112,13 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 		if (IS_ERR(panel))
 			return PTR_ERR(panel);
 
-		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
-							 DRM_MODE_CONNECTOR_DPI);
+		bridge = devm_drm_panel_bridge_add(rcdu->dev, panel);
 		drm_panel_put(panel);
 		if (IS_ERR(bridge))
 			return PTR_ERR(no_free_ptr(bridge));
 
 		/*
-		 * The reference taken by devm_drm_panel_bridge_add_typed() is
+		 * The reference taken by devm_drm_panel_bridge_add() is
 		 * released automatically. Take a second one for the __free()
 		 * when this function will return.
 		 */

-- 
2.47.3


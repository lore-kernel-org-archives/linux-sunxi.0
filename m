Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013035;
	b=TE7VIZtan3PQIsm3OyxnQo6xqiE8X37N6r7oNE/2susYy40kWdPPmhhFhkAv5anw10Rr
	 0XYDnnTmzKmLXlrIQSj6oCBTCd8O6aPX2D55/C86ip9TNpO7ZPlGgFgupiH+RCn5frvx/
	 ex7Gkj0FXoMCyBqFJS2siPP5zuH2q1wk0E4rRM34kooGzJ9RZrBMYpwtmSde1HCm0G36x
	 u8dn3VvlCiD5ill19IuwMyuRrepTYh3eRsRGQp0mWWVEH3yJH58VMMYvAkwqjTdmhiuJs
	 +j9808comoDc7Jm7YUR4jLcRDn4WvwIzLWs3pog79RMyXChVDj7s+2ZVwFTS4Uk8J0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013035;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zJGI2tz0W57vr06M7+SplOiRV5n8FbpcsoZ1wpiNj8c=;
	b=4TdzO37XoqvDbdd/eGz+IxuM2P2PUkw8hsb12o1wY5KIhrvpd2Oc87P5Ps47jpEIM8JJ
	 xycNlD9P6Yz7TVc0meCmK/CpUvOmAcXdjQJXny5pmpyo08E6bkUuGsXBf9Uz6zn6e8Z/I
	 /Ey5rOmthhYk5mXVH+5ou2uS0dLhLK+qgFmOdsdh+Nme69GTiqUffc4pkd59bW0Hcgy6+
	 3hjfMxVaAp0MftFFIQ3MrMJv8g3tDs+60NG1WLf3ZqikwaALIk9YSU2/BqP+JfXpNaekm
	 xm8LUZN4Pn9aUqnsTc1Ua1kgkpozVwniOi9BGUOKXE7PdAY5uaKqwkdYPc0B7WJU/6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="PcfRn/MG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jhAxx2BA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450BE60A260B
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 450BE60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PcfRn/MG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jhAxx2BA
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt9Nx3049897
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJGI2tz0W57vr06M7+SplOiRV5n8FbpcsoZ1wpiNj8c=; b=PcfRn/MGbVAXfuQ7
	zuREWbOF7ZIB8QlcwD/KDbCIEUoeG7p+WT9dU6U0lHPpBw7CHD9KJhgMPjXBnp6h
	RfZTfxM4vQGZM7+3gXb07mWk7JJJMFBiwdTqqjNS5cnBmRMhC18ELfJ3wiMBTGoY
	3yozE2Zy+QVDywzmszrEeOS9MZFS5j6P4ReC2pCgM28DF0eSBqSASDR4S4XRpO+e
	MQPqZsen2+iLuIAkN89uSuL/TIZ+320zVGTahJ3xA05P3hpjzwtk8i4Wh0HTXzzI
	em1LhwF7ZOqA2Ys1U29fiUiBSzr8wO4sCZKvvcLxiftqP7qiVcSk/ldu3jBwb7ca
	JfVhAQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9u3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f322ef7d3so645173285a.0
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 04:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013034; x=1793617834; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJGI2tz0W57vr06M7+SplOiRV5n8FbpcsoZ1wpiNj8c=;
        b=jhAxx2BAKAp//iIb9XahBlKzFEbUD/H0pEznsugocWoMJQE5kpcwdxJdk7FxH7iBE9
         HICjzraZAGh9ppLVOGivUm3T4FVmja12h5koVj4k6JHLbaq/XG6X/E82paln7OAmiM7p
         ytywG9iyrge8cxhUtVx0OADs0re0iMerhE70zkVcmEFnuZYKswkmGa7SIwz1fQC68P63
         D5bHH6jQ4BO0cD4I7jQhpypeQDTE+ExhsCckucaEUxEjoCbTpMuqT+2pviwXoWj6BXQ1
         xsIYcvoQZztrpSc9rDIOyZwzXf3uFjFySz3UMVD54m4jrSlj4EyqvgMMtKUVHN+yBBNS
         H3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013034; x=1793617834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zJGI2tz0W57vr06M7+SplOiRV5n8FbpcsoZ1wpiNj8c=;
        b=kHHgDh2gcpTnoBBn15vPeTr+Fj+7kuj0QZEpmYtiR8ApGGbGMETXIqRUuGOYk7t/gC
         MZxwqLorDlbsVXNP7gQcbXmcKYJalyHEczr5FHKivqA2yRPwNAs8T7UQVe4NUQC6Kb11
         VKZpemimsAldzeDmC8injXHoXeOLp1KBwT+uymIY9KdjvnFM2LPlJf38NVOYmysIFiCt
         /LP7KWFKl0spbxmSV+LSvLXoKqkNutc9E6A2j3N6wfOZlvY65dnzUzAOSKRS0AvXH4TV
         a3x3/7l5e/+DrL4w78OKAZMYxByuehGuRK07HjkJgWefWSenOFmDUe8BkqV2II4ZFK9D
         KXHg==
X-Forwarded-Encrypted: i=1; AKwUvBwSlxFWCsBM2l3rK4HZVFf1+/pMs6yrJNepUzybwb2dx9l96Ax4Uoyr+jLFQpPXFJQNzdRvtr6KqtZtzw==@lists.linux.dev
X-Gm-Message-State: AFq9FYL8iy1C+n5XHZFcYQ/pHlVxbmP6b6JOVDTICgwzfOqis9w9Xqqn
	I52pfiBAaRbcXu7+U6pDgadDICUApTOl/z8diBLwz9oLBpptU6nUz9HEtyT8xotyJaACpwiVAB4
	mX58Ex3aUTgaa2lHskMQ8cR7Mn2JF+grUuz2uzfAUT8deX1TVHpBLzIbucJQbs4M5BQ==
X-Gm-Gg: AYBFou0GCs9Y3wdB4ZD2YKl+WIAtXHX3E6jnzJ160Ozoz2+7gwM7ikwduwYQUzpbNwd
	Kf+NlNwcEbk1y/6k82z5qfOZXcarc65HHJWPZ9uFTv2nDGFdLhDbW4Yndj/b8KWiggGSc7L9lf5
	IBqBUb5V9iG1EnW2g73mp7bvtUlvlHBdo3U1BgUnlxR17xFH3B36HZBuV+diRLAEL4JvNI5pRrE
	dZx8JeWxcORdoyoPzBPfMM9ZMk6SAu90a44ytgVi4mCtr8j1TYvruxX6e+bDH0s2xiqLTQ6/QQf
	5l8kwE+Ykf8SM/oOt1/UNuVrWlzzsrO7lyXgVVvSwDHk3GxiQqvaXQaWbATNzOmYhsBWgOa7ZVn
	vH/gNpcsztkyW+xD5Ui2ejcWCu/BHwfwrZsHYjWPzDAcejuJUsgAGNTMrtGBF/2qlamvdY/ZuWG
	xk00KZZs9hyUsG
X-Received: by 2002:a05:620a:6887:b0:93f:567b:6157 with SMTP id af79cd13be357-940ef964f93mr965085385a.46.1793013033603;
        Mon, 26 Oct 2026 04:10:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6887:b0:93f:567b:6157 with SMTP id af79cd13be357-940ef964f93mr965073285a.46.1793013032997;
        Mon, 26 Oct 2026 04:10:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:56 +0200
Subject: [PATCH 07/35] drm: rcar-du: use devm_drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-7-5e3070a3478f@oss.qualcomm.com>
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
 bh=ULsX1dvjGix9WxOeq5OBXyIUsRBnuO1n1CN6kLh7e1o=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGrfNQijBa4aGH9jIv71o3IUXgiKh0bJWRV+IrnWQn/EhK976
 okBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJq3zUIAAoJEIs8ij4CKSjVvlcH/iO8
 jYjv/HmDRrgNDbCzIBY4wlAdtIgGZlU+t9FDDKZ8SP6nhoK2hkukiFUBbwqQnTCMGhwHGeC81oR
 JVXvJKEJI/fcLj0DPMr3YIpCmst/stq61gz+KuqPdk7SI9OuOF0a2H88vkGOOoj35VT0rc6NCdW
 9QKlWwfZvnOEY9n2MuG076KGS2o5KXObwy2hr7i5FtiMbDhT+y9jXBXOVw+qvMBJyB0Utk3l+MX
 pgFkTm36QGi1diysTHh2q2sTPKR2zcgP0IIlrA5zOSzxXb6wCEfiKFWWPkLHZa+EAGdzpIvJYg2
 b9aYDplpVEOCLyE33DWH7DqvtUtQp6mqaFqOu44=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: IxfGiGzLxsBUtG7suPrtbNd4oNlT0mIS
X-Proofpoint-GUID: IxfGiGzLxsBUtG7suPrtbNd4oNlT0mIS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX7l0NnSNXv6a0
 1ojH0p01cTlyDZ98LcIF4CSzsehwwF1T25NWFERZgSQ2rXzhmpCJSMNX1vWAYVEt5OUFx0oKwu9
 6YSt3WgN7/zkgPWl0ZlsUHASJqRDWNFuKB3EwIXboAc4YeBJU6JZOqGI20Gn0CB+E+4LUQRaH/Q
 +sPiiTlWrlOGSm/zmOz7XRa2CJ8MZk/pdzNGY72b2izBFfFeAZ4+0Qk3Do65Cr0C0Iffp7f76IW
 NtJoSrTxAdCViv6OLfMtjGdhTYDd40V2INAm8UNkw5rJNzCBifxJe/U82HHt+yUYJvrQiKz0K1G
 dUNrNndtlpwtJ5q+/VuyrtP6Npdy+S5RU2Y7q1BRCgC1qrCHwVYyQPaPsjRMuzlj6ggOYLUe8Gj
 qIEGBCUNI6zwLhcrqI/xTPgD4FWQMy0K4TZnt7dJep/3Rcs6o2QsHtMS2BmXo8M51faMrHMKOdW
 dGT5Aqxtu5nHGyvIJkg==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf352a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=BQQ5wuhf5moQr-eOkAQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXyOtaGWau46t8
 tfvwKQYVYnQCTMNASbO/D8Y+GtkyR3k20pKsnpz5FogdRbXVHcRWuIqcyL7A5EszHrCKgGvhEz3
 Shjp1K+EKEnDhjYG/DiW490/35WFv98=
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
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
index 3f98eae9b6ac..f28840e3a1ed 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
@@ -67,14 +67,13 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
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


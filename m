Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013050;
	b=wE85VvKwpX+0c5eu5C4w8BqtccVdDKvZjcgP8Je69wNNVZvJSNUEGs5M88BlbzQus84B
	 j88Ri2hzC2EnY0OhjwSZL6ksYomNgYENaW1pfB7OsXEcNLFioBvckzj5tv/RVT8d565AZ
	 LJLxGp1JtMsebpFmSztNgcCWjW16psfCTt6bKPTIKOToIDncHFrza6PFZsSN69Z33vBrn
	 mR2zGf0fmYUnU/R14YBJ8hw4+OWGWuhmBWNueVVohdGKOa/sz6GyyV+1GT3FuLnKFsX1L
	 pffnq27+HvL9Sq7TnWoEDgHifgCb3rgUjhKI1DTpRlqs2OJC5BwQ3de4ZXBR1vipJiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013050;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MgkZ3msvDETuLbxSPazzmfYLPQWjddqXDEgg3s8gAlw=;
	b=j9mPsFUywLtjMjWBZNqXo13fUPhS+RLVEWRJ37BCXnQQR7344ATExZhGrNczjwEqXP77
	 2Heou4o3qktSLuj4cMUV300k+VeSG5pepKacY2rbRCvdhR9p4ei65OC8ljfvc1MfpALjU
	 eOC+2T9HoXjNL61IoQZhZ5cF0MuCC+ZRGCUNpdkTx48+5ZJmfVdQOjK7lzt+B7rxzt8pq
	 wxHqGGQxobUtATIzw62o1OiB1LMz5nwrLYu4gwCLr+ztWzjoT3MlmEJkqkPiOy0Jh9yKI
	 9mg32tbNC38eCn4UPgz0PLDPvFJosHBsnyxtiLIv6iPRCucAw/5IneKbWFw27MErQqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KG6mF87B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UnIw0ojd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493D960A263E
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 493D960A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KG6mF87B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UnIw0ojd
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsrNP3033637
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MgkZ3msvDETuLbxSPazzmfYLPQWjddqXDEgg3s8gAlw=; b=KG6mF87BwDyegVR2
	WOC0yihmsTsqx8SvUZV2iGWPkp9Pb2Hvhl4NaUQ/MT7bNLzIzXIuD954aVOxfFLf
	OMTNKXXxDOWvA24nkedlrdQDM4kJKjKiOySK62sBx7WsS+iPISA0JRQJtV8Okfdb
	GnEY7lBuwVNouo1ngFthfG8CCuK7nBhUGabPBAzHp45LLtUUlhFDak0nLrhsVQD0
	QyMLX0XFCTvUhuq2/MbNjhn7TMG+fXU8+PEwgZNtSKtunZOGK80Wfe1QVjEg58pK
	TRwHwkfdEYa4/DCLVAhWEcFNUiIPqaoyvucpCQBn/PylXE25/U1hQES9i3uAjJQP
	ZVsZxA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y046j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 11:10:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so366153785a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 04:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013049; x=1793617849; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MgkZ3msvDETuLbxSPazzmfYLPQWjddqXDEgg3s8gAlw=;
        b=UnIw0ojdpJJwrtpaR8IjAHvqF/kZkUG/Dl2hb0qDYDa3frNxdrIQmeSuh1/czLh/C4
         PU4JYhrhdshLwwbO93Udj5q7qS7OisL/ZqGYUWXmAx45fwv8yTxqvKaa3D+Af05k2f5k
         iCWh/5/gLVloyvSgkPXQaOfju9tDje2qZHk4bdQ2lcpdGVNkqA+Nduu48kUmTrDbCOgW
         WQyS7ZKmVyzZnWf98tMRqSNsj9xPwFNO2Oep0062hEsBZCI7xGHkpShyHPDFSI5pMF+6
         vuju3VW/qJMJoCNUoo5z1kHALrK7Tq6KvAErywQFjfcgJRf0fGa/RlmJgVAeYv4Bp7Be
         Y6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013049; x=1793617849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgkZ3msvDETuLbxSPazzmfYLPQWjddqXDEgg3s8gAlw=;
        b=lc61hv+Aa9xQfOfKqjyY92rnjx3hdJqX7C41it7qK8DGMsksqGnRm7b6Es1I88/2ny
         RDFt51J2kCZDgn7hKj2uBs8tJ+n7WhvYPtdzG3gFD0y7IxgVACM4hXIB70h42Ekg4Rym
         YFgeW1sU4gEpSCioD04ixVs8pRkGflXYYWbDNQvoIn5g3BOK0IND3hfpSza+oshrdyS7
         0NIbTrHhID9k6aB7n/wEOudeoETj9MY400AnFu1qrOuhUjzGX+u82lItCBLfissmY5wy
         02wXRbtdLQqTQ2tDxqn1poaaKXsPZTroLeiu2PmhUjeELjF/kYwbJb5BzYp6HTwh/Ecj
         Rv+A==
X-Forwarded-Encrypted: i=1; AKwUvByWMvvrs9sq9Sk4coEkMBZTFI7py7wo8nZlWdS5tvB1MZY4JMLSvCJ2iKnx4oWXdZTNxM+qDTj9dbMSjA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIfTDLE+9NNOx+Ri4VJCWJIuHGSycxdETETeL/C5Of4I4ntAtrD
	MRsZ/1cLPFRj5O4GghnWlQDsXTjkGdyBF8cAqe8gpF3GcS8Wnmyu7Bf6E4GL/kfbNUy8Wj4gwvz
	JaLApgMq4+GaSi3atzVOnrPkdJDeilIIkvvNXQC2j/tIL9zOm2qEpwbrJ3yVIh1VE6g==
X-Gm-Gg: AYBFou3QMcxNcbFYRtJYA4pfUCNNnkHC9JT62Qq4h5Ok32cXEkTLSIedWS5ya44nxSa
	8NxnKuUfgWf08f0D4Z/GaJYF08gn5tS7M9xuGM9vkk3YvDecl5vEnHWmA+utEQPGrmtuJSNPBRd
	2B6f+WXUWBwnr8HoV+2uca7/9EK5MO5v2ug7xYAffcelJekxbBthI/d2OuWYN5bcFnaErIbTSWK
	yJa8p2qB+upELykzxgmYAINdh3ay2L5Vu5WRinpKAtN1f8HQl5RPZ5s78PDse6WXMnulVDsQVc0
	X66TXpGSV4wBRlc46rZXFqVHfqnF+aP7pQalQKjxy/GNd6c6RqvjNkuEYlLzvQ8FS4rVKPPlTCC
	EoD09Z0CrFUF6XFdRxiz3nSRZqACZJDwA9Cnf4rU7Ea2tMBoxd1JoFMx0X0XJzzCJFq7mvKScfX
	iGm6Q6CTPrc+bn
X-Received: by 2002:a05:620a:7104:b0:93a:824:ac8d with SMTP id af79cd13be357-940ef914286mr798387085a.27.1793013048110;
        Mon, 26 Oct 2026 04:10:48 -0700 (PDT)
X-Received: by 2002:a05:620a:7104:b0:93a:824:ac8d with SMTP id af79cd13be357-940ef914286mr798382885a.27.1793013047531;
        Mon, 26 Oct 2026 04:10:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:01 +0200
Subject: [PATCH 12/35] drm/rockchip: rgb: use drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-12-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4oVr60RnAJ61z5K570gUDjVdVdyuiFoMRTG0La4ODaY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zULrSMqA/Vm72dISmZNYEmYT6M9UrSaAuj1N
 xyRpwiPNmSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81CwAKCRCLPIo+Aiko
 1cuAB/413OSCmLLBtnCNxmjruuBAUTBtqGUXr10iDIhH/YKrPj+DNJCrC2d3as1Yy9C7NO+eSWK
 5dbptZX7u2Cv0Kgt5u9zSOWCxRUnCGON8JjEMUqCRQkZTRrtSyHZBbfrJWAiJhm/kcqEzv30cQ2
 xYCUvmH44dxVLVkMi7kRresJeaiUfN+NxtmmBthFZszfOuliShQRIxMVEjEEwRuYKcmfBWFfCLe
 ga+LGNl/4iffXLq1yi2Vrt0YUknyWwkxFeem9H32ix7nUmkWpfyGA/OIQryvGWfKrN4bvrBxdTp
 7hnRUYTpEhTZg/67wCtAvrKSEYzmtin/ikAxcW2GvYAAP6u+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX0+DHKU+kYlWf
 goUplVZKyKM7Sd5NLYb8GyvSyFtilsauATJrGJFQVa1Kg0VEnx2yBL42O/tjmJnX2973ugBItnI
 qm3wDoiMJdbpGXtx+8f64corZYM8p9g=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf3539 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=-QyiolZmvoSe3Jx-ok8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX1muW68ufprCq
 0CciTq4x8Cvbzrt1j91DM7Q/dVM4H+k5nWP9di5dttv241RR9C4VZyECsjh5xXsHrlu8Cfe25H5
 ZewKd+k9e60NAgKXW6lxjOtnZaBLMdEUnUrfQMpS4uAg7o621CAYF624quoeuSs94FNKD7L8RFe
 9Bea1cTsFZfdlKK08xbf+1sEUSGDq27AlPe7vcbfDc9bpKoczdqEde/vpfoibwwdW9PvcNS5cQ3
 PNuNgf5U1WjeTICyPGp8XzUODIx+hk2LoFtpnf4Onp77dSKklNn1hj7ACZsnn8CesQGqzdTQ5lk
 2BD9EvyFIsM/KMWJeLl3ArHywq6XB4kHi0Z0mne7UmAiUpEVS5tYmUi/M9b5MqFHupsorqGRmgX
 Dl3rnCjrwZoWqvchxdgFH48f4nGiE0tSD5iNJezbnMrN80lJc6Xo/GM5h+pj0LwAPx9yVd5zo8t
 zvpJLwvNdW6sQ57LwZQ==
X-Proofpoint-GUID: UlsjPFI2cxcHrHyLCccnb4VChAj5pkki
X-Proofpoint-ORIG-GUID: UlsjPFI2cxcHrHyLCccnb4VChAj5pkki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The connector type passed to drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/rockchip_rgb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index 0e1830bc40ee..feeda68c20b8 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -143,8 +143,7 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 	drm_encoder_helper_add(encoder, &rockchip_rgb_encoder_helper_funcs);
 
 	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_LVDS);
+		bridge = drm_panel_bridge_add(panel);
 		drm_panel_put(panel);
 		if (IS_ERR(bridge))
 			return ERR_CAST(bridge);

-- 
2.47.3


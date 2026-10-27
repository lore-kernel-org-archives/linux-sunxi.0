Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102578;
	b=iB61yz+miPKiFWGPZ1FEWtapikoOUyb0+ntzBbuNXd8T7+/+ztxtesmesciYrssloZRr
	 NIgGVxEMdFxxNxGt2byfaN3kwzBDNOpA+9k7+38KHwr66ZwPHVcxm2ZU5S/Wtb73h21UL
	 +xdxw6VPwNj0YkwFsVzOpfxqLD1oTNFKnofSAUcwGKTP8q9okEPmoztGjM6BOMmiiNQj0
	 gntNbaXtsaEh0c3/wQrTNP1Au5N7gb/wIPZ19+sPUrumkZMESU8Wa9x0//8fnzIr50qEC
	 v4bfQGkmQDMtB3YsYIKs/zuqdJTME8gYQnlrj/gzYSmfcJckOw8FHpLsdUo22HUDfoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102578;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RreJT6OdWgxLLvGlC2N7bmJyUm9m4QYaD4O3KtIV+1A=;
	b=W4alfKwrnBlZ3zcnmV00d+o3HL0X+nChjU4Io8MnMDsp6WiXHUjMA8YRQ9GKZIVEVnkZ
	 rKEHiAqRRuiK5DQKA6aSAFeFGlv92EyTl6INVZnl4eFe/8pj7RCn/k30fSx3W5hzcrhm2
	 UNBV1n34LQfKMQAdESFs/n1lJGEOCeOxJKpJe7XRNCZoklcdM9IZDsJk8Xb9nVqDkzBo/
	 Ioyp2DcMzosshviFSymOhFvEspO/Bf2TRHS7rdtL4lG5zAhTyRahZ9axdprQ7L0MHVId8
	 6/Obpnhs39IIzVzwUaQibpf5H+wRIVgRpKzbE7BevzEqY8eWPZxRWNFysz0lKa9MobQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+1n6Gi8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FRSGu6Qq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C430C60A262C
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 12:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C430C60A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+1n6Gi8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FRSGu6Qq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdw8H2458110
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 12:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RreJT6OdWgxLLvGlC2N7bmJy
	Um9m4QYaD4O3KtIV+1A=; b=E+1n6Gi8vcyP3M0k3o5Wgql4Sq04nvrDDWa2FIWu
	sLVnyHOl26uyu0ziRm33cusRsQ0idxUnBjgHJ2RO/qvSp1wHmhCKSkhP2PX9UwFl
	D8NaLY/DpIx2crNESacLyxTZ9kQuhMfSxglvu3e1a1oKGG0W6iSjx1gw/r1fp5Xd
	k7OrLdTHpGWvnjK4pATqvpF/9fOaMQ/AzNNTTONZty1mBXLBsphEF0jiM2RS8p4p
	Ry8ZVgJBxRqe4K/+tP9x6nh0kIssyfUW4f+D5JWoBKeWW8s+5tYb+3xWnGf/RmGW
	fXR54qk1SYsBEQyZhnU16D8nBTna1kcthL5pM8W1wcnJSQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbta514-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 12:02:56 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eac6157868so830259e0c.0
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 05:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102576; x=1793707376; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RreJT6OdWgxLLvGlC2N7bmJyUm9m4QYaD4O3KtIV+1A=;
        b=FRSGu6Qq2wXahGGCutdfbeB18J6OcVL8PC20z7xlh6EEzkAhIkpG/D5wqiMBdXcPkW
         Ful4z5OpsLBaGRw9UgbYFoYOsR2qwF5eiATBeAVQ6xuYPnUnLStQp3TuGVN0ebSPyWTQ
         4xx6zE268rbwsTYeg53yZnWYdcG9BEm4eDuop3X994oUK1ExhI/t88HfJNhhfhaweoV2
         OuMlqguNdUl17y2G5jiPIpcmKvPKr5sUfBJo2LxkU5G5sAMLA8PguXQC12BV1rJPRqPu
         K+c7NqHUTRvm3khMbzGcwprTvvyqvUC/EanWgvwywftcaU1IRfew7GALZRgi4J3LhwpQ
         gO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102576; x=1793707376;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RreJT6OdWgxLLvGlC2N7bmJyUm9m4QYaD4O3KtIV+1A=;
        b=edzVrC2tSQm2VzL6vnWLmIJPapxHQo3egYqx65VFIVUHT71kHuQHVnwgxlFP+P4o+C
         Jh0ubfSZRD6uksYJRI/jNvvwurY5khYckavtx60iqu1/DXCoJvI0FbpEvVlPKcFnQxjD
         qvI6m1VjEsx8rMyG55SCHomsSKUv1xttVdWi2hnBX5FbFd1UnnQ/NaKvOxmol0PphyVD
         y/QHTlf9sL/qatfnPZVTrl4lGLYSAU2lBG7y1Smo3N2dD6j/+3B7GW7I2x6i7GWg4Ofn
         PIxTrbTNG0S2XPaln2zGAud6KUnEEdohmwmoXILRXcUWGcLT+Cx0ziJcOCW9Bv9oTOnw
         beUA==
X-Forwarded-Encrypted: i=1; AKwUvBxOPm9Y/QeiRVPCrZmDBgvvPdj7GS2UT5pjD/xmv0PfP3Kx/n91r0Nrn6G2y9Jql46CPuwJ2kQ9RLEzIQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKFs2dEpmJvAVqH0dF2JyoGW01pKI5djLbAmRKvp9XEgEf7VMWo
	lWcYLJa5h4bokVU8b9qSQawnEEBUqHLhVkE4hTu8zrdabxQktl0jcKvD+nreYC8XXGDlaWVskzz
	LfmVqOcGVbB1sgVam+RyYax8E9/ShvG989RTwL/H6hYaKBGB722HM1rKM2erg2yKjBA==
X-Gm-Gg: AYBFou0gh2SYqZw2tnocoT52EiwpCck/bErWH0XDZz+F0GeyC6pjMeol1YGW6+h853j
	D664eR45m1lrRJrhVO7B7aBCPwwKKXl3LDnDl1lbjt/2ZibYvBVNiusNRLS5YaiNhFi4DgFJVSc
	GhudsodrPnWbkWHQorSiOYViSHYsdW5yEy9tVDd1qQe5ILUP1nJEvS049bFk1V0PJsmgO6VdwsI
	Ekt6NFzG+2lN/EEVkGSKnCAZD34o8IP68hU+At4a99NP42SCr/8ncEljNGO9AeYSPw44rr2vUwg
	cWEP2p1Oa1Nj6WQK1h0U53EOf67UoQegqMdNmFwhKtJHpd0iBfEPaJNZqSHlnz6m9OzNhLghq23
	0odruD+2Tl53QFXWK0ohp87830ypOT5CyIEi4iH0r25H2FEuO9HAQsGmlaC85jcTXqKzs17QZBL
	NtOZzi579eJIVI
X-Received: by 2002:a05:6122:124f:b0:5cf:dd67:cb32 with SMTP id 71dfb90a1353d-5ec3ea462d5mr652304e0c.6.1793102575678;
        Tue, 27 Oct 2026 05:02:55 -0700 (PDT)
X-Received: by 2002:a05:6122:124f:b0:5cf:dd67:cb32 with SMTP id 71dfb90a1353d-5ec3ea462d5mr652238e0c.6.1793102575110;
        Tue, 27 Oct 2026 05:02:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9558esm2089787e87.70.2026.10.27.05.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:02:53 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:02:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
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
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
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
Subject: Re: [PATCH 00/35] drm/panel: let the panels use the atomic state
Message-ID: <cxsgo7u2hfb4jskscqcbeaaneiyfh7bdmlvku2wxwtduekwhxz@3vsizgxvekw7>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX6DfJhX1KXVWn
 D5mOU6WYedU4RbVS1De3bbc8lsXNYiRkRM1V2EBUYP5NvJ/XtQinVt7WErZ2jow7hDwDY2SflyJ
 1xi4ffIsxH0Jb6SG/y728pGcl+JECeI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX2GCP5K8cIaMW
 Gp1nfbgp21iAvmriF9+q/LyqbuDSHN5hE4sthjXPDaNlTgiAru1KKEGgW9Q0ugKJafMuNNqNZKT
 MmyFeKp9HGrrEW8ldoRqbScOzLCK5q7PilzBWOMlh21qAuvoP5L4H85twa7jSA/Pa6FMzwUTuGS
 lSWug9P+9YNnIMyxGrnQCgjMCYGfgdZRZwlUGn1XCKbD66KBTEtf0j0iY+zbG8oVdu5j7gO1sCr
 UILxWUgde0xlx3UuD08+oOGQts3RG5qTNnWiz9KIhxQO2eck3GQt+DDR2FWCcYrTmFWEBj+Qph8
 +r6+JLkWGNXGilnmRwK+yRoSVF7kcDYrRLoOB3AuN/V00PZbY2Ugx4fuKUP9D4k2CZluIsaRJyk
 w1Afp8/5hp5bSMbvzOqjemKp883JQAL7tMQpvSG7CzO4HmIOQw3nwJFD0pg7F67xJX9odcq7UFY
 NjTHn0HpQ64Ce7O8WTQ==
X-Proofpoint-ORIG-GUID: nfMFZDkvHeGBMBCCRR28ItVZDp7HdqV6
X-Proofpoint-GUID: nfMFZDkvHeGBMBCCRR28ItVZDp7HdqV6
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae092f0 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=dDezlKT4IyV31VqxjHAA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

On Mon, Oct 26, 2026 at 01:09:49PM +0200, Dmitry Baryshkov wrote:
> The panel is the only element of the display pipeline which never sees
> the atomic commit. Its prepare() and enable() callbacks get nothing but
> the panel, so a panel which has to be programmed differently depending
> on the mode can only guess it. The NT35950 driver, for example, saves
> the connector in get_modes() and reads connector->state->crtc->state
> while being prepared: without the locks, from the current state rather
> than from the one being committed, and with no way to reject a mode it
> doesn't know.
> 
> Every panel has a struct drm_bridge embedded into it, and the bridge
> already has all the missing parts: atomic_check(), a state object which
> can be subclassed and the commit passed to the callbacks. Rather than
> growing struct drm_panel_funcs into a copy of that, let the panel driver
> provide struct drm_bridge_funcs for the embedded bridge. This is opt-in:
> the panels which have no use for the atomic state keep using struct
> drm_panel_funcs and are not touched by it.
> 
> To get there the bridge callbacks become the entry point to the panel,
> with drm_panel_prepare() and friends calling them rather than the other
> way around. The panel core still has to track the panel state, notify
> the panel followers and handle the backlight, so the driver doesn't fill
> in the power callbacks directly, it wraps its functions with the macros
> doing that part. NT35950 is converted as the first user.
> 
> The bulk of the series is the cleanup of what the panel core and the
> bridge need from the panel driver, so that a panel providing the bridge
> callbacks doesn't need struct drm_panel_funcs for anything:
> 
> - get_timings() had no callers.
> 
> - The connector type was stored both in the panel and in its bridge, and
>   the display drivers could override it while creating the panel bridge.
> 
> - The orientation was read from the DT, stored and returned by nearly
>   identical code in more than twenty panel drivers, and some of them
>   also had to set it on the connector from get_modes(), with a TODO
>   asking for a better place. The core reads it now. It is applied to the
>   connector from the new connector_init() bridge callback, which is not
>   specific to the panels: other bridges have properties to set up on the
>   connector being created too (HDCP, DP link properties), and currently
>   have nowhere to do it.
> 
> - disable() and unprepare() returned an error which nobody could act on.
>   Worse, a failed unprepare() left the panel marked as prepared, so it
>   was never initialised again.
> 
> Behaviour changes worth knowing about:
> 
> - Panels with the rotation property whose driver ignored it now get the
>   orientation property. In the tree this is the Motorola Mapphone panel
>   (panel-dsi-cm).
> 
> - sun6i_mipi_dsi, sti_dvo and the Tegra DSI get their panel after the
>   DRM device has been registered, which is too late to create the
>   property, so they lose the orientation which the panel drivers used to
>   set from get_modes(). None of the rotated panels in the tree are used
>   with them.
> 
> - A panel implementing atomic_check() can only be driven through the
>   bridge chain. The display drivers calling drm_panel_prepare() directly
>   have no commit to pass.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (35):
>       drm/panel: remove the get_timings() callback
>       drm/panel: remove the unused struct panel_bridge
>       drm/tidss: get the panel type from the embedded bridge
>       drm/bridge: lvds-codec: use devm_drm_panel_bridge_add()
>       drm/ingenic: use devm_drm_panel_bridge_add()
>       drm: mxsfb: use devm_drm_panel_bridge_add()
>       drm: rcar-du: use devm_drm_panel_bridge_add()
>       drm: rz-du: use devm_drm_panel_bridge_add()
>       drm/mcde: use drm_panel_bridge_add()
>       drm/pl111: use drm_panel_bridge_add()
>       drm/rockchip: lvds: use drm_panel_bridge_add()
>       drm/rockchip: rgb: use drm_panel_bridge_add()
>       drm/panel: remove the _typed() panel bridge functions

Gmail barked at me for sending too many emails for too many recipients
in the middle of the series. I guess, I'll have to split the series into
smaller parts. Please consider reviewing the posted patches, letting me
split / land the series in parts.

>       drm/panel: remove drm_panel.connector_type
>       drm/bridge: anx6345: set the panel orientation on the connector
>       drm/exynos: dpi: set the panel orientation on the connector
>       drm/fsl-dcu: set the panel orientation on the connector
>       drm/logicvc: set the panel orientation on the connector
>       drm/stm: lvds: set the panel orientation on the connector
>       drm/sun4i: set the panel orientation on the connector
>       drm/tegra: sor: set the panel orientation on the connector
>       drm/panel: drop the orientation workaround from get_modes()
>       drm/panel: read the panel orientation in the core
>       drm/panel: use the orientation from the panel core
>       drm/panel: remove the get_orientation() callback
>       drm/bridge: add the connector_init callback
>       drm/bridge-connector: let the bridges set up the connector
>       drm/panel: let the bridges set up the panel connector
>       drm/panel: set the orientation from the connector_init callback
>       drm/panel: make the disable and unprepare callbacks return void
>       drm/panel: don't hold the follower lock over the panel callbacks
>       drm/panel: route the panel calls through the bridge callbacks
>       drm/panel: let the panel drivers provide struct drm_bridge_funcs
>       drm/panel: novatek-nt35950: provide struct drm_bridge_funcs
>       drm/panel: novatek-nt35950: use the atomic state to select the mode
> 

-- 
With best wishes
Dmitry

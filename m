Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793465059;
	b=2Qn3TpjTTIJI0pO4Z/YoD5fsI7uh8/5m8ioU/Lt0vPyiT2n0UoHeQtMaa/2A68WBBErY
	 l3UkcdeEu/7FBcMgtn6iudEKgF31EIkDhSn43YlEeDeEiuEeKSY8BCml5j58Y7c3l+rei
	 xghBJLi/bDImttbD3td7xA7vCkkhcKJA1hLeYTkO+OOoZQQe/M38Gpf72GOm4ARf3XnHH
	 ATw6wqQ24u9HqtdB4mK5KLwxgVUheWY/Valhc0Y4AebQ3BMpe55dOzg3S260/vv8tBp/n
	 FO8Ol8K9OPaW+A/0xX9sqEvp7Vd2/YJ6Lf46v6hAWJ0HfVgvmexD516ryrzMwjTfaxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AxPaqqR7JQ477yDdRMMPNaR6fhRM87wS+96sE2dqDu8=;
	b=mzf7291jXB+xrmuu8OA6DorS6zbg6Ae57Iiv0gHGmv7T/jUUN8HZdz7q5v/5D0H7dbaR
	 nZ+jfRGsTXRnmvzb+cUn8cv8s/6+Q5kWo+3vUEV7qPVH5mZmdMpr++1uNOXd+sXN/jKwF
	 pYwzWC05wNtqZWvXvRfK5vNZTjddXxAPMbZYXzG/cRyC7E4ovy+hihARixsdtR69Kna/D
	 0NL4hBFSmCK6OKdzeywEokv9LpGqhMAFmUV3ETnJgA+E+vq9hNyLohYSWBopYTSrDpLdS
	 7Ocl5XEGUrakNPYgwFjkguRqunzB5usaQAhAzRnom0VH2vh/+KqAle74Bpnr5CnH0OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DdWMOV2z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hgqfqcH1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABD3606A31A
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Oct 2026 16:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ABD3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DdWMOV2z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hgqfqcH1
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VGTpgH3604910
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Oct 2026 16:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AxPaqqR7JQ477yDdRMMPNaR6
	fhRM87wS+96sE2dqDu8=; b=DdWMOV2zuAcTmxoxESfa0mRiVck5d3ot4T6wTvkn
	yr7gIlkhDjxYophT68C9VCeg5uY00oW5ZoeSXPnEjEaqePR2Q8nbQW8Xa+qS0dig
	wyFR8xvA/YcJsCQ/A2m8uQD+qG0Hq0Ph4zLv0/UvPovKUHRsiJQ3x8JrIjg+qvBy
	8W7X80/OYoIl9M5BCR5yGjNYS27fpc7/yearZw2P4HVKmW6XIanjK9VlT6DPIKvW
	bB3nWBjPKKrSOdO468EAHhmlrMPpgBDB6+LVkJ8UgH53hlHtXymHV6jhjq6sWWEq
	tbexGPO0M/CWaqqzHd4e5fZObFGADZ/+RRPuvLLrJhF3Iw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fswex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Oct 2026 16:44:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso374214085a.3
        for <linux-sunxi@lists.linux.dev>; Sat, 31 Oct 2026 09:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793465056; x=1794069856; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AxPaqqR7JQ477yDdRMMPNaR6fhRM87wS+96sE2dqDu8=;
        b=hgqfqcH1sBEey/KrdH9m435wl8zYCouc+/Cs00WZGXLeAA6aUVm4yGry9YN6ZGivvn
         9zeFThw4OI0j2KNramkoPsySTYEBnDLPrU/Sd2OLK+ELbUTEy65X0tw5tZpXvExDMBl4
         Hbii9GLwJpyQgbPp23QLowR3zv9T9l/2I11GwAT+ongRGnzE/MkhG1ZJd+E0pAU6LTLF
         JHyKqGJkfc3w7HFCcGCYCjb/SpA+Wf0exiDMaHpgSjo27JIkBlh/QEm0UjH6QBbMAl02
         hq9+Epq8z25uJRphFv7wSZx+MqiQccBKhj+2wiCVUJhrXi6vXMVnjCjNF8zKQnrAltSj
         l8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793465056; x=1794069856;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AxPaqqR7JQ477yDdRMMPNaR6fhRM87wS+96sE2dqDu8=;
        b=aWAJ9975y6VJhNLXCZ/KQYXdct/GYxA18yNs0c6HmCEib/jmOX/OjMANGgcU/9grkI
         f6vBGx6U5cNyXSpvwRAaK8wxmPDWFZfRcAGRPcldHi9mcrAHpL8GlnGgZR3P3X5d3VfF
         SQE6HfjptGy5CD8bbaq8RD7WsIyh1NmD4prJAfWbOPMS2d6Veutqr/H+c8CU/0bU5Qk8
         D/kbQh7/b3wrgEWkmQtux+wBalqyqkR/gnfg0ysj0q4nSqr5AzMnvw+YwW3VbqPCDQRg
         hFXK4gGHaFbzRHtiVJHP9nmYrkE+TwKTb2Um9pItlXCNFy5wC1kWqcuQix/dhc8GAaki
         0a5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxc48+GXByWdM+nDblcQmr225YzogDNolNYFAEhRQLiZPLzH2+dEj0cCfA2+zaGAswfqYC86WVlVh4xTQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLZsxlt+vY6RXkI/TqQ+wrj5ei2VGsvZVYptU/vZBWrXGQZpYMq
	/2X71SWwLc2p0FLZe7PDh57CrKRzsa5db1tsytrdCZruP96pAiAmn8rLLihn0CndZ3pxo/fsGGC
	GyaHfd1Lq34cN3cRPtV6bSV1rOECpKETW9oXjkLg9byY4C1u8Ul29AT0w8R49v2II1Q==
X-Gm-Gg: AYBFou2Pxtkp7qG0SbO+iFKWD1L95SDYgkPc2sQP4hF0T3KVW0oIMu+NMjpabHspYJj
	LACHQpqA9uon15gkEBAZuC9weyyNbp/lpZE/Agywn+EJfP9Q/QRBrFQWoIzhMh48xxd25gz0iiy
	f9UY3CHuRssIkgRUczOKuacSVm5jfHfGqX4vIvwwEuIkCBix5K1WRAA5gRhBawAfyuyNtEBH/RA
	5kCUzoAhXZrweQOq9c5ZzkdO769xB/FOrQ5ZMFS59a2cdVg8ieRdeO3d7ZCg/QIM4Qj6T+v7wEr
	wGnp3EBNLw+hm9aJ2F/YpVI460vtU8lUzW/IR77We149WsNTlBedOZNdQHjpho/mWPwjw5vQ67O
	coWuJnVV8hnUU5pT96xzWDnVxZ+nPWDnEDq9o6znKAveAr7HONwA4Y1h6joH3Gev9TYI8XFJiIk
	uzslfFo9ewNLg0cXqukQUqBaP1vDyIIlxgq0UvB0e2g2dess0zAT8U9AIMYQvpZQ==
X-Received: by 2002:a05:620a:1a17:b0:93f:3120:6c82 with SMTP id af79cd13be357-9442186437cmr915816285a.78.1793465055787;
        Sat, 31 Oct 2026 09:44:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:93f:3120:6c82 with SMTP id af79cd13be357-9442186437cmr915810385a.78.1793465055075;
        Sat, 31 Oct 2026 09:44:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072d1a8sm660313e87.32.2026.10.31.09.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:44:13 -0700 (PDT)
Date: Sat, 31 Oct 2026 18:44:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Douglas Anderson <dianders@chromium.org>,
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
        Yedaya Katsman <yedaya.ka@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 00/35] drm/panel: let the panels use the atomic state
Message-ID: <py3tch5wmx4g2zjpebzbgtpwji4ci3vk5obeuy44fbi4vw2em2@gpjmxyvwpimn>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
 <cxsgo7u2hfb4jskscqcbeaaneiyfh7bdmlvku2wxwtduekwhxz@3vsizgxvekw7>
 <DMICO60J4G03.1QBH2T9SQ7XEZ@bootlin.com>
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
In-Reply-To: <DMICO60J4G03.1QBH2T9SQ7XEZ@bootlin.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NiBTYWx0ZWRfX/tmVTrJLhsy2
 dN+jirJW1/v3J4jLQPSA8aNp3k/3KlD5IDYE3suoPmVhwHAVsW/KfKtpUAXIhG8399EaRNU4SGX
 tNRdKgrrPI4Rl+V78fO5pUv6u0eosUo=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae61ae1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=0sqqXKTFXRObX0Cx7wsA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: V1njwttDC1SmOarp8YSe3ZCicVhaCKHl
X-Proofpoint-ORIG-GUID: V1njwttDC1SmOarp8YSe3ZCicVhaCKHl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NiBTYWx0ZWRfX3MoV13RETHJL
 TMXRyqlNkRL/GcVbR2p855LJX67BVqLWR175hZXKAGC0q5jAUBGCnWnJBWTa6fXnmvL9APcv1gC
 I2CrPFq62mKzVwGTkzG9oEyYuCOZ4CfaQDJCUqsm5RDGfIGCrK3wiDQt6S7OwF/eg71UP1uOYgK
 Xiu9Y0/MbI7gzUMUHRb8WJONt2LPsOKkHtu9Tb7ig4L1Km1UAzxfsJZppLsGkOETs9UmthPGh1e
 zqu4Jkfu9aHqHo3VdCgFm8nmrWFIkV5B8CbHHR0t8BkVmudFIiGnlljwdc+XCjEGzwsrri0c+1Z
 xjswDTH668IaDjFR39g+J99bQZUFwVb0bHBrqGxWT/fnkBtHPBF5Jnhz7RnNk/poEEFOB3u4ooY
 8VMx1AlkiLOu8S0vhoY7VRC4dz/rQqVpjP8jqhE4chLJcUz1Tma4Cgmlkj4IMuDEobjMuNlUFQE
 yVbNdAMYMCavxOp38CQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310066

On Fri, Oct 30, 2026 at 06:31:02PM +0100, Luca Ceresoli wrote:
> Hi Dmitry,
> 
> On Tue Oct 27, 2026 at 1:02 PM CET, Dmitry Baryshkov wrote:
> > On Mon, Oct 26, 2026 at 01:09:49PM +0200, Dmitry Baryshkov wrote:
> >> The panel is the only element of the display pipeline which never sees
> >> the atomic commit. Its prepare() and enable() callbacks get nothing but
> >> the panel, so a panel which has to be programmed differently depending
> >> on the mode can only guess it. The NT35950 driver, for example, saves
> >> the connector in get_modes() and reads connector->state->crtc->state
> >> while being prepared: without the locks, from the current state rather
> >> than from the one being committed, and with no way to reject a mode it
> >> doesn't know.
> >>
> >> Every panel has a struct drm_bridge embedded into it, and the bridge
> >> already has all the missing parts: atomic_check(), a state object which
> >> can be subclassed and the commit passed to the callbacks. Rather than
> >> growing struct drm_panel_funcs into a copy of that, let the panel driver
> >> provide struct drm_bridge_funcs for the embedded bridge. This is opt-in:
> >> the panels which have no use for the atomic state keep using struct
> >> drm_panel_funcs and are not touched by it.
> >>
> >> To get there the bridge callbacks become the entry point to the panel,
> >> with drm_panel_prepare() and friends calling them rather than the other
> >> way around. The panel core still has to track the panel state, notify
> >> the panel followers and handle the backlight, so the driver doesn't fill
> >> in the power callbacks directly, it wraps its functions with the macros
> >> doing that part. NT35950 is converted as the first user.
> >>
> >> The bulk of the series is the cleanup of what the panel core and the
> >> bridge need from the panel driver, so that a panel providing the bridge
> >> callbacks doesn't need struct drm_panel_funcs for anything:
> >>
> >> - get_timings() had no callers.
> >>
> >> - The connector type was stored both in the panel and in its bridge, and
> >>   the display drivers could override it while creating the panel bridge.
> >>
> >> - The orientation was read from the DT, stored and returned by nearly
> >>   identical code in more than twenty panel drivers, and some of them
> >>   also had to set it on the connector from get_modes(), with a TODO
> >>   asking for a better place. The core reads it now. It is applied to the
> >>   connector from the new connector_init() bridge callback, which is not
> >>   specific to the panels: other bridges have properties to set up on the
> >>   connector being created too (HDCP, DP link properties), and currently
> >>   have nowhere to do it.
> >>
> >> - disable() and unprepare() returned an error which nobody could act on.
> >>   Worse, a failed unprepare() left the panel marked as prepared, so it
> >>   was never initialised again.
> >>
> >> Behaviour changes worth knowing about:
> >>
> >> - Panels with the rotation property whose driver ignored it now get the
> >>   orientation property. In the tree this is the Motorola Mapphone panel
> >>   (panel-dsi-cm).
> >>
> >> - sun6i_mipi_dsi, sti_dvo and the Tegra DSI get their panel after the
> >>   DRM device has been registered, which is too late to create the
> >>   property, so they lose the orientation which the panel drivers used to
> >>   set from get_modes(). None of the rotated panels in the tree are used
> >>   with them.
> >>
> >> - A panel implementing atomic_check() can only be driven through the
> >>   bridge chain. The display drivers calling drm_panel_prepare() directly
> >>   have no commit to pass.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> ---
> >> Dmitry Baryshkov (35):
> >>       drm/panel: remove the get_timings() callback
> >>       drm/panel: remove the unused struct panel_bridge
> >>       drm/tidss: get the panel type from the embedded bridge
> >>       drm/bridge: lvds-codec: use devm_drm_panel_bridge_add()
> >>       drm/ingenic: use devm_drm_panel_bridge_add()
> >>       drm: mxsfb: use devm_drm_panel_bridge_add()
> >>       drm: rcar-du: use devm_drm_panel_bridge_add()
> >>       drm: rz-du: use devm_drm_panel_bridge_add()
> >>       drm/mcde: use drm_panel_bridge_add()
> >>       drm/pl111: use drm_panel_bridge_add()
> >>       drm/rockchip: lvds: use drm_panel_bridge_add()
> >>       drm/rockchip: rgb: use drm_panel_bridge_add()
> >>       drm/panel: remove the _typed() panel bridge functions
> >
> > Gmail barked at me for sending too many emails for too many recipients
> > in the middle of the series. I guess, I'll have to split the series into
> > smaller parts. Please consider reviewing the posted patches, letting me
> > split / land the series in parts.
> 
> The first 13~14 patches are nice and fairly independent cleanups. I guess
> they can be sent separately, or just be applied. However I'd still want to
> review patch 14 and do some testing next week before I consider them ready
> for applying.

Sounds like a plan. Would you ack the patch 14? I'll review and repost
patches 15+.


-- 
With best wishes
Dmitry

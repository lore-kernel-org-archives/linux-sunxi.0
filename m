Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706837;
	b=xeUQsiBfFhknfWL5JGfr6SfsZnu2aoWwNJRoqzYwMNRC63yfugJFZ2z0tlRZBF0latdl
	 IyBBPbigNrrj+Yx6w1G397u2ebWV1KZMuuEZErpJwQNwCjZMqbzSRfRhViqEOcYQ25ld4
	 lbn3dTU3Mxdf8XdhAv2B/hHfaSHKeGTb2cY83MUTATcci9xfO3hFYN3vTBQuqorWoYvn0
	 9JJV2t4kAc0R9W4hXF5Fk8uLpc9pfIEAenTl30tTuUN+uPPTvkfIe892lJF+/EOygXhmu
	 NbhQnBe7VrLCx9o8ZfaSFaT1dI33Z2s/PGzpB4rVXMUxclO/7gPVwEFG439ZwE0eriA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
	b=AM1zrx9qxBdn5aa9Y0oTZamkaMUo8ioa9ypojFI88SnIG7DSiMHoRKMlQjK8bgqrwz/q
	 AHasAN3/QoYFtou7UUXdiCxnCTdZRuAp/IZl0fgU4vuJdKVZElQbUaogQPTfxa/ccumS0
	 ZBbd3zjAa/KGNDyWHYSNNBMigpKDK9rhc93DtXqdti+TlHkFuySCBOa2eNzIlT5g0YD2Q
	 p/5XYlsAoYQroXUbSs+p4D9gQiVbaHyhI9yPsJzpdayIBGpTWdEK9SsmbiS3JalHW75Fd
	 Necw4hLRajeCzZvximKXs6Xm5eC84mP9ltrFgRZcxUU5P6goaGb/cuWTcK+hzE7Slxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWWjy+ZV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjbEXUjL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EDD606D81D
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 11:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69EDD606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWWjy+ZV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjbEXUjL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AASaG1594036
	for <linux-sunxi@lists.linux.dev>; Tue, 3 Nov 2026 11:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=; b=MWWjy+ZVi2QdM7hV
	mqTyO4PsXxS1DeaTU7F0pAhk8eTinZvdhnDH3UY2nWUpcmotKOOoNSkfFYno6zvP
	REV6ABDEPV1Mi6FxJu8o8aHXxbGZ4bqB5mDrgZsk6oUaMDz/uw8uPELXjz6h/pe9
	XHsfsSXDnizijPjlIkO1rH/9HbhyfxvkHInASLwANmxINNEuUt1A8Iq3uXhv8gzD
	jtrLtrSdpmgIjQyTpzH4p2jGLgzKVv405S9fxEOkSFBSK17afQ5ypntnmcE+zZde
	OxDAZWtoPjUvNfQ/RumMUqU3vTm1o3B2J1r3WtcAYbHiubHCK8T8v5pdvCyKmcS2
	dVepVA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081ujec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 11:53:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89f84753b43so2654746b3a.1
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 03:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793706835; x=1794311635; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
        b=jjbEXUjL1is5FQDKVlzuOSnvK2q38HncBLyffjC9UL8X/f8soOwB+SfJaScq92bo5U
         S3xPr9HwyFh8Aztrv7lSHirjEnckLrRlMP8ZejFm9ES9cnerBrikSzj3qBRZKhvBWp1A
         0B9Df7EP9yzn3oC02ovs05GlIZTe2cf00BjGcNyfZpnG41gTGylTClJhrCn5dP0/VJ/a
         q1W9CnP0ROI9I441a3+CErUlFlSMIhKItuW/dikg+PaFpOmXX6fbhq8LlrJ/tuZp+bUz
         fvlD/uSR8tCZAu8smLwdENGeNm3JkvLugMuiJTuXTyUgWYnZAbzNd5ABxGU/eqgLFK1E
         wd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706835; x=1794311635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
        b=hTg/Xtd0OgJLDUskYUe7ilpc3AXmQSyUbJ6qaq3qXWVH0sMLOqrNlYx5NxJS6rqeWL
         nSvhwtA8cqHgjWiRk/UwQKmYCYd1OfL9CZVZzQE8OKcgkGZQhJNoJVgfM15IP3Q+ZyTh
         8F8zjUcwWM1ZDlhYN7ZpzhZ0l5ERPVPMGyO7UkGHRz+4pWqDtgo9WzqdoQr+F3EeNPst
         aFx/N3S8VBL5T4DwpcM8FFyQ0v2sxMu0EyWLmTDQuUDSp2vNf/9Lot5KCuKcCfrxzpib
         +pqCwzsp20GNPSlbP+qNVbxTBKe0FRa/rr4WTPB46qwVZ2UuLtLHVXGFTJBxphmDsbF4
         MlwA==
X-Forwarded-Encrypted: i=1; AKwUvBxLJwryQX2x6QzGSWLozD+W6MzZtvvMFihdAIw86LPnDVo93bgwbACXoIdzzZcBUrB0cjyPF4dsZqcgYQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8QLpA351fbvj3ZmSTFjsMmiRsTqAqXUCTLNn9qp5T5QqmNT9Fw
	ZaTGOfiekHTT5ODQp7wOjwclwhx7MpXYFz3/EXmmJA8iK4P8wgA0fRZehGv9JQu9GScrPzZsd2s
	8jc6fkGUhAClc3x4vuIkUEN8x2N6I6dNrAqxq+oFb3yQOnxZdoO0KxrdshPnu6lwkQA==
X-Gm-Gg: AYBFou04eOjCKvSH8lRpkmiDcdqPsUEhljEMKYLZlTlpnq9dt0Z/9cAjSMCjfn4OC6/
	xiruniOsHX5qHX9b1ZYrtsJTgIPWbR4UGK1dpLWjhtoWJsilgkymjrFugjjyZxe+bh/ldFWryxc
	R/C3cTjPRlU55bZ92PdbClvfF2yjr2rLXBXKhJyqCRU2fvOdqRe51T1boicGj7glBSdsXQV/79r
	/xunu5Lg7mrtWVu/88no/j6wM5VbykO9fwcQm/bKaUTplwtHm2wp2IguJ3uSBHUuQuQUQSWYmB3
	sY/+wP9TetDyQcSdBrvRixzL9GkzSSA1nIdjF5liyAvIKx/NyggfIJDKBGHa457MGwRvvTypPvc
	gP6n+iSb/5aZ9dM4yNeSqMCVKiknl22asWsJYQGawSvaJglgoxmLCrfeddvBTUY2ze9vCBHB4NC
	Ructno5w==
X-Received: by 2002:a05:6a20:1f28:b0:3e2:3392:5408 with SMTP id adf61e73a8af0-3e928ff2900mr10480899637.79.1793706834780;
        Tue, 03 Nov 2026 03:53:54 -0800 (PST)
X-Received: by 2002:a05:6a20:1f28:b0:3e2:3392:5408 with SMTP id adf61e73a8af0-3e928ff2900mr10480885637.79.1793706834326;
        Tue, 03 Nov 2026 03:53:54 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364cb511sm1161045a12.28.2026.11.03.03.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:53:53 -0800 (PST)
Message-ID: <7a873a59-247f-4e4d-ad30-32bb504da40d@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 17:23:34 +0530
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] spi: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, Mark Brown <broonie@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>,
        Ryan Wanner <ryan.wanner@microchip.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Vladimir Oltean
 <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
        Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Heiko Stuebner <heiko@sntech.de>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Tudor Ambarus
 <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Laxman Dewangan
 <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
        "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
        "open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
        "open list:RENESAS RZ/V2H(P) RSPI DRIVER"
 <linux-renesas-soc@vger.kernel.org>,
        "open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>,
        "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
        "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
        "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
        "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Cc: vkoul@kernel.org
References: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NyBTYWx0ZWRfX1GIX9OZ24IeU
 Hw6qW6Zm+nnrJ/LvE5MRxhTBgw3IHBX7gWdD7WgbdDiEMDa/Is/Zxu6frIH+iw+UyzpP1LD5rQa
 Jvp/whr+s/QRWE2Jt4xS3Z6eeig8o2Q=
X-Proofpoint-ORIG-GUID: -Ayneo9Xkx8lxpg7GDpHZTJTSGKos9_P
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae9cb53 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=ibj56h0FkVxt_nO8038A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: -Ayneo9Xkx8lxpg7GDpHZTJTSGKos9_P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NyBTYWx0ZWRfX1/7zxLjX46/7
 cH1zxWcesk3pSjMICt0TUG7BeKj4nXKB8JhColjhpaXkvELENhjpBlLZTtWruEWlzgIhhTqwVpa
 x19CsnNhg7ci+kxtcemOuUYqVGTLqxJwxzEQ+bG0z8/YZI+D38WYlt5MgHz9CsE1XkNF0ZJz676
 4iPZc3OUwkGMmIgiA6GPqgS+BvfALVJukVsCfYZ1fyUJL1zWtxmYk58hItymTLfmTRBAMW2d61I
 A4I6vVjmFst40blHn1MYynaT2RXnhX/d2FrL9dy8xOWkpF9izMTTfPI9VYpT9sPA5Kmg1/GUSYu
 2Uz5WP0g6oA2PMPODBKirGLHMDAQwXzRhDtVlW9b2ecmWp9lwGg5+9DdeFmFIXyGvfX3fi4xKk9
 jCWhkMwZG+D99Sc1qG7cbqlSFE+b1T58U8UzYmxPDFTuln3JUTFu9wky5Id77Ly0bGAyqwcfmnC
 +WqbFEYua41ImD28XRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030047



On 11/2/2026 11:09 PM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

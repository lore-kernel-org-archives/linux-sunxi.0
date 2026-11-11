Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378658;
	b=pR9TDw42LOslodm9zvwenGV2u5VH0vY+EMfcXVUAoHY6SweCSY8+CrZo+8xNDF2xvuLi
	 GahN2GR03RKGZrXjmMSDPWuvoEeslBuo1ib0+1rcctB2zH/vcxWW8QBsL8XTh4+1/hBOt
	 cDHjjm3BtRwzELVF2TWJ6c73yg8QvdC95QNjXjFp58W/MQfl4Imhu8WlxMbzeCxh1sEVC
	 Kna6DRn9oVa3IfGw1VCTHuAoXecIxDbb71NsKjOi0VjyvsfKYyzRKmME3/d7CJS5VebpP
	 qBZBuGTePM5pFMP+5Exff0AAz0/hEImGT5LUQoPj7upqj3AY6ohEC8DXV2xDw+l2IRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UkJcxjLHhm0Y+CDL9JRRl5rrZMoXUbMeNekZv0BizMY=;
	b=JlRyl4JznJh07hKtwd3rKFF5FTDRddpTnScmz2s8m/RhL63z2q/dGlaHV7T7HKnorsag
	 ESsgtuNBSANFBvKBm4WAwLQEFveYjyfRBfJbeoKwJz5VOJ17029rr3NSBSwEKQEeYzIU0
	 yg+Cp/aWzCo6sEs2pPJbbZD5j+BHdJy/cU35DRa7E1fLQk63uVTp839EfN67azvzbl1i8
	 jMF4sL64/wAswfV8SVd2fc1xdwAkpobYvy52FOfkLTEG+Ffz0JPM0jLg2gUmRGHd5GC33
	 5YpH4r7bGPdXFIs9eYSmuSRNDqsdoZVMh0p38LZwKOv95ZZZR0ucnobp/rfEf2yo6pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itVgzFw2;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B53606A337
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 06:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B53606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itVgzFw2
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso3483398e87.0
        for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 22:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794378656; x=1794983456; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UkJcxjLHhm0Y+CDL9JRRl5rrZMoXUbMeNekZv0BizMY=;
        b=itVgzFw2YGR6mlkCiSze60k/QRsT29lzwxytEXtHg/MbD3G+2M3s5jsYlqMN3g7pI0
         QtmRkYbTBMXbcVxSbV6IBxh2zYi5hTbD7LX55QkoQNWuslsGvhTXlM2FWwqcbiCqvK//
         fzwIRbMuJkZQk4bEIXbSMLKg+jurluarMHRrcCwB89+voUv+PenTDqwFSdf1H5Qv7X0l
         daCyEHhkwJZrDHjNZ4NcUj/rxtFhVeHBDzRuFZjd7qwOja09V7DHcHkVuos9UAZBf7xR
         qAVfPAFjJ1lzFWdf6KJ/qAxpWP33Lw+rhLJrZCZCt82SQ/S4VYTxd9MbH1xGgSO79HwR
         3JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794378656; x=1794983456;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UkJcxjLHhm0Y+CDL9JRRl5rrZMoXUbMeNekZv0BizMY=;
        b=knmkCu3FnAwK1/DFRTIi7DQH0EgT1qnkdQJMsHknJ1mvS1ZGCX22JZ+ENxnO4g7dcY
         g011Mu+25+apbb1/LdziBfjFixHOQDncXP9jVmE5IF+YY8Zlx+Dr6zU/ilvudXJvHsXZ
         p1byFM1jvp//5Js/ci3zT6nVT5q/7xG8oS2Jllui6CXPp/ScJ0ZqrKj+3P9n77sz9RJx
         ZSOS/A85edDCbB/5ZoLdH0RoP1147y3JgOtQpJKJCi5rm404PeRxMbOIZgJgMIp0a9js
         eVMOD/XuAxTRvhCQ7obuDpTO08LKC91BqhuSyDz8sCqhsIXmPtIOtog0H7TEy9/M5EIZ
         VDLA==
X-Forwarded-Encrypted: i=1; AL+hErG/SHx3Jp7ygtFoGgKPiHcIvcdetPSAoSORkAlFZcD29bd3LIaOaykwqMJJtcVNvI/xIAaDJ8ZH6Yjg9w==@lists.linux.dev
X-Gm-Message-State: APuU4Z+cHqFNqLDCCujLfykQvcvRvptGYQNVQDrcluHUqFB83PT3vzRT
	4C6BG+3F7lEe36oBd6dC2tIr6hfpe9GJBTCjhel+e/MCLubYXQ1AcYBF
X-Gm-Gg: AYBFou25rQcmfBoyJNLdKYXyCFM1Y7ur5zcjBFVkc2XeuBbRivt0iuCvQwFS4vnDArq
	6zMr3PzQ20lj0qgZ5pOb3Eag5fparM8s5yDsWMpNdtdBuyt/4TEJAOeO7GE/mQiJIOTAiYT4dmS
	+s1a9jxCuHXzFOcnCWRWqPb5W+p5ztpyThaQDf6MBsi4sgvcP+xTbWw7+I8irj8a+buVtvTttLH
	MJqavnq/BKXrRfGuxqA4n8aKAF0VIlWm1Vd7OKXM6WtcdRx0ugCot0nVCLi3Gwu8ujgQYEj1PE+
	Fhst3H6QTBmSMHeSaNGX+fzplXYWp2DIvBH1SLJBeEehM5a4n1GJQFIctnR2TVc0cYeVItHk6Hv
	sEBbVp6An+8rXzbyKxmu6AX+Y2kK9zyj7mDyDZwcvdu9EXf5EheGRQVMy/W/b9OubmEb45AG8dh
	J/uSclY3pZDqoJZkkRIAaqBleYT9uTLj4hxCv7CIa+EEH08iHk2AxgnJClWgDrHtkra36pMu+Z0
	//39Rko+mLNcjdKCyGgKloZ9MkNwR56n8rgUwP8wetVcLAgKPhQAeIe15L6aCkYvkQSn7WUUk5S
	tcoT0/TGIhcXAvguxRMU0zluEXsX++FrSN28jmm3y8ZwIQW12X7N+/7/IVQB84+eGcPJvgBUGPd
	Hjn2Ll7fXXA==
X-Received: by 2002:ac2:51ce:0:b0:5c1:5974:8a54 with SMTP id 2adb3069b0e04-5c15d545536mr529421e87.5.1794378655623;
        Tue, 10 Nov 2026 22:30:55 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bb7529sm811767e87.66.2026.11.10.22.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:30:54 -0800 (PST)
Message-ID: <0a520efd-ac3a-47bc-b37b-11df8263fb5f@gmail.com>
Date: Wed, 11 Nov 2026 08:30:51 +0200
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
Subject: Re: [PATCH v4 19/20] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Chen-Yu Tsai <wens@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 James Ogletree <jogletre@opensource.cirrus.com>,
 Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Tim Harvey <tharvey@gateworks.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter
 <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/11/2026 23:54, Uwe Kleine-König (The Capable Hub) wrote:
> These arrays already mostly match the most used and generally
> recommended coding style. That is:
> 
>   - no comma after the list terminator;
>   - a comma after an initializer if (and only if) the closing } is not
>     directly following;
>   - no explicit zeros in the list terminator;
>   - a space after an opening { and before a closing }, a single space in
>     the list terminator;
> 
> Adapt the offenders accordingly.
> 
> Reviewed-by: André Draszik <andre.draszik@linaro.org> # for Maxim MAX77759
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> Reviewed-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com> # max7360
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443991;
	b=Qz4pADs8p+XRlNFcuVifU3YWQ9Ao080wy0rqwO43prbiZWNgljXcNP/I3fQLsHLXA+X0
	 Kc1NKMqi/9nPybGbcdmXuI6Z8JCU51nQepxwBi3L8O1HOf0JyikFN8gpN+m1cmcEU3ebE
	 arSTTTzd53bDIKS6iFk7KMBSRJqDd9hBXpplQyvX8eY4wJoH6TRwcCgXdj0/8ETQyeHgG
	 KLnt4Flga6x8iUpQSjvTKX2gT8IYu5AgP8TjydYF2CadCVGr8e6lD9cfVRY+lMX2Og7zG
	 vLLyUF9bC0zf1LCZXdB9ka0EI+0g4iJnzRPKfBAfHVj2H7IjD0QGAwHbndPfQVuKXsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MpBy4DQUeAY3YB4hP8JJP2A0Pzqf+41bgmSv+sbuZU8=;
	b=Spef9f/EmVT2nW5p9UMgDBFmNAtT4KmXtRGj1IT34O1+8bTEldr7sOqD/M8TSMv+tmSu
	 mJDlZYpIco/0T75mUzx8Rvu+wWkS5HELXNXMi4W1xZ3BJKafVNLXz2KJq9QWsJmHF8eK4
	 06+ByLzxhRtZR/5twu5RsSqPFhHjNdBzts1MgJjPY5TCxIJ3OSnvFjpVt8d7bEEiCBDSH
	 7OyzS6c6SUYSmL5PRPDiHr4jw+71xZDqrgkytZHZ5K/Sr5mjOdKf3tyw8PUB3L6o/NX88
	 ygYpBHUO++83vONdFLVndh+bQs8W5p4TIHS0YgB04OR/vPR4/3uND1iwYzgX/Eh4TaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qFZYB39J;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2F5606A321
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 14:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F2F5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qFZYB39J
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3adef977ad9so25180921fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 06:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443988; x=1796048788; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MpBy4DQUeAY3YB4hP8JJP2A0Pzqf+41bgmSv+sbuZU8=;
        b=qFZYB39JOxl3PRFP/x3IhXtjnOHBjd9TAksIg1AwS3Ljodv8z5QfXQxyDEPsHjcUC3
         TT9jr/6Ma5C8vzrA+gxK4woC/6JtuYzoPtdmIBTEIIG5/sBkv5RbQB4uJWjFM/kpwgOg
         UBM0vYLXME4ryz2liB3XxnqKUYPo/SXR0p2ddYC8icI4Gm45w2p9anfqvFD2UeUWIqsa
         pclWcxLUxNheZurhxS818bMvMmC9c2CIFNRgysgykjl5Oy9yurkE5K6oCjsuAAzpSKKE
         3EjPW397+btEK8jbYtmZVvHIjWCUXxH59Y3bGrUb9nyDmtTS/lSQj65w8CZCHSP3wxDl
         DZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443988; x=1796048788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MpBy4DQUeAY3YB4hP8JJP2A0Pzqf+41bgmSv+sbuZU8=;
        b=npyEqLPVt1+Wu6XYHJZ3c/Mqqytio1KWo6qK/E7BDT5o0QFUocj9u1HGsxWqA5eXnM
         4oIEs9ULM7C9RFUbjXtbTWKySnywqLnXrt/dJTCbyiiLX4rU2+9hIJrUNznSfJgLqvDT
         Lp/95kEP3d3BKKs3BxxD4zZZakH5E5fTKdxlrQYPBS3QGr7DtReg0yYHvZ8HUmlH84By
         KBqu34aWg1lf16ay9F5fpye2cEmKzzhxZTxbSEbmM7SjipNASXbe4icSDgv5ljpfiP52
         9mOfISLVD6p/PTMRSX1xBeDULWb/yVGNXw5ATjlqG676ZYjWLW2xJM0CFTfnBfAuq8gn
         OWiA==
X-Forwarded-Encrypted: i=1; AL+hErHB8LZS1hHKT+XHayVrJa4hKSotl5pHOA7jcHlnIBwjvkkKjib5aqZYKJFdqx11vTH0EVX9i8U4wzom5g==@lists.linux.dev
X-Gm-Message-State: APuU4Z/6W1q+5ZSXZstoyq6igDsLM9wgSw1+CYD8qdMwTdyBL81c1A2y
	9SOykCxoWDDle/XZ9UjigquqSkIttIP6yfciCP/vM8HGlh1hx7l6zbn1
X-Gm-Gg: AZFdTZfp3ECdkvSmtRuTHA1hkiQxRsGWjutZ78Bjil2GGGvRmp8YSdAwPvfRNmNV0p3
	k71wtyIAdE6U88wBDA4nfQ+iYiWsQfWPn85beyr9u73CuZfhwQ7WsBnWzYRm0yBBvmn6aWdXMNk
	zGP0bSEAFwtj7BD50fC9ByjRjzJa2rEcB94ez4QPh1V2tsBMlKZpY2scdmGOJ3ALcDnwmSvzLgz
	3CP4Mr7pNgJTFJjnZU/d27R9RqGNQV6ytzUJs25WGHPjfbIdQf1XPY5c7gOq6l0rTdIJ7eQZ302
	SBJ4iizj4X3KKz5NA3sjYhUbkTttkXwuJaDfB8KtCGY9VF3YfhPZfVf5JEedXDqNqAZ5DWicrvh
	Hoc6baG0qRoddmNqwI/LsxeMaZxDHCVv4GqneEvFa9o6IrSI2ZHe5jmK1jpE9VATLz3O5mc2Tln
	P5mzDlXqunQ2RBQEvptMzb1Y0KsjpDrNQ0ywG49KhUz31CixNXgyhA5Pbtj9aWx0x9e3lHjG4J+
	4PyyRiEYdhbnTmTQDLZtDvhwnnfjw2Q/ncc5s0WTp6c4wQ3PaHer3gsruBZvnUDGN8lYsOVpv7T
	YNSesOs05ObT3RDzXfGa+pcGgLfFEDNPYktibL1u5RXp/ZC5IDq358KrUvCHJVHc3q0dOwvnNge
	j6NwwdL54Vg==
X-Received: by 2002:a2e:ab0a:0:b0:3ac:e4b6:b93d with SMTP id 38308e7fff4ca-3ae7f9a072fmr31420641fa.8.1795443988058;
        Mon, 23 Nov 2026 06:26:28 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80536529sm33679491fa.27.2026.11.23.06.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:26:27 -0800 (PST)
Message-ID: <bc178673-54dd-4811-acdf-cb6327ec2417@gmail.com>
Date: Mon, 23 Nov 2026 16:26:25 +0200
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
Subject: Re: [PATCH v5 16/17] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Lee Jones <lee@kernel.org>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
 Linus Walleij <linusw@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Chen-Yu Tsai <wens@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
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
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
 <b69bcdcc394e46e0eb60947f23923e6241d24ff4.1795431460.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <b69bcdcc394e46e0eb60947f23923e6241d24ff4.1795431460.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/11/2026 13:18, Uwe Kleine-König wrote:
> From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> 
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

Reviewed-by: Matti Vaittinen <mazziesaccountw@gmail.com> # rohm

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductor
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

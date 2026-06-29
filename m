Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C031C8604
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 13:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740161; cv=none; b=CXG8iWhEN30+SN801Md+DWs59pGw0rIlx0Xb4uVdnTFnOSbNHYJxL06zeKd69CeW6vPhicPe2TU4eSgf6xdDJtqd9XaOvx2DvwvpkqeA9uARU7nhHfGX1zr/vpwkx5j5XZnAEFbR7pXeSaiDqZ+jDzmiCDOnyzHXLKhl0UOfikg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740161; c=relaxed/simple;
	bh=zqrAv4ptgcQDDabtUqrMSNTpUU2PxpRKSgX2iLRPyeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYjRs1G8v5jufXiXmO2gLZi84fahBDBdrgB8/9PASXUG/izhha2faBCcwkoWBfRSif7u9Glj2JW16+H8IfEKmwhgh8lwCF/moPs5PpXx6/bKuzitKMiD06NFfZCjCjIRmwo4riQM0nu7vyozWPKxfqlE2kEKvu/0H7f+szM1sjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rohGWZwx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rohGWZwx"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4924593f45dso43704745e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 06:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782740158; x=1783344958; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RBM+1nAZz4BwsUG4gfSKzLFy6PeoM2OFZ8wfEYkLDpg=;
        b=rohGWZwxrWYYpDR9u1pxhEDp16zmJjtUk3bcAB0obxbIP0ymvSj319cO09s4gOeFTw
         Ru8VzkvccjQsfUOQ6541WxVVnr3p6v8WgH+Lbz2BozAO/G0rC5Fbwo4sbsGQvxJrbHum
         EpMqxW3k0MViw8GfyNqklVulgxpnthagvyot66AVI6S4SJfFqGI5rsRIxsL6kjQ6CRUz
         2jl0xcajWz0QoiRZPr9XTQFMtUeLtK6LqxpOFWMlXAsOgQFWgDULUjypsj2QniAFhxAf
         v35xT9UZdYXw2M2YoUEUmrmZy/iWrqAyL0rGrqc2oHfaHOJeJPdtl0g/B2MonbhVE2F/
         4N+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782740158; x=1783344958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBM+1nAZz4BwsUG4gfSKzLFy6PeoM2OFZ8wfEYkLDpg=;
        b=PNcWq067bVItxEQZZY9PFYs7OAnRKhg8LJI32VI70X8Q7QUUel7EweBs/YkeCTISG8
         mSPHJ2FyoP5QUxU8vquzZGjVb4ynqE3V4rguh6DIu6HotMleS3Qkpw5tnY9qjmV4iW+W
         Jx3wWT5jv2/MYk/nvgpwnwaaN1DnFGDos006IsSh5IgYp9pyZ4x1K01jW1Wobq3pA4l4
         Dac8tv+VR/iBJzKrYXmj1S4GSvhCnzSQhLBCrEJtuAY892dxov/YSyVJ4nsx00w3uiia
         zAvNwdPRUaV0GPJ/8JBOs7V7VslLdmx7MkGF0o+Krf9MBNsampFVveCogvoiXTLsSVLM
         sQgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8XWyDzwFPb1lbAP8Z6UDowVDmna47L2wxwHxnp6NwcwKdJACBWQWIiTnx462chpY4sxVgbNA5g4lj8Ag==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/QOxto6jbomrMHFQjr91BUfwvnlh2N1+Dkt5gnNM7V+sGznUo
	L+7r1f+9hRo3NbK6aJY3v9JshOCqxvOnUkv4CDfhoSpidI41QdUpyOP3
X-Gm-Gg: AfdE7cln4kJHFeMvKJfUOBq/WkUXY9AnpqcHgPodxA9CzGQcn2FXy+ZxwDSe4Xe6Gvr
	t10bYLyPKSETHuXhu7D+9f4ClOYdF/imo28U4+Z1/UI8SkubxabF8wOBFe+0awJG56beOjw5HZK
	CuE4uq/Uoqgh4+LaCASbW2lonQkJA5V5rv1NJMSTCQjAo+okTLifHrtBoaJw/Hl8aXX7WFwxy6+
	w3MAqA+kZ+PhGxydS++Sg09dq9wHXvSqCpTTE2xBxxpmfFg2KbmKZJVtFDZZR8P2TJbG2ac8SuM
	fmlAVtkkxQ30Lqw+1hRraCOrbmrZ9EK0GqncqF0E12+PHy10Cp2Gdhg3jO35bzhE4IyYn5UPEPX
	N6zHgiG9yQBDj6PA7o377YseR1WPBMdGKZrDjVaDT0RNtLDuPzR1sDQNbwOhkHL/LLCuH+3r8xp
	xKACEIoU4Z3PR8ITBYEnjXgJWM2fE/A+1imQgregEieAAvBo/m+NP0tyUzixbsOXZbeKgpXkpml
	Gk8AOzk
X-Received: by 2002:a05:600c:524e:b0:493:b2c1:b302 with SMTP id 5b1f17b1804b1-493b2c1b445mr34652035e9.16.1782740157956;
        Mon, 29 Jun 2026 06:35:57 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47327c47122sm13954850f8f.34.2026.06.29.06.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:35:57 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <2496717f-12b9-4d33-b6db-1db278aee8e2@gmail.com>
Date: Mon, 29 Jun 2026 14:35:55 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 2/7] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-2-1b7fb95b51f9@oss.qualcomm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-2-1b7fb95b51f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bartosz,

On 6/29/26 12:28, Bartosz Golaszewski wrote:
> +config PHY_QCOM_SGMII_ETH_SCMI
> +	tristate "Qualcomm DWMAC SGMII SerDes/PHY driver (firmware managed)"
> +	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> +	select GENERIC_PHY
> +	select PM_GENERIC_DOMAINS
> +	help

I think PHY_QCOM_SGMII_ETH_SCMI is missing a dependency on PM. I get a
build error currently:

WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
  Depends on [n]: PM [=n]
  Selected by [y]:
  - PHY_QCOM_SGMII_ETH_SCMI [=y] && OF [=y] && (ARCH_QCOM ||
COMPILE_TEST [=y])

drivers/pmdomain/core.c: In function ‘genpd_queue_power_off_work’:
drivers/pmdomain/core.c:936:20: error: ‘pm_wq’ undeclared (first use in
this function)
  936 |         queue_work(pm_wq, &genpd->power_off_work);
      |                    ^~~~~
drivers/pmdomain/core.c:936:20: note: each undeclared identifier is
reported only once for each function it appears in
drivers/pmdomain/core.c: In function ‘genpd_dev_pm_qos_notifier’:
drivers/pmdomain/core.c:1133:39: error: ‘struct dev_pm_info’ has no
member named ‘ignore_children’
 1133 |                 if (!dev || dev->power.ignore_children)
      |                                       ^
  CC      mm/truncate.o

- Julian Braha

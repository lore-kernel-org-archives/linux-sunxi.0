Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4C7185D
	for <linux-sunxi@lists.linux.dev>; Sun,  3 Jul 2022 03:57:31 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id t189so8918920oie.8
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Jul 2022 20:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S2PQt3HxkBxUYjC+VtlXEq4NoCpstcc7waq7Ie+ZSSw=;
        b=LcxkuQlcBom6K7cYz2cObFcKqvmFziGvIewxr5CVdQDXpiVs4Qe1p9/ma3MjpEBl0m
         LdiaLTeEwxUPT1iylGK2uBRwa96fvGW0y6QRWq5F+NZCFL6N1e6TXJlkAQCGEx5XaKBZ
         bMXT/f+ogoq6vs4TCzgBdramsCAz0nmWRD4br2nzTC8FHRTsVjgo15di4+fdqYbsWQIV
         4/vga7HK3myEs7r2HcBsoYeS5QL/sXXpo879hazt2tPiyyJMP+yzm9vvBM9i2od8IqAh
         LSpFzHsWhZD+5n1ToMnLkj0S4zSlSFpghH27+UmeVqnGiX+vxJHJBYAk1fLnQfBbxsFF
         J2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S2PQt3HxkBxUYjC+VtlXEq4NoCpstcc7waq7Ie+ZSSw=;
        b=MQp28DoMAZ7OubMV7kMfw9KAyOF2reRbCzgKFB2n71j1ZYptKYTDRhjRxxsr87rjtO
         ajPEd6Gj+w+hFL1jp6X6y/gTQkvRN+XgfhU4swULWRZhvT8MNkqfu3JhDmcTbL5zU2mQ
         Sv9Er0O7B6kpJwun2aEwwxFofmEyIa3xudpoo6Qu6vRwIO3EkhSvKlYQ1Da3DTxXEDzp
         b7cdcGXkDLOij1pTKm2MQCYRCvZguRSaa8/g60PJMSoJHDo88XljxHTcSyYjbMAKnjMt
         DtkUzrr3C/t1o2mmUT+9oNesbLCbSKWMDT2T+VpPL7ehwqKo++y9qGT8uHHG7wY+Zv9W
         WpKQ==
X-Gm-Message-State: AJIora821kuIx5sVf6pTCQstXAe2WBgzZMBf+DVb0rZWCAFesPkGhMvo
	W3kMXZIRfhbYi852nlpvaH7IWA==
X-Google-Smtp-Source: AGRyM1vPsLVLSd2YTyZeBHDlHn82rVPH0GlTr+Bdo5oMuTiVoQgn60DY/3PL3sh3O2ct5ts3e02W/w==
X-Received: by 2002:a05:6808:1b25:b0:32e:e59c:3901 with SMTP id bx37-20020a0568081b2500b0032ee59c3901mr13881725oib.186.1656820650648;
        Sat, 02 Jul 2022 20:57:30 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:29 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org
Cc: Li Yang <leoyang.li@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Thierry Reding <thierry.reding@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Scott Branden <sbranden@broadcom.com>,
	linux-rockchip@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-tegra@vger.kernel.org,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	linux-gpio@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Michal Simek <michal.simek@xilinx.com>,
	linux-samsung-soc@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	NXP Linux Team <linux-imx@nxp.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Heiko Stuebner <heiko@sntech.de>,
	Nishanth Menon <nm@ti.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Peter Rosin <peda@axentia.se>,
	linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	openbmc@lists.ozlabs.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Andy Gross <agross@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	linux-omap@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ray Jui <rjui@broadcom.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-input@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	Chen-Yu Tsai <wens@csie.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Samuel Holland <samuel@sholland.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: (subset) [PATCH v2 00/48] dt-bindings: input: gpio-keys: rework matching children
Date: Sat,  2 Jul 2022 22:56:25 -0500
Message-Id: <165682055971.445910.5189932421143220440.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 9 Jun 2022 13:37:21 +0200, Krzysztof Kozlowski wrote:
> Merging
> =======
> 1. dt-bindings: rebased on top of Rob's:
>    https://lore.kernel.org/all/20220608211207.2058487-1-robh@kernel.org/
> 
> 2. DTS patches are independent. They can be picked up directly by sub-arch
>    maintainers, by Arnd or Olof, or eventually by me (if you wish).
> 
> [...]

Applied, thanks!

[27/48] arm64: dts: qcom: align gpio-key node names with dtschema
        commit: b08f5cbd69dcd25f5ab2a0798fe3836a97a9d7c6
[28/48] arm64: dts: qcom: correct gpio-keys properties
        commit: 5a4b0b853a2914403746b0a1decab695202ff242
[29/48] arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from gpio-keys
        commit: 9d8840f6ee426b6dfcb65bdf39e2898652e2b1e5
[30/48] arm64: dts: qcom: align led node names with dtschema
        commit: 3cfe94d660a8ebc19e78ea0a4781d7e9a1054c65

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>

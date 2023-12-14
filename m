Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA3368B94
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 18:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/9lLk78"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40c32df9174so76402185e9.3
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 10:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702580197; x=1703184997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAxAjKcdxPU97AIvApR3RCAnoJx2vmM7/1XrerRQJkc=;
        b=X/9lLk78OCU91M7LVrzK75xYKCh/cfCG6WXDyfNQUkFTJe2/QztA3IfKrU+8T4HOto
         j4w9muon9DP1I3JzkYk9xLY/HmX4sCmXoBF++6cyYfQ7tAviq3tUrlMfyHRCtm3W2XGK
         rGK9lZIY+rHCflU1S4rvNn2FWa4jKbCFr7Y6l/ZEGOQIM8vIzaI5qXj81xi1092XUDg5
         frYIy+UdWqgN27Su61oUHBQ9YelpquUv08WseXVF8Cj5zMwf/Nl+p0Ji4H22JP2FC8BS
         V25MANmXPxSPD7jxbUIWmAgKY7ByK6ayRiC2nV8BbIZaCaeOAAGvOhCwCq3hdTW0b7nO
         JGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702580197; x=1703184997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAxAjKcdxPU97AIvApR3RCAnoJx2vmM7/1XrerRQJkc=;
        b=O8UyWLQs09rtYq7IRphi+bAC2+PVLABp4sEh086HEWuG+Hb0SGHvVrC7MUXzsEG5/2
         hZjKgZ2WrweL9UH9wQRHiBdbZx2dHM8HP5M7uuNmKLYmYz4z6pHm2ybTlKPEwOzEAlHt
         xyY3dsKvzQ8N/kSorFqH2UMW4QSYKaeJxYHGtbI8LuHlP2DXSzlvAXrSchkYVHkwrl9F
         6vl7nfZZvPvhPyPgSru9CBhpx2dQs//iNLd/W6Q8Qh+EDh3nu91GMfjymoUzhY1jr/85
         yEQA7sLsMZySLDLS3x/ChSeY438F0xuvqQigg/+OWF54qLy1LEGwOpt4hLk+022Yog08
         lFtA==
X-Gm-Message-State: AOJu0YyhV2CcNgJMxbZCr5xbDbq/oblLbIErLdXkH0xpAdMav4Zg8OwT
	5VDhEMWZoTy9dhDWsy1WCfU=
X-Google-Smtp-Source: AGHT+IEJdSovztE1+kaX2STJnCOl7W1aWVQMf5BovgvciYv0lS+dzUl+ZZ1suE0cXUGwcLPNd6ee9g==
X-Received: by 2002:a05:600c:1c07:b0:40c:1e8a:4d0e with SMTP id j7-20020a05600c1c0700b0040c1e8a4d0emr3298090wms.27.1702580197226;
        Thu, 14 Dec 2023 10:56:37 -0800 (PST)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id m14-20020a05600c4f4e00b0040b30be6244sm25718707wmq.24.2023.12.14.10.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 10:56:36 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v2 0/3] arm64: dts: allwinner: Add Transpeed 8K618-T TV box
Date: Thu, 14 Dec 2023 19:56:35 +0100
Message-ID: <46021670.fMDQidcC6G@archlinux>
In-Reply-To: <20231214015312.17363-1-andre.przywara@arm.com>
References: <20231214015312.17363-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, December 14, 2023 2:53:09 AM CET Andre Przywara wrote:
> A quick update, with the few fixes for issues that reviewers spotted.
> See below for a changelog.
> ================================
> 
> The Transpeed 8K618-T is one example of various cheap Chinese TV boxes
> using the Allwinner H618 SoC. It comes with up to 4GB DRAM and up to
> 128GB eMMC flash, plus the usual HDMI, 100Mbit Ethernet, WiFi/BT and
> dual USB ports, not to forget the mandatory microSD card slot.
> More details: https://linux-sunxi.org/Transpeed_8K618-T
> 
> Ethernet relies on the yet unsupported integrated PHY, and the HDMI
> output is similarly not yet supported, but patches exist that await
> polishing for mainline submission.
> Meanwhile USB and eMMC plus SD card work, so you can hook up an USB
> Ethernet or WiFi adapter to get things going.
> 
> This series is the usual trilogy of DT support patches: adding the vendor
> name in patch 1, the board compatible name in patch 2, and the actual
> .dts file in patch 3.
> 
> Please have a look!

Applied, thanks!

Best regards,
Jernej

> 
> Thanks,
> Andre
> 
> Changelog v1 .. v2:
> - fix alphabetical ordering in vendor-prefixes
> - remove unneeded UART1 alias
> - extend regulator names, drop now redundant comments
> 
> Andre Przywara (3):
>   dt-bindings: vendor-prefixes: add Transpeed
>   dt-bindings: arm: sunxi: document Transpeed 8K618-T board name
>   arm64: dts: allwinner: h618: add Transpeed 8K618-T TV box
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../sun50i-h618-transpeed-8k618-t.dts         | 161 ++++++++++++++++++
>  4 files changed, 169 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
> 
> 





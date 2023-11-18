Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D911E521
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Nov 2023 22:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nso0wnZd"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5098e423ba2so4490184e87.2
        for <linux-sunxi@lists.linux.dev>; Sat, 18 Nov 2023 14:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700345963; x=1700950763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SdUlrf4eM0AylepdE1Wf9qlP5oYXQhUKgEsdEd0m+c=;
        b=Nso0wnZdwDTkiPpGXDiDwhObZGbvxZtwN3KVeDevD6sFx39/aiEZoSwUfA4EfNnbiB
         XsJMd+ZFQ7ucBn2HbjlDEfI4v2rEcMtfMNWWsJL4O/DuPIJ6X9OXKDmOnPECC7PLCisa
         O76jHo0q+S5MMcMpq7D7T5bGyYeJTzGKp0TQSeC8DX38JOEKserMgyFr+1jnV8XdRCeZ
         HdXYoYBL8z+izTUyRfioWzMXegb3taP/BGQo2+0Dwe1QxRZUBWJzzx7mqniT7Bk/BDNw
         f3gApXGHIQWMcSSZFa6xHsQQ7KuYK0YOJ+7MzkAlCEHWvlDeZvcsh3X1X9Qvv0EqzRLI
         pGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700345963; x=1700950763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SdUlrf4eM0AylepdE1Wf9qlP5oYXQhUKgEsdEd0m+c=;
        b=hKUDK6QH2yZyIO+QJF/dqcwiAXefq0N8hvdYezDPtej1HldE4r+s0suim6Q5ctiiy2
         9E338oeeqwz/WdN0VeP7zqdmfZR90NoM2sxXjRpSLEuDIOcbuekWTE4q3cE3ocZBYcQz
         TzN7fRv1l9fR53sAfxvhIzAoAbmw7/bNX8IpQ9QgSD9EzNTXUqyBQFkLYpd9C4DIrZ9S
         MeI8guGQqeHBeA34f7Wcw+c6B7Th52W4Na6QzcNb8UOglGI8jEH8eKMZS2SxUXWUfzbP
         yo5qXnlt2lggbRzU9TSExd6uxw/PTjSNyxAYj8kSB4HF0Y8d/Z5l6pKcCYUNoNb1QwVO
         UuRw==
X-Gm-Message-State: AOJu0Yzcm52bG92kIqlUUHdsDIkakznSmL/K0OMvFQbQEarqr3NT1NM1
	EcMLuw99VUcgaRr7xFI7bUE=
X-Google-Smtp-Source: AGHT+IFZFJf565TqTikKzO/ClYoNkt69RXWTXyDiHbUvibAso77wJ1lAXFJDchewe4Jjve6l3KDzPw==
X-Received: by 2002:ac2:4469:0:b0:503:19d8:8dc3 with SMTP id y9-20020ac24469000000b0050319d88dc3mr2336421lfl.31.1700345963374;
        Sat, 18 Nov 2023 14:19:23 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id mf3-20020a170906cb8300b009f28db2b702sm2236761ejb.209.2023.11.18.14.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 14:19:22 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Marc Zyngier <maz@kernel.org>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: allwinner: Add Orange Pi Zero 2W support
Date: Sat, 18 Nov 2023 23:19:21 +0100
Message-ID: <1868924.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20231020145706.705420-1-andre.przywara@arm.com>
References: <20231020145706.705420-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 20. oktober 2023 ob 16:57:04 CET je Andre Przywara napisal(a):
> Hi,
> 
> this adds support for the Orange Pi Zero 2W, a small board in the
> Raspberry Pi Zero form factor, but with an Allwinner H618 Soc and up to
> 4 GB of DRAM.
> 
> This is just for the base board, created by looking at the schematics.
> There is an FPC connector, which connects to a stackable expansion
> board, that provides two additional USB-A sockets and an Ethernet jack,
> among other connectors.
> What is the recommended way to model this, via a DT overlay, applied
> dynamically by the bootloader, or using a separate .dts file, that
> includes this base board file?
> 
> Cheers,
> Andre

Applied, thanks!

Best regards,
Jernej

> 
> Andre Przywara (2):
>   dt-bindings: arm: sunxi: add Orange Pi Zero 2W
>   arm64: dts: allwinner: h616: add Orange Pi Zero 2W support
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>  .../allwinner/sun50i-h618-orangepi-zero2w.dts | 176 ++++++++++++++++++
>  2 files changed, 181 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> 
> 





Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CC61D54CF
	for <linux-sunxi@lists.linux.dev>; Sun,  2 Mar 2025 22:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740955455; cv=none; b=ofRAnjoUbt9Cf+r0q07aIiZVO3L1bOZakkFIoQiLJnAKnai0lcFpfBR6Grjb34ZPcPmMLFrJVJgdXzqeu3XChJ1bhpJi8yC7iuWicoUK+b6FtAf0lnqug4U/jiuG4SikqBKvhMLUQZleLAiokjoV7QgtFlAMq14344eyADEQSYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740955455; c=relaxed/simple;
	bh=ni4JewE3sYVZYisMRjfTJPtBp8jUfifzDt0C7xVMFik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jIPbTdqrPaUb4uk/P9a0nD2HmH4euYsD969EMewdKPlcsrlmeRbVU9l6vvg2U5mDF612fSlj9sn1Qv5MXQEYnDZhjBpq+Vzfp9vT9/WP6M6vMRV2nLWvTdNGwaaEmqcL/yoIMGrnbcHkQ1GvNpW2pGQnhE9eB5cO8rkyw4UThrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E80mZx0f; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E80mZx0f"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-390ec7c2cd8so1617244f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Mar 2025 14:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740955452; x=1741560252; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B3nSz0Tm/9ALfIco44Ttp6VO9zHRPvQciCEJvIO+PRY=;
        b=E80mZx0fMM7TzTutVhjyjsbMvoahW4Dm+VArlnaeIju49CjDQ+1vW9DWeNtd4m90Fj
         T527jhQsAufCMKAJCNEyf6cZpKZcdOWAZ/TfRGdI+j5WXGgFJ7yaelqNYFpDhU0iBmO/
         0R3lGWm/C+ApcteQMh5mSI+oaMyLc2hK2xEsVnY6p+mFYBggoQN0pFDgRNUh4nVGI/de
         J0vezagLUnp9AlsLnkmi2Y+kPCvUeho1IOquA0z6HPHaPDKqJYT8iLKJGRljhmqEsMUs
         hJqztB739Q/3XUpcX6IeYlCSqbOlFRTFbAhci4kEwJdAghUbQkoUrmk/2NNeqYAnHn9c
         DJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740955452; x=1741560252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3nSz0Tm/9ALfIco44Ttp6VO9zHRPvQciCEJvIO+PRY=;
        b=iYJ5JbeSjpb1oLmTH2geeUBFgGp8BQ64078ohK3Blxmo+54guds85sJm+cMEvNEoa2
         SMgaJM9GR08mzVQfk+OM3Y/O3MkkY+rzTUCSkwEP3Y7ZCM3iTS3MUo97aXaxb1by0HPn
         heglLViOMj3l/1FB8zNA1CwJlybkNSHpRrcJ5vH5FGmlm7eJzb3OgsL2CfZzJAcAoFbZ
         Y/f4LG91xUoTC4vzGcOBcAjiL6G4qh8DqE7AFOv1CtZRDGzINTHtiQCgjyznUbDoybyc
         FuOKmf08gaFuTDwZbsomT8ebhTp/A33prN/lMICtMc+HjsRIf4srT383cZrZqZfBskvx
         qMcg==
X-Forwarded-Encrypted: i=1; AJvYcCVqYSrwC+MFUM0Z5aUFOIQDQa6mRmdYR+xW1HMxOaDaB161LLJaZRNiE8jUtp4Lb0WPSSfpiPmmhdnE0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcLxJuHN100z2k4pmiNvanT550NI/kWpeZFNIKy6lIrpydt6iQ
	qHtDGJ6UArW5jjzvIbMguwl2MO2Mw1F6hKwB1WD+LvN1RSfo55QA
X-Gm-Gg: ASbGncuPHETJYUXAFDMDT+Vhh+4Y4LwKNV1EOlrqGn3CZdYIVnIfL6cj77vDf+qmlIz
	BQThvCMYXplessjbUZsdVJNWWD3Y/2YHoMNonF15REfZgJ57QlhXK5hd9CgLgz+t+rJOClvN0wz
	/AnuoCWtDGzURrp9hg+gPYJIQnqIxczeQ8hD7Mx6C2aPrLnMa5zK7xXL0KzUPseW/17we+ycU4F
	ioASA0LxyRwwkxMCVGRUqH6A+c/kN2WD3wIRNk6M1wbe0SbO7SYjO4BC6Zg7EMt7SSQRQjvZ1fb
	+JQHtdWDMJvaXQDzq/rWNj8HIZZLlCTyw9eDJDQfjnv9MTzJBomndWn7GNLDYY9Oay+krFKiZux
	9uM331o/zeEExKnFTx7M=
X-Google-Smtp-Source: AGHT+IFSwDgCyqBHbrq2Yl2rg5agQteOsniIG4r4DpFhXYFaxZR5xy7+52k8VXpQGVa6zUoKmIRgVw==
X-Received: by 2002:a05:6000:1789:b0:391:ba6:c066 with SMTP id ffacd0b85a97d-3910ba6c216mr967773f8f.35.1740955451848;
        Sun, 02 Mar 2025 14:44:11 -0800 (PST)
Received: from [10.13.13.3] (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844ac6sm12407954f8f.71.2025.03.02.14.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 14:44:11 -0800 (PST)
Message-ID: <01775d74-d72e-4a93-8a02-c13f7365d385@gmail.com>
Date: Sun, 2 Mar 2025 23:44:10 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] arm64: sunxi: h616: Enable Mali GPU
To: Andre Przywara <andre.przywara@arm.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org
References: <20250221005802.11001-1-andre.przywara@arm.com>
Content-Language: en-US
From: Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <20250221005802.11001-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested this on a RG35XX-H (H700),

launching glmark2-es2-drm completely hangs the board.

No kernel oops or error messages.

Philippe

On 21/02/2025 01:57, Andre Przywara wrote:
> The Allwinner H616/H618/H313/H700 SoCs contain a Mali G32 MP2 GPU. This
> IP is from the Bifrost family and is already supported by the panfrost
> driver, so enabling support for 3D graphics on this SoC is rather
> straight-forward.
> However Allwinner added some bits in the PRCM block, that control the
> power domain for the GPU - on top of its power *supply*.
>
> This series enables the Mali GPU on those SoCs, by first introducing a
> power domain driver for that SoC (patch 1/5: DT binding, patch 2/5:
> the actual driver). For the Mali GPU to work we literally need to flip a
> single bit (the BSP does this in the bootloader), and this full featured
> power domain driver is admittedly a bit over the top for that purpose.
> However it seems to be the right thing to do architecturally, and while
> at it I added the other power domains (for analogue, PLLs, and the
> management core), even though we won't use them in Linux and they would
> be always on. I have a simpler version of the driver which just covers
> this single bit controlling the GPU, please let me know if you prefer
> that.
> Please also note that this supersedes an RFC patch I sent a year ago,
> which included this power domain in the R-CCU driver:
> https://lore.kernel.org/linux-sunxi/20240225160616.15001-1-andre.przywara@arm.com/T/#u
>
> The rest of the patches enable the Mali GPU on the DT side: patch 3/5
> adds the compatible string to the Mali DT binding, while patch 4/5 adds
> the purely SoC specific DT nodes, for both the power domain and the Mali
> GPU. The final patch 5/5 then enables the GPU on all existing H616-family
> boards.
>
> There seems to be an existing problem with powering up the GPU, after it
> has been turned off by the kernel. Chances are this is a problem with the
> proper power-up (or power-down) sequence, where clock gates, reset lines
> and the power domain must be asserted in a specific order.
> A workaround used so far downstream is to keep the power domain enabled,
> by ignoring the power-off request. Observing any assumed "proper" sequence
> is a bit more tricky, since there is no Allwinner specific glue driver
> or anything, so things would need be changed in the generic panfrost
> code, where they have the potential of breaking other Mali users.
> I would be interested in hearing opinions about this.
>
> Cheers,
> Andre
>
> Andre Przywara (5):
>    dt-bindings: power: Add Allwinner H6/H616 PRCM PPU
>    pmdomain: sunxi: add H6 PRCM PPU driver
>    dt-bindings: gpu: mali-bifrost: Add Allwinner H616 compatible
>    arm64: dts: allwinner: h616: Add Mali GPU node
>    arm64: dts: allwinner: h616: enable Mali GPU for all boards
>
>   .../bindings/gpu/arm,mali-bifrost.yaml        |   1 +
>   .../power/allwinner,sun50i-h6-prcm-ppu.yaml   |  42 ++++
>   .../dts/allwinner/sun50i-h313-tanix-tx1.dts   |   5 +
>   .../sun50i-h616-bigtreetech-cb1.dtsi          |   5 +
>   .../allwinner/sun50i-h616-orangepi-zero.dtsi  |   4 +
>   .../allwinner/sun50i-h616-orangepi-zero2.dts  |   4 +
>   .../dts/allwinner/sun50i-h616-x96-mate.dts    |   5 +
>   .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  21 ++
>   .../sun50i-h618-longan-module-3h.dtsi         |   5 +
>   .../allwinner/sun50i-h618-orangepi-zero2w.dts |   5 +
>   .../allwinner/sun50i-h618-orangepi-zero3.dts  |   4 +
>   .../sun50i-h618-transpeed-8k618-t.dts         |   5 +
>   .../sun50i-h618-yuzukihd-chameleon.dts        |   5 +
>   .../sun50i-h700-anbernic-rg35xx-2024.dts      |   5 +
>   drivers/pmdomain/sunxi/Kconfig                |  10 +
>   drivers/pmdomain/sunxi/Makefile               |   1 +
>   drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c   | 191 ++++++++++++++++++
>   17 files changed, 318 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml
>   create mode 100644 drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c
>

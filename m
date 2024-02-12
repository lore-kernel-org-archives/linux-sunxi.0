Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F24C4C61B
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Feb 2024 21:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707772332; cv=none; b=PO6HAGsVZaTpHXfj12/dLmrWAsOyquLJ8HOnTxNGi/Wf4I7xi7CyPIVDdsM2p8ZfMOmLHqqNL7kZZ5qGOs6gQ4+jnYpiwZ8f51UYK3fHqLEmBQ/D4vMwoG6Fu0kjV+7vsPSrw3rScNWoZZc6uyIChs7XkdWTNZDGSVFFIOD6dDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707772332; c=relaxed/simple;
	bh=h2MtV/MK2Odk0xUTraQ/KlPfHPspWCPAQzwp7rljY2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UDkq/8GgISRc3ti0/xAqvZ+er+zAe55uRypTFjuMvFxqXLjU8HULlnMD5zhJrnWNCtfBZeWCOZFacyoWyAkEGTTdqx9RhEiUYN3a/2THYmZ7jEWE8l6lGQnJtlJ7yoooY2wuOnsGGlF2LEeOEs9n6Ekd3HhBz1M1p0t4+WwAhSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfY5Bwad; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfY5Bwad"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3640487d9c4so5009085ab.3
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Feb 2024 13:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707772329; x=1708377129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crkWvWwMlvDdItEx33Ai/IPFs930CB0fo5NxvXMgpxs=;
        b=XfY5Bwady/NwAnFECCff/h/ongxX+BboG/DI85Rzr2Ub/O8xXr1HcyRPHR10Kc+imo
         /7geWyZymwsL88pgWCNYftX/+dzq7ftMHcKoBJ/KFlkjqDdSGpQhC3kZ804dsi4YIdtp
         pyEu84pJSSOwueF8ze3vFOWLQt4OgXUczkneFw/IDaceXqBryNIToo5Q1R4RXmm8JZ1/
         u3vGFycLwX4ZFmoOPVBef7W0ei2BZ7sZ8avgkmU9nvDapojCKl0ljpKKMG+fUscSo/Ol
         6VDMNpTmMTUUgOBEuZWErzMaWgbyQrghMPe4WVbrLioaRD3kteCOv30m2kbDOll2qXgx
         z2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707772329; x=1708377129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crkWvWwMlvDdItEx33Ai/IPFs930CB0fo5NxvXMgpxs=;
        b=qJTns3PLrQ+Erlho0IznaP4hCkVu/qfw8Ia4tdiQh+5/N0ANQ/nDwOTx0qNWKyINPU
         MVG4XHWBti3GQyNH6m4Di/zm/CT67JdItm/Idn/C8xcsY+sQRqpPCnXe8l2vCJvo3mer
         8jemLgwnl9ZR45ciNyHF/X/vAkiglxRkbTD/CtD+af0KY98SFB/Sk/b8hMS6B/3HU+OX
         EzRcUA3109zlV5msdsyeNm2MUBSfj0kpdWstyvSs5hVOHZ65uhypI1UkeTwX/3urFIGg
         V6PlXTfKL/4hOvMNTdAsvct/we5mVbrXKyslv21Soju5fHKDzxVElOfW2q0c654Oep7I
         Ji4Q==
X-Gm-Message-State: AOJu0YwSLW89CdCGh3GjTw3p/iJ+wzuuqyux2glKZYbS9nlzVWxpZdR0
	A+wbZM87+bL/cjItDZKx3KTsS5DyUah31Mx9Ec6szkEAc0zCEpCV
X-Google-Smtp-Source: AGHT+IEsFxP2wf+CqyRsyHIhdyhg6SpWiZQ2tz1EtmrrYtkThu5pFY+Z/6qwEZdwy8WVxZujb8uIIQ==
X-Received: by 2002:a92:c8c8:0:b0:363:a61b:52ba with SMTP id c8-20020a92c8c8000000b00363a61b52bamr9094902ilq.9.1707772329458;
        Mon, 12 Feb 2024 13:12:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWZUJyMD3BIlUtvrM3sjdysoX1iZhYCUYCdDIih1hsVuMH0lXwQxABBNHke5UPD7IJTlw8aY9uzWC3lsfcC4qyLJmS7Qx4T4N8lDpuhjo177D0ZJ5Haf/j8KSpxEkU9zhAecvKzPrjZ4DmYP05ghRLShI042R/c3e5ZXD9/iC0irsJi2VHMSfH7iAw/I8yYi3eYqtHxkLx+O42xtDXIHhDVNbv/H5faUNNOoOzepT9ocug9aUtze2sd1jQKkzNqSeYL6znPw5S8QL8mlhajZRexueu9TTn5J1dxk2AXx39riZzU0Utt3xvE8s3kkh0zflLTfwxKft/4Vsl9Ir/WCYwkT+yHON86o7/3uWGHpSRC9IN32hJLBSQ=
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id a5-20020a056e02120500b00363c2249c51sm2050733ilq.87.2024.02.12.13.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 13:12:08 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 0/2] arm64: dts: allwinner: h618: Add Sipeed Longan SoM 3H and
 Pi 3H board
Date: Mon, 12 Feb 2024 22:12:04 +0100
Message-ID: <2183605.Mh6RI2rZIc@jernej-laptop>
In-Reply-To: <20240211081739.395-1-jszhang@kernel.org>
References: <20240211081739.395-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 11. februar 2024 ob 09:17:37 CET je Jisheng Zhang napisal(a):
> Add Sipeed Longan SoM 3H and Longan Pi 3H board support.
> 
> The Sipeed Longan SoM 3H is a system on module based on the Allwinner
> H618 SoC. The SoM features:
> 
> - Four ARM Cortex-A53 cores, Mali-G31 MP2 GPU
> - 2/4 GiB LPDDR4 DRAM SoMs
> - AXP313a PMIC
> - eMMC
> 
> The Sipeed Longan PI 3H is a development board based on the above SoM.
> The board features:
> - Longan SoM 3H
> - Raspberry-Pi-1 compatible GPIO header
> - 2 USB 2.0 host port
> - 1 USB 2.0 type C port (power supply + OTG)
> - MicroSD slot
> - 1Gbps Ethernet port (via RTL8211 PHY)
> - HDMI port
> - WiFi/BT chip

Merged, thanks!

Best regards,
Jernej

> 
> Since v2:
>   - collect Reviewed-by tag
>   - add vin-supply property to reg_vcc3v3
>   - fix reg_vcc3v3 voltage value
>   - remove "interrupt-parent" and "interrupts" properties from axp313
>     node
> 
> Since v1:
>   - Use const rather than enum for "sipeed,longan-pi-3h" dt-binding
>   - remove dts-v1, model and compatible from SoM dtsi
>   - add interrupt related properties to axp313 dt node
>   - use "vcc-1v8-pll" and "vcc-3v3-io" as regulator name
>   - add dt node for board's discrete 5V->3.3V regulator and use it for
>     eth\tfcard 3.3v supply
>   - add usb2_vbus-supply property
> 
> 
> Jisheng Zhang (2):
>   dt-bindings: arm: sunxi: Add Sipeed Longan Module 3H and Longan Pi 3H
>   arm64: dts: allwinner: h616: Add Sipeed Longan SoM 3H and Pi 3H board
>     support
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   6 +
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../sun50i-h618-longan-module-3h.dtsi         |  75 +++++++++
>  .../dts/allwinner/sun50i-h618-longanpi-3h.dts | 144 ++++++++++++++++++
>  4 files changed, 226 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-longan-module-3h.dtsi
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dts
> 
> 





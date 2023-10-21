Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29B917F1
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Oct 2023 06:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUmSVPPm"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so1103129f8f.2
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Oct 2023 23:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697869538; x=1698474338; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsqAnBrXIKrXNI9KXUv9rutA48kvBGnl6z6p/8v5FYU=;
        b=CUmSVPPmEgyYTD+FSnDT3IQHEuBU5CEl1caVUIlYzm5nWNvv2UomlOXfs2Gbv5aP7e
         UsDPRg20ohKA38mTAQ+JNRj2syYuksPJjcM3KwXWb3uq+XBj75hAfBtPIpeUfMg+ngci
         jzwYWUaeN5bBqpbXDAd9VroMqxLTbgAE9BwJEpzq+6SVJkaUHaQoPtUO3picc9F9J5qC
         I9mdzwEpdcPVT7CNNAxNciRz82js8z3pklfoJWeKYRXpwyGE+jqEWQaHDZIyslO/3X4C
         91EGw2P4RcQHdE2A7b/k+fCamfgVEV+pNS3eAkk2Eb58eDFDGxVcBkqutKuxfNavRDaw
         7IZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697869538; x=1698474338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZsqAnBrXIKrXNI9KXUv9rutA48kvBGnl6z6p/8v5FYU=;
        b=FI6qEoT8gAieDz0Jj0GtH34ZwZr3quCnRQDwVihL3PdGsZD16I1RgLJzqvZULacKlu
         1euQEqNIsiD0aA6hLmYZHHClDLoThpmhb53nv8ekrh0RPCoQzMlaTCtJJaroR8lDYW0W
         f95CpcHq/h8Xq+1WpR/FYfV+678UJ5J8hmaxQTIiahN3P8AUzGaHC3945PF6mQNXIDPC
         I4WoLL9x6+KwHd26tLPLq3RG2zFWGh82e45bvm9xK/drMZtO8I/v8oQa6sne1Fbz6fFz
         rdVB9+cvTQwcKyW6QXhsV3S5a8bN4n0Urr4D3ZnPZBqaQfOuI/WNNAPE+cXLGF6ELXy9
         8mfA==
X-Gm-Message-State: AOJu0YwYNGFFUTD+UY7NXC4+DbyxwY5d6vSehJJeWZ1/+KXs7/bKuC5u
	Gq4lnr1bm1iHy6Bc7rLUzpE=
X-Google-Smtp-Source: AGHT+IGBIAoIEX9VEYtSOBHJ/FKN3MKxhiItjQca01ABPMp2r9vu/fnkr+Z2ZvtrXh6N7Oi6DuE1tw==
X-Received: by 2002:a5d:514a:0:b0:32d:be44:f6fe with SMTP id u10-20020a5d514a000000b0032dbe44f6femr2221091wrt.0.1697869537833;
        Fri, 20 Oct 2023 23:25:37 -0700 (PDT)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id t14-20020a5d534e000000b0032710f5584fsm3085895wrv.25.2023.10.20.23.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 23:25:37 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Marc Zyngier <maz@kernel.org>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: allwinner: Add Orange Pi Zero 2W support
Date: Sat, 21 Oct 2023 08:25:36 +0200
Message-ID: <9180085.CDJkKcVGEf@archlinux>
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

On Friday, October 20, 2023 4:57:04 PM CEST Andre Przywara wrote:
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

I would do it through DT overlay. It can be included in kernel, alongside
board DT.

Best regards,
Jernej

> 
> Cheers,
> Andre
> 
> Andre Przywara (2):
>   dt-bindings: arm: sunxi: add Orange Pi Zero 2W
>   arm64: dts: allwinner: h616: add Orange Pi Zero 2W support
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>  .../allwinner/sun50i-h618-orangepi-zero2w.dts | 176 ++++++++++++++++++
>  2 files changed, 181 insertions(+)
>  create mode 100644
> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts





Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B0A7B3DB
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Jan 2024 19:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706644127; cv=none; b=Ef2X6lUZBA12Bs6stc4FiTnmRM3ygqNcbetEo6OZULxTGr3R1wo95abwQvgwViscR6VJYxZ7FC3D5vf5+KdTeacjFtQIQxB8RKqzdV/yz7ok6lnUnkZLZXZu9k+VrnXt6s5niGe0+BeJW21vsVyAJfqAmG5USaBWd4096OCIrjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706644127; c=relaxed/simple;
	bh=hnS05lukx2Rc7Jjyk2rgzbNfJHNBRDEpUQ7Lv4HY3vQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tBBKJcbAiN15pFZrtg8kLmUd2clv0xvvR2M7Cb7P0Gi89UTimEC6dADGSdBOIhIPey44YhP2N4nW79jeM4NaGe5TeHwsEC7SN7Hf/Hhq5WsOxzA6y5orftC3EIIaHxmWHVkIHC5r6LU8k4BBDSWO9+S+DwPB3H7nBIhEscI7NCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9AYxVcB; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9AYxVcB"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55cca88b6a5so4398680a12.1
        for <linux-sunxi@lists.linux.dev>; Tue, 30 Jan 2024 11:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706644124; x=1707248924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJeQzLZeVsfqqVy/IRIzUBnzfv+gRBsQWCb8iOaJluA=;
        b=b9AYxVcBWPKISoJZwOMtGetaCo9ikt75dbSWXPT97q5uIypq4Lv8HWLPdK10f7zT+8
         4h0DxfaWtnwqIFjnIIrIhoQVWD8cuUqBpv2qHBECU3QNrm4iUY3X/6bJ5Ak3sCzoPk02
         WVSk8g1Xc0qX5D6l+Wy3+Xmo/FaCj64zcr0ewdrQZug4ltPAiIWIfu4/9a8F52l7aUPP
         7822iFAsafcSNsTifnzEbIuUIKuFrqEFRTKCYhNbvdgH4hgdwJAe9sIqq/5hOJjYSIZd
         ZU6PnGbJeos4xI3uHzD78YMCBmFwg/QonqsgBrCB5lrTpbqkkRY9EH99a3I0jx1dRGMb
         PgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706644124; x=1707248924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJeQzLZeVsfqqVy/IRIzUBnzfv+gRBsQWCb8iOaJluA=;
        b=fSerON32qV89vC1hYFDwrm+OdZsgyJEQJl8saK0Yb1CifDeMt2FLNOQ+YP3BDMTQ82
         6+Ii6R3OLfXHBRXW+wFcJmXDEtkJdP8U6A9VXUwvYGFmA/wvmn2L4RtSWqMBRHFjMi+U
         9WnAItLl/K2lDR8tQwFezhaAW3SYmeVcI/8JqCl6fWQZ9Er5pe+45TZYHsHMQ5kcigZo
         X8WhDD3n93Dlmw1BuIWvLGP0t71clcbErmBD73p8Xk02QQQa638949ffcL/3ViBIYWTS
         jrpa0R7ntBUzCa3ZkTQjTxCekea9yac38mX3aojG/fheGUllMFdF1qC1cJX4zwYTzuVI
         5U3A==
X-Gm-Message-State: AOJu0Yyq8w/LTQxuZawPlfJ6R5b6pAG1CDr5wkwtq1dj2O1aeoOMgeCP
	XiAsTukoHS07CUqp9iFfWPEtcHsEMoeZRSZXRq9VlQ7hJLtL4uvQ
X-Google-Smtp-Source: AGHT+IFf3uIFgKLDiLg9UvZu2Lh1EJ+Gp9y7um4mQ5+zM0LwgiEuvgFwE4KceV9gO1NkGgepHcxJpA==
X-Received: by 2002:a17:906:4088:b0:a35:b7e6:e6f1 with SMTP id u8-20020a170906408800b00a35b7e6e6f1mr4382872ejj.1.1706644124332;
        Tue, 30 Jan 2024 11:48:44 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id p2-20020a17090628c200b00a311092d2f8sm5378460ejd.169.2024.01.30.11.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:48:44 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-sound@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] arm64: sun50i-h616: Add DMA and SPDIF controllers
Date: Tue, 30 Jan 2024 20:48:42 +0100
Message-ID: <2170768.irdbgypaU6@jernej-laptop>
In-Reply-To: <20240127163247.384439-1-wens@kernel.org>
References: <20240127163247.384439-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 27. januar 2024 ob 17:32:40 CET je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Hi everyone,
> 
> This is v2 of my H616/H618 DMA and SPDIF controller series.
> 
> Changes since v1:
> - Switch to "contains" for if-properties statement
> - Fall back to A100 instead of H6
> - Add DMA channels for r_i2c
> 
> This series adds DMA and SPDIF controllers for the H616 and H618.
> There's also a fix for SPDIF on H6: the controller also has a
> receiver that was not correctly modeled.
> 
> Patch 1 fixes the binding for the SPDIF controller on the H6 by adding
> the RX DMA channel.
> 
> Patch 2 adds a compatible string for the H616's SPDIF transmitter to the
> binding.
> 
> Patch 3 adds a compatible string for the H616's SPDIF transmitter to the
> driver.
> 
> Patch 4 adds a compatible string for the H616's DMA controller.
> 
> Patch 5 adds the RX DMA channel to the SPDIF controller on the H6.
> 
> Patch 6 adds a device node for the H616's DMA controller.
> 
> Patch 7 adds a device node for the H616's SPDIF controller.
> 
> 
> This was tested on the Orange Pi Zero 3 with SPI flash transfers and
> SPDIF audio output. The H6 SPDIF change is superficial as the driver
> does not support receiving / capturing an audio stream.
> 
> Please have a look. I expect the first three patches to go through the
> ASoC tree, the fourth patch to either go through the DMA tree, or
> through the sunxi tree with an Ack, and the last three through the sunxi
> tree.
> 
> 
> Thanks
> ChenYu
> 
> 
> Chen-Yu Tsai (7):
>   dt-bindings: sound: sun4i-spdif: Fix requirements for H6
>   dt-bindings: sound: sun4i-spdif: Add Allwinner H616 compatible
>   ASoC: sunxi: sun4i-spdif: Add support for Allwinner H616
>   dt-bindings: dma: allwinner,sun50i-a64-dma: Add compatible for H616
>   arm64: dts: allwinner: h6: Add RX DMA channel for SPDIF
>   arm64: dts: allwinner: h616: Add DMA controller and DMA channels
>   arm64: dts: allwinner: h616: Add SPDIF device node
> 
>  .../dma/allwinner,sun50i-a64-dma.yaml         | 12 ++--
>  .../sound/allwinner,sun4i-a10-spdif.yaml      |  5 +-
>  .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  2 +
>  .../boot/dts/allwinner/sun50i-h6-tanix.dtsi   |  2 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  7 +--
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 61 +++++++++++++++++++
>  sound/soc/sunxi/sun4i-spdif.c                 |  5 ++
>  7 files changed, 85 insertions(+), 9 deletions(-)
> 
> 

Applied patches 5-7 to sunxi tree, thanks!

Best regards,
Jernej





Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6A632860D
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 17:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760982666; cv=none; b=jJi3rEX5hxQIuYoqkCtkHfsPzQgVYEx/7+fShsq/OGrS2LsDHA0dj0gOS5owrR3YKGrVdebY8O4YaGhAolN0wYaLjV8D2RCc+vLTaNK78J3j+jMsn1RUOh5WbQZTVnGDDBNbQFjuzvQbI87+FAhatHAew7Dl2jetPnCr7bbqNnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760982666; c=relaxed/simple;
	bh=KnROEUass2/iW7GccrgtsymOuPjezhPd1bODirEEn90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FqjlVpiy3GUNfK3zH8/s4bT3n07XmvVDQNnIAD0l/06JS9J7Fwzmo6qjBAxCKEYH+26qge0E5ZlxxunXRwxgQKhgPrR1AsVoy1S887rQA8NiMzcqoPY8StvA1KOLZkV80NKP0pEKBBR2MRy7E6szD3UB2VZx2AnrROl1knfaibw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7gmol1q; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7gmol1q"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4711f156326so33658415e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 10:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760982663; x=1761587463; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTAyakvLktp/e+AMviKRZMNRnJVDyQcT2DmQsBGK+VQ=;
        b=e7gmol1qSMqHd0bIdaleUeyMsSTXk0DI0sqpBXXDxBENANYdf0gzE2x/jxSRLRjUP+
         U5T2gVoKOS6Hwei7SeTmRPoIX/riWZP8mJB3vAkJuFLyD9c99LDrPwHWghlubuQtOLov
         7/dUEV0w80MvYT9DKkLrcp1eAf6pIxLdXN/Pwkxe3A/HNaxZ5lyLEwZpcqjrwdPFS9D3
         UMMaHWfaNX/Rke/Q21v9I78101zVRA/iC7kO2TBZJfAxLmIDljK6qQiLIWhlbOGgBBhy
         h5LVEmMQA+7DW+ahLBrexHE5bM0v6iJLDtnOHZc3zE/AtlLusFvxlT6zxaiHYWiCYVrX
         4Gpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760982663; x=1761587463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTAyakvLktp/e+AMviKRZMNRnJVDyQcT2DmQsBGK+VQ=;
        b=mfVBzGRpX/752pDfpTeC+CbBSidVLQRpa5opFp/UXkL3VRu86mPVlL1vqoT/BPkf8k
         9NhowDKV/cAI6sfeNZ4g54gRTuhZp1EhXDK2AO1tOIWiUpDnWe4TdP2/iRgXesbhdi8s
         dyI5IXwCiGguFWE038aWBxuLxMWA6DfIFSgKLfArMpc7NQ9wfMMtEvUGKV+nYP8lnXnN
         YyDMP7rM5F6r1VUx5j3NNxWO8iU8ndn4IkpFjQDZTvW6INHjch7JiOB+0C/+/eZKcwTo
         1qE3c8PsJAR2eZwgPtbCwo5wcPOv7qjGKe+3MaWiVMTwZvzwEG2jLS6NceyWyKGnr9og
         9qig==
X-Gm-Message-State: AOJu0YxDgULYZZI8Ezcm+fYsP/mcPBzZ6ac+3NP8i+4ce/6mKfT0YReQ
	hDcyhZlp0P5X8/IA36GCNRXT9K6X3SziXrW5SeTsGe8dIlmNXihIJyqz
X-Gm-Gg: ASbGncvvY4AdT0qKiHffHzOqi5bfRXtdqpKkGD55GoBz2cB/cz7P+MRHMEUiNY0S79A
	av5s6H9GMiIF6iYhcJ1N8zg0Xd9wexOqxu1FR/JRWm8ODrHaUmaY4PKBbUqOFCF/vxAlE7OhvGm
	OjtExXsxRU/qbaRCgd2JwodAtbcUhArHryMj6wWGMQc7tTQ2ahgxiURWao35LzVFp6L3wAfIwsK
	+Kd5hiRzG5RkOfUwi6oClvbM3CGbW0EanPByidS1MPzqeSlHH2sRKrtYuCBcUF5yrZHIvcMbFMK
	1g93g/2VpuyIA46oILpXm2TZK6Wy2I28qo+lGyJxSXCcDk69yzgTFG0FSMX9MeiLC+ovjLdy1Wb
	y4B2otjoJ42ykFzXi5AkTHvEJ63uDKgSwDztJs68WLSkPS6nPo9B7BdmqCAe6jyNTEL/EOJtAWZ
	kNx8E5uELnaE0pq5nPv4egzR4pcX0cRJBzvs6hy5J17hkM9PwNEtM/9LZPPoY3aID+sDqfPdS5J
	hVAlnU=
X-Google-Smtp-Source: AGHT+IEf+pLydZZJlPsNS9klI6Ppz7HfqYBrVGwlK2LGcq8ett6vc+FT1k0DRHTRyZXn1XwlZQ3W5w==
X-Received: by 2002:a05:600c:444d:b0:46e:4cd3:7d54 with SMTP id 5b1f17b1804b1-471178b124amr91678925e9.18.1760982662640;
        Mon, 20 Oct 2025 10:51:02 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d8b2sm187794005e9.3.2025.10.20.10.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:51:02 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 05/11] clk: sunxi-ng: sun55i-a523-r-ccu: Mark bus-r-dma as
 critical
Date: Mon, 20 Oct 2025 19:51:00 +0200
Message-ID: <3374980.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20251020171059.2786070-6-wens@kernel.org>
References:
 <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-6-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 19:10:51 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The "bus-r-dma" clock in the A523's PRCM clock controller is also
> referred to as "DMA_CLKEN_SW" or "DMA ADB400 gating". It is unclear how
> this ties into the DMA controller MBUS clock gate; however if the clock
> is not enabled, the DMA controller in the MCU block will fail to access
> DRAM, even failing to retrieve the DMA descriptors.
>=20
> Mark this clock as critical. This sort of mirrors what is done for the
> main DMA controller's MBUS clock, which has a separate toggle that is
> currently left out of the main clock controller driver.
>=20
> Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM C=
CU")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi=
=2Dng/ccu-sun55i-a523-r.c
> index 70ce0ca0cb7d..fdcdcccd0939 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> @@ -121,7 +121,7 @@ static SUNXI_CCU_GATE_HW(bus_r_ir_rx_clk, "bus-r-ir-r=
x",
>  			 &r_apb0_clk.common.hw, 0x1cc, BIT(0), 0);
> =20
>  static SUNXI_CCU_GATE_HW(bus_r_dma_clk, "bus-r-dma",
> -			 &r_apb0_clk.common.hw, 0x1dc, BIT(0), 0);
> +			 &r_apb0_clk.common.hw, 0x1dc, BIT(0), CLK_IS_CRITICAL);
>  static SUNXI_CCU_GATE_HW(bus_r_rtc_clk, "bus-r-rtc",
>  			 &r_apb0_clk.common.hw, 0x20c, BIT(0), 0);
>  static SUNXI_CCU_GATE_HW(bus_r_cpucfg_clk, "bus-r-cpucfg",
>=20





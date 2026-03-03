Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE5E382F06
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Mar 2026 18:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772563111; cv=none; b=KBFyWmj7/Qlhn/zqK1pLYILbOrCU0gWmxRujxOw0PCR1N4Vrw+9piqALLsIt7tWnnpBTpX6OBLd1CnPg24M4FeOmnj14HDi+RtODARtFkkAHY4xmoEB174MGQCu+TVS0yMLwEb6f3cKSS/V0G5Uip9HavGaodLXc2yMFpHD4ULY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772563111; c=relaxed/simple;
	bh=0B+INJpmx5ghoy4TOBH7nj7HmVMBE/uFPhIqDvN0Pw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fUcps37pc6DWcymT5onFl8p7yLTzrjpZAzQeRoySP9QpqGMQhs7mwHdO1V5Kl7tCGOb6pVRwR1bLDMauADtRQQiT9RlEbyRIYQKWPz4ZT5b1KJeKjn4SqZAqFRbs2HsChJ2yctmQbgD3of+1+oWKnyTtXtb4Th1pVYgvEwuCNt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOKVwsp7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOKVwsp7"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483bd7354efso79880575e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Mar 2026 10:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772563108; x=1773167908; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWbdBUMEXH4g8LJKj8OiXeXSCrn4OD1jl9QXgu59+fk=;
        b=EOKVwsp7/4BG3CExbXRVi7qu8RjpfZnmR4wSxx+Lnaj8uvq1/43KB6Tu90lGig8OtA
         U1Y7oH83NOjNavv+ZlsewkdRkPTiqAQ3KL8IiZZfZltFcZS7Nql3w4D7jNriC1qywgiU
         mtQ1Bd2B07ORbMFDW/uaWrUVqoehSXJc9mzRR2s8VpQyM1VLUvYCFY7VL/Db4FBx3LIL
         /BwB99dvxwW6LLcxLnhjy6yhgUw/UYc4QxT6YWS4XUHjK9KSBWf3cD2Y02Afjynlb72t
         gR86/BAcaXK4XvsI8kFDZUaLQpwiTugzphJbMuyw0hJ0kIN+1xn77ahpOJd9On/NF1rj
         a4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772563108; x=1773167908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zWbdBUMEXH4g8LJKj8OiXeXSCrn4OD1jl9QXgu59+fk=;
        b=KIVfdyWcmb+BSvIIhcgGwEFt71TT1Zj16jaMKFJsInFAZVzJt4jHC3h7TRG6DI6vbZ
         GhT7Hb6wXK3FP7BEBlMBRTZhCBo6ed2FqLJTXH20jFS8QaLgJ6ZpNWDY8MGo+ib7AM3T
         /YrfW/3AgfmQ+8l+mHiOtLsAPgcJs6FzfKVNMINVhL7xoi9Ffz1w56V1lP0BbqX30WBt
         Qcy/tNkBDeMAcy/6hTnjSO4h4BD7OV5NEIcX7GAGeUW1C1yCS7NZjanM2/jVXfFknGNI
         tSnJKLE54lALqaC2ME4SzgD6pXH+38SRBbXC1ErHnUwzz4Us5GR22/JZ/P6CZbm7OnIJ
         uPaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAEqjqFwqd2n+cgj/jzrJbxAgBRhyvnqupkXI3Lzrv50ToJV7FhG3MEU6IMqo/n1yJItm6a00vGdwkYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvDhMrDyLAYQUcZENmp+A38Hp+qXnEeDLVs4XJCX9ZZp2IEJmq
	1Tw6Zx9HDL0udBfKFiVEoq6mqcDDhm2oQLTb2YBfkd4zQ/6sBEmch0oj
X-Gm-Gg: ATEYQzx3NHrsrZ6gbokBRKsbGhlW3qQMNfhaostCs/4/MtqFMXSa89zrWM8hegzLbz5
	SNNzI3kXuu5v6Fu7GkIyoTf+Qk756LFtL/oEryacb1H80NzWeOfa0Cga8REYsxYy/oEV6At9B3K
	NVdwYleNPJkXCWmvuhVyRubprwdBjrTFQKKg/vEwGOATX8nsFnQs36uFpH2HFCmqmiu7/IO4z3q
	JSBhZe6AgvGJj/rdVxX2YaAWbRD4XjQA+AXshIl/miv1Dw7l0g2Htd+SpIMwIfBW1MFX9NBJRhY
	tSINOTXrEkGVUJuruoHfVA218svM/kL5LggR32VPKz6Yf0iQSvD9aWFrMb7ZLPy6EoIm3T2dsaL
	GLhoMGLdC1EzAA70T/4b3Lx5DqS2e3z9BxRVnADXOml1wnVvUhEQcT8X7XuGLrFHYrM0bwDXWvv
	7Uq7px6FAgy1eRA2g5dOoCoJ/nfaRgJicoVo3PZMdaldmGmElRaYsF+tCWd5hBeJcQleBaBTHnc
	8mbIrlkKzaovgmPJXs=
X-Received: by 2002:a05:600c:1e85:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-483c9bbbe23mr300242825e9.21.1772563107874;
        Tue, 03 Mar 2026 10:38:27 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b841absm409737345e9.13.2026.03.03.10.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 10:38:27 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Jun Yan <jerrysteve1101@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 samuel@sholland.org, mripard@kernel.org, andre.przywara@arm.com,
 Jun Yan <jerrysteve1101@gmail.com>
Subject:
 Re: [PATCH v3 3/3] arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support
Date: Tue, 03 Mar 2026 19:38:26 +0100
Message-ID: <5969847.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260302020956.96424-4-jerrysteve1101@gmail.com>
References:
 <20260302020956.96424-1-jerrysteve1101@gmail.com>
 <20260302020956.96424-4-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 2. marec 2026 ob 03:09:56 Srednjeevropski standardni =C4=8D=
as je Jun Yan napisal(a):
> TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
> equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
> WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
> one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
> infrared input.
>=20
> It was released by Ultrapower(UQSoft) as a blockchain-based terminal and =
is
> now discontinued and no longer supported.
>=20
>   https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn=
/product.html
>=20
> Hardware schematics are not available at this time; however, the
> dts from the vendor firmware is provided for reference [1].
>=20
> Based on the PCB silkscreen marking "AZW-KT02 2.0", the ODM/OEM
> can be confirmed as AZW, and the overall hardware circuit design
> is highly similar to the Beelink GS1.
>=20
> Tested, works:
> - debug UART
> - status LED
> - USB 3.0 Type-A port
> - USB 2.0 Type-A port
> - Micro USB port (Host)
> - MicroSD
> - eMMC
> - WiFi/Bluetooth
> - HDMI video output
>=20
> Does not work:
> - Ethernet (requires AC200 MFD/EPHY driver)
> - HDMI audio
>=20
> Untested:
> - SPDIF
> - IR receiver
>=20
> [1] https://archive.org/download/tqc-a01-stock-fw/tqc-a01-stock-fw.dts
>=20
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 361 ++++++++++++++++++
>  2 files changed, 362 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.=
dts
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index 2edfa7bf4ab3..d116864b6c2b 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -38,6 +38,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.=
dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64-model-b.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-taiqicat-a01.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h313-tanix-tx1.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> new file mode 100644
> index 000000000000..3138292abb45
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> @@ -0,0 +1,361 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (C) 2026 Jun Yan <jerrysteve1101@gmail.com>
> +
> +/dts-v1/;
> +
> +#include "sun50i-h6.dtsi"
> +#include "sun50i-h6-cpu-opp.dtsi"
> +#include "sun50i-h6-gpu-opp.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model =3D "TaiqiCat (TQC) A01";
> +	compatible =3D "ultrapower,taiqicat-a01", "allwinner,sun50i-h6";
> +
> +	aliases {
> +		ethernet0 =3D &sdio_wifi;

Wifi has alias ethernet1 on H6.

Other that that, it looks good. With that fixed:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



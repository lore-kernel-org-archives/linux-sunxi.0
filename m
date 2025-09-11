Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889B7368083
	for <linux-sunxi@lists.linux.dev>; Thu, 11 Sep 2025 18:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757614030; cv=none; b=P+g6cyte4Y+1zx1i2giZIe2rq77KW/vQmxQbDmzSywqe4Xgdifkl+6D7593zBDqLEJ0QSXrBl7qEGzSjTxnENgmoCYfvwLwUW2moxS/esW9yV7S8j7lDSTooZVlIMY70uu1G8OiArvaj80GeUgxQOLfg7JVdSHnhdkT10TJuCOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757614030; c=relaxed/simple;
	bh=cgUcYv/Eh4Qq22HkbanZ6zJHJ3E+UBu28WTayReVPdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zd3ZgO6O++6RccyUW44rwexmPdFBXtmxlBoA4b53Mn76J1YDZZKLn0zOdXqdC+r4EPvGQMWhiF7lA02TPR6d40VfHIGMXmrLmuhst7ZKGuVJIc+H+1vkP/TtN093PQ22jB0MOvGCTyX9OdMj9MOnhYQNJloVYnWBnHIvCR2Kpbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfPR8U6Z; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfPR8U6Z"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3e249a4d605so1062588f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Sep 2025 11:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757614027; x=1758218827; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYHb2ePbP/cSM3RYmLN5AkN0s21xSd8WU5SVhx9urGw=;
        b=hfPR8U6ZictYhLNnxUuxKd+HpWCxO6O63fJ7kfpYIH4TmssM2Q204rLhd9jHN82As5
         CWfGQt5K26/CTz5mO0L0nJiH33RR8vR9QSOjZQK7gU0TH+2cXCHK/1vdX0FwKRTPHVLO
         ccb0nbnAZklm15gSf0NUg4oCvQWdGvzqDAtgNbnIVcboXNd4NoEIV3dY0zi5xMqVDVkO
         hCn9WkToyN30Dm1Rd9lZFbDI0doF+Am7hPNHFxXRzU3Q9AtmwNRZvLgGJ78/Pj7U+Gpa
         IcnuZ/KWsVFJ4sPwecWWOmY4auKROUgEACVdibpE4F5j39mhddmAWFMhSe/JFnbh+IIt
         i8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757614027; x=1758218827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYHb2ePbP/cSM3RYmLN5AkN0s21xSd8WU5SVhx9urGw=;
        b=nvp0SDgm73rzUswga8syI0nW6CjGeoPxWmEJEYDUPzBvJ0YZbPcYH30JK6TrEVYrsX
         7PpGdh5ZrLIuZa0gF4MEm6TblcQZRcuw2V+epin9Nzh7YcGOUzjfkUEajNpv1q/E/BuX
         HaIXzyQOHix80Ov8mPw1gHUnYzqy4m1AWbsGWfy8X/voa00BPBKHaQ6EcH6EwRAhOUs6
         WhV7v/0CwClTPyQ8IBnTQNhcOSc70g5BaT7rMNtFS9ih9Rr039Gv8kDsHW65m5mo3bbd
         CdqB08ITQB1h6mkzbnGAg34iACWweDwPnE7XlSF3A48BU3Nz94vzqyQmbeVbK1akhYhP
         psLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBuwzSrjCpECeBRi5Z/lxocAL7NasnK3mpjIFidbRnhHCVs2SGR2oPBobrl5Ucx3HY4EKMLXs9+rBVPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQsa38KlVKY04AdtrI7QrF59TMU8zsuhSmri42QvcMEuqgNUwG
	fePwroS3rbQHyfgFyIQDbgomV8HErhov0rGl4kJigeRAJV0l+TLpzNbJ
X-Gm-Gg: ASbGncuRnOw4raUsFVQLD0xHEEeidGTeoSvJIDXhe2Zn8ZOh9zJeef33bmIMyKiEK8H
	8Mrpzb+jtsBPjeu4yP4Rr1RGmhrLkm1UL+romykyVoMRQazUfr+DY/Wdcbd6ExWEi0+4TuxXVhe
	xam81XYyw1yg4x0lKMCxV5y6rhzOrwbv0TrNCwdhJOwGGSO7r89qdcqGgmlabUohGCaVxhU6l0V
	DPq5GjIhBOtqMdqQKcMwsD7CF2YeRUnjXorUxiplnzc4gFTsAHg7Csw18xJENDI6zGsB8N1BAUx
	nlMvTcqn0+cY4/9Hn38IXJiMuVDDZ3pqMu5M89d2tSaKkwwhGqYnbhFQv5dHdmUzJ2vJy+XeiKX
	nXCicUfUVbIjoWiNNM/7q55chFJ8m04nSoB2vrrKN4AQykfYdGuhdeQcHxMkfFUUj1fiTSr8irP
	/0sSbOAPMllg==
X-Google-Smtp-Source: AGHT+IHR6gKFBxF/Amrl+hTiQqEAGO5RUJG7DroNK0beFvilU6FlAdKcfqOOFlfA2Rioywi+kGhMlA==
X-Received: by 2002:a05:6000:2f87:b0:3e6:e931:b42c with SMTP id ffacd0b85a97d-3e7659e9785mr284823f8f.39.1757614026548;
        Thu, 11 Sep 2025 11:07:06 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e015775f1sm35637425e9.8.2025.09.11.11.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:07:06 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 3/7] clk: sunxi-ng: sun55i-a523-ccu: Add missing NPU module
 clock
Date: Thu, 11 Sep 2025 20:07:04 +0200
Message-ID: <2795929.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250911174710.3149589-4-wens@kernel.org>
References:
 <20250911174710.3149589-1-wens@kernel.org>
 <20250911174710.3149589-4-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 11. september 2025 ob 19:47:06 Srednjeevropski poletni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The main clock controller on the A523/T527 has the NPU's module clock.
> It was missing from the original submission, likely because that was
> based on the A523 user manual; the A523 is marketed without the NPU.
>=20
> Also, merge the private header back into the driver code itself. The
> header only contains a macro containing the total number of clocks.
> This has to be updated every time a missing clock gets added. Having
> it in a separate file doesn't help the process. Instead just drop the
> macro, and thus the header no longer has any reason to exist.
>=20
> Also move the .num value to after the list of clks to make it obvious
> that it should be updated when new clks are added.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Changes since v1:
> - Move .num to after list of clks
> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 21 ++++++++++++++++++---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.h | 14 --------------
>  2 files changed, 18 insertions(+), 17 deletions(-)
>  delete mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523.h
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index 1a9a1cb869e2..acb532f8361b 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> @@ -11,6 +11,9 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> =20
> +#include <dt-bindings/clock/sun55i-a523-ccu.h>
> +#include <dt-bindings/reset/sun55i-a523-ccu.h>
> +
>  #include "../clk.h"
> =20
>  #include "ccu_common.h"
> @@ -25,8 +28,6 @@
>  #include "ccu_nkmp.h"
>  #include "ccu_nm.h"
> =20
> -#include "ccu-sun55i-a523.h"
> -
>  /*
>   * The 24 MHz oscillator, the root of most of the clock tree.
>   * .fw_name is the string used in the DT "clock-names" property, used to
> @@ -486,6 +487,18 @@ static SUNXI_CCU_M_HW_WITH_MUX_GATE(ve_clk, "ve", ve=
_parents, 0x690,
> =20
>  static SUNXI_CCU_GATE_HWS(bus_ve_clk, "bus-ve", ahb_hws, 0x69c, BIT(0), =
0);
> =20
> +static const struct clk_hw *npu_parents[] =3D {
> +	&pll_periph0_480M_clk.common.hw,
> +	&pll_periph0_600M_clk.hw,
> +	&pll_periph0_800M_clk.common.hw,
> +	&pll_npu_2x_clk.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(npu_clk, "npu", npu_parents, 0x6e0,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    CLK_SET_RATE_PARENT);
> +
>  static SUNXI_CCU_GATE_HWS(bus_dma_clk, "bus-dma", ahb_hws, 0x70c, BIT(0)=
, 0);
> =20
>  static SUNXI_CCU_GATE_HWS(bus_msgbox_clk, "bus-msgbox", ahb_hws, 0x71c,
> @@ -1217,6 +1230,7 @@ static struct ccu_common *sun55i_a523_ccu_clks[] =
=3D {
>  	&bus_ce_sys_clk.common,
>  	&ve_clk.common,
>  	&bus_ve_clk.common,
> +	&npu_clk.common,
>  	&bus_dma_clk.common,
>  	&bus_msgbox_clk.common,
>  	&bus_spinlock_clk.common,
> @@ -1343,7 +1357,6 @@ static struct ccu_common *sun55i_a523_ccu_clks[] =
=3D {
>  };
> =20
>  static struct clk_hw_onecell_data sun55i_a523_hw_clks =3D {
> -	.num	=3D CLK_NUMBER,
>  	.hws	=3D {
>  		[CLK_PLL_DDR0]		=3D &pll_ddr_clk.common.hw,
>  		[CLK_PLL_PERIPH0_4X]	=3D &pll_periph0_4x_clk.common.hw,
> @@ -1524,7 +1537,9 @@ static struct clk_hw_onecell_data sun55i_a523_hw_cl=
ks =3D {
>  		[CLK_FANOUT0]		=3D &fanout0_clk.common.hw,
>  		[CLK_FANOUT1]		=3D &fanout1_clk.common.hw,
>  		[CLK_FANOUT2]		=3D &fanout2_clk.common.hw,
> +		[CLK_NPU]		=3D &npu_clk.common.hw,
>  	},
> +	.num	=3D CLK_NPU + 1,
>  };
> =20
>  static struct ccu_reset_map sun55i_a523_ccu_resets[] =3D {
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.h b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.h
> deleted file mode 100644
> index fc8dd42f1b47..000000000000
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Copyright 2024 Arm Ltd.
> - */
> -
> -#ifndef _CCU_SUN55I_A523_H
> -#define _CCU_SUN55I_A523_H
> -
> -#include <dt-bindings/clock/sun55i-a523-ccu.h>
> -#include <dt-bindings/reset/sun55i-a523-ccu.h>
> -
> -#define CLK_NUMBER	(CLK_FANOUT2 + 1)
> -
> -#endif /* _CCU_SUN55I_A523_H */
>=20





Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB7734D907
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Mar 2026 07:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772609153; cv=none; b=Y0LvrNVG5VrDoyjSHghntpNzzVZGkowwHvb4iR+SuCeP6K7pXmV+6orWR7Efk2NssiIwRKiahbZnt7Gsmz71hEiB5mxWAuvavj2iGZGpKPVjHt7PoPRnouSQiFQQpv8zLw0PJuqF5ipR1QqsmjO1i0MzAh3L6jwBrLE6rYlsrvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772609153; c=relaxed/simple;
	bh=u2dqIwEcqB7gZGhAjpnE89HllIsn+qZmeaKPFJf4eC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fYLKXzDlHgLOd+/hFTROokV8hguRgpiQ5osBkOqfdrXfRSrs/2jEYk3meOY/oakFGSkP2MRbFsVsZfijhCbHxlU3NjfplxBwXhQv9N09dxjMZbmY6WdyHiP7I+OkewqvVjxTrJ4L+WxT9n4EzUMrBSsQ5OELOGC+VrbCvjPgmr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFdofMGV; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFdofMGV"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ba895adfeaso5753492eec.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Mar 2026 23:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772609151; x=1773213951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Xjt8bJH/L3RjqSPLVXpTgggvkPMU8B0IuZLjfddvGU=;
        b=MFdofMGVNQKYGs75Fm9gyziFDxDtZ6uJm/DNQkx/iZUMJPVKr2ptVa1dB4CmHTnJjH
         2BnQbqZapaMVKcBYuOYquNcGr9C6lGJhabGjdRCYu7lfgfJaXpT5EO19/G97EQ//Ejxa
         9MLlXLoePb5yEQDONz2kEr4bl0sWTQKhjlP0xW0Colmr0dbzc3ZlYguqI4wKH4turi+v
         R5mNlhtTJGtUJF1k4d5kEHclSIKwvcePs48YJ8vHlg7VoAYipI+d8n34+Sr+4tiSnczs
         QRE6qeK3rMkquzJP1+58RUusplksu9x0CZ33r/PkTIofvRb8vtiPyvFOKgOUu/MsrHCl
         AlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772609151; x=1773213951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Xjt8bJH/L3RjqSPLVXpTgggvkPMU8B0IuZLjfddvGU=;
        b=OzimQ7inBjj1eLshMgwXAA2YMA+8MbnNyEUUc6r7rgdPhCVILa3ZanZNAiy4C0cFNn
         EfpOcPwB/rDTmkt5ldbM0b5wzaCR8OccWL/eAX7PmaylIWLRss84gPPnJhFRJVp+SQty
         CGj7Lv06J09fy5Bm6Igk+eFDpByjNaTyIkLK4ILuNg8S8ynoEkjGBKsnR/CR4r1yUvvN
         UOA2ic7XYMN3LxH6DMat1RriSFzuRvwYe2oxhyPTyTDa+lYGCmWceXDks6UpKdjPIG8E
         N0y+q/8js98QSeffPhmQplwnfPcJDcvKuFB5iZWY26YyFGrwv8JbJmazjsJLbo5ZKMM0
         ET+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdvbhF6yRPoPDlwf2j2bXdNPYyiECK62H/hlI8CQTwQwOh7BzuYVIA5NagxftmSGRK1bUBfFxxI41v+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyioHLSAvMwjHNIKlVwRDFPLiYZu/P++gIe/hz/knb4vp9URm6c
	kiQNCK3S8q1EAOi0Gq4F6o+Ke4y54J3azf0yMB38ayCQbWzWPcUlAuCh
X-Gm-Gg: ATEYQzz9gMOR67MteHYD3hVSMNlMpK6/0MQcDkdG830o23Y/4pshnGCN2O5lR6zFrjY
	Faoxy6QkuFzv4+AQKZUv0oA/shcna0syn72gIXdnpUuxZCAWHqBENaVrGwGYFgheqDp6l02fHPH
	8zJ2H4G//Bq8oDnniNDLtuGUtWwk8+obXYSXap7CZhpNUsOOmf+tnVYU4boq3mnz54yHRG09SEA
	gV1sQhDuqMUBWMHG/t/X0v3jf/AJA/54lh3NjfU2FEEWN4wbPjzym4RR5ectguwAdTDdTkFyvTq
	EjtapURH8lXv2qMIFHQiYp6O17EI/+IsK/x+c86ya8ydqDtMoUG4e/MIfcZYi2w8x0nUdf7VlEk
	tdmNQXl/45gFwF/ISPekvAWb32cEvrq4e3sy3vKDGWvmVAbpySN2t27l3hmynTYuovduz3ekKCk
	a1CyNOdU3sFNuRsPE7ShGK3r3XdE88ZcQ=
X-Received: by 2002:a05:7300:72d1:b0:2ae:5e93:b69 with SMTP id 5a478bee46e88-2be310904acmr459054eec.29.1772609150602;
        Tue, 03 Mar 2026 23:25:50 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a55:9af1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be249ed6a4sm2548374eec.11.2026.03.03.23.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 23:25:50 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: jernej.skrabec@gmail.com
Cc: andre.przywara@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	mripard@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support
Date: Wed,  4 Mar 2026 15:25:43 +0800
Message-ID: <20260304072543.436707-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <5969847.DvuYhMxLoT@jernej-laptop>
References: <5969847.DvuYhMxLoT@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Dne ponedeljek, 2. marec 2026 ob 03:09:56 Srednjeevropski standardni =C4=8D=
> as je Jun Yan napisal(a):
> > TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
> > equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
> > WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
> > one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
> > infrared input.
> >=20
> > It was released by Ultrapower(UQSoft) as a blockchain-based terminal and =
> is
> > now discontinued and no longer supported.
> >=20
> >   https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn=
> /product.html
> >=20
> > Hardware schematics are not available at this time; however, the
> > dts from the vendor firmware is provided for reference [1].
> >=20
> > Based on the PCB silkscreen marking "AZW-KT02 2.0", the ODM/OEM
> > can be confirmed as AZW, and the overall hardware circuit design
> > is highly similar to the Beelink GS1.
> >=20
> > Tested, works:
> > - debug UART
> > - status LED
> > - USB 3.0 Type-A port
> > - USB 2.0 Type-A port
> > - Micro USB port (Host)
> > - MicroSD
> > - eMMC
> > - WiFi/Bluetooth
> > - HDMI video output
> >=20
> > Does not work:
> > - Ethernet (requires AC200 MFD/EPHY driver)
> > - HDMI audio
> >=20
> > Untested:
> > - SPDIF
> > - IR receiver
> >=20
> > [1] https://archive.org/download/tqc-a01-stock-fw/tqc-a01-stock-fw.dts
> >=20
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >  .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 361 ++++++++++++++++++
> >  2 files changed, 362 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.=
> dts
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
> /allwinner/Makefile
> > index 2edfa7bf4ab3..d116864b6c2b 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -38,6 +38,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.=
> dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64-model-b.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-taiqicat-a01.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h313-tanix-tx1.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts b/a=
> rch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> > new file mode 100644
> > index 000000000000..3138292abb45
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> > @@ -0,0 +1,361 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +// Copyright (C) 2026 Jun Yan <jerrysteve1101@gmail.com>
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-h6.dtsi"
> > +#include "sun50i-h6-cpu-opp.dtsi"
> > +#include "sun50i-h6-gpu-opp.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +	model =3D "TaiqiCat (TQC) A01";
> > +	compatible =3D "ultrapower,taiqicat-a01", "allwinner,sun50i-h6";
> > +
> > +	aliases {
> > +		ethernet0 =3D &sdio_wifi;
> 
> Wifi has alias ethernet1 on H6.

Acknowledged. This will be fixed in PATCH V4.

> 
> Other that that, it looks good. With that fixed:
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Best regards,
> Jernej




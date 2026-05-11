Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AA020D4E9
	for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 01:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778463891; cv=pass; b=FiS/wCC9gO5iXz1X0I1Yunp+ZL9ii1B55y3W0Bx4UpFnPh/BMDCfqc89UzJJjGhiFqIMlHiX04VJMG8Ge0guWcgTOuhJrBHBo+7JAPOhgaLZ+xHUYC5fhmg+UJNdTNiircfddlOCfeadGppgBBhpMmcvu7v67Xba5u8lPJ/2dPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778463891; c=relaxed/simple;
	bh=dcERz7RH/AJ7D68IG6bQCbf+o3Z7rl3hTCassk6h6ME=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=G4TRWbgtR6svpeVM3g4j1fxQbAIqWgiurs8TdOSwVDJ8PHEtcpTWbKXojIrOr/r4TdurQG5VBqwf18xkiziKge7d/KkHC7mgp3ZOQ9AQGNUKrGap0+4f/us+ZJixNml1ehMcwIabESDKM03fYtIWYfwiS9WdofDYTXMyAsq1ha8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThjoqzB9; arc=pass smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThjoqzB9"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-95673f7b5baso1001794241.1
        for <linux-sunxi@lists.linux.dev>; Sun, 10 May 2026 18:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778463889; cv=none;
        d=google.com; s=arc-20240605;
        b=dOxd49iOWV+BvBddHqE3LrbveO9Tlbwg39w0SY6ohYBenR8oiyPQztvnLdJ/qg/JpE
         WpjmPttDvi9U1WbUpapbTdzZdzquafqLt6Nq9kS9s743TmrU239caZi7JDZOgpPHyLoI
         bcVwjyekKzVhGu+MfSb6dnDqc3CTaryUbec1nNo/w7FTfZQ/Zp8yOemEgeOWoWqGRAgG
         85qJRbPyP+7lwbY+8eCrZILFvxalCiV1mW5kITUHOiRZxY67/vFbt0vZr2iO7i3g+3wH
         GzluO/NdFlEBQDsyJ8ZyCLj9+dt1kuFPnPARXRO0k52qUKjd8BEdl7ZoKt8e42lhhVam
         Hoqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ndBvHQLM7mxv7AI6ROioxLQwc2Wuc+XafAFB+8LwQTA=;
        fh=Bj77F/ZtjE6O0mjq3JR6nNjWVfVkqQ/dsy+yM+Jt/pk=;
        b=HE0qvZ54pkFZCFqjLpm+amNbryLW4STyoCTiMUU02fu175UkFvC4EqKYWIuH9VtPVL
         81VjTOrrfGuqZMfVXyJCyOZCxhX3do6XbUDQ98fHgVJc9yg0b1tpUA47UJ2Ph1Cgl20+
         Xv8dpW8CI2/mcWkQUKSzDY30DklQp3Y1irE2IsyInBgpZjiEzaOTx6RXbHxJ8v1cRkLu
         yoM48gncRtbvzZDYSeJeDoivFuiOe7G0ByjZSNEOCKHLV3TX/PAq1VdDeK4csUeUzY+R
         L2lPEu41tBjSnGDJXZvXXk5qusts7QUiUJJIstkfzNecgVNtxk08nUBRzFkUGAM2sYRF
         jYww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778463889; x=1779068689; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ndBvHQLM7mxv7AI6ROioxLQwc2Wuc+XafAFB+8LwQTA=;
        b=ThjoqzB9a9EJpQVlgnG2LzxHsyT14ehbScx0iC3bTlEjwVI9yHazfq6cE+uNWhouVI
         HE9fgYSMsK1E0omfua5N1Yeu1x9EN3V4oN+IwUh8ieWt1UXANGEA7FYWVr17LAUrHoxG
         eeRkOI5TXsOVdrOkOcTvYQqSIVrPkSTxLshwYlh2WHMzk/ACGA9fsrCJbjYkYbHxPjLN
         FHGV+1BCIem+eY1qbFJnQdb0yUt/WvApsMqT1c94d7hYL8Jw1A/UxouWQ5HqkmkN6eOG
         Wfc8tm5oBOJGW0Es3mHwi61lsvaR7KTjFkppEKyNDpTuOD63QBx61YGnLkXA2H4fxc1F
         jWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778463889; x=1779068689;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndBvHQLM7mxv7AI6ROioxLQwc2Wuc+XafAFB+8LwQTA=;
        b=tOQkB+FQHnjP1pnnWBLdI30N3Kfi9SIlRqSjQrmnl7N0WY75r/vj9aj/eIugjGzctS
         bOaHM2r30VBYoZJc6Pr9mIYgTIljV3xAO1w3Zjmi7e+BlRqoN5eb+ERe4VAQe0MttxuO
         p+/+bg7ehAYOEJryKedpBWtD+PVa5Uq7ZsBrfnwdZ/EZJZ+joKuHJe1qcheD5bJ3K58F
         DvGCOUaKkb6dO9ZUlraeuoipRpPQL49JGOwVzf3r08upqD103Is+tZmaGujkK3JxwQuo
         3sKdBZN4bnOTDqcYAyfutH5Ob7U6awi5zS+vcM0WZEgkPG7TAEzk4MSU2JghjSMXLISz
         bk5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8uvuryueOcfuTs7ZlAdgF4f9c+CNyyFCGfDCVm5i2VpD4UDKtBDg/q+56qRUDhGH6Gks4NcOpoEsnuqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwiUYOnZbGu4mIbFbeTilSp9g2oCHw/B+70S8nedd/B4TuJU42+
	cgcwv3j1UpO/D65UQyyLpL6hlmtQ3WT0bCMDmuyBs57qeNiUyl8pYeU+YyQ8cCXonuLfQ63Lyd5
	7d8h7eq35SINoN2S7Dn6scvMkqYz27Q==
X-Gm-Gg: Acq92OHFjO1YJUhyLq/rX6cG2+6Gs5KN4jRe9oDODQfdTUF+RIpCGCCt5/NLM6rTxHE
	ez9spJlARwF8sTNGfsuhrGqDiqDXPi/z0LfdpT/jSOx13iL7twg5Ds64jwu/4NF01zA7h/nn4gc
	Ch7VGU8qy8KjHLvd894ASd2rYhr5Brx740bi2wcXam8xHWGYr1Dzm67ozl2vX48/cQk4lyWPVn/
	PMqRDrPP7fRVcOEHgSjxdPFME9AltaN2fBi5lbDXyYGR08xDAI7+tuuC3MM2YuhiMgXcgQtXnV2
	Cv3SDA==
X-Received: by 2002:a05:6102:54ab:b0:62f:3cb7:8652 with SMTP id
 ada2fe7eead31-6313e9f142dmr4833089137.13.1778463888492; Sun, 10 May 2026
 18:44:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Yixiang Xu <m992364136@gmail.com>
Date: Mon, 11 May 2026 09:44:37 +0800
X-Gm-Features: AVHnY4JPopboAW_Ec2owylTnIzbk88ztgfT9KyTE8i92NLZ8aDYkHduXSz8eaOc
Message-ID: <CABEbnPHhbdq2mrnWUbs=FWMeO01qh_AQTzRwMbhvia128rQfVw@mail.gmail.com>
Subject: [RFC] media: sun6i-csi: V3S parallel HREF/VREF polarity mismatch with GC0308
To: linux-media@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I am debugging a parallel DVP GC0308 camera on an Allwinner V3S board
with Linux 6.8.12 and the mainline sun6i-csi driver.

The sensor probes correctly and the media graph is created, but the
captured frames are invalid unless the HREF/VREF polarity bits in
SUN6I_CSI_IF_CFG_REG are forced to 1.

Hardware / software setup:

SoC: Allwinner V3S
Kernel: Linux 6.8.12
Driver: drivers/media/platform/sunxi/sun6i-csi/
Sensor: GalaxyCore GC0308, parallel DVP, UYVY8_2X8
MCLK: 24 MHz
Bus: 8-bit parallel

Relevant device-tree endpoint properties:

bus-width = <8>;
data-shift = <0>;
hsync-active = <1>;
vsync-active = <1>;
data-active = <1>;
pclk-sample = <1>;

The GC0308 sensor side works:

I2C address 0x21 is occupied by the kernel driver

the sensor node appears as "gc0308 0-0021"

media-ctl shows:

gc0308 0-0021 -> sun6i-csi-bridge -> sun6i-csi-capture

the sensor source pad is set to:

UYVY8_2X8/640x480

With the unmodified sun6i-csi polarity mapping, the driver computes:

IF_CFG=0x00010000

That means:

bit16 PCLK = 1
bit17 HREF = 0
bit18 VREF = 0

The resulting captured buffers have the expected size, but the contents
are not valid image data. Typical UYVY/422P dumps look like repeated
single-byte patterns plus zero-filled tails, for example:

e8 e8 e8 e8 ...
d1 d1 d1 d1 ...
84 84 84 84 ...

As an A/B test, I forced the parallel CSI IF_CFG polarity bits to match
the old Allwinner BSP behaviour:

value |= SUN6I_CSI_IF_CFG_CLK_POL_RISING |
             SUN6I_CSI_IF_CFG_HREF_POL_NEGATIVE |
             SUN6I_CSI_IF_CFG_VREF_POL_NEGATIVE;

This changes the log to:

IF_CFG=0x00070000

After this change, the captured UYVY data starts looking like real
U/Y/V/Y data, for example:

80 16 80 16 80 15 7f 15 ...

and the frame displays correctly on the LCD.

I also compared against an old working Allwinner BSP for the same board
and sensor. The old GC0308 BSP driver uses:

VREF_POL = V4L2_MBUS_VSYNC_ACTIVE_HIGH
HREF_POL = V4L2_MBUS_HSYNC_ACTIVE_HIGH
CLK_POL = V4L2_MBUS_PCLK_SAMPLE_RISING

The old BSP path is known to display the GC0308 image correctly.
It effectively programs the CSI timing/polarity bits as 1 for
PCLK/HREF/VREF on this board.

This looks related to the existing comment in sun6i_csi_reg.h:

/* Note that Allwinner manuals and code invert positive/negative definitions. */

and also to the previous discussion:

[PATCH] media: sun6i-csi: Fix incorrect HSYNC/VSYNC/PCLK polarity configuration
https://www.spinics.net/lists/arm-kernel/msg771128.html

Parallel Camera Interface Timings, Signal Definitions and Polarity?
https://www.spinics.net/lists/arm-kernel/msg771862.html

Question:

What would be the preferred way to fix or represent this?

Change the sun6i-csi parallel HREF/VREF mapping so that
active-high hsync/vsync sets IF_CFG bit17/18 to 1?

Add a V3S-specific quirk for the parallel HREF/VREF mapping?

Use a device-tree workaround by writing:

hsync-active = <0>;
vsync-active = <0>;
pclk-sample = <1>;

so that the current driver computes IF_CFG=0x00070000,
even though this contradicts the GC0308 BSP/sensor active-high
description?

Is there a better way to distinguish HREF/VREF semantics from
HSYNC/VSYNC polarity in the binding or driver?

I am not proposing the hardcoded A/B-test patch as an upstream fix.
It was only used to isolate the issue. I can provide dmesg logs,
media-ctl output, raw frame dumps, and test additional variants if that
helps.

Thanks,
Andrew

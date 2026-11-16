Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794847456;
	b=WHBVvz5AcGvOZFz56wP68eIgQnEDHX2EmdGtNQaP8EHTFBzsblFaWSMR1hi5L3bG8gta
	 JuD34NUBclvo9Tgln2pVgZzPJA8Q6X1nPyULJ/roQLogehyBi/uo0fyL2jBq3IcCLuyip
	 9p/JK3FdgwUtsPe5U5zqnizsPIb3KGmx/RxpQrxWlnTI7YOQE2xIqckPpx2cTMu9Mh/Tx
	 4r3XjCpgTX3dWsQz/Fi9WXn+/pgZ4t2VZG4aioLSH2FJp/hYOy2JzUyGDTHdYb8ojuAD6
	 OYLxEnm3s9xMr1W43Wt60SxM7mM6QnxCKDixIugnteSGS+w9fE3tNDJ9eH/17JH6L0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=8dvRea7RkLNWOZktMsIshQYmOR+oUMa2n+1hk9YTFeo=;
	b=Rpi1E4T7SnYnXmfsEyRMyHlc5FR3D6hXrWMLevHtuBX/YFX0Sr8Jli8lVntb9z1r/1+u
	 E1BJQQuUf/11nWTuKXWHPAXQEXeX+VDPKJTpSCyDrAa7F2L11ItpdRznVWjh6arDMW4qX
	 bpng9ypyjHa2REwmGaTsgAAtXjQvZjBSwbSWjCho9DOoPxEhq7JsNJ7oiQ2lB5W4W00kQ
	 6ZUbPs4nnnrMUoUVRyV2Lq1nrQ10wHFcUXMy8s27OJJz7d2keXx02q8WzoPh4/GE1CHvo
	 DpJ4tMY9+3nHJQVQvvd6x96ViLiZilBL0INOU45ZuXcJqIykbPUXHbVS2kciPD8pdeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DG8eAeue;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB15606A881
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 16:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AB15606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DG8eAeue
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so1291350e0c.0
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 08:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794847455; cv=none;
        d=google.com; s=arc-20260327;
        b=rWI5ExvUtBoOcKAZON5YYleFBB76wx1m5oVF+OgkdhjUPjb/cK0Acan1luU3EbyGr9
         sZg/LGtJ8i0RBz3OSgnUiY/i0I9gEb7PVs0El3dEUYw1lU2nY1f5dOAznQBj0ZzTfh/t
         Wg0Uh3P0bxhwN3g758MI+yU8G12gS/gmXUrFJVIMZA/xrQiLNr9Oa7lLHrBh8SGJ3cgA
         Ku/KF/gTgom07u5+JjSykgmbLiAn1xjtIse9ZnGhfeCb6K77NFlLOejcfVSTxDhC4gvb
         JqpOXtG+w7BNvTUY2StpYfl3TusE2wB4DRQaIXE/RhwyRHDrdJrJK2R6h+hCQ9WyYhgQ
         PRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8dvRea7RkLNWOZktMsIshQYmOR+oUMa2n+1hk9YTFeo=;
        fh=8mKbxt61qqMgZwMBZaNEjI/MZvXs4lWogfmeiutgWbM=;
        b=a475AljH6ZMBUXsHSq+z+Rg+AhL8v3Bue1gzgf6oBbdCoTGc4wJDBqWyNsBa2sYc72
         UdQpVCfZHVGMfpmvxOEIOo338ba/jp1aq7KruT/L5E5sNWY8VYO0QPpMTGV9qO6xvqds
         wWzxeXkgG1KDk2vjt5tpegPOKPGo+mjLBRp89aeRW4tQ7uXWWuaR4+/5TJtF4Z9K6HTG
         zj2DMr0fSMd+eTz04VVdLl5S6yIcGtAuIlobJOHKpmgdbPvZ7eA4T7D8qcfgd7lTrJFy
         xTFIzcC5MqxuJBVKFwv1M/wRSra3fd1pX0YVEPR/MC+/foDeGJ1oWAMexuEdYTtojhUP
         OKhg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847455; x=1795452255; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8dvRea7RkLNWOZktMsIshQYmOR+oUMa2n+1hk9YTFeo=;
        b=DG8eAeueMNMWj97iXudCtYHIb7YB4W0dV62/4ZI6TxQsFfr9P1y4KuZnkldXYJ/3VO
         mn1FqM23uec7QMkfQ6cnlt2Pep+osHcVYg4UvSCN3OJvs8SkiXS9512DQA6Y2wHRCb7A
         vXuVPacqPqsW0BhB7bP4qMD/NutCMttapyyZNHzhA7mmQpMnMkkTNl91Bz4E1lCLsyLN
         HsN8QChioZ8hoFurYxkiuAXwpfTbS7ke270TAKJWXU3XH1diL0qbUfXteLr6DV9GwLb1
         DqEth23QH1dgHA0/qLS/QebP+nmg5vvIMj/gb2/AtghgQvvmpM6tBfV8uHQMbunetvJq
         ALLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847455; x=1795452255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dvRea7RkLNWOZktMsIshQYmOR+oUMa2n+1hk9YTFeo=;
        b=2UC8fmQa2RDdG7RqDw0wBeGxw1QstVbGIURHbrkxTGflpB6TlBUEs1EMmVqey5Kjct
         qheDnJxkIuTs5ibORVHH4Wz7Pb9Wcytg6PFyqMeBZgysS8JlhfzWdYFm4MLgFmZcBFiF
         ZQryrJnQtt29lrQUmPCb2rlvov15Mbou6qk0WHc5QYonXvIG3RxXosmgB1P3Avbz+ABp
         PuY6n43zT3seck1JeHCmPPiOsGyARixRxwGWz6G4CTRFP7sGPi0hycSjqQ9WAouUXSTn
         OXPvgOMnb45DY/pcWWHlbQ0XqDZFxr3/+TMsi1JIK5GZ5rTVQYCJ9UPwnVMkdf/DvO5I
         70EQ==
X-Gm-Message-State: APuU4Z9eg/Fa5x/ZPILw/KOJYqm7qNYQwIkT+b2I/3tGe/LOrMTm1xic
	68qGRw7NZtDcFESw5ndqeFD6i3Ouz0NcEJcgofWenwJP+zgfpF+xsGwghA93CnX891n5WskYLJg
	d4Ws570BrIMR6M7cVTp6Hs9Qk5lulsWs=
X-Gm-Gg: AYBFou2qGADoMDFVevroIfzJaia8ETIYTagrWiAZZb6lVGbVloep93HFcTLUIF4NEuj
	T9UR+iGMpBSr5FkwHOtZdTOTcwLlNUKtovElMpaflF4edynF8Td+p/yBZDWONDVucSP5l4NdMuy
	Pdm7AussuKGcq2m882ebVsIiQhykuI9wY31xbzVxRfqtynDmZxYj4o0YV7c4EyjCxYZK26I8LkU
	vmFhVFOL6Uo3ojW74jf5BYuRP8Wy7mdEhdLtDvcTRpIPkrhE/KjxS/6Goyf+cYU+b+BFqofdqpu
	58y36vjlM0Vn941FdDfk2OPXFKE3c70WcHUd5QE5PnEulZ0C2HCGPN+g4sj4ii6LU35muRcHQqr
	pjBPvf8zBh30CpouhEY3wImKeYCNMWB2xYgSRd31zeGv+luD3vMJAKq1pjOcpZMuts0wSEg==
X-Received: by 2002:a05:6122:1d15:b0:5ea:b294:f0ab with SMTP id
 71dfb90a1353d-5ee3465027cmr4058583e0c.2.1794847455049; Mon, 16 Nov 2026
 08:44:15 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com>
 <20261026-sunxi-orangepi-3-lts-v3-2-98fef4f75184@gmail.com>
 <CAGb2v65eCotQPfnFsj6XfExs=ybE+xPWMFUhC9DFJRehfv7XAQ@mail.gmail.com>
 <CAH87RzSWDuiA9w8-ZkZXjVmQ_3EbRGKu8dKUzBf=KhNJHZFgjA@mail.gmail.com> <CAGb2v64Fd4ZN7fbTwcz45wK4Sc=hD10gjaVCYgW+HDa8O7W7_w@mail.gmail.com>
In-Reply-To: <CAGb2v64Fd4ZN7fbTwcz45wK4Sc=hD10gjaVCYgW+HDa8O7W7_w@mail.gmail.com>
From: Cristian Filipescu <filipescu.cristian@gmail.com>
Date: Mon, 16 Nov 2026 09:44:04 -0700
X-Gm-Features: AclHuK8dnGWqOScVe0Mt4jfgEl7XJ4HJYdFbZQ9_mRCIbIF03B9UBE-gzV7FCFI
Message-ID: <CAH87RzSJsk8ypdw0cDZzopeUxgPR1VdyiF_sHDLjKYR4AfzWXQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
To: wens@kernel.org
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 7:38=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Mon, Nov 16, 2026 at 7:47=E2=80=AFAM Cristian Filipescu
> <filipescu.cristian@gmail.com> wrote:
> >
> > Hi Chen-Yu,
> >
> > On Sun, Nov 15, 2026 at 3:14=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> =
wrote:
> > >
> > > On Tue, Oct 27, 2026 at 7:34=E2=80=AFAM Cristian Filipescu via B4 Rel=
ay
> > > <devnull+filipescu.cristian.gmail.com@kernel.org> wrote:
> > > >
> > > > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > >
> > > > Add the board description for the Allwinner H6-based Orange Pi 3 LT=
S,
> > > > including its regulators, storage, Ethernet PHY, LEDs and USB ports=
.
> > > >
> > > > Specify the Motorcomm YT8531C PHY ID to avoid early ID autodetectio=
n,
> > > > which failed on MAC driver rebind. Reset the sole PHY at MDIO bus
> > > > registration and keep reset outside interface detach so its configu=
red
> > > > 125 MHz clock output is retained. Use PHY-internal RGMII delays.
> > > >
> > > > Select the weakest GPIO drive level for both LEDs. Enable 1.8 V eMM=
C
> > > > DDR52 and HS200 modes; retain the H6 maximum frequency of 150 MHz.
> > > >
> > > > Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-3-je=
rnej.skrabec@gmail.com/
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> > > >  .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 379 +++++++++=
++++++++++++
> > > >  2 files changed, 380 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/bo=
ot/dts/allwinner/Makefile
> > > > index aa21f58a4..7ea136380 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > > > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > > > @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-=
zero-plus.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-beelink-gs1.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3.dtb
> > > > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3-lts.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts=
.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > > > new file mode 100644
> > > > index 000000000..e2ca41b94
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > > > @@ -0,0 +1,379 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > +// Copyright (C) 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > +// Based on sun50i-h6-orangepi-3.dts, which is:
> > > > +// Copyright (C) 2019 Ond=C5=99ej Jirman <megous@megous.com>
> > >
> > > We now have a common sun50i-h6-orangepi.dtsi file. You really should
> > > rewrite this patch to just use that as a base.  It is mostly the same
> > > across all the OrangePi H6 boards.
> >
> > v4 now uses that include and keeps the LTS-specific additions
> > and overrides. I compared the resolved DTBs to check the inherited
> > properties and preserved the LTS electrical settings, except for the
> > review changes described below. Common naming cleanups are deferred.
>
> [...]
>
> > > Set the supply on all cores.
> >
> > Done. All four running CPU nodes reference DCDCA, and all four CPUs are
> > online with the shared cpufreq policy.
>
> I should've mentioned that since this is already enabled at the .dtsi
> level, you shouldn't add it anymore. If anything, it's the .dtsi file
> that should have all cores referencing the regulator.

Understood on the CPU supply. I have rebased onto sunxi/dt-for-7.5 at
098728144545 and removed the board-local CPU0-CPU3 supply declarations
and CPU/GPU OPP includes. These are now inherited from the common
Orange Pi H6 description. I also removed the redundant ramp-delay and
CPU maximum-voltage overrides, keeping the existing LTS 800 mV minimum.
Any all-core supply cleanup belongs in the common include.

>
> [...]
>
> > > > +&mmc1 {
> > > > +       vmmc-supply =3D <&reg_wifi_3v3>;
> > > > +       vqmmc-supply =3D <&reg_bldo3>;
> > >
> > > Something is fishy here. The schematic also shows vcc-wifi-io (on the=
 aw859
> > > side) directly derived from vcc-wifi (reg_wifi_3v3). I suggest at lea=
st
> > > checking with a multimeter to confirm what the voltage is on the VDDI=
O
> > > pin of the module.
> > >
> >
> > Regarding the AW859A I/O supply, I traced U60 pin 22 (VDDIO) to
> > VCC-WIFI-IO, which is connected to BLDO3 in the schematic. I measured
> > 1.8 V at an RW1 pad relative to board ground. This supports keeping the
> > existing BLDO3 vqmmc assignment; I have left it unchanged.
>
> You traced it on the board or on the schematic?
>
> Can you test at U60? The schematic has two options for I/O voltage from
> the LDOs, and then another from VCC-WIFI, hence I would like to be
> certain. I imagine the SMT components aren't labeled on the board, so
> it would be somewhat hard / eye-hurting to trace the board directly.
>

The Wi-Fi connection trace was from the schematic. Initially I was worried =
I
would short some pin, but I see pin 22 is at the edge. I have now measured
1.8 V directly at U60/AW859A pin 22 (VDDIO), relative to board ground after
the kernel boots.

> [...]
>
> > > > +&usb2otg {
> > > > +       dr_mode =3D "host";
> > > > +       status =3D "okay";
> > > > +};
> > > > +
> > > > +&usb2phy {
> > > > +       usb0_id_det-gpios =3D <&pio 2 15 GPIO_ACTIVE_HIGH>; /* PC15=
 */
> > >
> > > This isn't connected to anything but a pull-up. And you already speci=
fied
> > > host mode only above.
> >
> > Removed usb0_id_det-gpios with /delete-property/ so the common include'=
s
> > PC6 setting is removed too. USB0 remains fixed to host mode. The runnin=
g
> > DT confirms the ID GPIO property is absent and dr_mode is host.
>
> Thanks!
> ChenYu


Regards,
Cristian Filipescu
------------------------------------

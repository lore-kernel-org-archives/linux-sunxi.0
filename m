Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794786265;
	b=oO6RBbG9pZqLg2PBKc+IefAQB25JtY7nBAeW4UGFXYV/ExnsDJ30AhIFOTN0l45dvX2y
	 QMMSrS/XfntYnL/gJ5DalRIzfDDP8XD2E3EZmzKqNdUk7RIsFfy9M2F20QFaQQFk2ezc8
	 VOS6jWlyZQYThukwnHjOoBPhNtniTWvJ9NkS31DclNO2gJOXJTG6hgpj7yMbEPxNzLfZk
	 I1Mk5S1sy/FaezovSsM1rNlszCdWyeMPKuWy77q4CRPes9jQ21cvEHZP2JQk95dp0poC6
	 BgZIikypPUr/sdOvp+8WtOIjffFTlWpHmyHtNZIIrYFL9AlcFIx2UE7O96lLAGbdYVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794786265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=auof1BOxZI/hueJ3qT4KAJwQ5fheSgQUSxA+iFOzg5I=;
	b=0LcTsUuYipX2ZDvq6EzUgV0gMZC/YQZ41dNUuMmJGV+i+7u4EEbisIzs2mQ4llSL2pZF
	 /Y9QYe41DcaSGxlNhyyHlo4OjWptg9KnvToWqnBbGpLZ0YJLxUwNbcJ6/s4W03VLhVjIa
	 6qQ6V7OCjs5xT88Mzk5VSo3Sp0AV2b3iDWL/xu0WF9jno3o65xiaUdfc6YSNr4s3ZUpKx
	 wqEpl29g2eCpXvtkqESENf2Z/GNjNO6AxoffI1PuVWfNdFL42HfUg/72z/z4U6keyxLAZ
	 y0Xe3cbGiLFO0SGZr/aPuQX+qbcc5BCC+CSX1/SdrBvugX8qUUs1Hasv4lQumYWB+gQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QcywPtba;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A134606A329
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 23:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A134606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QcywPtba
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so3341499e0c.2
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 15:44:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794786263; cv=none;
        d=google.com; s=arc-20260327;
        b=sC0tUvPUsL4ncqZ1JPmgsq0YRilZqgriCl11LmdXuifHCUyUymMbWcO+juhhkXpEHJ
         eAOvq/ONTjslbDD4YeNDcLcuz65ygl4Nfm4FrN1j17/AxQDJ1UsgNwDDnJarDKKKQkBl
         q+z3PsH1NTokRjkn+VoW4B0NWXNNtgtRyN+TAMYojY2OvIZEhavITRls/6lXqtvB/6p2
         EmLC4iHxPelPt6tAM0phSOSvysnTNzNBfPHMkfgE/VIiWTbIBmKvy9xgpumzdVO/BT9P
         xMFK3YyiPUtyPdDlCKvME3QIBy86vssLvq9H9YDJ5PWBUxRzxmdzr+jjJwulFNIZ92/7
         83gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=auof1BOxZI/hueJ3qT4KAJwQ5fheSgQUSxA+iFOzg5I=;
        fh=8mKbxt61qqMgZwMBZaNEjI/MZvXs4lWogfmeiutgWbM=;
        b=ONulkhzySQX7bCOl9l/tOl0+kbl87dfPVNw+1ltEkALHMJ3/e3VDmw8XtOxfXH38pX
         FwluWTRWxhvfZmEuu9GgSRHi36VhF/EJHjV/iamgFdrGjtONSxhxAniwyJ3RA8bRL33h
         OPRQwrze1q7SHxnW1R6xVxR7/Nnd77/vCiD9d52Z18Olry84Q3cEz/PJcBlGhx8ZLPZw
         38jknhRQLCjlE9StH0sK/ryPuovy2TdwrmOA3yu3YjHZzYDkNVGlFkleR663I1wTvvjS
         Mp+xsyNKJXaHEM5aYKcvmBcKTyHf6P52BqfbKRKjmb90RgZGT1P99/o2MaZRNrX7Ws5Z
         RHsQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794786263; x=1795391063; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=auof1BOxZI/hueJ3qT4KAJwQ5fheSgQUSxA+iFOzg5I=;
        b=QcywPtbaiPbetHMLqtd/s4ZrGQE3qpngCtTva8ZxXICSEEFfFqLrmQpCDG3mHVxgbz
         Z7TULSLVLNWiba/50q1ldXqiEWpdCHuRIr7hLVVdNKt4D2IN9Q3vPs+OKFLK6TNd76p6
         y96C7biTeNoYOw56vaTnVvsLroqHW41JZOItg5WJX8zJTdZqDo7ifANnhj8kyHblyuSQ
         jd8wM1e82/Xdcl9y0GledcQhRV2g6v3cMaWUdhMQoIVXf5DsSdtT1sj5/88k0btm0vAB
         26TeNgnN/6QhFqV0gWqhHI3quWQoLmavqaJTPgBvn/fdU4URMVtqejGfDgEvEWmvVRRP
         4D7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794786263; x=1795391063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auof1BOxZI/hueJ3qT4KAJwQ5fheSgQUSxA+iFOzg5I=;
        b=VwIVInK2x9xo8MfodXr2OxXUumkjUxbV4DvRbMht7zYpUH3Qr90+tZq+mIQA8yVOlD
         FcL0SJuRTykh27k6GFRNCgz1fpwwuL5SiIb0l0b0iiBlh7wygOFxzOjWX/UqIBf+N7Vb
         JJeeWpJmbqVpoIOW/geVZlwX7PVwa/6O5wcS0G8Q8AMIRJsfFwTXOIo79jIVHd86H29q
         iCKb6z76aTtaIecPK+46kpnh8MZqYuPUGIX9TpML5I/E31wfa/HfO1MGjcVRVdNGo5Iy
         du+F2e03eNp6OTNssOGLEBxrAiUDxaGghYt0YhNGekV/uK1NyDlRNemIIN/HOnR/9BtA
         HWbQ==
X-Gm-Message-State: APuU4Z9oTGDrD4rGmeZW3cBE+qaX06ThhvLUgfdoQjL/lsp21IWPwknY
	h/1bMZGAQzi2oimEVVh3yIsc8TjU5Qhjm1Ht3/YGu7LkfcCndlmPGRj5pTdAr0+OB5rxIHCLe2C
	5UdgMnLekG4VeTCGZ4mVMoTMXqiDnERs=
X-Gm-Gg: AYBFou01Y8A1S/ah0eEuhFH52ZJzOqx2KuoEXZX9xdHesbnax+DAQ2Yw75cwiqq2V9X
	fgq6IsifkNICHAOGQFPUa5mncHz/IDfhKpd5iIKTjwGeaZWnOZMhgxM8NUJ2o4nM6KJL+wHkMyo
	DJ8khtBcPuBCLa2EkFAZBykaoTnT7xiGMTQ4b90eJZLHd3I4EgxPK/42uzKnr0xs+pTCDh34dsi
	vCfqJSyeBxoAtkxovjincVLtR6EuLl1fwEThZyxFj1c7ykEoRR6KEgkLWuM8dJKEI3D5xpHM1z2
	gUOiUV5XRtr4B0ercWHE4MogFtQ4w5LA81ZP+sC6hzV3hRxS5frovwE89eQDPtIP8nXuOslgVec
	45tCNSkKNeDrJOy+Vcnxk2x6B0ezdLxM6H2ayE4DYiQcbEW5HlNpXpmC+ahJZxAYpaqe9AQ==
X-Received: by 2002:a05:6122:488e:b0:5ea:bfe3:6035 with SMTP id
 71dfb90a1353d-5ee34a46807mr3122166e0c.8.1794786263045; Sun, 15 Nov 2026
 15:44:23 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com> <CAGb2v66f5QFECs1L3K1C+1LMXS2KVCVgG_LgAnEuun9YNgHidg@mail.gmail.com>
In-Reply-To: <CAGb2v66f5QFECs1L3K1C+1LMXS2KVCVgG_LgAnEuun9YNgHidg@mail.gmail.com>
From: Cristian Filipescu <filipescu.cristian@gmail.com>
Date: Sun, 15 Nov 2026 16:44:12 -0700
X-Gm-Features: AclHuK_c04QdNpovv9zvqchoEQGN-Z-QnqhIaD68AYr5MCT9q1wPyZvYN5agNtE
Message-ID: <CAH87RzQRJB7yndzT4fAsQX4mV5h8Q8ksiwY2ruc_zUus8e+yHQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS
To: wens@kernel.org
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Sun, Nov 15, 2026 at 3:00=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Tue, Oct 27, 2026 at 7:34=E2=80=AFAM Cristian Filipescu via B4 Relay
> <devnull+filipescu.cristian.gmail.com@kernel.org> wrote:
> >
> > Continue Jernej Skrabec's April 2025 series, adding the board compatibl=
e
> > and device tree for the Allwinner H6-based Orange Pi 3 LTS.
> >
> > Board testing passed SD/eMMC reads, both LEDs at drive strength 10,
> > and five Ethernet interface cycles plus three MAC driver rebinds.
> > Each network cycle reached 1 Gbps/full duplex, obtained DHCP and passed
> > ping; PHY ID and 125 MHz clock-output configuration were read back.
> > eMMC DDR52 at 50 MHz and HS200 at 150 MHz each passed 768 MiB of direct
> > reads and 256 MiB of patterned writes with verified readbacks and data
> > restoration. All reported MMC error counters were zero. Both board DTBs
> > compile and pass schema checks.
> >
> > Codex assisted with DTS updates, review analysis and build checks;
> > Cristian performed the board tests.
> >
> > ---
> > Changes in v3:
> > - Keep green as power and red as status, matching Armbian LTS roles;
> >   default green on and red off without a boot-stage sequence.
>
> The roles should match the schematics, as the hardware vendor specified.

Agreed. v4 now inherits red PL4 as power/on and green PL7 as
status/off from sun50i-h6-orangepi.dtsi, matching the schematic. I have
removed the Armbian-based rationale from the current revision description.

>
> > - Select drive strength 10 on PL4 and PL7 with per-LED pinctrl states.
> > - Move PHY reset to the MDIO bus, before discovery and outside detach.
> > - Specify the YT8531C PHY ID; MAC rebind fails with early autodetection=
.
>
> Why do you need the PHY ID if you moved the PHY reset up to the bus level
>
> ChenYu

I have dropped the explicit PHY ID in v4. Generic discovery now
passes five interface cycles and three MAC unbind/rebind cycles, both with
and without temporary PHY-ID logging. Each run reached 1 Gbps/full duplex,
obtained DHCP in all eight cycles and passed 24/24 pings. The initial ID
reads matched 4f51:e91b, and the configured 125 MHz output was retained.

>
> > - Enable 1.8 V eMMC DDR52 and HS200 after board testing; retain the
> >   existing H6 maximum frequency of 150 MHz.
> > - Shorten the descriptions and update validation status.
> > - Link to v2: https://lore.kernel.org/all/20261022-sunxi-orangepi-3-lts=
-v2-0-70b899252c6a@gmail.com/
> >
> > ---
> > Jernej Skrabec (2):
> >       dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
> >       arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
> >
> >  Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
> >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> >  .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 379 +++++++++++++=
++++++++
> >  3 files changed, 385 insertions(+)
> > ---
> > base-commit: 4403278e4ea2f654f8130a5c03eb8b4516a0f201
> > change-id: 20261022-sunxi-orangepi-3-lts-43b92246a8ed
> >
> > Best regards,
> > --
> > Cristian Filipescu <filipescu.cristian@gmail.com>
> >
> >



Regards,
Cristian Filipescu
------------------------------------

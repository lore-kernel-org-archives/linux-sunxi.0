Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793999327;
	b=nPm9jI54Fi1WXcnFAjHb0VvhG15qbxah+ctC8qnb9Li7dmQEvqm69sYKTIyKz/K6+XZN
	 0xJnXF5TaHeDUqyQFzSSsUYnSfcklbbmsuZMRokl22FcEB6baNCKCuIgNQFPuDbxt80tf
	 bBYvea3M6dVjhSINmqbwo4RGim/he0KiI75gi3I0wPC3HizYoVaQo+fSMP7x1macULzdq
	 uWVydyOoyKKuMo7sYhVk0VA8SACpNvzK8aV/qpsUNxiGY5YfoQItusl0K/tgySHQpvgeJ
	 UEs4id8JXDNPb7npJVRywgMLuedwtWM61GmlPzlRKXcwo8WTGdN0vRvC53EeQ382HJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=qGG8oGrrJLldZvlh0Urj7gU0vRB0ez6rdNJ54mOMWZI=;
	b=BTDHcbWHXL+nFgIkYKXT+Yx5F9fdXslXmIVu5Axy89frpBuhT/Y+c2xHO1+Wkg236q6n
	 U/KZQku38lMcooeIvD8EFA7To+mPS0wO+wj8lAOWekWd2AyRQe0RJUekoLL0bPIWZSfWW
	 UuYy9WXOcoTD4qa8o1/BThV9S+y7uTcPeMrXDBp4mFZi/xvjhwTRRu3udyIsvXJxh95Z0
	 jc/utxtKFiuTUwWiKNeM4Ad1T1Fu7V8pxqwY2PSgu+iwPDsVIwHF7/AQLU1yWiPqcSW5I
	 E3Ye246wQtAl8gIaB/d1dwww7Zs8/ZmpZDl7FjcjHRZEUAL64T3HpmeJ3YHwueKRxhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="piBC/y43";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E114606A329
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Nov 2026 21:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E114606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=piBC/y43
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c434376dbebso14060866b.1
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Nov 2026 13:08:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793999326; cv=none;
        d=google.com; s=arc-20260327;
        b=ORaK+hNr1XfU7gqCv5bH8zdkf9HyUZeW178EvX2oBvcf7t8C4ZEdUK9/RYdthOQH/P
         M34HVY88/+sz/MVIHSrMgoIWd0VXSWgQeYSm1RQPzxoSFr+wdEXQVbQBv6E7szKlzxI6
         3h1C6cMzHZjH6VU2P8wMJwhe2gOFRaM6Kly8Zc4loCv7KuBQZbLO6oAXK2HbOiycofS+
         l5kj5XOywD4CVDcEB7+ZsCiRqTNmsDMbYFyHPiuQyYuodzVTxrrmNgtR+CARaBxTzW02
         QtzhzBhjJm1hHt4MotEPagPZP+XFL6bW+GVXn6XNfn0b1AMW41CQFYNytSTzxsaH43Hd
         RLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=qGG8oGrrJLldZvlh0Urj7gU0vRB0ez6rdNJ54mOMWZI=;
        fh=qpp/+jq+Xxlo9Vw0BpjKBUDz26lpreCv3Iyc9wiyAPU=;
        b=iT9GBVHD69pTdoX8SIwbJ4yEpP3i3SUjBdosIPv5GHLk0NC3m1zbm1QZNFY7uDH1pf
         Vo7zOb2yR++wjhTYDCWIZn2b1daCmllnIEUzmYWgc99vumNOJL0eQmPa8814ILbvyp4p
         C/jV/BfCH9zuJOo5NV5nz8Ikco9H2mlsSmKbiA0ykmcINquvUbWol6EvGJFQpK9adJux
         95L59/hTwhecVFFjFFbJqclFEYOsp5NOVmPdF7c5RSnW0+fwYFMbgCpXKxtHi2uVyV4l
         W9nGsgujTbZ2s4S3iTEL/tO7bAOc2QbJ2+c4CxEiR23FcIJ/21pPTX14JYSV4Ti7EARt
         Gz8w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793999326; x=1794604126; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGG8oGrrJLldZvlh0Urj7gU0vRB0ez6rdNJ54mOMWZI=;
        b=piBC/y43qA3qO0qDJtOZIhAS2wTcekimzASMMmSEsNH49IedMAcd8pitNFGifeaOz4
         o6UTANC2pXL9jce0SIAk/+n61CrMoiEEYr6JImJLbP2fUIvWaonvpguNxE6tFBZ8Pe8p
         ty48plf/jJQkFNE3J1xNqYNtPltR1XciKBRaBExg3AEBhQBF31BOC92heikLqI7eKHj/
         f9u4H+QhiMKp76OsGwO1DK/wSAybeBSNBblFTFVj8N6PJ9CVh5DS4m8Jrm7E1Z194kO1
         /NR02KK8Bmu+sjCde1+bgm9TwZrotBuBlVwkoa0HPsMhlOemMgD+iU7P965boCYtyg27
         TsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999326; x=1794604126;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qGG8oGrrJLldZvlh0Urj7gU0vRB0ez6rdNJ54mOMWZI=;
        b=rwD4YjSsi9F6TKZC6qnUjj4mYwCcwUM2D6raSyjg4CVHOSWbnYMjZIiE+kICapU/7i
         0tpbf8Vu8v3Vu9wRQBgpxydfaaBgOuew6WA4/7mAiJP0ImhTXLeT38tKE1HvfesoSUaG
         vAFGyYppXC5yBgKaDIUDM3iTO71Ins2acSJ4/NG/PXd5zPEppboJdRnNig3/2G7Ewfho
         xLeYltCkhLyZEjParxOYRHsjQxdMSnywS5jOTOKxgoL51GPmlu4wnEyQeXRb+Iu0zShl
         VEj4t/456zrrSn3HMyylXvKw3UDA9qVku+L5HEoEZsHB9SVhJM6/PBNgoL9euh6GWeLC
         6L+w==
X-Forwarded-Encrypted: i=1; AKwUvBwDAw/eJnuNsK4alGMcqVM7ODLjgClcpZTNY8/6+Qgl+fktepsZ2jKKI/UVm9KEmexSeF5lL5drQBJMXg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9UFFMnzOtwZOeDhNzMS+71Cuj4uF/xVsRpuuUJuEMhdj8uYwfr
	0xgpeUeI+B2N46Uksokeh9PVN7auBovbgofPVqM3VRTYKgsIHGcVPfqxMezGGOXZ/QhpxaErjpp
	q4pi315AUoRch4aM4gexaR9gyLkSphQA=
X-Gm-Gg: AYBFou2ztiVtmQPgzDlYbAtr3G/yMpIPrg9tzwI3glrq9k3H/JebIIjYB3aH6urYkST
	LP8eD+FM2rzj8rGWXIPGmMkN9c9qH+yp3BmZq3XL9as1AKMUmE3BTntS1Xj7Dzx9C00vrGR6VNl
	LE+22OF4qKShDJmP8P/HFlY9uik90qLpYGVL4OXL9x/HZ5I5J2S2w9bY1MpSFOEbsCaFVwHxVp+
	63WXo5lCtJ75cZa6lpV3bRKdgglRipShmS4RynAnHJyklRyEmyBP69Bw+ri3IfG/xYSJXCXHS6G
	TOmRlIsvbdfbGssNszfTaSTbBwT79E1VL9a8MkoJk7FmASs9cI+UpEH8rFjIA0wpd9WI+jViAkj
	gnGY+H4e31bh8k/HcyxoXokt9CpLyWISJKsmQj1mb1BoSitcWkg==
X-Received: by 2002:a17:907:5ce:b0:c42:bc58:f21 with SMTP id
 a640c23a62f3a-c4d524de677mr9637766b.15.1793999325372; Fri, 06 Nov 2026
 13:08:45 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Sergey Kacheev <s.kacheev@gmail.com>
Date: Sat, 7 Nov 2026 00:08:34 +0300
X-Gm-Features: AclHuK8gNSlyHOq3BH0lfB5PLWaS-qptjYfSCBSSXzK_ROJ0rOwb8P1w1O7g2js
Message-ID: <CAJVhQqX3Yq=TO5b+KW2R3nipk0-zx-wKL6jSP2SNSRZ++Ro2EA@mail.gmail.com>
Subject: [REPORT] Cubie A7A: RGMII CRC errors resolved by changing drive level
 from 1 to 2
To: jbrunet@baylibre.com, netdev@vger.kernel.org
Cc: andre.przywara@arm.com, andrew@lunn.ch, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I investigated Gigabit Ethernet CRC errors on a Radxa Cubie A7A
(Allwinner A733, Maxio MAE0621A PHY).

On this board, changing the RGMII pin drive setting from hardware
Level 1 to Level 2 eliminated CRC errors in repeated tests.

Environment:
- Kernel: 6.6.98-5-aw2511-srv, based on the vendor BSP
- MAC driver: vendor dwmac-sunxi / stmmac
- PHY ID: 0x7b744412
- Local backport of the proposed Maxio PHY driver, with the vendor
  EEE-disable workaround
- Link: 1000 Mbps, full duplex, autonegotiation enabled, EEE disabled

This is a vendor-kernel result; I have not reproduced it on mainline.

The relevant pin group covers PH0-PH15. The DT change was:

    allwinner,drive =3D <1>;
    ->
    allwinner,drive =3D <2>;

The BSP pinctrl driver labels these settings as 20 mA and 30 mA.
However, I am deliberately reporting hardware drive levels rather
than treating those labels as verified electrical current ratings.

The A733 User Manual V1.00 documents four levels for PH_DRV0/PH_DRV1
(sections 18.14.6.99 and 18.14.6.100). Section 18.14.3.4 describes
Level 1 and Level 2 as enabling two and three parallel output
branches, respectively, reducing the nominal output resistance
from r0/2 to r0/3.

With TX delay =3D 8 and RX delay =3D 10 held constant, repeated tests
showed:

- Level 1: CRC errors with pseudorandom Ethernet payloads and
  ordinary TCP transfers.
- Level 2: no CRC errors in the same tests.
- Returning to Level 1: CRC errors returned.

For example, a 300,000-frame pseudorandom test produced 141 CRC
errors at Level 1, zero at Level 2, and 61 after returning to
Level 1.

Payload choice mattered: fixed 00/ff/aa/55 patterns did not expose
the problem in earlier tests, while pseudorandom payloads did.

Validation at Level 2 included:
- 4 GiB of bidirectional TCP transfers before reboot and another
  4 GiB after reboot.
- 600,000 raw frames per validation run, covering frame lengths
  of 64, 128, 256, 512, 1024 and 1514 bytes.
- No CRC counter increments on either the Cubie MAC or the
  connected switch during these runs.
- TCP throughput around 111-112 MB/s.

A separate TX-delay 8 -> 9 -> 8 comparison at Level 2 was also
CRC-free. The small throughput difference was not sufficient to
establish a meaningful advantage for either value.

The persistent configuration currently uses drive Level 2,
TX delay =3D 8 and RX delay =3D 10.

These results are from one board. I have no oscilloscope
measurements, so they establish the observed effect of the drive
setting, not the precise electrical cause or a board-wide fix.

Would Level 2 be an appropriate board-specific RGMII pinctrl
default for the Cubie A7A? Also, is there an authoritative mapping
between the A733 drive levels and their electrical characteristics?
The BSP's 10/20/30/40 mA labels do not appear to match the GPIO
current figures in the datasheet.

References:

A733 User Manual V1.00:
https://gitlab.com/tina5.0_aiot/product/docs/-/blob/product-aiot-stable/A73=
3/Hardware=E7=A1=AC=E4=BB=B6=E7=B1=BB=E6=96=87=E6=A1=A3/=E8=8A=AF=E7=89=87=
=E6=89=8B=E5=86=8C/A733_User%20Manual_V1.00.pdf

A733 Datasheet V1.01:
https://gitlab.com/tina5.0_aiot/product/docs/-/blob/product-aiot-stable/A73=
3/Hardware=E7=A1=AC=E4=BB=B6=E7=B1=BB=E6=96=87=E6=A1=A3/=E8=8A=AF=E7=89=87=
=E6=89=8B=E5=86=8C/A733_Datasheet_V1.01.pdf

BSP pinctrl driver:
https://github.com/radxa/allwinner-bsp/blob/f9a496c24bf6b7cc31c4b5c716ece58=
b2c287f01/drivers/pinctrl/pinctrl-sunxi.c

Best regards,
Sergey Kacheev

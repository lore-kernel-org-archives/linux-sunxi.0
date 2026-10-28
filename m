Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793178300;
	b=CPdpsBH2eB6m3Orxy6FGChGlN07Isltt2mIKo+uK9IZfce0Nk9D7I43ZpgqgrgymwIEs
	 Ehdg5NuWhlnPgif5ZmImtm+6m2KI+wBaLItnhbWu9JA9uvuEHApKTfX28/ELbCuC1Sf4w
	 86D+uAagOMigmfX5pUSE9skcuhxWWTmGVbcZ3MIr+NEoKi1bRAd4HzZuE4vuCOiMHDrq9
	 FnEEHAb2y6UoHHQbD2yiW9DiHQhOQ0ZJ3zk5X+wYFStCqWzW8vaB7dsELMaEmt6zmIURQ
	 Js/bsgqp7wWiMgIhIKTpXd3erCMZlWyRC2UAyw4kffcku+up+c3s5Al1ByMiQQPmA2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YMPvQ0y2/UErW4qcLjewTviEOS5UzV5x/LnfQYGS5D0=;
	b=zqOsf0dL4LufVcqmcliXqlhUXlFKFhlPz0SVIKYFluV2cXXn/AbdCUk8XtQarD8oo7wp
	 nlZ4H6SPQqJS81dTejqSv9QVotjUPNL4IlYOm3fjEwq98ApOVB3HPqaz6FpD2s+pJtwTT
	 2fCUBh0dU2jbEABTkj49VG9aLaSwTOIDoKFzPLxxrBtXzfWWWj79WzHpR83NMiqnl/M1L
	 A7WVs0CO8bmONDdWFbY7Fc3E/XIxONjHwKUAn5m3YO3nlVahoQAUeJmlyrr/MfoWtgeoA
	 II7VaWIjSF2AGSidfzDFHTtkOh2IVKBAjiMiwIam7LhObP5Xv5lvXZND0kkyrbyVi5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YsCTot0N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23246606A31A
	for <linux-sunxi@lists.linux.dev>; Wed, 28 Oct 2026 09:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23246606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YsCTot0N
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so1536415e0c.0
        for <linux-sunxi@lists.linux.dev>; Wed, 28 Oct 2026 02:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793178299; cv=none;
        d=google.com; s=arc-20260327;
        b=T+5FmyWFoSvVvd2aGS9R07pE+agaYrNgv8p+yoIwteBF8tSQXcK9Rv0BaFcTstbQ+m
         GwovWAFQTbfMr81E2XsrGexFy4rpUK5z/Y6rTq60uIVKTkpbKIyyzzLQFtFqPebSv8aY
         X/NwQbQAx9iRIsmdzvo9OcqxcyhckWJyXGa0NbMM3cfYESGtJhPozD0evRT+EGwxKHeq
         Gf/8dj+j3gKUnmVXwZTW+Yxf0m8sCl7QsM25cBjObt/qiaIdwjkrsHW6UyU7GbNQgfC6
         EDOmMi5z44OdyE1i/7JmmkaKhC37zkI/0NZIjyVNncMifAo+SEFsEVYoUiPw7jSlMZBM
         xfeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YMPvQ0y2/UErW4qcLjewTviEOS5UzV5x/LnfQYGS5D0=;
        fh=2KEEaWqYF9QowAFyiy63pJlee0ut4iCTTxULkrSiG0g=;
        b=OyvoLkxzarX2HArKFWvLc1MagRe6FTdt1CLFTzVesbeBF8NPB0HS2WeESXTAdWBBeu
         Ng8XXjdfSo96r1wc0WKsj2z566tCgrYTLqCorAfm3nKx5Q7a7ZWFyfYSKbyifr1whe8R
         ufLpjoQbWmDOMfemEkPUgrlJ4nt8c/2xizaEIGPUvuJRP3jUVxOvAHZTLqR0CqHIIenW
         vwgi61TgM2bx7lVka4i2msnoW/KRzktjviD3gl54UMI6fPJ1MpHDzvXdeiTJCHKikGw5
         2si4u/SdTOcVLS6I8r5YYp7e4BCcSjhdpX6EiyxyUahdg+ZeKQ0ASbvuHpvg/k3lf2FX
         IIpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178299; x=1793783099; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YMPvQ0y2/UErW4qcLjewTviEOS5UzV5x/LnfQYGS5D0=;
        b=YsCTot0No5kdreAxItghQoOKqQZxvLT2V8NFUJ474l02IzKXYwtvxQSRgUURZW8SIA
         N92nu4AqWsicOuVGfr3TY+zWWA+EZkEzWQKhNvwRB57iAN22zQlzYVrny8xgLi9DXg56
         ClWmq9uBj7IwlPGr187iny1EkkWOsy6og7S0HEjHeLGJ/RQhk1Zr9A7Be1l24zyHON5L
         EAh2yj/iyPk6oRsfzZp4uvusBrQJ2LNwxduFwufU9yj/5EVbfXNckmH/Yy0dPCU3w4iX
         x8VDQTFDuDTDaY7tjcHM4pGORX2vnFUCbFwr9Tn7wovoZ5d3aZZ9T5BYhXqNyXM19GWq
         XM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178299; x=1793783099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMPvQ0y2/UErW4qcLjewTviEOS5UzV5x/LnfQYGS5D0=;
        b=eiCSuKySknkkCixxNiZf2MrVTvbYSpakz+klKBBhjMILXjesba9gabfLUN4u/7YrjP
         lLKtIvXeZOk37lA/uk6V4aZ9PZR2Y4Wu7TlO/Rda3ObYk3/NMJDp/TktNCU89zKL1MWC
         XQZ9ocW+7r8r36Tmi+uTKCzyKpSmARlxvJWURUKhog8+5ipu12QKbYT8sHjG6SEk1HZo
         i/i8OfrPzfkRYVJ+o7RjMHnVp3Orbqlp+5o8wKypLQCrxiC0SCw52M7TOITamqkwzK5e
         Vu96wITCCsKCYmlQXVVuHiN9yZsv2Whi7duV/WQSqYigSNIvmyUdqOp92SetNVteFpSG
         x96g==
X-Forwarded-Encrypted: i=1; AKwUvBxsFjQDsFmWVwOSk/FZ6PH1b99mvrLtVvQ/dhMVfNcELXVFAM1hG60I0eVtOE3bGVFUwzdFsOJf8nt3ZQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLFOQg3xVL/tXkOwVWqzkwZyTOOCMUqEv2+2qvYDjliOZ9wh0eK
	nrj8O0A7Sk4R9DQy02yLfLwRx8LeCenczI7AQw+FbqKtbX4DxurFL/v3VpbPFcXrEzUXULXfFWx
	tCX0HVCdbHCcJHZi04222hIF8VT5IojU=
X-Gm-Gg: AYBFou2kUodYKMTZ6Hkl9O0J3T7l/MvweHVh8loYgou3+a0No4EJUbo0Sl5u+9EkPm8
	SL4J4CC+eDclv7wnjL+NRfUJ/upXW3LUc4/QwN6hA8bAoQLtsGHBoyfn7rTUprxsDtX1+4y2+uu
	FqkP3hByoP6d11mbvSqspY1lCQwIH6gwVAjLgBJkBb3yi4FVWWwYlmJiCKOz7GcPOsqnY8urSEA
	LqgpNHP8atvRHOXb6uJ+EhrFHgqcBHJKJtHCUMZCWwJyCFsHfznyZVihpRO7wRAVz9HZp9+6rOG
	8i5ZfHzUZJPMZcfL5Up8ZBShbbSThMA7a6hJoq09FbY/03twNs2qpipYMV2VqvPmYHnnJAjPZPc
	zMVNHpQI1xgIvIBFtjBJ8KOmommx76HUbhwLlMw6enkCkZdv3MZOqZ/un4pcJPzpzntw9PQMN6/
	VBq6AbX742nJ1na3oOVTO4VGPCnLOgwKdnRt2GTinAmFdZnfixmgCjNEmtYyAW1XWKHQHyScz1O
	2PtzsIHOmRp3DapiWeBIKlbuw3AjA==
X-Received: by 2002:a05:6122:3a11:b0:5e9:5e79:aa5 with SMTP id
 71dfb90a1353d-5ec4fffa0b3mr263672e0c.7.1793178299127; Wed, 28 Oct 2026
 02:04:59 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com> <10f350ff-8f82-4a3c-beea-4a02d0d179f9@arm.com>
In-Reply-To: <10f350ff-8f82-4a3c-beea-4a02d0d179f9@arm.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 Oct 2026 03:04:48 -0600
X-Gm-Features: AclHuK-gFIc4OLdQpz2xuDakOfWjCmV7F0pKVxznmCh4UQXGFX7ZPx8S3KT4ikY
Message-ID: <CADvTj4oSo7gXsqoLndTChgC0oaUGB9SB-4B4a1gEkx6XDFD7Tg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] serial: 8250_dw: describe the Allwinner H616 UART configuration
To: Andre Przywara <andre.przywara@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 2:57=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi,
>
> On 10/28/26 00:05, James Hilliard wrote:
> > H616 has 256-byte UART FIFOs, but lacks the DesignWare component parame=
ter
> > register used to discover their capacity. Its debug-divisor and RS485
> > registers also overlap offsets used to probe optional DesignWare featur=
es.
>
> that affects almost all Allwinner SoCs, not just the H616, so should be
> solved universally, not just for one SoC.

Some Allwinner SoC's can read fifo size from a non-standard
register from the looks of it.

This approach at least allows for just adding SoC appropriate
compatibles with their fifo-size tied to the compatible. Or the
fifo-size can be pulled via that FCC register on the fly and
reuse the code paths here probably by tying that logic to
the compatibles as well.

>
> IIUC Chen-Yu has a patch to attribute the right FIFO size, in each
> .dtsi, which I consider the best solution to this problem.
>
> I'd say we wait for -rc1 and then work on top of his patch.
>
> Cheers,
> Andre
>
> >
> > Add an H616 compatible for the integration-specific setup. Keep the
> > existing 16550A port type and describe its fixed FIFO depth in platform
> > data. Use common Allwinner helpers to configure the transmit load and
> > receive thresholds from that depth. Configure automatic flow control,
> > preserve the BUSY-safe integer divisor path and keep the UART gate enab=
led
> > during termios changes. The H616 configuration uses PIO.
> >
> > The series first introduces platform setup callbacks and a shared RX
> > trigger conversion helper, then adds the binding, H616 setup and SoC DT=
S
> > changes. Based on tty-next at 6b4b543fa187 with the posted RX
> > trigger callback-lifetime fix [0] and DW BUSY-safe divisor fix v4 [1].
> > Platform setup runs before installing the BUSY-safe divisor setter.
> >
> > [0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifeti=
me-v1-v1-1-731b78d5003d@gmail.com
> > [1] https://lore.kernel.org/r/20261027-submit-serial-8250-dw-divisor-v1=
-v4-1-41714a75e15a@gmail.com
> >
> > Assisted-by: Codex:gpt-6-astra
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes in v4:
> > - Introduce common Allwinner setup helpers with the fixed FIFO depth
> >    supplied by compatible-specific platform data.
> > - Rebase onto tty-next at 6b4b543fa187 and the posted DW divisor v4 fix=
,
> >    installing the BUSY-safe setter after platform setup.
> > - Use an early return for FIFO-less DMA setup, following Andy's review.
> > - Default to generic setup when platform data has no setup callback.
> > - Select Octeon's optional-register discovery with IS_ENABLED() in its
> >    setup helper, preserving the existing 32-bit and 64-bit behavior.
> > - Extract the shared 8250 bytes-to-FCR conversion, including the
> >    unsupported-table check, into a preparatory patch and use it for
> >    H616, following Andy's review.
> > - Set the fixed 256-byte FIFO depth in H616 platform data and omit
> >    fifo-size from its binding and DTS, following Krzysztof's review.
> > - Precompute the Allwinner RX thresholds during setup and retain the
> >    sunxi FIFO-depth helper for filling the table. Use named FCR encodin=
gs
> >    in the helper, following Jiri's review.
> > - Share threshold-table initialization and callback assignment through
> >    a sunxi RX trigger setup helper.
> > - Group and comment the H616 trigger and RS485 setup.
> > - Link to v3: https://patch.msgid.link/20261024-submit-h616-uart-fifo-v=
1-v3-0-286fc1b8c3c1@gmail.com
> >
> > Changes in v3:
> > - Introduce a platform-data setup callback in a preparatory patch,
> >    replacing skip_autocfg and preserving the existing Octeon setup.
> > - Describe each H616 UART's FIFO capacity with the standard fifo-size D=
T
> >    property and use the value already read by uart_read_port_properties=
().
> > - Derive the Allwinner RX trigger thresholds from the FIFO depth.
> > - Use an unsigned trigger index and conditional runtime PM guard,
> >    preserving error propagation when the device cannot resume.
> > - Rebase onto tty-next, replacing the earlier DMA prerequisites with th=
e
> >    posted RX trigger callback-lifetime fix.
> > - Separate DMA enablement into follow-up work, retaining PIO operation
> >    for the H616 FIFO configuration.
> > - Link to v2: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-=
v1-v2-0-af0593504635@gmail.com
> >
> > Changes in v2:
> > - Keep PORT_16550A and set the FIFO size, transmit load and capabilitie=
s
> >    during setup, following Andy's review.
> > - Select H616 setup through the matched platform-data pointer and remov=
e
> >    the type and DMA burst-size platform-data members.
> > - Use get_rxtrig/set_rxtrig for the 1/64/128/254-byte receive threshold=
s,
> >    with port locking and runtime PM around register updates. Keep the
> >    standard half-full FCR default, selecting 128 bytes on H616.
> > - Advertise UART_CAP_AFE so CRTSCTS enables hardware automatic flow con=
trol.
> > - Rebase onto next-20261023 and declare the posted sun6i pause/lifetime
> >    fixes and their prerequisites for DMA enablement.
> > - Link to v1: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-=
v1-v1-0-e4a3bae2eba8@gmail.com
> >
> > To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > To: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > To: Jiri Slaby <jirislaby@kernel.org>
> > To: Rob Herring <robh@kernel.org>
> > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > To: Chen-Yu Tsai <wens@kernel.org>
> > To: Jernej Skrabec <jernej.skrabec@gmail.com>
> > To: Samuel Holland <samuel@sholland.org>
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-serial@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-sunxi@lists.linux.dev
> >
> > ---
> > James Hilliard (5):
> >        serial: 8250_dw: select port setup through platform data
> >        serial: 8250: share the RX trigger conversion helper
> >        dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
> >        serial: 8250_dw: configure the Allwinner H616 UART
> >        arm64: dts: allwinner: h616: describe the UART integration
> >
> >   .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
> >   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  12 +-
> >   drivers/tty/serial/8250/8250.h                     |  16 +++
> >   drivers/tty/serial/8250/8250_dw.c                  | 138 ++++++++++++=
+++++++--
> >   drivers/tty/serial/8250/8250_port.c                |  12 +-
> >   5 files changed, 151 insertions(+), 28 deletions(-)
> > ---
> > base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
> > change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
> > prerequisite-message-id: <20261027-submit-serial-8250-dw-divisor-v1-v4-=
1-41714a75e15a@gmail.com>
> > prerequisite-patch-id: d8219673210dac82d3adab41578ff2f76f5862c9
> > prerequisite-message-id: <20261024-submit-serial-8250-rxtrig-lifetime-v=
1-v1-1-731b78d5003d@gmail.com>
> > prerequisite-patch-id: 9a9395c715c2bf7bbcae5bdd16a339d7f2af6269
> >
> > Best regards,
> > --
> > James Hilliard <james.hilliard1@gmail.com>
>

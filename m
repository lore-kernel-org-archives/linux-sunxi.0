Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792768376;
	b=3G0pG6oFjvoaPTkYYlOHKLQCyFhqU28jVNQcpnuYzCdJV848dEROrERiE0JdJ/uZQkRp
	 Fvj7YA6DNzzSrSlLMUqu/RhcENlbFVFTPPHH7QET9hgis2yi+DOJwPr4CcmM6rnay9aKV
	 Ww21jZxJ07TKiV7IE0CCiIVjxHo4Tzp3KJbaczQo08XY6zN6bhK3I3wstV6EWdoli2kN2
	 AfWc2JmOLu0mJgHBIS6vyQN6KZkf7Im8rqnBimL9QRBq5KqiMiH0aGcyvlNCiAUjmA4T3
	 JYvPkOka+IHUVpWCEtiRNIE7a2Iya53rBGehQwQ6sbtbaajZNJeFGQ9aMyKst9dz7Zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qg7iB6bscMTGZD77CGgbdOimAao7FC1LowqN4FOrg2M=;
	b=LAxEykc2gTK5seJ8X1+qZEwnyd5o1kEqzBoFvYDdOeZ3yhlRUdROnxFDyoxFFrWtc2Xj
	 aU/oqBtZYYZ41MvO345o8inh/6IDQkUMlDRespv4Y22HdLKRKZm66J6wZE3yyBWIBwO+5
	 PPV33bV/eGuyF/Tl8RWTVgqs2r9BoGjT/CjLerPScQQWxOjnmBptVidCcsx2KCzkpUIgj
	 e8RYiGXCbfdoLF6+ExaEMzhufgL+PwabDkI91m8EA9ehHR3ejzcVhCnP2SUk+LATS4Nii
	 PYdIWz+bWE6ZhfKEcsAJayfxO0rUhWO+De52e2+uEN4VnV+YSPGT51+7mlBZ4Q84gcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XEYFFjny;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FA1606A31B
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 15:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6FA1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XEYFFjny
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso142759066b.1
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 08:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792768374; cv=none;
        d=google.com; s=arc-20260327;
        b=jPtK30SvJH7GVhfPjllYXCxp+X30V2Ldmh9yDmOWOtnLLAUJbexdpye0EvBe2Cizmr
         ogcIJfy5her3rsHBavejbQxNq5JEb43PYSkvun1qnyEIu1edW5rlkoM4bPXlPKYo5lQ6
         WHXiwDrzvpUB69kMZ8HDDzag5e8SIp56MdSfce2PjuWSy/1t4M01mciemyvyH0JFca9A
         38a94+iolSD8bPDzkEnTV6ci7xmVE9DS9c6ywEGcSukyKa8Uwz/KBian0tV71EEDHVHa
         LXvpwO+jXPNP1iIJm+tYvpHIE3XlDpX1lfRxlrSPKpb8gf68StJeu6B7RM+Pmbeyl2Us
         xinA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qg7iB6bscMTGZD77CGgbdOimAao7FC1LowqN4FOrg2M=;
        fh=NyBARPCBw/CSTi0WK5LSctoa3kzLOQKm63lsNhl4jMw=;
        b=BptDsjtL2gAdFyE4RyAT1UOXhvwSWAhgevY6qdDlpEvgkl2AYd8pp8k3uBxV/X4j/A
         /o+ClLjWF7/9gYkBYs7t5n9y8i4IReY5x3Q/8bXtVUA6MRcl3arQqwpHSufukLT7DFjF
         hrGWOfpT490ghM/Zo/AEUkHgIC/pWrXCl/apxMKNmZT0mSsXKC+ZQZm98xDXHWpqttq7
         CpB6l/peUCIdJCEM2QJE4EgAEAmTpFLohPqZ2shNqtEsrB9oMbr2Lr2RJ63T0QivoCpn
         YOdxcpu+PrY1zvgQkUPkSzxBIyGhPtjUXikQH6gLZAQWLiFTRQRnseDIL0urDeSKlZ/i
         L51A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792768374; x=1793373174; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qg7iB6bscMTGZD77CGgbdOimAao7FC1LowqN4FOrg2M=;
        b=XEYFFjnyf6A555AszqLzooA/5lsv4RMxLxlNRgWYwmRnhA393wbh+QFw8T0HFsYwA2
         NdJgu74ZaS7qIEjwMLJDT3uk11+ZYQ3EWJwnA1fvlwKAt5ExKLeqodZycUB0C38TNSOX
         gA3hvsTKxby2HklApK/U46z4wqNzuSUixMdeAOPePI0dReo/GACRu7Zyw5Bw4a2u+QrG
         AZaKD/yWS4TH1bpBO5EmtxooreYxYH39l9+DsiXKL+C+Ua/FQDP911yFom8NEbEkmhEG
         WjFXYXooJyJWBNVMz/MgtAOiVvE3VklYYl0lWFpy4wcx/Bea5OTQt9etkNeQgsEHjhHJ
         jA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768374; x=1793373174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qg7iB6bscMTGZD77CGgbdOimAao7FC1LowqN4FOrg2M=;
        b=lQ6qx2Ux9HacxT6/ocZKK3reLFvphcRh9o5SCPG9rT02bmEbFuh4gkKiaTsulL6zQp
         kK6tRVms7zVyr+RAvq0cvKTwoBgoFHfHXckOjqromBONdHFHWqr+edpOcHLZ1p4Fv6mh
         tCzpkm3in6lP9DqkgPYEVLb+hhdZNSqd24vwIhgfAagD40vC5iWvoZ0Y1YO2GTY6Huve
         TOWrNfrj5jWfsdhpiwiSrFUlkEY5sAj5qOBhQhcQirchWmwS7n4WAvO8a4MUtRIzVsnH
         /lC92sVLePM3D0v5BGkpGLzCu62D9q4fVoBJJvv7aIR7HoZlnlsl2ogzt6JLJmn1BucW
         YoMw==
X-Forwarded-Encrypted: i=1; AKwUvBxTccjnB9A3baqGteqEzfvr2kmeMGSZi3PKMcFiOpKz14OndJ6488+Mxv92azOboN2FjGHWk9ku4CAEYA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJOVoWbgIRt1byznA2jyhpT4YqI+IkdUvvkd90kfgL9MYzmhAxI
	puJ1nfznMLfxA/8C8L9RlYfYRqrA5caPORsO79tw1rwHkljLxDfpOOau6/BEk90evdx1m5JcWoh
	7jnUPOa6XzkDbc//Ps9aE6L8c2tSQ2ws=
X-Gm-Gg: AYBFou1dZfLCc6WpzLAQ/AJCUVvE2vxQScMfiRgSIi8lWrUWBzAshdYVG3Y4L1b/c63
	3tODfoFO4sR/UGLD+H711D4J+0c2RuuWUmjvWrZx3cxGty5NKUzTLI+n66uZ2apnEABzQ/fTWJD
	OxoR82gFJNrMz0pElldLH6tDw76v712cI6YjkAB9Kqo0S+m2K1iQ2fI2fj1gSbuLuo6bueOXb2M
	tEfCgqVYrogPcHv6CIxD8sMbjMJSCxifHgpKtmuFGnWQdET9GS6OjpdA3Pz17shdFMuXmgfYA98
	eeZNdDkR1Wn8sQZnu/mnoFLPfo8ynT1Hj0Jqlz4beVk45zDiYQoI93998u7rpWUthHybrqkDmBY
	gfoV9gzjWHB/xjZr5UXgiVG8NKe0spdw3fiJ2ThMQdUhkbPV+YzoVXBetFISBs1nnTXGEi7vgXr
	TGyD9QSwzqzrD8AXN0AROcQW6vf38xxf1jbX5FAUJ5RSwxxjcMO6bjfSU/UAzfX0yLGXNs+2efn
	oim3i6TUTTaOZjEaQ8yhUkq/EJfGQ==
X-Received: by 2002:a17:907:3e12:b0:c29:22cf:b0f5 with SMTP id
 a640c23a62f3a-c46a922dee5mr411130066b.33.1792768373956; Fri, 23 Oct 2026
 08:12:53 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com> <atseYvQUYvpMFEIM@ashevche-desk.local>
In-Reply-To: <atseYvQUYvpMFEIM@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 09:12:40 -0600
X-Gm-Features: AclHuK8N0aoS8N5_iVP1byTsJlqPWe2cGv2Z_GYIPJWKyo5TvqjUOKI8du6YHIo
Message-ID: <CADvTj4pRW9q6VyQ=nLi8q0mMF8LgccfO4eqAeqgzzgOkDno1dw@mail.gmail.com>
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 2:44=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrote:
> > H616 has 256-byte transmit and receive FIFOs, but its optional DesignWa=
re
> > component parameter register reads as zero. Generic 16550 probing leave=
s
> > the port using the 16-byte FIFO configuration and its trigger-level tab=
le.
> > DMA attachment also depends on a FIFO size being available during probe=
,
> > so these ports do not reach the existing 8250 DMA path.
> >
> > Use a fixed port configuration for the H616 compatible, with a 256-byte
> > transmit load and the documented receive thresholds of 1, 64, 128 and 2=
54
> > bytes. Select the quarter-full receive trigger by default.
> >
> > Skip optional-register probing for this fixed configuration. H616 has
> > debug-divisor and RS485 control registers at the offsets used to detect
> > DesignWare hardware RS485 and fractional-divisor support. Probing these
> > offsets writes unrelated registers and can select incompatible callback=
s.
> > Keep the BUSY-safe integer divisor hook and software RS485 handling.
> >
> > Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled dur=
ing
> > termios changes. Its clock is a gate on the shared APB2 source, rather =
than
> > an independent baud-rate generator.
> >
> > Attach DMA from the fixed configuration before registering the port. Th=
e
> > 8250 core installs its FIFO defaults during registration, after the pro=
be's
> > FIFO-size test. Configure single-byte RX and TX bursts because the
> > peripheral request can correspond to just one character. The existing
> > startup path requests the firmware-described channels and falls back to
> > PIO when they are unavailable or the port is a kernel console.
>
> ...
>
> >       /* Internal 8250 only */
> >       UART_PORT_AIROHA                =3D 124,
> >       UART_PORT_AIROHA_HS             =3D 125,
> > +     UART_PORT_DW_APB_256    =3D 126,
>
> Why? Besides the poorly chosen name, what prevents us from modifying the
> corresponding parameters at probe time by leaving the one of the existing
> types?

The new type was primarily a way to reuse the core's FIFO configuration
table, including the RX trigger mapping. H616 uses thresholds of 1, 64,
128 and 254 bytes, whereas PORT_16550A maps the same FCR bits to 1, 4, 8
and 14 bytes. Overriding only fifosize and tx_loadsz would leave
rx_trig_bytes reporting and selecting the wrong thresholds.

The core already has get_rxtrig/set_rxtrig callbacks, though. I'll rework
this to retain PORT_16550A, supply the H616 FIFO parameters during setup,
and use those callbacks for the correct trigger mapping.

>
> ...
>
> >  struct dw8250_platform_data {
> >       u8 usr_reg;
> >       u32 cpr_value;
> > +     /* Use a fixed configuration instead of probing optional register=
s. */
> > +     unsigned int type;
> > +     unsigned int dma_maxburst;
>
> This sounds like a hack.  Why do we need type here? The address of platfo=
rm
> data is enough, no?

The type member selected the new table entry and also identified the
fixed-configuration path. The matched platform-data pointer can select
the H616 setup directly, including bypassing the incompatible optional
register probes. I'll remove the type member and use that instead.

>
> >       unsigned int quirks;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

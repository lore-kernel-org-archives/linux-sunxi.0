Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793377984;
	b=eR6xPpZUibnBb7tBrySrTEGCAZbn+v6klQ8z8MsG0TdDkmriujE4n3okklT9s5YQLp0p
	 NaRsH5uKDWOnJV8StN3l2bUqYKTTAsxhU6MScIeBvFHW3kPsiFa4v6EcivDD80OniyR8Q
	 b+BzyMBLFjw+yLsKC8rtTbj04sdkZzpgtctytRt1X2AK9hl7TUfMzGkEkMeShYy52eGZQ
	 o+ytayxMPi9y3zWLpbaHAqCWAnj3QmwBZnzSkl98ehOWaODPDsYcVzqOPBfhoCWpgwSU/
	 o2BlIifN+Rz3JdnuiLrIYL6jS/VkRND5LQTXjEAhyyEkkfBB0L1302IRDKuKUM9AB8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Absm4V+vGVFm3z0L90Q3kfe36wXiy29rBEs36+SAYuw=;
	b=0T8pJRHe/ulliMe3YIqewzivDgNN0D1qL5ynbd0rPiZy3PE8SllCk5+i89FeEFy+q5sM
	 14Fi/UvPJg7h18PpvmTFIDyU4FhGDZ11et+V0GHxfWc0w7/yHk6j1bY2YY2+kF+N1hI8z
	 ggnAmhOQTkv5MmtOXunO3A930fJS1no/8aoarIUL/71/mOKiF3ELJMv374Q2KJiFB11Wi
	 yRa6T5+z5g58QerQGhS7bZLTfXI2j/qwh8YubWIi+ir479dW77GFcks8ki6FfETpJ7zmX
	 TVNs/x4XF1X4mDLPA5WYuXQXnKwEB6mjNPEokSgP9Yi+r/n/GNSrqpOP7c60C/cK4/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XYhkyay4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252FB606A320
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 16:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 252FB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XYhkyay4
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-988c7371716so296323241.1
        for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 09:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793377983; cv=none;
        d=google.com; s=arc-20260327;
        b=k7gnyh/29UuDDztrD+1GsIicoJBl0iQ37zowjARc+W0SNr/E/vxdeWA5C4wVnIQjil
         p+8/3FN5iEWicLzWUCw7TGIH3ICw1b4BJVL2RMtJFURnwy0Brzpio1gLtLQ2HCw0fe0g
         Nr8+GdmEFiJSGgi+AsehOtFzdGUsB7VemviiNRfQ/ON3yMYfbQh3S1ABFbnLbUAl6hku
         wRDVeGGkiys8k8S9twv/A60N0/HY9BzJnjoNSE8wVrdK9i1kIjpHG7pFuKnRL3c6LWck
         KSxWS24updsq94NU4fFqoUyUGNxruMS7uKBC63zbIC01u73YDgKaJgJmg2eODOds9PZz
         l+fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Absm4V+vGVFm3z0L90Q3kfe36wXiy29rBEs36+SAYuw=;
        fh=tZ3NXRkHlkkYt1jzMB4aCqqA8c+BCWOfEY++mn3cIWg=;
        b=CYsGF3kP8x5zNqKAekKwPIhMvruVzx+ouXBHHfVpHniX2BLB6Hd1rvWTDmqUN7usHF
         yziuZwXQCNoLr0cnzkjk+V0oA3TdNOBvtMRp9vvjIF3EF8xOyrdkM5eQqJJ2TdTTmUPu
         JUDaey3ulN4dM+g9OUpW8bLB+OXPk8Ba1HU4tuMxDPSiitdkQKMl5LL3TCPDrI1D51pS
         kFjKmPm4EdoxF3sNCZpm4GmoKdP0kZDJicX37vM1qJzOArAHzdcVMt4Wkkvvs6qpUfjf
         4VkVe1DsnlPRy65LSNNKKte6NMLrxY97TlIif2Lyi672y6Xt1f2KO/TESid736R+RmsF
         mt9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377983; x=1793982783; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Absm4V+vGVFm3z0L90Q3kfe36wXiy29rBEs36+SAYuw=;
        b=XYhkyay4L6dMKkdAEOAOFQ3PrpdQNEM8Jlvg5cTy4eohZCHcxbHcq/G1RNy0P4pK1L
         y/0Vln+41YJtL5FT0jmHO9nWoIb34K/Pp/zdhyeLL4C3o+ZnHY4ScdB35i3iNBTkG95V
         xJrW1MROd0ZBTjKTGrv9VO4HObdfQ8dZ/sV6Dv1fDgXVCTVcOWrl6/XJg4SFnFwEv33Z
         AvrwzaS0HgnuqR4dOKfq3+6tONKDztKBTyTSaw+gfc8O0KUF2fPiDiq+wWFEIW8sikuB
         VJhSK6EiW5stP2CneotIlpscA9XtiHOBN/z2cTtVGaYLsPcq0gdTDwQ4bW1JMFKbLj0W
         oywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377983; x=1793982783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Absm4V+vGVFm3z0L90Q3kfe36wXiy29rBEs36+SAYuw=;
        b=HjPmbP93eyKUnsMpboLdvavXU2AP+4yxOg8F6A44tKf29A8a9iruyRZr9+igzUWCpW
         PKHmpSsrL1MQ3bO0OpnK5/wkvQd0Y34NmOCnKQbqYDzpRBNzXbaom/JTCJaNyy58S4hu
         3gDMxw8QlgnhxTYzgNMEpANhpTOuacmUTiFHbUNhUaaBquiU60Tp10oR35+SrRNMG3z8
         MjlPK/Msw/2NLtJQSkP5wBv0FaDTwkIY+FlazAqUMmCE9SIuMBQNIJd/gEZeicDewJE1
         lJzXm1+abuvufgrmVD0bgD6qWdXGJodGfmwC2z7+l0F5gdeQGel4ullow7xvZfszUAjq
         Ezsg==
X-Forwarded-Encrypted: i=1; AKwUvBxT2xLcAZdDgHLu8MKH8xlD8qq5iMrN0Xuu91SLzsCxPbgllV98c386Z3W0rn1407Htnry8EroW95PwNA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJKV2Tlqps5NHxVFU+e7RBtBtFvzg3PHjQ9ex7zanX/WeeDcUt2
	FpDV7FiM8wBzKOWautEN+SVei2sF+Os8TuldchOl40liKfDve8KZ/6VvF4gAxSZiA8Fk00Dghsm
	Qkma+6Tt/bN62Il0Vs2EV/ytlsPyeUBw=
X-Gm-Gg: AYBFou2iGKzGUI2jYWjLOc+84HfW5E83wnz9VGx5JFbSKLjfJ5byxbwLV/T51QB0KIJ
	TL99ClxmVMxGbpBKJOo+IMa1T8/HHUAYzNwOf8/QXRc+9RT4gCe2dSJ1OKCBSBCMY3cdK7FwW0A
	bH1wsu4CaUpHQqwpCJLc3wxaBkNg1xSi2iv/fU8QJN8fwj11oQ1KXPJsQyvs8YFuDjPrfrBeFqe
	zCmPtREl6uYQrc37qUiPKFhfbgOt2Gx6BSgPsCuApXXowLkWrFhGdjrQK/PShiT+C+sItRpghe+
	kUzeqliWOob47WwkMJICnzHcweKRMwOY6/Jaue4FTu+g4rpUs+gLaEeeG4HbixMWvBbcSDpIMZJ
	n7ov3XwdRBF+XGt0jcKgCCFE8cSVdzrA14VYNdrWvOZ6IX8eh95yu6LlvDAEnwSr8C2fILONsjE
	RHw7RaFMeQVXpkJ+elNy8XAHmOhdH1m680AD0geApgHplSkMzxayXiBPdz/EU/yq3TzzsBEnMuO
	JBALL6hDV32pO/OsU0ucncVwFK7jg==
X-Received: by 2002:a05:6102:2c0f:b0:7a6:d11b:16ea with SMTP id
 ada2fe7eead31-7d0725528eamr1573062137.6.1793377982874; Fri, 30 Oct 2026
 09:33:02 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
 <20261029-submit-h616-uart-fifo-v1-v5-7-53b433aebbf8@gmail.com> <3d7af02e-4196-bb82-9579-467e88879021@linux.intel.com>
In-Reply-To: <3d7af02e-4196-bb82-9579-467e88879021@linux.intel.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 30 Oct 2026 10:32:51 -0600
X-Gm-Features: AclHuK9dYwyBnU9vyC-IBxpz7TsWhpjTcY4ZwN-3UTn5urI74GWhcbY5yqJONhY
Message-ID: <CADvTj4on8Kx2bW05sSp5uHCT=LCL1L1Jmh_cOo2TEnNdx-mU9w@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] serial: 8250_dw: discover Allwinner A523 FIFO
 depths through FCC
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-serial <linux-serial@vger.kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:15=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Thu, 29 Oct 2026, James Hilliard wrote:
>
> > The A523 UART integration, also used by A527 and T527, has 64-byte FIFO=
s
> > on UART0 and 128-byte FIFOs on UART1 through UART7. Each controller rep=
orts
> > its TX/RX FIFO depth in bits 31:8 of the FIFO Clock Control register at
> > offset 0xf0. The field holds a byte count, not a logarithmic encoding.
> >
> > Read this field in the sunxi setup callback when platform data does not
> > provide a fixed FIFO size. A fixed size takes precedence, so H616 retai=
ns
> > its 256-byte configuration without accessing FCC. The probe has already
> > enabled the clocks and deasserted reset before invoking the callback.
> > Leave the FIFO clock-control bits untouched.
> >
> > Validate the depth before generating the RX trigger table or setting th=
e
> > transmit load. The quarter-full threshold must be positive and the
> > FIFO-depth-minus-two threshold must fit in the byte-sized table and RX
> > trigger API. Report an invalid depth and fail probe instead of generati=
ng
> > zero or truncated thresholds.
> >
> > Select this setup for the A523 compatible. Derive the transmit load and
> > RX threshold table from the discovered depth using the common sunxi
> > helpers. This handles the different FIFO sizes with one compatible and
> > one receive-trigger mapping.
> >
> > Like H616, this integration has Allwinner-specific debug-divisor and
> > RS485 registers overlapping the generic DesignWare feature probes. Use
> > the common sunxi PIO setup, BUSY-safe integer divisor programming and
> > software RS485 handling. Keep the APB clock gate enabled during termios
> > updates with SKIP_SET_RATE.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/tty/serial/8250/8250_dw.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/825=
0/8250_dw.c
> > index 3bc6735fc253..2ab91f479fc6 100644
> > --- a/drivers/tty/serial/8250/8250_dw.c
> > +++ b/drivers/tty/serial/8250/8250_dw.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/device.h>
> >  #include <linux/err.h>
> >  #include <linux/io.h>
> > +#include <linux/limits.h>
> >  #include <linux/lockdep.h>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> > @@ -45,6 +46,10 @@
> >  #define RZN1_UART_xDMACR_8_WORD_BURST        (2 << 1)
> >  #define RZN1_UART_xDMACR_BLK_SZ(x)   ((x) << 3)
> >
> > +/* Allwinner FIFO Clock Control register */
> > +#define SUNXI_UART_FCC                       0xf0
> > +#define SUNXI_UART_FCC_FIFO_DEPTH            GENMASK(31, 8)
> > +
> >  /* Quirks */
> >  #define DW_UART_QUIRK_OCTEON         BIT(0)
> >  #define DW_UART_QUIRK_ARMADA_38X     BIT(1)
> > @@ -64,6 +69,7 @@
> >  struct dw8250_platform_data {
> >       u8 usr_reg;
> >       u32 cpr_value;
> > +     /* Fixed sunxi FIFO depth; zero selects discovery through FCC */
> >       unsigned int fifo_size;
> >       unsigned int quirks;
> >       int (*setup)(struct uart_port *p);
> > @@ -729,6 +735,16 @@ static int dw8250_sunxi_setup(struct uart_port *p)
> >       p->type =3D PORT_16550A;
> >       p->flags |=3D UPF_FIXED_TYPE;
> >       p->fifosize =3D data->pdata->fifo_size;
> > +     if (!p->fifosize) {
> > +             u32 fcc =3D dw8250_readl_ext(p, SUNXI_UART_FCC);
> > +
> > +             p->fifosize =3D FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc)=
;
> > +     }
> > +     /* The RX trigger table must contain positive, byte-sized thresho=
lds */
> > +     if (p->fifosize < 4 || p->fifosize - 2 > U8_MAX)
>
> One additional comment.
>
> What is the reason for this "byte-sized" limit? Is it Allwinner specific
> or perhaps the use of unsigned char in 8250 driver to store them?

It comes from the current 8250 software interface, not an Allwinner
hardware restriction. The per-port u8 threshold table is introduced by
this series, but the existing set_rxtrig() callback takes unsigned char
byte counts, and rx_trig_bytes sysfs writes are parsed with kstrtou8().
The existing per-UART-type threshold tables also use unsigned char.

> In the DW databook the CPR given fifosizes go all the way up to 2k. I'm
> not sure how large actual UARTs make them but applying the FCR formulas
> one could get > U8_MAX thresholds.

I haven't found an Allwinner UART documented as having a FIFO larger
than 256 bytes in the vendor manuals reviewed, and the BSP configurations
checked also stay within that size. With the Allwinner mapping, the
largest threshold for those depths is 254 bytes, so the current types
cover the hardware identified so far.

A larger FIFO could exceed that representation: a 512-byte FIFO would
need a 510-byte threshold, which would truncate to 254 in our u8 table.
The check prevents that truncation. It is a software limitation, not a
claim that Allwinner hardware cannot implement larger FIFOs.

> If it's just 8250 drivers type limitation, I think the comment should
> make that obvious the type could be changed as needed.

The comment should identify this as a limitation of the current
byte-count representation. Supporting larger thresholds would require
widening the new table and shared conversion helper, together with the
existing setter argument and sysfs input parsing. Widening just our
table would not allow those thresholds to be requested through the
current interface.


>
> --
>  i.
>
> > +             return dev_err_probe(p->dev, -EINVAL,
> > +                                  "invalid FIFO size %u\n", p->fifosiz=
e);
> > +
> >       up->capabilities =3D UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_A=
FE;
> >
> >       dw8250_sunxi_setup_rxtrig(p);
> > @@ -972,6 +988,12 @@ static const struct dw8250_platform_data dw8250_h6=
16_data =3D {
> >       .setup =3D dw8250_sunxi_setup,
> >  };
> >
> > +static const struct dw8250_platform_data dw8250_a523_data =3D {
> > +     .usr_reg =3D DW_UART_USR,
> > +     .quirks =3D DW_UART_QUIRK_SKIP_SET_RATE,
> > +     .setup =3D dw8250_sunxi_setup,
> > +};
> > +
> >  static const struct dw8250_platform_data dw8250_octeon_3860_data =3D {
> >       .usr_reg =3D OCTEON_UART_USR,
> >       .quirks =3D DW_UART_QUIRK_OCTEON,
> > @@ -1024,6 +1046,7 @@ static const struct dw8250_platform_data dw8250_t=
da54 =3D {
> >  static const struct of_device_id dw8250_of_match[] =3D {
> >       { .compatible =3D "snps,dw-apb-uart", .data =3D &dw8250_dw_apb },
> >       { .compatible =3D "allwinner,sun50i-h616-uart", .data =3D &dw8250=
_h616_data },
> > +     { .compatible =3D "allwinner,sun55i-a523-uart", .data =3D &dw8250=
_a523_data },
> >       { .compatible =3D "cavium,octeon-3860-uart", .data =3D &dw8250_oc=
teon_3860_data },
> >       { .compatible =3D "marvell,armada-38x-uart", .data =3D &dw8250_ar=
mada_38x_data },
> >       { .compatible =3D "renesas,rzn1-uart", .data =3D &dw8250_renesas_=
rzn1_data },
> >
> >
>

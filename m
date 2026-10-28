Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793177601;
	b=GQqNtvQzKP79LTc/rNb7tk/gSGccZgty9NDPmVdP7kVNmOivPS8JHlPwFY5bXq5BlRtX
	 GSl0YETm5W/X7oA0BC0gMF2uH1/SpEIAJ6NYmMJ2DKROj+9vPMly1qdtznLJjiTvXpSc4
	 PZehO7VabmG+44ErL6U6ZwU4bdFAOEYddSCMKddkg+uE5gM3PcbzsfsQEhWK2aw7JMaM3
	 flgS2HeO4juo4BCFn2zeTSc/74OSlnACpNCxTyokjTZMt17lbV5stf7Bk0DGPiAatU0+m
	 1wk/bTS/jZ+7EBvQ9A10IY8QrzGUsyt/d3P69i25l+XN0zTFcfpdOWXYJGpdqtiT0rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FlHhSlz8HMhmsAgAah+96UUmNr3q3P/5A9H7JsgocBA=;
	b=H9WFtt6AvvMRFRY1cJTFCz+e5ioXgPsmbPTo9J0geG299r/171PhtuYmm0CTPoX3BQCC
	 jAp8vhJcyJ9yJL0vg5WeROY7inh6iVWwKX/DRM7F+v15Qt0N7Qd7BzcC30YlfePEbNg1Q
	 4ZFYGwvWUogYnuTSwPxpOL3hU+z4357e/bJccgzwAjolKwvvClxEHJSxJLyZX+B6E5wZM
	 73JyjDmBhoKUOG2/JA7Hl7Im/cn7WEF4HkQnEZu6oCcdIcITOodqXPyjHir3hGhB+T1UO
	 wOpQuyQd9Zl3S992KMleia/GBezKhcbN4okVw68oLlK6KcYmajvOjdfZc4mJn0E/QvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tI27OrEn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49823606A31D
	for <linux-sunxi@lists.linux.dev>; Wed, 28 Oct 2026 08:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49823606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tI27OrEn
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eafb65e163so488336e0c.2
        for <linux-sunxi@lists.linux.dev>; Wed, 28 Oct 2026 01:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793177599; cv=none;
        d=google.com; s=arc-20260327;
        b=MOVqPsU18Yv1PRviGtmT2f35Wr07gfTXBc6r2vt9Nl3854rLUwMrM4nTH3/KZQpYgP
         7seiXCJxAqmFRpN1ryb5L7Kcdg7Ink/iOW28TRQG7WaalWA8Y9eIf6d5nYAlQRulQU+0
         zAyBzg1Ea535dXkgAhucR/DGJXbvTt0YokQXxQuPiRiyWd3UndhS0GaK3sqs1tIrIOyq
         qug+n6ofv5vLHCNBRe7T1WHnrMLJJ1Aa6ssxlXNFCIIP2/T7yEj4Pky9pjdNqWKDfsz4
         ILqM1dpity9W8kh2JS9xsBDmAwgSPJxU8E3XG4P6S/C85Y4DXCRkSs5qHit6LvmQJNDB
         hr2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FlHhSlz8HMhmsAgAah+96UUmNr3q3P/5A9H7JsgocBA=;
        fh=h9MV+oq3JfDzQ1IK8fjfQ6VVhk7Pv4Sk5n54sKDiguQ=;
        b=JyE9taAv4jtVvCcUZ2S/PkCY+9MhFyg9nU0v+DYZ3ZVtmJbaAkXx6ZvxwGk9Q4nbFm
         EezBo1a1Qiwkp8jAOpUrthgL51tZLBqVj4L8ECFdiLWY/ocWgoCK0CSWtX4B9/+Ph2/4
         0rzUgcfbp+pH6zqr6nt2ajb9AG7MANBzTaacWoTm+eFijMsH8rD7daiG5DDYGMCMqZx8
         wcMgyDikh/LW4vTqfCNctnaSM6A6tOBSMw88mQJR0AkfSPjXLkSebLJRceh0o0tG0oRq
         YenwJOB7GSIL+NznVbHm/irOemzvEzMwBkX16DTapJryjSdfifsZHP+D+DRvStdoEoj+
         CuGQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793177599; x=1793782399; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FlHhSlz8HMhmsAgAah+96UUmNr3q3P/5A9H7JsgocBA=;
        b=tI27OrEnICmz6ILfaI6EhAljp+mO/wZyXL6PTkOER20XXMKhXCO86wsP8Ml1bhtZic
         KyXxhEF53zTlhw3mi1dYZuH/n+ovkT6msqzLQPr2r/uESYQE8hMDTep8JXkMdO/x9FoJ
         runpl6VA1OE/DSGA7oiQE+X7CvLKEubZCtOi0BTG5NUI+/YX3ML6NYK03kNkXsEtUBNM
         zJ0cIEJfQ5qw/ZQBNM7M1aZQE/1pQgHZ6vtsZvZ+CiKxkZ6tJfZALmTQpp7+gezgRIRQ
         0uMvbonfSfpwfEJtNmonfxYuNbgXBwuOHVhlpZa5mKhVohWnzhM+v23FaKQ/DyXnPE+l
         W48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793177599; x=1793782399;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FlHhSlz8HMhmsAgAah+96UUmNr3q3P/5A9H7JsgocBA=;
        b=tpNMOd5XiuhAxgSiCE7ZuTSfTAlICUWsEWdbDPjnzTygoAeN+el7fm32IS48gSSjsW
         /Ua8/xRFkJdOWZtZ8Cz4np+tlR7b+6nx2Z8Y97266h/inISOUscIeMqxKDDTjO3p3Qqv
         7/zUSB4jpHDb7Hl41A27ZJxQ1DHxCbMyTBXbGW6/A5NZnDmXYiCrkRy4mNBWLs5gN0bT
         Yx7Se9NWbVyWvHz2zWbP9N6m3nJCqxSH6MtGAo6qCJ2BPgkoSeyBXQ0NAbvj4/1ZVmlI
         MZT4HvTDqn8VPfTMkxW2Ef0lD9qNPPIbGFRe6+Dqwbp/VmheQZKl2IfkJOmqIcStuH3c
         iW9Q==
X-Forwarded-Encrypted: i=1; AKwUvByRssE26RzzR1aRThZ+RFa2iCOgE8hkV5iUFNLTq1yRaqdYSrTqnH8SMLfWhsaQiq69F5InlPXRymXmDg==@lists.linux.dev
X-Gm-Message-State: AFq9FYL3gWk+t7dN0sfhb12LJLk9L810S7htjJo6Hdkr/6weVjZvJXOs
	GKD45XzH/CN5921aRXaynpjQGf6OYu0uU11GictXLtaLLZoliKHFBt8Ko4puICeVQZ5euGahLqr
	Sht0UdvjarOzl04HkT+ofkaD4+Oi/KgE=
X-Gm-Gg: AYBFou1dS8Av3olZ6F3b1ueqkdMQFE3M2NE/lOnpbrAhjrGdfnsSyXvOnH/6mhnmUXM
	Om8ILQYXQ4I5aa8rdcbSR9fxTUIOH0v7ZlRH6zsR2SqQhXGOZrSBDoH7Frz90qdzLH6AeSoXmNS
	S8B/rimy4Yuicuoev+kOMZfmkm849ACEtsCgbderX3pJqqcwoms8OQqwhZch484cy3NJIGt451B
	2u9heRS+vROO05n4JX0QzwsZIt4JJfFEGDrfwlpDkJcPQRHiVk8aFoVsEJpe2/ymtg30jPIljaN
	QQdLG1M+AlAEERPGH7YwiSInOgwHXggwehxfpegh147DqFk4MMJ5e7e4tssqrQs/knCF2moagop
	/4zDbP4Uh0ddk4FfA/Y7vE7D5cK8VLYi0krz9phJlM+9onRWuiItrVfbJe4/eOrz2A4WTExh0RE
	MXMrVZfi8FD6MlhXevvCrgngITA+I667qRgyjkl49Va3JgLrE4LpDLvNv60ZfdnWApzNefLW1+7
	70w0Ua7HxlbGJ8S1Bv8kKDq/YAW/6k=
X-Received: by 2002:a05:6122:e22b:b0:5ea:df96:c394 with SMTP id
 71dfb90a1353d-5ec4cbc53dcmr735009e0c.5.1793177599205; Wed, 28 Oct 2026
 01:53:19 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
 <20261027-submit-h616-uart-fifo-v1-v4-4-d37e018fd0a6@gmail.com> <c8668925-efec-da4c-193c-5e85c5bbcf15@linux.intel.com>
In-Reply-To: <c8668925-efec-da4c-193c-5e85c5bbcf15@linux.intel.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 Oct 2026 02:53:07 -0600
X-Gm-Features: AclHuK_mnaE8FYNJJORUUY4g9ttUI8htgnnSLpHl_6Eypp3F-37DUlSMbLaTo6U
Message-ID: <CADvTj4pquJ=WV3UuQc1PxazSWh48cPi9jY5G7nNORgvyV0-Dww@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] serial: 8250_dw: configure the Allwinner H616 UART
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-serial <linux-serial@vger.kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 2:39=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 27 Oct 2026, James Hilliard wrote:
>
> > H616 has 256-byte transmit and receive FIFOs, but its optional DesignWa=
re
> > component parameter register reads as zero. Generic 16550 probing leave=
s
> > the port using the 16-byte FIFO configuration and its trigger-level tab=
le.
> >
> > Keep PORT_16550A and describe H616's fixed 256-byte FIFO depth in platf=
orm
> > data. Use common Allwinner setup helpers to configure the transmit load
> > and receive trigger table from that depth.
> >
> > Derive the receive thresholds from the documented 1-byte, quarter-full,
> > half-full and FIFO-depth-minus-two mapping. On H616 these are 1, 64, 12=
8
> > and 254 bytes; the normal 16550A half-full FCR setting selects 128 byte=
s.
> >
> > Build the threshold table during setup and use the shared 8250 conversi=
on
> > helper to select the nearest lower threshold for sysfs writes.
>
> You do that, I can see from the patch, but I came to read this changelog
> to understand "why"?? You provide zero reasoning for this design decision=
.
>
> Since you fifosize is constant as well, so what benefit building it on th=
e
> fly servers?

The intent is to keep the FIFO depth as the single platform-data input
and derive the thresholds from the common Allwinner mapping. Other sunxi
integrations using that mapping could then supply a different FIFO depth
without duplicating the threshold table.

Building the table once also lets get_rxtrig() and the shared
bytes-to-FCR helper use the same derived values.

>
> > Serialize trigger changes with termios and hold a runtime PM reference
> > while programming FCR, preserving the FIFO contents. Propagate runtime
> > resume errors before changing either the FCR shadow or the hardware.
> >
> > Advertise automatic flow control so CRTSCTS enables MCR.AFCE. The
> > DesignWare termios path selects hardware CTS handling, so the capabilit=
y
> > must be present for the corresponding hardware control to be enabled.
> >
> > Select the fixed configuration through the platform setup callback.
> > H616 has debug-divisor and RS485 control registers at the offsets used =
to
> > detect DesignWare hardware RS485 and fractional-divisor support. Avoid
> > those probes and retain the BUSY-safe integer divisor hook and software
> > RS485 handling.
> >
> > Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled dur=
ing
> > termios changes. Its clock is a gate on the shared APB2 source, rather =
than
> > an independent baud-rate generator.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/tty/serial/8250/8250_dw.c | 94 +++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 94 insertions(+)
> >
> > diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/825=
0/8250_dw.c
> > index 1351523f0c47..2f156c01c5a1 100644
> > --- a/drivers/tty/serial/8250/8250_dw.c
> > +++ b/drivers/tty/serial/8250/8250_dw.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/io.h>
> >  #include <linux/lockdep.h>
> >  #include <linux/module.h>
> > +#include <linux/mutex.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/property.h>
> > @@ -63,6 +64,7 @@
> >  struct dw8250_platform_data {
> >       u8 usr_reg;
> >       u32 cpr_value;
> > +     unsigned int fifo_size;
> >       unsigned int quirks;
> >       void (*setup)(struct uart_port *p);
> >  };
> > @@ -81,6 +83,7 @@ struct dw8250_data {
> >       unsigned int            in_idle:1;
> >
> >       u8                      no_int_count;
> > +     u8                      rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
> >  };
> >
> >  static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_da=
ta *data)
> > @@ -657,6 +660,89 @@ static void dw8250_octeon_setup(struct uart_port *=
p)
> >       dw8250_setup_dma(p);
> >  }
> >
> > +/* The trigger is the masked, unshifted FCR receive trigger field. */
> > +static unsigned int dw8250_sunxi_rxtrig_bytes(struct uart_port *p, uns=
igned int trigger)
> > +{
> > +     switch (trigger) {
> > +     case UART_FCR_TRIGGER_1:
> > +             return 1;
> > +     case UART_FCR_TRIGGER_4:
> > +             return p->fifosize / 4;
> > +     case UART_FCR_TRIGGER_8:
> > +             return p->fifosize / 2;
> > +     default:
> > +             return p->fifosize - 2;
> > +     }
> > +}
> > +
> > +static int dw8250_sunxi_get_rxtrig(struct uart_port *p)
> > +{
> > +     struct dw8250_data *data =3D to_dw8250_data(p->private_data);
> > +     struct uart_8250_port *up =3D up_to_u8250p(p);
> > +
> > +     guard(uart_port_lock_irqsave)(p);
> > +
> > +     return data->rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
> > +}
> > +
> > +static int dw8250_sunxi_set_rxtrig(struct uart_port *p, unsigned char =
bytes)
> > +{
> > +     struct dw8250_data *data =3D to_dw8250_data(p->private_data);
> > +     struct uart_8250_port *up =3D up_to_u8250p(p);
> > +     int fcr, ret;
> > +
> > +     fcr =3D serial8250_bytes_to_fcr(data->rxtrig_bytes, bytes);
> > +     if (fcr < 0)
> > +             return fcr;
> > +
> > +     guard(mutex)(&p->state->port.mutex);
> > +
> > +     PM_RUNTIME_ACQUIRE_IF_ENABLED(p->dev, pm);
> > +     ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
> > +     if (ret)
> > +             return ret;
> > +
> > +     guard(uart_port_lock_irqsave)(p);
> > +
> > +     up->fcr &=3D ~UART_FCR_TRIGGER_MASK;
> > +     up->fcr |=3D fcr;
> > +     /* Changing the trigger alone preserves the FIFO contents. */
> > +     serial_port_out(p, UART_FCR, up->fcr);
> > +
> > +     return 0;
> > +}
> > +
> > +static void dw8250_sunxi_setup_rxtrig(struct uart_port *p)
> > +{
> > +     struct dw8250_data *data =3D to_dw8250_data(p->private_data);
> > +
> > +     /* Allwinner RX thresholds differ from the standard 16550A table.=
 */
> > +     for (unsigned int i =3D 0; i < ARRAY_SIZE(data->rxtrig_bytes); i+=
+)
> > +             data->rxtrig_bytes[i] =3D dw8250_sunxi_rxtrig_bytes(p, i =
<< UART_FCR_R_TRIG_SHIFT);
>
> FIELD_PREP(UART_FCR_TRIGGER_MASK, i)
>
> For clarity, it might be useful to split it into two lines using an
> intermediate variable.
>
> > +     p->get_rxtrig =3D dw8250_sunxi_get_rxtrig;
> > +     p->set_rxtrig =3D dw8250_sunxi_set_rxtrig;
> > +}
> > +
> > +static void dw8250_sunxi_setup(struct uart_port *p)
> > +{
> > +     struct dw8250_data *data =3D to_dw8250_data(p->private_data);
> > +     struct uart_8250_port *up =3D up_to_u8250p(p);
> > +
> > +     p->type =3D PORT_16550A;
> > +     p->flags |=3D UPF_FIXED_TYPE;
> > +     p->fifosize =3D data->pdata->fifo_size;
> > +     up->tx_loadsz =3D p->fifosize;
> > +     up->capabilities =3D UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_A=
FE;
> > +
> > +     dw8250_sunxi_setup_rxtrig(p);
> > +
> > +     /* Use software RS485 with the Allwinner register layout. */
> > +     p->rs485_config =3D serial8250_em485_config;
> > +     p->rs485_supported =3D serial8250_em485_supported;
> > +     up->rs485_start_tx =3D serial8250_em485_start_tx;
> > +     up->rs485_stop_tx =3D serial8250_em485_stop_tx;
> > +}
> > +
> >  static int dw8250_probe(struct platform_device *pdev)
> >  {
> >       struct uart_8250_port uart =3D {}, *up =3D &uart;
> > @@ -878,6 +964,13 @@ static const struct dw8250_platform_data dw8250_dw=
_apb =3D {
> >       .usr_reg =3D DW_UART_USR,
> >  };
> >
> > +static const struct dw8250_platform_data dw8250_h616_data =3D {
> > +     .usr_reg =3D DW_UART_USR,
> > +     .fifo_size =3D 256,
> > +     .quirks =3D DW_UART_QUIRK_SKIP_SET_RATE,
> > +     .setup =3D dw8250_sunxi_setup,
> > +};
> > +
> >  static const struct dw8250_platform_data dw8250_octeon_3860_data =3D {
> >       .usr_reg =3D OCTEON_UART_USR,
> >       .quirks =3D DW_UART_QUIRK_OCTEON,
> > @@ -929,6 +1022,7 @@ static const struct dw8250_platform_data dw8250_td=
a54 =3D {
> >
> >  static const struct of_device_id dw8250_of_match[] =3D {
> >       { .compatible =3D "snps,dw-apb-uart", .data =3D &dw8250_dw_apb },
> > +     { .compatible =3D "allwinner,sun50i-h616-uart", .data =3D &dw8250=
_h616_data },
> >       { .compatible =3D "cavium,octeon-3860-uart", .data =3D &dw8250_oc=
teon_3860_data },
> >       { .compatible =3D "marvell,armada-38x-uart", .data =3D &dw8250_ar=
mada_38x_data },
> >       { .compatible =3D "renesas,rzn1-uart", .data =3D &dw8250_renesas_=
rzn1_data },
> >
> >
>
> --
>  i.
>

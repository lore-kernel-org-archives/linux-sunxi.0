Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793300896;
	b=Jieg6qRtXvGCUlyl+XbqAzfAXAfpGZRIUuBfzz1ZoxQIfoVsQwCVuTrxXIOu6x3V3lrZ
	 uJ9cYvGwM4UQ283Q9kQTnkenmH+1SxIh/wPDKPIFiNFan83Whl3OquuUtAaGlne3PGJdf
	 69cy/aCCxgF0y3guGU0DcRgDuVe1tF6do61waJ12uqa66WUqQqDmmTz7+tHpy1mKCPQHS
	 dPGlJghLtfcDLavOpZUzN7J06UqiWEObCvGTlraFHcL8UOCgYv2tXzwMmxsxsHadM2uO7
	 +gDNrmeMtc3KrusnWXZq7q5/XxI6QONuyxJFQcvWlWylVQScPzYVW4IUYGoAX+xjZag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u3pPXjv4Wwx+POQttN+7x1MDfExsUHeAJSF+oGYWqgM=;
	b=1O2Wb8Prj4ozz2hvdACQLwOkDUn7qHAZhmb54iHyAR7CCs2t91DYqT4tF1ATPktThd6R
	 KzHB6CR8okfMO3+kc5LV+dJZMhDluBlxDwU9G/gIU3C+vwPp8LAtlyjw1L/mtlRwjbtc+
	 1wbimaWAAcGllFWU1se2lTVcvZSpUxI5PqeTG3r3CtRN2wMp1iXYIekT6F+jLwibyYWyd
	 R8mQKNZ0BLE8sPtVa0F3n2OxUxo4xDTBwbJaKArcIbOkZLdhBW67nWjVUFR3ub+i/ItT9
	 NmXuprB4Zdxg2uu1pepHeH3/LyGiz4zEpc0vWYnCiAqfRY1EzwiTcfolqbTLJ0Dd8xQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HjkomaJw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0DE606A32E
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 19:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D0DE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HjkomaJw
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eac01ff101so3750e0c.2
        for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 12:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793300895; cv=none;
        d=google.com; s=arc-20260327;
        b=jwO/z2J1nEjmBG3F/LOu703PDg1PpZxC20Iug9msjEQBzBgglCjJD1nYcM2ZxXoOU2
         7cLeCmEKeiPasTV/fNPKTTtJJTbxwT67ayKMna89nck6saGp4wG0RmHwgc1C29REcLU6
         RGzlbx3gztk0L4apT3kHVcf504/vcKf9BjLeaiSjQmSlOW5Tz3ltbFJatniAyhX6IFWk
         Fbpwxme+jYIm5EIpuiW768uKeLgjlNHsmRYTm+wJ+btydjPvFgnJzcp+V0EM2uoEXdFV
         XLysh9z0GGGTLWABcaSCizdq/cCMUJiJuHWSlYTs36oZBkoc/C1dEm2HpbPkxOGd5e6X
         BWog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u3pPXjv4Wwx+POQttN+7x1MDfExsUHeAJSF+oGYWqgM=;
        fh=C6aNKoKZdcH0pNRtH/SJx90btSSo6inOnRgEkdNQ9UU=;
        b=AAuJGQz8JTm0PvL3LbImKDGa1j1bvQNijGykZS0j6oBH9GRS8SVMeJ6MLl9n0U9hRA
         gXuXXrlY85XL/QnB/KEFUhWEupdlN7GB8l9awDx2NYSvK6BQJrzIR5ZpDW1IrfXpq1q9
         EbcawM6HCHa7JZz5Fg6ZWO0ig2+xkRQlFflQ4SdGSPu59udmpsKwZaGulNiVfTWIxCCc
         CNNHnXrlXeX1PFuI9bJUq7ZT33egXHekhVCymG7ZX8FtLOwf6bX6KQEF2Kql+590GCJl
         nEQa021nwo2y21DWDmUGsboKtd1Uj4FjGCGIBwV6n9phgI2spO1Oj2DttMEUC+VL0jtQ
         XqPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300895; x=1793905695; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u3pPXjv4Wwx+POQttN+7x1MDfExsUHeAJSF+oGYWqgM=;
        b=HjkomaJwmmNhHk1UCjTihZXT8EY2NWSCooHlzD4EmkOwG6cMa0SF/PiJROeJ8ryiZY
         vrz5adleqzQCSasYaNBh6wdSAwDzi70a918MjmIN9TdPYp4WKlF6gSPjM2XtBt8Dl5s1
         oirj2A5MfE4LHJoszhwkD6urE0aUG7j55T0X2RbusC4pzCif7p9ZpPC8AbbJDNM1kTa4
         amkXAWF1CdwLLemi6Ffryjt1dHSozG1lbkKkUx/BIBdxSaEuSmdDXjAiU9yCQF6wXv40
         hSkfJQUuqmUxUqLnVmqiyhZzqvukXCb1kL7MC9NEdtEKKktrfObsJl0eYw5ShoynyZO5
         goDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300895; x=1793905695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3pPXjv4Wwx+POQttN+7x1MDfExsUHeAJSF+oGYWqgM=;
        b=tlCQ7WgB4HA7sG+aqxgvWKn+VB9om0FzSV7KHxrOxxoNysCIBwKIC5yPjgrUIhqLeY
         GHQ9HNQ4EwhoqZibNYXZol0II/Ai8txHawt5FH7kXG/DhWLAckBQPz/4E9popEmffjun
         0ncNVmFKd/1CoXdV2SG5jSMyF8iSahIXBQctNPqn415qYcyeaihO9flQaYVfJjOyYPYf
         tAitI16P4Cxvbmu5QZXpWLQmijCesiaJhYGUO/TIOZEP8XcgPbT5OH5q0x3Mw6wCYARE
         6I0Un+rZn7ZpZ+A/M6n7dLrBI4sSjJMJbbXQifUQhtxP2XwSYA/JFB9wLAXCH1G4FTkc
         jYuw==
X-Forwarded-Encrypted: i=1; AKwUvBzVVvQSMZbvHfF7qB6CzYmckQ8fqAOEm36iIsXaFVFmdMp3p9I+vagD3oYdAmfAd/4hVSgR3xrw3UNY3A==@lists.linux.dev
X-Gm-Message-State: AFq9FYIVnZJN8SNwiauAWA40JbhzR6tZqPB1PcTYB8Pre7SbN6F0KFDR
	xM0VexaXgj879yp73BVe85/jSYpLmlApHpIP+Gpb9Njq1Y1oueU/xqBvsLk9bXPPodIaKq/83bA
	JEYcgFdc1oKgsQr7RfDDUhYqGVSMd3Ek=
X-Gm-Gg: AYBFou0pyatrzJ12Wm5DK/p3HCtC6aBWfZt7VdD+LT4VUKl9ym2CHoujMV5QToaPOiy
	sTye4YSH0Eo1YmRH/Og5OUjC5q2dnKMfkeIpTEdO2hdGMhTDpCu1Za3tor/3e/0vmbsLXuxV6dr
	mjIm/xI0gExlEjYciw8tdLd3IP7YxW8tdSjm3DPZhdqTEd3Y6LkLsMZV3hCv6kmoTyw9MZwt+Ml
	DUTKgjLDoVuHvFkqoqtC2i38sEtNGzMFPFzdEuYEDAmauB/9i878BdjIKQDR2ofFNVyysK/RprD
	wh10W/QY4UBi6tAd1Rgf7CD9W6+qgL7aTSdwwcziDg/12k0tOY+M3W1rOTrcmOhCsuotpPRI8tE
	cVrVeir9zZU/TBVX7/rQhV2q7fKNF8oraiIWOUV+JIngOXKiSgTaBBqb0wR3syQZkVr6649LvXT
	NOpVCuJoOV9f0B2PAamXKuNhL4iOZ84reInkbOV4B+nBnCrrB0hjOCAtSAl1WE7LaiBsWf/czwZ
	EskQpOatPKq+bFbYUrV+HM30ZcFcQ==
X-Received: by 2002:a05:6122:46a8:b0:5ce:ab22:1749 with SMTP id
 71dfb90a1353d-5ec6851cd7amr118633e0c.1.1793300895346; Thu, 29 Oct 2026
 12:08:15 -0700 (PDT)
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
 <20261027-submit-h616-uart-fifo-v1-v4-4-d37e018fd0a6@gmail.com> <auHW9nkDqZUXeHNZ@ashevche-desk.local>
In-Reply-To: <auHW9nkDqZUXeHNZ@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 13:08:03 -0600
X-Gm-Features: AclHuK-Rn80HNyPsHmS5HIf099B7rRnzpvWxOBqe3P7d4FosCUXTUKkW9AmBT7o
Message-ID: <CADvTj4o6N6sXk1YvYgMF6d5jyAGZCtyaZUe81ZP10qfhOPwd-g@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] serial: 8250_dw: configure the Allwinner H616 UART
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

On Wed, Oct 28, 2026 at 5:05=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Oct 27, 2026 at 05:05:32PM -0600, James Hilliard wrote:
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
> >
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
>
> ...
>
> > +     unsigned int fifo_size;
>
> This is should come from DT (based on the property or compatible),

On some Allwinner SoC's fifo size can come from the FIFO Clock
Control register[0].

>
> ...
>
> >       u8                      no_int_count;
> > +     u8                      rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
>
> Why do you need it here? Can it be provided via driver_data?
>
> ...
>
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
>
> You don't need this, just provide a set of numbers directly.

In v5 I added FCC based fifo-size discovery for A523[0] which does
need to compute these values dynamically.

[0] https://lore.kernel.org/all/20261029-submit-h616-uart-fifo-v1-v5-7-53b4=
33aebbf8@gmail.com/

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

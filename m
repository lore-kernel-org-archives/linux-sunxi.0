Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3539720494F
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Nov 2024 04:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731384617; cv=none; b=LwGqD/1gHUzxxf24agH3aaXSvxpGpkVhAn9yAzixCov6QBSNYWcimdzvUYtH9gBvtRzYW+T6WOQESXUkuw6l+sg8Oo85no3suhX7/UyPI1iWM5W3GyvzfcemF/e9+E5bJEyU4wHry7NCSaUBWzHKAMjT/ZJh4eEKujWXQckunOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731384617; c=relaxed/simple;
	bh=Dh0Rge16au2bgrUgJitkpfwaIhhWpmio6WByFkkHRtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCSNLjI4kdbCzF42NHo+yA9JyJcjybDxcWcRRmjd56bBfqFTr9oVIy+7zMuZmcQ412gUV/MM2bj7TTE4wl7en4N+m0ZwggpjbLszKu5hUOEBhX7iFEEpJMdnXnp8KpMmNFXN3XGYEo1CDpO17J7K8xUAT29uT9Z0cY4pQWzBZOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWKq3j1E; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWKq3j1E"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e5e5c43497so40150847b3.3
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 20:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731384615; x=1731989415; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsmubN01hyDUEhQ6tv783ePv53ofcUVY2RqcZdf3yEo=;
        b=VWKq3j1EAZYzSA4jOJYt4/rWKm5YnBkH3dD+TgxKRyfJ5H04fya0rmOWaA778wneUs
         64wj1NKyfTJmsBPyqaO2X+kemTGOKd5uSvGcOCCuoAWjHIg2z6lWvXnjoshmuwYijHJj
         p1/O0+j8y34M/HpBpZ6L8RhFKIPwjNJCFTXFAh1TTjGUVO6+27W/3C16GPPSAJJiFV9b
         71r9NOx6yvzsmq2XeSSCrcgkm1cwANjVAeqoRhcKWXFb+MWRy4HtX5nnX8rlYbCtH8jc
         d/gA0vcUPlgKBtZswnmkZA+iv894Rn8Qov/5XXBZpuOkwnFk03qRPhjKBLHHnjGVK6ei
         jnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731384615; x=1731989415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsmubN01hyDUEhQ6tv783ePv53ofcUVY2RqcZdf3yEo=;
        b=ZPwECZdnj7k+bdWVpE9a4qVLT+sh1k05t8Hde3ayLRdN0Fwv7Fyz0dKVtWoxm6jGSn
         r6Kx5wOTLs1ESIU7eQ5NvCfgR3olLf3++PB69HBrEYn81vpyM0CjRBjfFzImALlSIpKj
         0y290iTwzsgBCAUceCuCBSRhjNhudApCnbFKLoIJ8+RbdRTh7v47dwRTVRj78cj8rCCb
         oiWK41Cdueu4ZHR7bTxXGRPJOWtcFTn0raKWtS0NUFlY4ZjTfY71braBUZaUpjIQnadx
         R0++JGzGAgf8LHbgIjBYZnpgVoH/Jh/5vUZp3oWuTuF44UVM83aniSN35emnOmDXxx6d
         +f6w==
X-Forwarded-Encrypted: i=1; AJvYcCVwf/JIZgnRv0DlJ5WqRFjlSV/vfycE9qviKCE1e9lWNGPDTYcIRmvLhh82XcDsKY8Kgx5T3hLkL4hZSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjmwLWrdbU+gp9NWE61O3a/TMt+gWer6TwNX/TNjYCa6gVVNBC
	dum3NWXgoDOHV7l4MprlctrOEBISYT06ArYNNhHxirWW/oawf19051TvfYuL1aNWZHEA5ev70O5
	Mucq1pvagWO34o0rEWRlfMCyp0oE=
X-Google-Smtp-Source: AGHT+IEEd9e7KYmg9hOChPdcooKIfQet+Ec2imFxx6bP82VRvCibSsbb8ecrhexu0TZ29275WhqN4tjEisNPdXIjqY0=
X-Received: by 2002:a05:690c:6b11:b0:6e2:ab93:8c68 with SMTP id
 00721157ae682-6eadddaf35cmr135388027b3.25.1731384615059; Mon, 11 Nov 2024
 20:10:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241111210316.15357-1-rosenp@gmail.com> <20241111193222.00ae2f3e@kernel.org>
In-Reply-To: <20241111193222.00ae2f3e@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 11 Nov 2024 20:10:04 -0800
Message-ID: <CAKxU2N-VHmVerombZ77uOHApi0aGBFi46oC1eoGTm5sakCVc4w@mail.gmail.com>
Subject: Re: [PATCHv2 net-next] net: use pdev instead of OF funcs
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Pantelis Antoniou <pantelis.antoniou@gmail.com>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, 
	Byungho An <bh74.an@samsung.com>, Kevin Brace <kevinbrace@bracecomputerlab.com>, 
	Francois Romieu <romieu@fr.zoreil.com>, Michal Simek <michal.simek@amd.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Zhao Qiang <qiang.zhao@nxp.com>, 
	"open list:CAN NETWORK DRIVERS" <linux-can@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:FREESCALE SOC FS_ENET DRIVER" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 7:32=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 11 Nov 2024 13:03:16 -0800 Rosen Penev wrote:
> > --- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
> > +++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
> > @@ -111,7 +111,7 @@ static int sxgbe_platform_probe(struct platform_dev=
ice *pdev)
> >       }
> >
> >       /* Get the SXGBE common INT information */
> > -     priv->irq  =3D irq_of_parse_and_map(node, 0);
> > +     priv->irq =3D platform_get_irq(pdev, 0);
> >       if (priv->irq <=3D 0) {
> >               dev_err(dev, "sxgbe common irq parsing failed\n");
> >               goto err_drv_remove;
> > @@ -122,7 +122,7 @@ static int sxgbe_platform_probe(struct platform_dev=
ice *pdev)
> >
> >       /* Get the TX/RX IRQ numbers */
> >       for (i =3D 0, chan =3D 1; i < SXGBE_TX_QUEUES; i++) {
> > -             priv->txq[i]->irq_no =3D irq_of_parse_and_map(node, chan+=
+);
> > +             priv->txq[i]->irq_no =3D platform_get_irq(pdev, chan++);
> >               if (priv->txq[i]->irq_no <=3D 0) {
> >                       dev_err(dev, "sxgbe tx irq parsing failed\n");
> >                       goto err_tx_irq_unmap;
> > @@ -130,14 +130,14 @@ static int sxgbe_platform_probe(struct platform_d=
evice *pdev)
> >       }
> >
> >       for (i =3D 0; i < SXGBE_RX_QUEUES; i++) {
> > -             priv->rxq[i]->irq_no =3D irq_of_parse_and_map(node, chan+=
+);
> > +             priv->rxq[i]->irq_no =3D platform_get_irq(pdev, chan++);
> >               if (priv->rxq[i]->irq_no <=3D 0) {
> >                       dev_err(dev, "sxgbe rx irq parsing failed\n");
> >                       goto err_rx_irq_unmap;
> >               }
> >       }
> >
> > -     priv->lpi_irq =3D irq_of_parse_and_map(node, chan);
> > +     priv->lpi_irq =3D platform_get_irq(pdev, chan);
> >       if (priv->lpi_irq <=3D 0) {
> >               dev_err(dev, "sxgbe lpi irq parsing failed\n");
> >               goto err_rx_irq_unmap;
>
> Coccicheck wants you to drop the errors:
>
> drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:116:2-9: line 116 is =
redundant because platform_get_irq() already prints an error
> drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:127:3-10: line 127 is=
 redundant because platform_get_irq() already prints an error
> drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:135:3-10: line 135 is=
 redundant because platform_get_irq() already prints an error
> drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:142:2-9: line 142 is =
redundant because platform_get_irq() already prints an error

I looked at the output. The error checks need changing too.

>
> You can make it a separate patch in a series, for clarity.
I don't think it's enough to warrant its own commit.
> --
> pw-bot: cr

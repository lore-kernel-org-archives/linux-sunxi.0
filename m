Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9E71F8EE2
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Nov 2024 09:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731491319; cv=none; b=E3N2ohWhX2iT8Y44OEb8AF9IBmYkDJFnnlrEwnOJgGUG/DLt5nIBtgEbqwF+1T82AZ4096dcjHdpfm7K7bJzHMWRGkJiMCbbeaw9q/+/IaM4WHXcWBSb42qWOsYeANXDktap+HQF+xkTjXYzzILMnAdUxLCLuJuPEQVKhObdpUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731491319; c=relaxed/simple;
	bh=ks90hqffQrT0BE2v4o9sOT2myXod5HsJJ8zUteV+gKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1xlrCZdPbyJU8tAWWlIb/ZhZZF2Lrf4MT+c5MRGczffU2H0nolIG3t9nEW1pYN2OWmVqcruwXKaR6m1lEOsEdI+yL7vn+j0nbD7DE7nryJeY6CXdl/e8gtAXa2DZFitbOeANieJk8pUchC3+q486W/lict05J0lGjVWAy/QytA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STK598uA; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STK598uA"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6cbd57cc35bso4714216d6.1
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Nov 2024 01:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731491317; x=1732096117; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaSnfzm/t5DivDcI8TYnD0ZfKr8uwA2J8rw6CZWmB2k=;
        b=STK598uAA3M6zkDa+Ga6C2a1oRslk24bPUTTiaiYzVE8BXcvP/wWPPdeWOub1RQ9yr
         LPWknyvdQRXdf2GIWTEPIzxMdhBSOBFGLFOB9D+93w3INZHq+u2374kFyhy5QOVIfrKv
         MQpbI+RMwCkk08Z79ORX0W/jTH4vku3JWIItodHvATeSgnTK6YdL0+w01cTZiXpVTMIe
         sQbVOzbA+jMHBtGU8zat1FxjSfla2F8EUyx7/dmcaBriEqz7fWLcg8LM1SPgMw9qVxVP
         yIgRap6hifEJhgUzrS1PqkkIVIZH8LATTyWQ1+OQsIHQrN/Kh+WSEyjleegJUmWrwcje
         +f+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731491317; x=1732096117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaSnfzm/t5DivDcI8TYnD0ZfKr8uwA2J8rw6CZWmB2k=;
        b=V9hK/P4Q2qOS24QiL5fiyS+ysg8v/zgakC+yqGbqFtxO5Eq5zcBKqtnfXUAnvSjN/K
         AmuSDc+wDDnkeVcjTXEdD9iLlX1bwWpl+Nh+U3spm06X1x8zPwtZolfvfLnuo5OGKuxG
         QhaL3mKNUHPt2aDrCQaphBJ4/jXKz53DJmuPUIJy6T87n18/k+TjLuF8FqQQF1Rv5aWh
         kQjs+QLb27XyO7QEyzHKIlY2KdT5av+CxpaJ29XyiUjbtGFGgWORfmqwYuHK1Bm7/+d0
         ae9gIa8a9Gc8gaiJcN50QkYZUWP61NXmVu6OFfQVCKNku1l6RAc+Df9SVOBXOuKnNqFA
         BXxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQsmW6GCDbr0qF8T0vsLJi+6H8DYAM8jvXJl3nziler3mcFmWaP9U2QjuDUsX6jgtX4x+PZRQkpvBtBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjRvNsRCMqTh+0THkPKWgd9ttN97xRmO7u1imyKxk2Rj7Ix10z
	AZ2wRCxFzH7h2bis2yJt8T0dH5ctE+/ZCW51c97OjM47k4zPMvwmXYTo7BPFBbTCmolX44xq7bd
	Pm7Ikeg3YEKgLHlRgH/Gy356uoC0=
X-Google-Smtp-Source: AGHT+IHcLy8AEacbQGHGgfaEwyTub+t1gLTfFsAT9DwCgvxu+gX32+4tA6aRof7gwejihIaPx+ov6qt1kZkNWsKHlks=
X-Received: by 2002:ad4:5d49:0:b0:6d3:5be3:e711 with SMTP id
 6a1803df08f44-6d39d57c179mr302997596d6.9.1731491316900; Wed, 13 Nov 2024
 01:48:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241112211442.7205-1-rosenp@gmail.com>
In-Reply-To: <20241112211442.7205-1-rosenp@gmail.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Wed, 13 Nov 2024 20:48:24 +1100
Message-ID: <CAGRGNgXhtPy_G9O0n7dEhcAX3sWN=08tF9tgFpLs8V---uELYg@mail.gmail.com>
Subject: Re: [PATCHv3 net-next] net: modernize IRQ resource acquisition
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Pantelis Antoniou <pantelis.antoniou@gmail.com>, 
	Marcin Wojtas <marcin.s.wojtas@gmail.com>, Byungho An <bh74.an@samsung.com>, 
	Kevin Brace <kevinbrace@bracecomputerlab.com>, Francois Romieu <romieu@fr.zoreil.com>, 
	Michal Simek <michal.simek@amd.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Zhao Qiang <qiang.zhao@nxp.com>, 
	"open list:CAN NETWORK DRIVERS" <linux-can@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:FREESCALE SOC FS_ENET DRIVER" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rosen,

On Wed, Nov 13, 2024 at 8:14=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> In probe, np =3D=3D pdev->dev.of_node. It's easier to pass pdev directly.
>
> Replace irq_of_parse_and_map() by platform_get_irq() to do so. Requires
> removing the error message as well as fixing the return type.
>
> Replace of_address_to_resource() with platform_get_resource() for the
> same reason.

Sorry for the drive-by review, but I have to question the utility of
this conversion.

> diff --git a/drivers/net/can/grcan.c b/drivers/net/can/grcan.c
> index cdf0ec9fa7f3..48e93c3445e7 100644
> --- a/drivers/net/can/grcan.c
> +++ b/drivers/net/can/grcan.c
> @@ -1673,9 +1673,8 @@ static int grcan_probe(struct platform_device *ofde=
v)
>                 goto exit_error;
>         }
>
> -       irq =3D irq_of_parse_and_map(np, GRCAN_IRQIX_IRQ);
> -       if (!irq) {
> -               dev_err(&ofdev->dev, "no irq found\n");
> +       irq =3D platform_get_irq(ofdev, GRCAN_IRQIX_IRQ);
> +       if (irq < 0) {

In this change and a lot of the others, you're not removing the "np"
variable, so you're basically replacing one wrapper with another.

>                 err =3D -ENODEV;
>                 goto exit_error;
>         }
> diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/n=
et/ethernet/freescale/fs_enet/mac-fcc.c
> index be63293511d9..9006137e3a55 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
> @@ -83,8 +83,8 @@ static int do_pd_setup(struct fs_enet_private *fep)
>         struct fs_platform_info *fpi =3D fep->fpi;
>         int ret =3D -EINVAL;
>
> -       fep->interrupt =3D irq_of_parse_and_map(ofdev->dev.of_node, 0);
> -       if (!fep->interrupt)
> +       fep->interrupt =3D platform_get_irq(ofdev, 0);
> +       if (fep->interrupt < 0)

This one and others like it are fine: it's much cleaner to use the
"platform_irq()" function instead of reaching deep into the structure
to grab the "of_node" property.

That said, in this case and probably a few others this is a driver for
an OF device so I'm still not sure this actually makes sense.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

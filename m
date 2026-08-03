Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D66C3502A5
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773356; cv=pass; b=YHjdSrF6PHDsy48zh+8qqucwkB+Pzs67q39T12n9Rws8fnLVirJ/bgaTtD5KW6vYbhDplX7ezR5XLT0smNGvw3y5od0SdSROfGxfMg+69vZrFUA/Y5GCZlCEoCaTbe2cWuAmLxgEpootAgBsxw9+DQFlHtfXeMo06SA0MGNobK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773356; c=relaxed/simple;
	bh=WkleEX41KDLCmTlkLZWoFZUTVoGZM+SKri5I4gXE6so=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acMQ2/1Q0ga0IMoI9Pt1b+x512texww8J/bgBqeEh3yWS2HNcJLi6HZFGTCbNshmr+8Y5PsKOI/GKLZeFu9Rj5Ka9ej/vlaF5gqyZWB5ZkpCw1vpcKHpgKGmz/3izGdq/jYpRfhXtLzIomYCzsnQaF/+Dx6p9bOwZbdZdfAI2EE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzX/4zBE; arc=pass smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzX/4zBE"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-738cdd667ceso851371137.3
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785773354; cv=none;
        d=google.com; s=arc-20260327;
        b=fcvBu46FpluZo3pBzmsekMfXK9BtlTqEPePLXo2SRly1ghgyyCfmUlcZfG1yeM0iFd
         lDQG2nkOkhnNH7IgNcjZ8DS6e4j8UUgazgNIYtrmanlFwQ4BPsjPdAYKhLpRgrrBxqG1
         ItdyrBsITfxKfr655aJrJa4yPf2iayATxYvPHAMQp3XyBLpxCRb5DaIjWYfUnf7Q2grs
         A1QCtidtxaqn8j+Mrb4bO23FFEpcPBctWowmIuH2Zej203RTYrdfVdHjB+8zFk1n1htG
         92cElHM71XZ9OXdxUq8EjvXMP2zLAFARUopdZBJqBCeqhQkkNeQg5oGkM9ZaNBZYa9HE
         yLkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kPUuUdXNlj9HGEt2H/gq9i9+yKMP/RfrBRw+r1bpfmE=;
        fh=GV2xHCbY69Iimym/dUOaeAT/+lFCUPZwbN73fwTSon8=;
        b=O1uzyqflD71ZD5m7FEvw20ZtVLAMGdKcTPy7Cqcv5/9FJxBzqtF13VUlz8Wst+O34B
         a/dqyBU1FeMbR3o2jDFGTUShdM61fVxWI+QMq/FRcRbbWVfvo/+PWGim0uQjmqnNSi7Q
         4bqdUYguJIe+Ry6PnVhoGey2fE9vSyJ9rd8ZjzqX1mU6q6sqe96a3BsebcWSxFv+8PHz
         lAhRNsFZpAJhLedOXi/Oqx3cJWitwqkaZX4yYWwDvV+GvBkFA9ELcXoguJFtjymhlbg+
         u9pVOyjowtcObWZfP6QOlQt1lOGitz9JCSHgSE9to2mENtREuLFc8+xk5uT+4Szcl7fn
         H1bQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773354; x=1786378154; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kPUuUdXNlj9HGEt2H/gq9i9+yKMP/RfrBRw+r1bpfmE=;
        b=mzX/4zBEe+052mFRm7SN81ZXt0CAziEoNiDYOrD5pharPsfeh55I6PmPLq0cgK0e1y
         BhM7x2jQa0lYSqjxdQ/oDLcOf2Q+LCLttP0Mh/hmVGnDBjp8QlT0GIh5IQucWTu0BwD4
         OYaIACDi+HBZgAPuBARTZVwnkDFKHN2om+KaodZrQJXFQsqpyvUFyiylMnDmuNthTyhn
         O+xYXCu2fkbiFeYeEJgzMI0GvbDpt6L8//8c1i3YyZPSpmUQ7I776Cm7zQFsYAH7MDSW
         F1K+85CRkh1R4ZzmcvrIGjaFIJGVxDQPuXMiLm6SRGZXVxL2U//uIx0YiwA6c8pqQeyA
         +54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773354; x=1786378154;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPUuUdXNlj9HGEt2H/gq9i9+yKMP/RfrBRw+r1bpfmE=;
        b=l+n6F9OK5BjvVQxxWG5aDdZQxgFUVSRpj5F91Jxi6232AbIqONK//Ify60DCTt9GrR
         okJrHR/Vp6RdoPXyYOe+tWYgLa3ITPO1dchOyy8Ygx5zPqL3NeUn6dKpLsiHNsxR1eJJ
         00izyQ8cBWFwHLtZewfFnlsXfUVE8Q8xJ0LqRfyYeY2+cl+DKHasECISkR6x4U9vrE/W
         /A9PqmonmIeYxjgxCz7F01fwx85sAZn5GlaBk8K1HvZYhoT9EvJBIZ2G2tc9CUf7Z4uz
         2LKFe2aAYxLqySBTu7H0eUAdNrvx9d96T9nV1av3LZpRXfLUKYqNxFz+GlC3KIJbsAfJ
         jvzg==
X-Forwarded-Encrypted: i=1; AHgh+RqKmtaS9f/j5R9O4IXW43iRCmVFWbaRUJTxqGNiqm3QDx1hn06gDIJ4lTR0y3+Dr9Ir8jed+pIQld8t7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMO6CtDxQ6ySjD/4Aj3At5lCUd7lE2YM69OIefKqn45+c0ydfh
	5WfO+JfNvbsq8abIRTeg7uKM1MAJw3pmjqw/Sr+zoKIgjiTMPGVQ8fhO0wcAKiZX169YSBJWEPo
	VxZAloRRuEmhRxmf3DMgtU2vlT3ZetlQ=
X-Gm-Gg: AR+sD10NRJZ/c5o3KIA50C5bZXHTcwz3cuwfdjtudTmD0DL9oEdX3Rkwfq6R4FR2hRT
	HpabnfJ9RvFGE7SWbgA5KRGcMXtAZs9S+f4AXE6tZearXz4f6I91tizKsKzxTagEvcevq80vb2K
	L5J9qky0iZ49DkySTrzZLu3YotS1Xa9QfJRJH/tU7zGmbzG6M2XwTNjdUB1X6Desz5FBCmK+Sl6
	DCJwTUBJXPbTL7eA+WGgTPmjqJiz3uFmmZSQlKqMAk77XOkobVfOjgGIm7ob7OCgMQYIxC8TBww
	NdUoVTC1xhZlGPeq3Tt1Hitn2bgJzI/Ud2DieolI16GKB9dr+B5hINlYmDFycdWSMMyuj/FlevL
	n/2l12U6foqxNcU9v95XYNnA+gjWXzUXhX42u1BkjsQ354agYXce9ZLx1MK/ngGoq4Ap+3H67VV
	ih+NoSD0tgzpiwXoMI7ek+zIFkLbPFuL6/ZQC4
X-Received: by 2002:a05:6102:15a3:b0:738:be73:55e0 with SMTP id
 ada2fe7eead31-75b237677ffmr7059647137.12.1785773353603; Mon, 03 Aug 2026
 09:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com> <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch>
In-Reply-To: <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 10:09:01 -0600
X-Gm-Features: AUfX_mx9mt9dbVrMmCFnN7qHq2KVIXtx4IDcN-1su1pyV_2ANjujEXVMup0YQWo
Message-ID: <CADvTj4o0JdjoO+FC4pO=qnjEQ8MRyzQdKp2Hxy9NsPU-gym5OQ@mail.gmail.com>
Subject: Re: [PATCH 10/21] net: phy: add X-Powers AC200 EPHY control driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 7:51=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +static int
> > +ac200_ephy_ctl_set_led_outputs(struct acx00_ephy_control *control,
> > +                            unsigned long outputs)
> > +{
> > +}
>
> > +static int
> > +ac200_ephy_ctl_set_led_polarity(struct acx00_ephy_control *control,
> > +                             bool active_low)
> > +{
> > +}
>
> I've not looked into the details, but these look like pinmux. Does
> this I2C device have a GPIO controller? Can these pins be used for
> other things than LEDs? Maybe you should be implementing a GPIO and
> pinmux driver. The Ethernet PHY driver can then just select the
> correct pinmux configuration.

These do not appear to be GPIO or muxable pins. The AC200
documentation describes them as three dedicated EPHY LED
outputs: link/activity, speed, and duplex. The bits in SYS_EPHY_CTL1
enable those output pads, while EPHY_CTL provides their shared
polarity setting. I have not found any documented GPIO data
registers or alternative functions for these pins.

Therefore, implementing a GPIO controller would expose capabilities
the hardware does not have, and a pinmux driver would only provide
a single fixed function. The callbacks exist because the LED function
belongs to the PHY, while the pad-enable and polarity registers are
reached through the AC200 I2C regmap rather than the PHY=E2=80=99s MDIO
registers.

>
> > +static int ac200_ephy_ctl_power_off_locked(struct ac200_ephy_ctl *priv=
)
> > +{
> > +}
> > +
> > +static int ac200_ephy_ctl_power_off(struct acx00_ephy_control *control=
)
> > +{
>
> > +}
> > +
> > +static int ac200_ephy_ctl_power_on(struct acx00_ephy_control *control,
> > +                                unsigned int phy_addr)
> > +{
> > +}
>
> These look like a regulator? The phylib core has support for
> regulators.

The external supplies are already represented as regulators. These callback=
s
do more than enable a supply: they sequence the package clock, reset and
shutdown controls, then program the PHY address, calibration and interface
state required before the normal Clause 22 endpoint becomes usable.

> Maybe take a step back and look at the overall architecture, and how
> Linux can represent these blocks.
>
>         Andrew

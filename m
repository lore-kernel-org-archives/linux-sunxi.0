Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCDE1A8412
	for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 23:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748301782; cv=none; b=R43fCGoE90v7XIBm98Uu8SpBSiaf95YH33uoOleam3leD14BywbKMgMnQQw4ariUO7LCeGD5bbiDUxqzgCw4iV+jMowOy19NZbgPHsVvKcxrNgspueFkkPDNabo+Mie7tSy6A/f3qVA1XXyLUaEJrrsCpSwIuHT7gfDOmOHNcpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748301782; c=relaxed/simple;
	bh=NAPAPDD+78wGKH6ZcOgtyAHb7B27RqAuSq6Mxjqyho8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ORNzZwgm7zl+GC/heh7huYvwR440llx8GNm/5UsRefFdyvTrk+3vZJ/kDm1GNMLZt+o5mKtrqZ0QJwkaIxrbVWkOJJ4iKR0t1RDrJ1Rd5SjJe7YSE5Vs+DEBBT+zATey6BjExnRvbekR+EpXJ7jNB7E9vS6OJ+P5ccTZuhxeNjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VreZsWRv; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VreZsWRv"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-525da75d902so774183e0c.3
        for <linux-sunxi@lists.linux.dev>; Mon, 26 May 2025 16:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748301779; x=1748906579; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC03/XuOWxCMaYoNF0Q5x7guuS3v9+l1Cc12aAtnnkA=;
        b=VreZsWRvVGeRF7qLlVOTY1JVddoQGej08pyVJkQ2TaRsExgXW60T3WfP6n0JZLR19C
         6Mk0hm7v1wftCLvxN7M/Ndzv7IpPRFAXJhH+ve5z59o4dvYsoxrIEuOWlEg/jbvObJ/0
         DMB5KVQSWAwj3RiB44hSiWZkTW82c1+WDTNvn7nFe8/brJjjwywEI2UAS7KH6T+J7Hpy
         CehmUwS35l8gIBLUUlvEI0LkD3tJ4Bqx7kCQ/xysefbX/uwA0bt9EUfw6tDnZB2zubAr
         ISjV5qLpdpzID8RBB16L7oJ4a6tgFuTnnBvuvgLRkUknO4lDzVIoUei8X3chc0g5xE8b
         /pJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748301779; x=1748906579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eC03/XuOWxCMaYoNF0Q5x7guuS3v9+l1Cc12aAtnnkA=;
        b=ejgsmJUewEAJTsovPm8fmHp30j9CFfr6JXD+bDf0Se84UHEso4xZh8c/D7x7l0bzOj
         F/UWs4ZIOEWcKgGKgB9wRC6UWECfwuEpRux92/BltuWw+Gms2SyHmQj/YG/XFaIo38Ng
         j2uZGaw5/ZbGD85+KMOJA/mY/OPFPL27BM/iVUikBMGwsJAbSEAl+TxzjdQbDBMM7BaM
         FGmku/1/+ZfPicnZJhA9Qkz8Lq0/yJ8I0Jn1UZ8eHyt6Z7HdI5m1ks4u25AfJZRwjPRc
         amdtij9PdJVjKVpsXAcvwnZchP+sYp2E3B7WmpbjrA3JoKJ245gaH1BVbXkRJSsPm7/d
         b5Kg==
X-Forwarded-Encrypted: i=1; AJvYcCX8/zTvnsC4FOkLfRmhIKu3rdE70kQm7Uhox6u0H9FoILv9tkTsDic03hAw8qC3DOEPTAb6J1JoK5EEQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhHmE8iA2LBf3JJnPlikskEppjtQ00WcAuF96E07IM5OGOHpv8
	TZz5DPzQ1haG8YOnPxrfKCq0HxH43mNaZzuqrmpR8qpPUwoy4jECiy1OuQ3rh2EHzQ7Atiw71Ir
	xkmLUFtMhGx5M8bfm/wxkQ/tSCrYtvtE=
X-Gm-Gg: ASbGnctuVFyD0k3KHpRWrA0Jsb0ltWEQ1YwLovakRgpev3uXTHcZsA2LUHBzqzMvIww
	zo7LhxyrsZEmw4AfDa8ZZlNP+bSJtBw2uff9uI+e/eNezoodzUlTjdm25xGI9PD7HWULKPM+GLF
	5B1oPx/ArA83wNkVgxiVpq9sG9fsJyEO6KFCdarodDPmyf
X-Google-Smtp-Source: AGHT+IFzKvKpSlFrb29A+sbxmD83XHx6KY3PDBx92mB2cK4b03AI554D48rVRv1CSb7aDYfIUCfFLjNZtV9qdmUBqQQ=
X-Received: by 2002:a05:6122:900b:b0:52a:cdda:f2a5 with SMTP id
 71dfb90a1353d-52f2c31882emr7542326e0c.0.1748301779382; Mon, 26 May 2025
 16:22:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-3-james.hilliard1@gmail.com> <959e576e-bf36-4d01-9ffb-023931b61574@lunn.ch>
 <CADvTj4oqjCkMeK0p8ZBa8PQmctc77hpiFK2pqgBJaxRFDgQoDQ@mail.gmail.com> <d4109cc5-83d5-4acd-b0fb-39a50043060b@lunn.ch>
In-Reply-To: <d4109cc5-83d5-4acd-b0fb-39a50043060b@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 May 2025 17:22:48 -0600
X-Gm-Features: AX0GCFv3GoYFahfXaX4AD29prOBqSMyyUCB0mQcsqn6ElJfHobjLmo9NhUK-PQA
Message-ID: <CADvTj4qdoD-mo7CxNW8VitZf+wXTiZ7m28R4JPQ9kQJGhUH7bA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] dt-bindings: net: sun8i-emac: Add AC300 EMAC1
 nvmem phy selection
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 4:38=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, May 26, 2025 at 03:32:03PM -0600, James Hilliard wrote:
> > On Mon, May 26, 2025 at 1:36=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > +        phy-mode =3D "rgmii";
> > >
> > > Does the PCB have extra long clock lines?
> >
> > I'm not sure, it's a copackaged(maybe on-die is the wrong terminology)
> > PHY I think so I assume the clock lines are internal, in the device spe=
cific
> > dts we set something like this on the emac1 node:
> > allwinner,rx-delay-ps =3D <3100>;
> > allwinner,tx-delay-ps =3D <700>;
>
> Those values are just weird. The RGMII delay should be 2000ps. 3100 is
> way too big, and 700 is way too small.

I think these may not actually be required when using the internal
EPHY's now that I think about it again.

> I think phy-mode =3D "internal" would be better, and just hard code the
> delays either in the MAC or PHY driver.

Hmm, would that make sense even though the MAC driver also
supports external PHY's?

> Thanks for the link to the old thread, which was 5 years
> ago. Hopefully since then, a bit more has been learnt. Quickly reading
> through that thread, i don't think an MFD is not the correct solution.

Well the current patches I've been playing around with for the AC200
phy are pretty similar to those patches still.

Here's a branch that works on both AC200/AC300 but only if I do
the PHY initialization in u-boot:
https://github.com/jameshilliard/linux-h616/commits/acx00

> In the last 5 years we have had to deal with more chicken/egg problems
> with PHYs. It has now become pretty much standard practice to put the
> ID values in DT, to get the driver probed when the device does not
> respond on the bus.

This is what I'm doing right? I mean I'm putting the phy ID in the
DT for both the AC200 and AC300. When doing the reset driver
for say the AC200 I would wire that up to only the AC200 phy
node and not the AC300 node(since the AC300 reset is MDIO
based while the AC200 is i2c based).

> The DT node can then use phandles to the reset and
> clock controller to configure them as needed, the core will probably
> do that. I2C is a bit messier, you probably want a phandle pointing to
> the i2c_adapter, so you can use i2c_transfer() on it in the probe()
> function.

Without a MFD or some other node that exposes a reset I'm a bit
confused about what driver would actually issue the reset.

Yeah, we need a phandle to the i2c_adapter, but since the resets
would be under the AC200 PHY node I assume there would need
to be some sort of intermediary driver implementing the i2c reset
right?

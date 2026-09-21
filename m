Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B5F4AC142
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 15:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003400; cv=pass; b=Fllp4tbJzgRn9FiGYk0AWnHKXfwxG010AQ411xlpx2JlGex7/4iml6ijjmVD3spZ8g+FVNjSnglfG9Nylztqk9KMAO8olMiYRmcKfcXO4It5p7HVkzV4osWhnuE4r2FQMmreFW2eD2a+FQYCWLw2VAiw75v5DjMnC1OKpNpwMiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003400; c=relaxed/simple;
	bh=RRnt92cNZkan/7gjLZgpWKhsYasr+rG4EuXp94q+O0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n61EISjfNLu4F5fPg05ol6SOn1tdzqh39CGWy3yqWBVGTzJyJFrABKCY7x/pKoC9gmla2ScTjIRA86PdTb1jj0HxyH4LVzFmbb2BK/5wHXKzoe5YCcTL7E+4CCkpO6CTNwOl5QWwZDde5gz+UwFVUawzskxR71ZRe+xZ4C+Vk3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAGciqiK; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAGciqiK"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982dd15d169so1758876241.2
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 08:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790003397; cv=none;
        d=google.com; s=arc-20260327;
        b=Oen2it/FZB8sYAVrc1QJ7AIfTKTCo48B54MQTypMaViOb9jrsiHtveKJ719afMVOv2
         hHlGAhnpLr25M3VduYVZwvgJxyFrYHOr08DbMQyZoxAgrKcZGG5IwTwchw9Ogva+X5Pa
         dh4VUF23B7odyE7KfbtEBx1VN+dA3EWgVYQLEEH0cGKfLX31Jidep2E3prCYFjeQY2m1
         CsjvW3kryoFFcSsiqcQnVhC7vH4Wo5qKHHInNRRHsDEad0wmIWfK88fBZSWdcs7dJj9j
         iJj+i8Spg9secB3ijsKswBuigNOAcH8k94lbYQH9/vxXXDmzzjami5R/Mtm/IDPKDCpN
         Ux/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1DBiA0IyE2Ft5pvUMescJhhLqoAG9H5I9OM90H7dNs=;
        fh=4f5NKVo1E2W+YP8Ihe81WEvsafIMAZxIZN+0flYGgy8=;
        b=MRIurAn7QkZJXOoDEu8wu32JYXI6ZYDQPSASXawHucDuoKMW0M8kk0vEqZPQzxOz55
         a90xu3J/zDXkF1dh//Uv3AIUnk3AqXIvYsx/VH3F8sBt+8/MwcxW2UZRUsUq6neRPDpK
         dOGWK/ySDWh/ALdvJxQVWeKTYdsIc31ZKUJTMMAXyhl1D+Ac1OyA4ZApi0jHi9ObHS5a
         5Vw/lNi63TJ7b/S2W5ilIS+InTFPgp7GcFL8OeTNqd4n/fWCsQoTKa8g/udMq2YqDA/N
         59Nc5gHRpQJ6pBzAe4QH2pNebp6O0MZjgdZ6bcUKGkoVY9yj6QsDvhBk0IVDzSaWlWve
         tydg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003397; x=1790608197; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1DBiA0IyE2Ft5pvUMescJhhLqoAG9H5I9OM90H7dNs=;
        b=QAGciqiKYeeYxzkj38dhTnRXLVJY3ad5LlydOFB6ndLc2TX5JARiRi71rYiQvBBq0A
         D7lWfPsyLhHuWsrAaovdEymS/JurMgCA4j+0lSDYjoMRvJV0SYnbbw/kfDnVrO1f7ups
         fL44aBsbwcFdc5DZo6AveP3eki1b0ToaTr+64Ou60jnGG138gHcVVDjpPj/GxbTdC7Tj
         5pZ6p8Oh10wTEowKa4vOOu9dT5LW6FXRvLPTrUr/OIhNgowfaYLx4XsH0F24KOFgmZKk
         IbGiW+O9co/d79uy+gJjk8qnvwnbm9CiX2tUY6nGI3YjNPzRUodGtItbG7kGb5wat4JG
         5hOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003397; x=1790608197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1DBiA0IyE2Ft5pvUMescJhhLqoAG9H5I9OM90H7dNs=;
        b=RKfIcSIeihZFDN8jH9kwytcjOSIdKVx4s+rQ+LhicW4MGNpenlpxiNPSD/ogZfkCP+
         IugZc9etvR1FFhxrSeDS0hGwSQAO9+An9Iw6diH0JRisRuA+f4zG4pxynONNXCOxfDit
         +yI6Mz4YhWAykeiaTRE5F4ubjfp2s1C0gjZVOmNyhzb3QeUV74geBgrctZHe3UIExOXG
         IQ39RzaVoVuXu9AJhQKipt5sHkn8P9srBAR39vO1B5zk6ny7MswGqMDU9dxhgIQyh2hO
         7jK0J9Rk9SAJAOzh7dDvEFT7jZQ6HfBItKSjdjNoWCXTRuVLoTzz2vnf7wja2Ixcv3zm
         wt1w==
X-Forwarded-Encrypted: i=1; AKwUvBztLN8zNfOVn+KqhaGPbX8OKwcXPafM5BRvcnFSYeqcQmW5Im8vJJzTBDx87YKgcTwn/yqjJnwfzb24Ww==@lists.linux.dev
X-Gm-Message-State: AFuF++nqDt1ZNaaDHc+ooGZfXcbUlTjuIT9fJjnrmYZo4JpmMJnEFfov
	IJvGL94Zz6He1n3dtBvQs+Y3vsvOidKbNPBTTgiIM1darfXRo0zJWH2qAfUy0V+xiPt50v0jVlT
	gP6KmQ2wctzMRpJvwXjLbujYfuVN7mZk=
X-Gm-Gg: AYBFou1r4Y/CMIh/eYwkUK2QfCgSFV/5j2G1sUCooGAheuZhj9YKVw61E2k84+0lrzD
	WiJbCX+FpjNrK+gp/0teVmEvzw+LXOaPCJDTchJvcc6L+jzhbR59pC7A9eZ9xN+ZMruLFY1V6PW
	n/mHyoY6L65yaNTwAqs6hZh9x2nXNsBnziDwbuox/Se7LnYF3+vyY09vUBPhOS31bBnKNvTHYZ5
	sKkYmIWONpHNdHc2KPIv3q/O5NEch2BhJuPr498jRw7pzBQ0jDjh1DQ6/X4/pK9uDcPv6Itnqb+
	jsKYZq5i2coOFmoAewo+7XPezEhveLIggEgeLIRxIJkdD0yeLLJq37dt2kj1XZZtC4hI9R10tnh
	0VwENhQmnePpig7XMmMDM8QGiGN+Iglzvws3Pkv080DZUZdj3r6oFakK81NhrVJSX7DZ7PpRB0p
	XI/324CQngdzmp/Akrjalbh9uvHs2qEGMWy0J4LML0vhm4e9MqPvOpADQ=
X-Received: by 2002:a05:6102:148c:b0:7a7:198a:c2b5 with SMTP id
 ada2fe7eead31-7a7198ad369mr3357929137.29.1790003396967; Mon, 21 Sep 2026
 08:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com> <475799c2-7eaf-45ed-a6cb-80c2c2c556e7@bootlin.com>
In-Reply-To: <475799c2-7eaf-45ed-a6cb-80c2c2c556e7@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 09:09:45 -0600
X-Gm-Features: AcwNN1VLNx3dtquO69cswaFe7FbqPEaN3LW5P0JUb4jisnZv9ewZXpukHo1wT2U
Message-ID: <CADvTj4qdVGDXGyXHmCGpb+ztvXs2kS3_joaCZkM0dq_sYvHscw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/6] net: stmmac: add Allwinner H616 EMAC1 support
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Christian Marangi <ansuelsmth@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, "Alastair D'Silva" <alastair@d-silva.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 5:54=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi James,
>
> On 9/20/26 21:45, James Hilliard wrote:
> > The H616 secondary EMAC supports RMII at 10/100 Mbps and uses a separat=
e
> > system-control clock register at offset 0x34. Add its binding and a
> > sun8i stmmac variant using that register. A distinct compatible without
> > an older fallback prevents the driver from using EMAC0's clock register=
.
> >
> > EMAC1 connects internally to the co-packaged AC200 or AC300 EPHY and ha=
s
> > no external PHY pins. Leave PHY initialization to the PHY driver instea=
d
> > of using the H3 internal-PHY controls. The RMII-only variant does not
> > expose the RGMII clock-delay properties.
> >
> > First fix failed MTU-change reopening and hardware-resume cleanup in th=
e
> > stmmac core so the interface is closed without repeating NAPI shutdown
> > or resource teardown. Allow phylink to stop a suspended instance withou=
t
> > restarting its link. Then move the MAC software reset from probe to the
> > DMA reset callback, after PHY initialization. This lets the MAC and its
> > MDIO bus remain registered when the PHY driver or one of its suppliers
> > is not ready yet. Clear DMA and interrupt state even if the reset times
> > out. Keep the separate H3 MDIO-mux reset sequence unchanged.
> >
> > The AC200/AC300 EPHY driver and package bindings are already in
> > net-next. This series separates the H616 EMAC1 MAC driver and binding
> > support from the earlier combined series. PWM, MFD and device-tree
> > enablement are being handled separately.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes in v4:
> > - Add a prerequisite stmmac core fix closing the interface after a fail=
ed
> >   MTU-change reopen without repeating DMA, IRQ or NAPI teardown.
> > - Close the interface after failed hardware resume, and let phylink
> >   finish shutdown directly from its suspended state.
>
> [...]
> > ---
> > James Hilliard (6):
> >       net: phylink: allow stopping a suspended instance
> >       net: stmmac: close the interface after a failed MTU reopen
> >       net: stmmac: close the interface after failed hardware resume
>
> These new patches belong to net, don't mix the fixes and the glue code :)
>
> The glue can land without these, no ?

Should be able to.

>
> Maxime
>

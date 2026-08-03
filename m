Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AB741D224
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 21:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785792878; cv=pass; b=BPX0Sv5vo41VLawfxNyOhk55acpZmZEepCXtBXlwzCVlOrw8rCUORgixz648DiKPF4/f/uDwxGNivjnVUzBdtOHF+QlhAGNv5fd6N+RzTDX2z5LIzUDZ2QQaV6Ipulw02THHLi3KWDu0Z1j0crypSIimXlIujapgvdSkqwqGewM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785792878; c=relaxed/simple;
	bh=jrCpdiSBc0sqoht3jRVlLKndiJ6qMGmFxu9cVzHBY9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xahb5EGx+/ULXGx6M6fCe93bJ51kp4vCW2K5scNnQjHdrG8e5irtC5jW5LDBKZ2mbKcRQuxlLm4YRvwHqb8kKd80K22M0MHcJ8KYMeoRhnbJsdlbYAr7IQ/+Pzz6/8Y4vrXsqZ0DrJHbAChMLhpNPYjbyLwEliYq8ZPKw3Kd860=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Esbtj2wD; arc=pass smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Esbtj2wD"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-966e7380109so2017426241.3
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 14:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785792876; cv=none;
        d=google.com; s=arc-20260327;
        b=RceLLQQf9goUnoI1oPIsa5XIR8gz7JXGipGXcdroWVGvC3h4KwckwqJ/VajluDRks7
         S7yE5yJcFg53hjsXN+z84WvI9lgtxhBZJ5TsEKrz0z/5v5I7lnFvWuHcHsUO7rEO8IEq
         IaxIJEVOMhBR17SED8JzKmN8Kq2Zgh43tuWrVeZHbe6H0CfwTaT90LTPnomAo/3sJegg
         H9TZOSY0o0W3iChNBLOIsVvqJG4slcn5anGJ2XhDpkLEg39KA2r7nmV83wjn13/+YDhE
         /LIbS0pk/GpaEaPPHBd1mFUGDz7e7WO8X/Jf9Y6Re447+7W6C0jYf0Poq0JMFWgKQVGV
         VqSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jrCpdiSBc0sqoht3jRVlLKndiJ6qMGmFxu9cVzHBY9o=;
        fh=G7a3opsDzl3JlbSPP57AZ+6a9lXAcvcRKYF1OnEjAMo=;
        b=MRy0AwKTkTYY6yvAv3Cmb6KVqMEKJcsmHGEdN6TkpgFepUmFM+Uj9LYczEpo8GqHZV
         N+qWxF/8sJgaofG8tYuZcnSD2Gc8sObtdv+H5/RWWvldBWk80Kwo1d2l3kJZc5kYJ5zl
         A5QgwMOYNSNHsZanBeUnxBTftjcLHw/WtMuJm299BTwp1phxCYNYo14pHNZU6St771Ze
         f9Sfbx7oNvnp99T7InOCPDLcwcglmiJXgFeaIM84f5mrKNyM5YT48XqUjOLkPn8xsd37
         +HmEqE1vBWTNFz/3FddX0sese/pdUDolNByaPV2Gm88qOI1Zbut1t7PJliFy+lImBCn2
         Yjrg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785792876; x=1786397676; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jrCpdiSBc0sqoht3jRVlLKndiJ6qMGmFxu9cVzHBY9o=;
        b=Esbtj2wD6M0lAauXvCpk0AjWKFWSgbphTTAuTQsIjvajYlaPi/JpcaQOE1cItmPkNm
         JgusaHX/DzSHrkYqHZ4nCwRQYSkSeF9Nw0/cHGsTb6m4Iy8eaja1MBYdNTiQzchK9zRY
         F2atfWLKkQEjU8pnB7C9Xiwsj5CKnppaUECTY5A4tUC2GNcQbJLWz3TJ1qhFllrE4ZuG
         w6BRgxdQuQP0bARQWJwD6Mr1Vr4RKr8MA3oAYaHB9L0xoQrkH57y6gDIv30sBTU/nrI4
         WWgkEvQE450sG1WsC8Kne9uxQllFXbWBCFGUg3m/abFBL28iiO5uTYkaBUVy/MWvYnSs
         yRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785792876; x=1786397676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrCpdiSBc0sqoht3jRVlLKndiJ6qMGmFxu9cVzHBY9o=;
        b=ck784toUpSKMGlbZ7kZE3//7k3P96/Eh7LYNBcShEcOhgxceScIREoQ0NyIKeb0cA7
         1CoXFMsPOg0Ckem6EvrPQgfkHhWkowGMt0B0W8moz5Hjo2Inou914ZGfoAXNf711q2Fz
         FbIdggL72HjArfk6gfANecY0fqkUP+2eYuPot3JYICpqUzAVfI+kfFKSfsuboo9mxfug
         w4xcAmsqz5K6CmqQlqOOQKGGl+4MmWk1EQmNE9M3KhX+kDEQRwIfAlZcudY+Bbc5shmd
         Zm9fvHmXsnRx2PRVFkmIkw5euDFW8VXhbEoqUxOSDQfYj34pWe12kQAuI/vg1QXRF7Ti
         RTfw==
X-Forwarded-Encrypted: i=1; AHgh+Rosx4gJZoSi8PaXDzATWqP0fh+tCHGHkEubSn2ZjEPgjt87QDXJtnYt5aCobn78PFd4IpISsawnLXFiFg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2A6bH9lkEe75p5EMkO3fF0SP5d1uNpBGfJLHkuVNsvlVOOUDJ
	ZWhsq8uHS4TCW5EEoo7wP5KO6+bsccIZIROD0SRCbMgi9ZEgk0Q3vufsPn2SF7CGoe3h+BYzTFu
	MROCgAMJ8miulx1J3+xFY1BRtxYT/ovE=
X-Gm-Gg: AR+sD11/RUi7weFwtXoE78CYtFkjRooV+JtamkX2OAecL5ySwfa290ETUZ92YOAb4Zs
	D9nEapTa4KT7DieDPogWN69A+GfYa+p0x5B+1nesGSDD4psiUhIKoM41vSE/uaAE9bdM6HcKmu3
	gZt8rZ+4p48d1bVb0KXo2+L+kAkHG4tjvYArPZNuI+XuOGlohLQaRKUM+NAPpyeGHzC6hW794aH
	9iGrj1HtPVoqspnv6cf6VA0+3ARptoKbdNZQdb44A7/MKf82f3jwCtQ3TpB3nqKebVkBZsh+Vhv
	DtUaxZFIpEE0UyW7/6+umFJ6DArVU+Jgvuttzot5PfU94fzNcTApfSupewQaTBMXpPL/s3v1+aJ
	G4ISPXEpg5v5DNitREJesLRbF3U0Vfq6Bv+ajYy4BtjqNXYXx6xh2zMQkxsAEcT+GMTU9Zfw1AJ
	WKgKY8cspHPUWLC1rPzGbh1oB61buyFRE5PTUNs5VqUkdhUTI=
X-Received: by 2002:a05:6102:c08:b0:74c:7fd8:73eb with SMTP id
 ada2fe7eead31-75b2196451emr9291357137.1.1785792875669; Mon, 03 Aug 2026
 14:34:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com>
 <f2cc3c90-060f-40c1-a55e-e2ed91e65487@kernel.org> <CADvTj4q7HnOYJZE-M070-1npEdne__Ct5D9FeUNVVXa8Bsm7qQ@mail.gmail.com>
 <e198e8fa-6c5e-4c8d-a4de-d8bb25aab0bd@kernel.org>
In-Reply-To: <e198e8fa-6c5e-4c8d-a4de-d8bb25aab0bd@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 15:34:23 -0600
X-Gm-Features: AUfX_mz0nFlKIv_Mdqu5KdrEqoS_kIvG6t--sSCBfp69bBMk1YT6VypHPp03QP4
Message-ID: <CADvTj4rjXGgF2d9Xm6TmeS2LwaM+O2wFFH=rGLA32y+aMk2KOg@mail.gmail.com>
Subject: Re: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 2:20=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/08/2026 09:54, James Hilliard wrote:
> > On Mon, Aug 3, 2026 at 1:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 03/08/2026 07:14, James Hilliard wrote:
> >>> The AC200 is an I2C-controlled mixed-signal companion IC containing
> >>> audio, video, RTC and Fast Ethernet PHY functions.
> >>
> >> This fails when applied, because you did not explain the
> >> dependencies/merging of this patchset.
> >>
> >> This is THE MOST important information of cover letter. The first thin=
g
> >> to explain.
> >
> > I did mention in the cover letter that the pwm series is a dependency:
> > https://lore.kernel.org/all/20260703152215.192859-1-richard.genoud@boot=
lin.com/
>
> Apply this patch and test.
>

How were you applying the series?

I noticed sashiko was also failing to apply the series:
https://sashiko.dev/#/patchset/20260802-submit-acx00-of-dynamic-v1-v1-0-0a5=
3cd9e21cc%40gmail.com

But that appeared to be due to sashiko missing dependency resolution,
I went ahead and created a PR that should hopefully fix that:
https://github.com/sashiko-dev/sashiko/pull/389

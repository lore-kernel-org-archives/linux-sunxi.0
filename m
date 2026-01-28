Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C26F30C60D
	for <linux-sunxi@lists.linux.dev>; Wed, 28 Jan 2026 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769619164; cv=pass; b=Ic3oCUXzZqwPP+ugaRB44lFb2h0tTN/RZUdevWDpTcPBsrTv5NS5nFoIEVzINrvum9YClK1q1dBcz1BmYlJdWdlSsPuKW2iAh5+0/pguCPnhZI/AEF1IeRQLQRIckbcJCbB8wudt2N9xQufnr8Os1hepqW8KV6sNB7KMJjVx/AA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769619164; c=relaxed/simple;
	bh=TpCucwmKAK2k086DcpFd+VvfN1GaOQ0WjNJ+vGCA69U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nNs1W6Uk25zZ8YesJEgqiPd/q0aCfbXsEhlQQtn1tUEykbmbKNSKSNq0feT9zOAWyJ7sEQ+ccMsh4K6rn39MDez0ODYLXiE42UO6KnwSa2i9+n5JQB09ByQ70+KutTD1AmsQM7LvxYXYhdX0f6PFAJ/6B5aPoxELjXA5NFJk/7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMftzo4q; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMftzo4q"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29f102b013fso64546885ad.2
        for <linux-sunxi@lists.linux.dev>; Wed, 28 Jan 2026 08:52:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769619162; cv=none;
        d=google.com; s=arc-20240605;
        b=L9L9vl9ayzJHIRnaOwVcEBn0Fw9OqVOTJrdSKbYkoXIz/hQKBmSTG17o/fjvRf2H9S
         qTnZf31gUfGCHODxCDgwImfis3I2xrgX3t1r5g1KNs4UMthpIPiaVa0T8HybiI7Arg6y
         NWiUqAi7KYlVwyVMklq/egBcE6ikuIpRDFPLIC0UJzcgw5Tq1y1c4aD5xxj+qwDAZISd
         u84n5RIlgTi+wC8+N4BiLC+PADus2V9eOnJAjYSQCN2XLTWRbpya2/s7XhFRuSf86aAK
         iO+ju7JwNKMD7PwW2GrYk4QoLgJqGtiJdxUtomhFVEdKKxeW8/w4q3pM81GIElWowYeV
         UGeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LX9gDx3KFBF5yxVstQOoU+G8u/eBTnZN64aCXHiziSg=;
        fh=8lF+ulMo/Kqmd8oAUGR3zfywUZJgYtE9o703lLNdOhE=;
        b=XCpPfoDaFSfRVK/Pfj0W2N6iV/qI4rq2Vef8Nxm7/PJK5/VGPQ0MEBusGxVRbS9hPj
         +L8rK8wyz3f63rjCdoXsxO3TdREQmCmc4SD3oVO9vEKHcZYMo49n9p4a+KFpoh++0IRh
         A0WGBuxjjXqRqnyRUzdrl7y9hUjktFyT5vvX0bPPkhiLIDTQhQDnxKtB5DuzbciBBQ5g
         mLds4EbU0o2xMFYgDYHWOBq3ufSdiIWlenxbn0jGHc3kD3bp8NlWLpbca58Zps3vwaRg
         lAUrkalwHpfQAepo59oUme22BbMsD/Q/DOFLUaBScMadWKg48CcD6ax1tKdalF0Rt5O6
         LXYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769619162; x=1770223962; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LX9gDx3KFBF5yxVstQOoU+G8u/eBTnZN64aCXHiziSg=;
        b=mMftzo4qQhuEGChK3o2q6Y781HDc3s+6wMeQh08SMmn8uvR2S/cQW0aQCcjA5UdEFN
         M6L0aOVhNi6b/aClV018fgz7P+MygHp+4iqAspYekUoVTwlGUzsleB7lSl/kJzpRfDd7
         iIepT997935a7BjPjOsd7W94w438WLkzMZHDZGyStkS6LQW74n884dm4Fo13I89y/ypR
         brXvlQRVy2seM3PfPR95X2Ymi3We2pWnJBJI/r/3Xh+gmlH5ww0qVWLsO1E7PXZpbPjb
         zCB3PaQVGnkRybv2IgVu1vTDXfHyeA5oeLNQWiPlnwLJMAAoUTXKTheQETxzP8rn9qKe
         wMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769619162; x=1770223962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LX9gDx3KFBF5yxVstQOoU+G8u/eBTnZN64aCXHiziSg=;
        b=wwCSFZNoweHaek5XhC/DXnC/IG4MEhag/1MoFUQbz3Kky7a+v34xhDRyaAlf610ryC
         B4IR5s+dvgpWCr1HXeZC7pg6z+RdGQAHocEaJdqFlMLMbdA2efSXdHHHOeyAI4tbhgGr
         FqPz/2bMkrGH6Eh4vmYuKxp8YBZoJ7p4U8IK2lVBPWoT8ibaGaxUv5Y8vHq/ibbipW5o
         7iOqo+bnoZKTdU1I1Be2lhW0EVRNsUprGj9RjKxNHFsMMSzHHjNMWS2Zm8JsJndFJESa
         F0SnDja5FkuyVnh07fcR3c7G6wr8UXW2HQ9yOUJij6Qf8Ifvg21GxdE8AfINNR7MsbQq
         POAA==
X-Forwarded-Encrypted: i=1; AJvYcCVYdwfvSNO6KaPUqwQ802pPzI80ZckjPcNf61uDRkgpJphzTyYpx2mVQgumTej4/yugEoI6p7Z3zBk6Vw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwghFEhVRN57y4q3cIk6La8kgVL+D0HMWA2XSDxdB6/7GJL9wrs
	y+Me56dKAzb/aI3aqTzBytYGa1wH993PtVPz7sjKhy0/JeTB+qRt7TLweL5KoEA4Dyq3NPUuK3G
	Ks/ZhVPEeNzn3wHvIm8Nk731k29fMhg==
X-Gm-Gg: AZuq6aJSlUoAVYg/MZhHUDVWmR4On5Xr8zrE9yTBCqpsAxsFYHKlvq+kLEjB5yGYo7X
	yUGQ+fQyEyru76c2abdpQ6wuc50a5D1bM88j8OuVjrHZbJ9qdJnvzwDlQsFIa7Srk+CZhT4pjrc
	M+0QPeZvmJDmZkO5Pzd52maUutJEHIWnR1Cet9lCrJxO3B9rw6VhKQqFKp2T7G06W/1QGfXkB9Z
	vqzWKOE9hQPxQM3yKYXn0vj3jfPmohf7FMkj5Apua4vPBh88uh/A6TA1G/xUF/MGI2UXr40
X-Received: by 2002:a17:903:249:b0:2a5:99e9:569d with SMTP id
 d9443c01a7336-2a870d6483fmr54239625ad.18.1769619161524; Wed, 28 Jan 2026
 08:52:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250427142500.151925-1-privatesub2@gmail.com> <aXJTqzZaBrCMnTvv@shepard>
In-Reply-To: <aXJTqzZaBrCMnTvv@shepard>
From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCo0YPQsdC40L0=?= <privatesub2@gmail.com>
Date: Wed, 28 Jan 2026 19:52:29 +0300
X-Gm-Features: AZwV_QjtfqpOuCyYtNE1xKe0593NpcMxJ89wFPIBopBcRc0tp-flqstJbbXGRk0
Message-ID: <CAF4idN=h9u2LX8Oa9_LcyM9ANUNtLbPTMyn_pHbZVBCXc5Orvg@mail.gmail.com>
Subject: Re: [PATCH v12 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-kernel@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Cheo Fusi <fusibrandon13@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Thanks a lot for the detailed review and for testing on A133 - great
to hear it works there as well.

Good point about the naming. I can rename the driver to sun8i-pwm and
send a new patch series.

Thanks again for the pointers and the context.

Thanks again,
Aleksandr

=D1=87=D1=82, 22 =D1=8F=D0=BD=D0=B2. 2026=E2=80=AF=D0=B3. =D0=B2 19:43, Pau=
l Kocialkowski <paulk@sys-base.io>:
>
> Hi Aleksandr,
>
> On Sun 27 Apr 25, 17:24, Aleksandr Shubin wrote:
> > Aleksandr Shubin (3):
> >   dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
> >     controller
> >   pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
> >   riscv: dts: allwinner: d1: Add pwm node
> >
> >  .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  84 ++++
> >  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
> >  drivers/pwm/Kconfig                           |  10 +
> >  drivers/pwm/Makefile                          |   1 +
> >  drivers/pwm/pwm-sun20i.c                      | 379 ++++++++++++++++++
> >  5 files changed, 486 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun=
20i-pwm.yaml
> >  create mode 100644 drivers/pwm/pwm-sun20i.c
>
> Thanks for your work on this driver!
>
> For context, this PWM controller seems to be a second-generation design f=
rom
> Allwinner, which is found in the following chips: V5, A50, H616, V536, T7=
, A133,
> V833, R329, D1/T113, R128, V851, A523 and A733.
>
> I've tested your driver on A133, which works fine too. It seems that H616=
 uses
> a similar (but slightly different) register layout.
>
> In case you've missed it, there's a follow-up series adding H616 support =
at:
> https://patchwork.ozlabs.org/project/linux-pwm/list/?series=3D409036&arch=
ive=3Dboth&state=3D*
>
> And there's also a standalone effort (which I've redirected to your serie=
s) at:
> https://patchwork.ozlabs.org/project/linux-pwm/list/?series=3D485644&arch=
ive=3Dboth&state=3D*
>
> Now given that the new controller was introduced with the V5 (sun8iw12) f=
rom
> 2018, I think it would be a bit confusing to keep the sun20i-pwm name.
>
> How about renaming the driver to sun8i-pwm instead? That would be more
> consistent with how other second generation designs from Allwinner are us=
ually
> called in Linux and makes it more clear that it also targets sun8i and su=
n50i
> chips, in addition to sun20i.
>
> All the best,
>
> Paul
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

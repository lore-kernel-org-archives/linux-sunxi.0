Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1E7EC3
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Oct 2023 01:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oak9JjnU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3EAFC433CC
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Oct 2023 01:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696813291;
	bh=12V8BUvOQDiMroiIaSqNg+ekaSPMnUVQbV6cs0RaO7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Oak9JjnU5uk8yjoGhRdnauLsfoKeTJG5EJpBmIgLFHzIt+YK0/qwkf2el57fx4TLP
	 1I0q6r4pXCN7zATz//1oh2SRs7VRWPP6vYFvyo7uiIqzCJqZ5CchCYhgqcD2ht9Nmk
	 Pu5t9FbJLOQiAJWVakj3DyvKIoZa8ZikhfT826svM7qn4U8P+WGDtR/TDgIzbuq0c/
	 uO+9BMSZoY/8ntPBcB2JVET/0V7GKFvzWGyVcV6z0Bor3LQStlafPvD+MbUkrkLnqS
	 EjIS0IEQSmKnHCMAEU+CEa7gSygVjblKT142gT1z9rvIAA4WiE1F13BTPCrs+CA1hv
	 RlkC0TGF6aN1Q==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-536071e79deso8768950a12.1
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Oct 2023 18:01:30 -0700 (PDT)
X-Gm-Message-State: AOJu0YxjWVKAxQHSFbNhpe0V7NDGXr+MRjSj9Z/NgtyF3jXLcrd9V0PF
	KmnpHcG4fwAyzrbPG8847Aa4GnwD/EC2EJyJXIs=
X-Google-Smtp-Source: AGHT+IHIfsPYV3LL5MmuuW4fRb62rbHbzO3zKIowTx57SQthg3QHBVuMCr03hUmOCe0pZutvENlB/38cG81IZDD3OGQ=
X-Received: by 2002:a50:fb0c:0:b0:530:8759:a3ac with SMTP id
 d12-20020a50fb0c000000b005308759a3acmr10568781edq.2.1696813289399; Sun, 08
 Oct 2023 18:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922081351.30239-2-conor@kernel.org> <20230922081351.30239-8-conor@kernel.org>
 <CAJF2gTR2JmsMhzjzWp85hEwoJwRBN4T4iHz_Z-1cG-XgB=EFeA@mail.gmail.com> <20230923-snowsuit-angled-f49237d27c83@spud>
In-Reply-To: <20230923-snowsuit-angled-f49237d27c83@spud>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 9 Oct 2023 09:01:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ+PJcZguUEN8+Ls_DX4U3xpW+4O-ztrJ0NzM2ODrc_5w@mail.gmail.com>
Message-ID: <CAJF2gTQ+PJcZguUEN8+Ls_DX4U3xpW+4O-ztrJ0NzM2ODrc_5w@mail.gmail.com>
Subject: Re: [RFC v2 6/6] riscv: dts: thead: convert isa detection to new properties
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jisheng Zhang <jszhang@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 23, 2023 at 6:25=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sat, Sep 23, 2023 at 03:50:36PM +0800, Guo Ren wrote:
> > On Fri, Sep 22, 2023 at 4:16=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > Convert the th1520 devicetrees to use the new properties
> > > "riscv,isa-base" & "riscv,isa-extensions".
> > > For compatibility with other projects, "riscv,isa" remains.
> > >
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > >  arch/riscv/boot/dts/thead/th1520.dtsi | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/=
dts/thead/th1520.dtsi
> > > index ce708183b6f6..723f65487246 100644
> > > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > @@ -20,6 +20,9 @@ c910_0: cpu@0 {
> > >                         compatible =3D "thead,c910", "riscv";
> > >                         device_type =3D "cpu";
> > >                         riscv,isa =3D "rv64imafdc";
> > > +                       riscv,isa-base =3D "rv64i";
>
> > Why not riscv,isa-base =3D "rv64"? I saw "i" in the riscv,isa-extension=
s.
>
> I did it that way as a hedge against things changing in the future. I
> have little trust in that part of the ISA specifications.
Okay, that's clear enough.

Acked-by: Guo Ren <guoren@kernel.org>


--=20
Best Regards
 Guo Ren

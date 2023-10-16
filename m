Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724F815491
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 07:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5a7ac4c3666so51374877b3.3
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 00:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697440636; x=1698045436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/hJao9N8LKEsymdGe3XcTumREOueGROCRui0e9bORI=;
        b=roRQJZOlKINjBBciWKNnrA1joWQ1/vX8wipmvd34rc6eFSPnQG3a4BwxERowwDFNPI
         P5jFvbMeN9a4IliDYSP1bxOLtRZV+GRRNVBxVeuIFwQQo7IvKuGeUtPOZkml0RxoRMt/
         F4VUFowb68zCSruhyqsMeftPQHGyaBjjWavK5eJXe5AdzrzAm85MMZo3FsK5OkwzHnKv
         zVXumeMv0OsmZnOp4LeVeXx9TTztBgxkmBsv9obTV5g+4Wpi9rrPL0ifCycG2i7mX2wd
         tLv4+dM0xfVF3cakCSRL/7Tmix/XsXVq5bwuzg8ELlaNStDnr84xMQyQGbZtV39harUk
         dlkA==
X-Gm-Message-State: AOJu0YyThTZLH/l/MKRHpe1f4wBMP2w9RUhgbprInXDKCG+C0MoRrJa+
	FPU8mBCekPK7bKWt6Gxw4msOAPdlAUp1qg==
X-Google-Smtp-Source: AGHT+IGcwUKsJW4zNtPmsjZxLlLzxlWZNVecsp29BdzIbL81LC6v9zdSWd+wjxcradawa5CP4v7htw==
X-Received: by 2002:a0d:e403:0:b0:589:f445:19e with SMTP id n3-20020a0de403000000b00589f445019emr31886549ywe.27.1697440636310;
        Mon, 16 Oct 2023 00:17:16 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id o190-20020a0de5c7000000b0059be3d854b1sm1981400ywe.109.2023.10.16.00.17.14
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 00:17:14 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a7e5dc8573so51670127b3.0
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 00:17:14 -0700 (PDT)
X-Received: by 2002:a81:47c6:0:b0:59b:1f6d:1958 with SMTP id
 u189-20020a8147c6000000b0059b1f6d1958mr31275633ywa.46.1697440633941; Mon, 16
 Oct 2023 00:17:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231009-approve-verbalize-ce9324858e76@wendy>
 <20231009-smog-gag-3ba67e68126b@wendy> <ZSzTqgVNSD9Q7V6H@APC323>
In-Reply-To: <ZSzTqgVNSD9Q7V6H@APC323>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Oct 2023 09:17:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUV3bJmqWysPak4085ZXCn7x7fZOnfnceGxWrdC7cB3pw@mail.gmail.com>
Message-ID: <CAMuHMdUV3bJmqWysPak4085ZXCn7x7fZOnfnceGxWrdC7cB3pw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] riscv: dts: renesas: convert isa detection to new properties
To: Yu-Chien Peter Lin <peterlin@andestech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.indradead.org, 
	conor@kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yu-Chien,

On Mon, Oct 16, 2023 at 8:10=E2=80=AFAM Yu-Chien Peter Lin
<peterlin@andestech.com> wrote:
> On Mon, Oct 09, 2023 at 10:37:48AM +0100, Conor Dooley wrote:
> > Convert the RZ/Five devicetrees to use the new properties
> > "riscv,isa-base" & "riscv,isa-extensions".
> > For compatibility with other projects, "riscv,isa" remains.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/b=
oot/dts/renesas/r9a07g043f.dtsi
> > index b0796015e36b..eb301d8eb2b0 100644
> > --- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > @@ -24,6 +24,9 @@ cpu0: cpu@0 {
> >                       reg =3D <0x0>;
> >                       status =3D "okay";
> >                       riscv,isa =3D "rv64imafdc";
> > +                     riscv,isa-base =3D "rv64i";
> > +                     riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c", "zicntr", "zicsr",
> > +                                            "zifencei", "zihpm";
>
> We do have zihpm, and OpenSBI can also probe its existence.
>
> Boot HART ISA Extensions  : zihpm
> Boot HART MHPM Info       : 4 (0x00000078)

Thank you, I hadn't digested the full output from OpenSBI yet, and
I can confirm this is present in that output.

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

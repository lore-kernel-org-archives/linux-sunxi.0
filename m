Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996321FD3
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Oct 2023 12:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-579de633419so54732567b3.3
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Oct 2023 05:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696853760; x=1697458560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dl00x9F8gW/xdOyelK9eYXeUORxvhqizJLBB30N7AGk=;
        b=hmtTC/VVJ5nuOLdFDb6h9trdunncio8vTeoAzC/ZYw+YSUEz8xDPDl2ZgC/q4EnMBr
         rKOoGObdWNyGwba8okeSZWcxTO6nXGzdb/heq2TeJtM5D81RPB+mUgeFYsKL7eYaXRxu
         i7T11ZgtA/+rJF9d1M00dl6PvL+b5wvb1Y/ZWe0A2SMfXN2eFIP0d5/d2cSlbHufemfo
         cba8E4/2rfyZR+kRH+AoBd8IlEadJI/fFwfQ9Jc08Jy+7HXyVHd4im+slUyYFREi37DV
         aqD+Xz/8Wh5O5yVkMF8lMmWvs+dIs3rxroAtHLkjV5X5O2eVK0f5hT7EGhZW8XFEvHJp
         KtZA==
X-Gm-Message-State: AOJu0Yz2H/KHJEGrSgvFggnYqZ6mYINNp3/2BhIWsVWm1WfTSY1q+T+l
	aRfAyXDeCnJZUmHGGWSZDsSCtBPXqZPejg==
X-Google-Smtp-Source: AGHT+IF+MVHUkmTgmUCX1mBfPKUmXtWGepK9wpPJajlKNWjQwMMLbUs3VYrT2USn+pcihrFWpjw4BA==
X-Received: by 2002:a81:71c4:0:b0:59b:cff1:a8eb with SMTP id m187-20020a8171c4000000b0059bcff1a8ebmr15504299ywc.34.1696853760165;
        Mon, 09 Oct 2023 05:16:00 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id c65-20020a0df344000000b0059adc0c4392sm3608778ywf.140.2023.10.09.05.15.59
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 05:15:59 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a505762c9dso54776277b3.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Oct 2023 05:15:59 -0700 (PDT)
X-Received: by 2002:a0d:d402:0:b0:59b:c847:bce0 with SMTP id
 w2-20020a0dd402000000b0059bc847bce0mr16554853ywd.42.1696853759136; Mon, 09
 Oct 2023 05:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231009-approve-verbalize-ce9324858e76@wendy> <20231009-smog-gag-3ba67e68126b@wendy>
In-Reply-To: <20231009-smog-gag-3ba67e68126b@wendy>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Oct 2023 14:15:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVc7VOvB86A7-TShhoqut6Y1ZvY0WSC8XpOEv8Bb2bA-Q@mail.gmail.com>
Message-ID: <CAMuHMdVc7VOvB86A7-TShhoqut6Y1ZvY0WSC8XpOEv8Bb2bA-Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] riscv: dts: renesas: convert isa detection to new properties
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.indradead.org, conor@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
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

Hi Conor,

On Mon, Oct 9, 2023 at 11:44=E2=80=AFAM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
> Convert the RZ/Five devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> @@ -24,6 +24,9 @@ cpu0: cpu@0 {
>                         reg =3D <0x0>;
>                         status =3D "okay";
>                         riscv,isa =3D "rv64imafdc";
> +                       riscv,isa-base =3D "rv64i";
> +                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c", "zicntr", "zicsr",
> +                                              "zifencei", "zihpm";

LGMT, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I could not review the "zi*" parts, as the documentation that I have
does not mention these.

>                         mmu-type =3D "riscv,sv39";
>                         i-cache-size =3D <0x8000>;
>                         i-cache-line-size =3D <0x40>;

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

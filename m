Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D8815ADD
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 07:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-49d0d90a7ddso1371356e0c.0
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 00:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697441457; x=1698046257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxKu2BfOe9aY6IVd/hySwpz3FIXqdj+qJLdSdMka9oc=;
        b=i9T3QQVRgEgqRB0g2QFzHPxaJxnxjw5w/Man7N5Acddz/EwgnN80ni01DAZ5bW02w/
         4N+DHn/a5maU1A6hhV7xEncKr3EaJFh1jDaLbU7MVlLyt9g8wROT8sBj2UY9/WEGqV2f
         JAAABsfXU4SEcNSru/3nb5UVaNq6gopXZvY8NO+cw4V55H08rBWZjeZswwFDOC9FEsdW
         adDIs/Xdvlm/S1JX4rIV1IWSqPc2+P4m1agvZAR9XKA1B1SjhVW43kfZTXQIoBHVC2e1
         FlnYJ/6oDz188rHaNj94UMbWnsdiAtN7D+R9ccoNwUkhZ9tp5EK7Oaw3N//mstyQnNIh
         3zAw==
X-Gm-Message-State: AOJu0Yz30Yndip07ULhdL0cJcM8KFRIqYntjRTtrZ0pLE+LblTRhtRHb
	XIvGv/t9sVXiHTie02jwgCaSlNFPK89lgw==
X-Google-Smtp-Source: AGHT+IEjnog3Q32JPuq7wnuecusSK3Wx11MNp5EIIbg14K7YV18j3utHT5plO0roRGiI6RdY5HdtqQ==
X-Received: by 2002:a1f:ac4f:0:b0:4a4:1575:4e5f with SMTP id v76-20020a1fac4f000000b004a415754e5fmr7210488vke.6.1697441457032;
        Mon, 16 Oct 2023 00:30:57 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id bk33-20020a0561220e2100b004962395e415sm733475vkb.15.2023.10.16.00.30.56
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 00:30:56 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-457bfdc1cdaso1091666137.2
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 00:30:56 -0700 (PDT)
X-Received: by 2002:a25:d0d6:0:b0:d9a:54d2:3af3 with SMTP id
 h205-20020a25d0d6000000b00d9a54d23af3mr18123368ybg.51.1697441015007; Mon, 16
 Oct 2023 00:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231009-approve-verbalize-ce9324858e76@wendy> <20231015-qualifier-campus-97bf09059d51@spud>
In-Reply-To: <20231015-qualifier-campus-97bf09059d51@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Oct 2023 09:23:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTiod7o9+DG70sNWr=GGFwBeCagj=OrRp0Dn_jPDbakw@mail.gmail.com>
Message-ID: <CAMuHMdUTiod7o9+DG70sNWr=GGFwBeCagj=OrRp0Dn_jPDbakw@mail.gmail.com>
Subject: Re: (subset) [PATCH v3 0/6] riscv,isa-extensions additions
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, 
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

On Sun, Oct 15, 2023 at 2:22=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> On Mon, 09 Oct 2023 10:37:44 +0100, Conor Dooley wrote:
> > Now with the RFC tag dropped. There are no changes here from "RFC v2",
> > other than the addition of tags that were provided along the way. I hav=
e
> > not added "Zfh" to the T-Head based stuff, as I can't actually read the
> > documentation that would show that they're encoding-for-encoding
> > compatible with the standard extension, since it is apparently only in
> > Chinese.
> >
> > [...]
>
> The first 3 applied to riscv-dt-for-next, I expect the rest to go via
> their respective platform maintainers.

I sent my last soc PR for v6.7 last Friday, as per the soc deadline.
Feel free to take "[PATCH v3 4/6] riscv: dts: renesas: convert isa
detection to new properties" into your tree for v6, if that is still
possible (I have just provided my Acked-by). Otherwise, I can queue
it in renesas-devel for v6.8.

Thanks!

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

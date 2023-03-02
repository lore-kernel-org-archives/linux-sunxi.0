Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73F31866
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Mar 2023 07:50:18 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id bk32so12839702oib.10
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Mar 2023 23:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9NdTpfDEMV32UTE9lZbQp6kQQhUJVdsU2kqbFsl+ZA=;
        b=GlZmeq/Hz5Um91USKrZ0+M5dSCefWeghYgtINjtcSbk4k4UwPmscvXuxvAr0OjOtJe
         Bn4YooJd54HFa/cfRccrafHhuhfD+PS+HybZmuvJgmFuW5BI/MCO2L0tdjkaz1wRO/3g
         i7xK7qt1TEDWuU71+TeukgWEZxv35tUADEiXZXAgsp8t2kxu+nxmmV4/F13ryXw0nNbu
         TKO99aTui+756FKR3yFA6eHBZ7hITNCjVXwGPxsD96FaTZb8xzlKEwU6YlKt2seICV6f
         NNoy31PXUAqY6KCyLmjuv2d9e7Yva8fp4a1mbnncKnCbqKAwHs29cxJQfvydEAEhhxXY
         wcKg==
X-Gm-Message-State: AO0yUKW4Kq9fdTlUvuW9BEAcs5rjOCYfiN0dk2NBsKwDY2cpi3uAoJhs
	WVF+igJWNQ3b9fTUt8pxnS2cgvRR4K027w==
X-Google-Smtp-Source: AK7set/KTX+UfSvr7/BB54BQghmlMBDvNWZyP9D1WubhHAqODPbtOhbGFG2AZea87E6mm6MRfNf0Cg==
X-Received: by 2002:a54:4417:0:b0:384:2883:4dd8 with SMTP id k23-20020a544417000000b0038428834dd8mr4637455oiw.7.1677743417620;
        Wed, 01 Mar 2023 23:50:17 -0800 (PST)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com. [209.85.160.41])
        by smtp.gmail.com with ESMTPSA id w129-20020aca6287000000b00383bfd8a184sm6800959oib.25.2023.03.01.23.50.17
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 23:50:17 -0800 (PST)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-17652f24da7so166173fac.4
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Mar 2023 23:50:17 -0800 (PST)
X-Received: by 2002:a81:ad1b:0:b0:52f:1c23:ef1 with SMTP id
 l27-20020a81ad1b000000b0052f1c230ef1mr5784211ywh.5.1677743396691; Wed, 01 Mar
 2023 23:49:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230301185209.274134-1-jjhiblot@traphandler.com> <20230301185209.274134-3-jjhiblot@traphandler.com>
In-Reply-To: <20230301185209.274134-3-jjhiblot@traphandler.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Mar 2023 08:49:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVF337k+zyjpbzoDtWWDnYhM6eM3+As6UuZ7FCgASsMQg@mail.gmail.com>
Message-ID: <CAMuHMdVF337k+zyjpbzoDtWWDnYhM6eM3+As6UuZ7FCgASsMQg@mail.gmail.com>
Subject: Re: [PATCH 2/3] of: irq: make callers of of_irq_parse_one() release
 the device node
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: saravanak@google.com, clement.leger@bootlin.com, 
	Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, zajec5@gmail.com, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Marc Zyngier <maz@kernel.org>, afaerber@suse.de, 
	Manivannan Sadhasivam <mani@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Nishanth Menon <nm@ti.com>, ssantosh@kernel.org, 
	mathias.nyman@intel.com, gregkh@linuxfoundation.org, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-wireless@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jean-Jacques,

Thanks for your patch!

On Wed, Mar 1, 2023 at 7:53=E2=80=AFPM Jean-Jacques Hiblot
<jjhiblot@traphandler.com> wrote:
> of_irq_parse_one() does a get() on the device node returned in out_irq->n=
p.
> Callers of of_irq_parse_one() must do a put() when they are done with it.

What does "be done with it" really mean here?

> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@traphandler.com>

> --- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
> +++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
> @@ -184,6 +184,7 @@ static int __init rcar_gen2_regulator_quirk(void)
>                         kfree(quirk);
>                         continue;
>                 }
> +               of_node_put(argsa->np);

The quirk object, which is a container of argsa, is still used below,
and stored in a linked list.  I agree argsa->np is not dereferenced,
but the pointer itself is still compared to other pointers.
IIUIC, calling of_node_put() might cause the reference count to drop to
zero, and the underlying struct node object to be deallocated.
So when a future reference to the same DT node will be taken, a new
struct node object will be allocated, and the pointer comparison below
will fail?

Or am I missing something?

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

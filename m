Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7927E
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Mar 2023 14:47:45 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id l18so6062639qtp.1
        for <linux-sunxi@lists.linux.dev>; Sat, 04 Mar 2023 06:47:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677941264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeKbxzDZy3GcKkrGUofgHv5MAh6MoP5a08Lg7rMsvMk=;
        b=ZPb1vCOAjHgRjeUPaTIIsvokwsH4xnbTumDCjfctz+ujALcP8cYl5GwBk/b6Y6pyY4
         1fdum01mNg48Acfl0vMT+Mi4MGKZJm1TTZNtWhHgyN54izmCnY4GwSGblVneGzRAmYdv
         9dTaI/DOr4dCjEG4d36mT3BKRxmWIMHT5NlKUKKgZnJkzkSrj+K+7CpHs1YHRYPZoUP4
         nv58q2oQbKZmgc+8gpHLd46TWJbQdfC1LMeHPtkgPOTtO2eynZUUk8uPTL55x8GLEUgE
         mKX5OekOBoZ41pWmTK1XHnQgBMVaU8f7DFgIuxof60hpNYkGwVu98WfAMQA2JFzSbuwP
         umBg==
X-Gm-Message-State: AO0yUKWDcanDeUeAeKdf+peaCaeZ9Wm1Eo/0Uw/AYMIgayuMQgGjcXE+
	0sFyMIvFJXPPaz3PTkQVbUT1iNxg+qgozA==
X-Google-Smtp-Source: AK7set8giAWleA7rqDYHebBdWH8ZhGL/OWw/LLJVcLl6QwQ2VwoDFA4xQ9oj7OH4QCg13AV/H9/acg==
X-Received: by 2002:ac8:58ce:0:b0:3bf:a061:6cb1 with SMTP id u14-20020ac858ce000000b003bfa0616cb1mr9648283qta.46.1677941264194;
        Sat, 04 Mar 2023 06:47:44 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id u19-20020a05620a121300b007424376ca4bsm3841669qkj.18.2023.03.04.06.47.43
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 06:47:44 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-53852143afcso97881907b3.3
        for <linux-sunxi@lists.linux.dev>; Sat, 04 Mar 2023 06:47:43 -0800 (PST)
X-Received: by 2002:a81:b723:0:b0:536:38b4:f51 with SMTP id
 v35-20020a81b723000000b0053638b40f51mr3187721ywh.5.1677941242747; Sat, 04 Mar
 2023 06:47:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230301185209.274134-1-jjhiblot@traphandler.com>
 <20230301185209.274134-3-jjhiblot@traphandler.com> <CAMuHMdVF337k+zyjpbzoDtWWDnYhM6eM3+As6UuZ7FCgASsMQg@mail.gmail.com>
 <7fa7f07f-d1e1-1e43-992c-4981c5810284@traphandler.com>
In-Reply-To: <7fa7f07f-d1e1-1e43-992c-4981c5810284@traphandler.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 4 Mar 2023 15:47:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdZatMYsc=367OuGotzYuo2-XVe5MAZdzh+kBs31=t5A@mail.gmail.com>
Message-ID: <CAMuHMdVdZatMYsc=367OuGotzYuo2-XVe5MAZdzh+kBs31=t5A@mail.gmail.com>
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

On Sat, Mar 4, 2023 at 11:34=E2=80=AFAM Jean-Jacques Hiblot
<jjhiblot@traphandler.com> wrote:
> On 02/03/2023 08:49, Geert Uytterhoeven wrote:
> > On Wed, Mar 1, 2023 at 7:53=E2=80=AFPM Jean-Jacques Hiblot
> > <jjhiblot@traphandler.com> wrote:
> >> of_irq_parse_one() does a get() on the device node returned in out_irq=
->np.
> >> Callers of of_irq_parse_one() must do a put() when they are done with =
it.
> >
> > What does "be done with it" really mean here?
> >
> >> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
> >
> >> --- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
> >> +++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
> >> @@ -184,6 +184,7 @@ static int __init rcar_gen2_regulator_quirk(void)
> >>                          kfree(quirk);
> >>                          continue;
> >>                  }
> >> +               of_node_put(argsa->np);
> >
> > The quirk object, which is a container of argsa, is still used below,
> > and stored in a linked list.  I agree argsa->np is not dereferenced,
> > but the pointer itself is still compared to other pointers.
>
> I fail to see when the pointers are compared. It looks to me that only
> the args are compared. Am I missing something ?

You're right, in upstream, there is no such check.
In my local tree, I have converted the comparisons below to use a new
helper of_phandle_args_eq() (which does compare the np member, too),
but that change never went upstream, as the other user of that helper
was rejected.

> In any case, looking more closely at the code, I guess that indeed the
> of_node_put() shouldn't be added here because this code expects that the
> nodes never go away. That is probably a good assertion in case of PMICs

OK.

> > IIUIC, calling of_node_put() might cause the reference count to drop to
> > zero, and the underlying struct node object to be deallocated.
> > So when a future reference to the same DT node will be taken, a new
> > struct node object will be allocated, and the pointer comparison below
> > will fail?

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

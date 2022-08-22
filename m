Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B071256C
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Aug 2022 15:29:05 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id h5so12877558wru.7
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Aug 2022 08:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc;
        bh=Tj/TeA1Vba5/YB2iX5+tYIMrGWJcVWB+zymgkTHRpAI=;
        b=ggvUSWKEViLarUpllfN8d3/D/U3wXUfnghmeXfQzCGOlRYHhcU8UMzw/F+Bimd1PfO
         zNyWPt+OcrJ9/jp2YaN0/V06NbEurpv8kfhhxbxDnA4dncOMgBVIMsnkoDQ84ndL0S55
         Hhk4mGLPxrL5ffb9JwxdEFu38eJwdJLT6MJs403e09BL5yutuC36oNq8raxcJxoTfBxx
         bYENxKw1cYcFPdk0rcbI4r/XcbmXoBJmbwyKBmyFFhFj7wG15WWHbGLbB0nIpEUjIRkc
         sGBQWBkGqZViw77T2vsLwAfY3/nLH8nyjKe5hcg7qKr7SuLyWM5ahcrcin+v872QyJjc
         42OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc;
        bh=Tj/TeA1Vba5/YB2iX5+tYIMrGWJcVWB+zymgkTHRpAI=;
        b=Fvyz/vXJqyz+qFAuMSM7gEmLpRJCGSgajC8Mdhzx5+RVt+jfg41WzzUEhL2f1Ym7P/
         ULNZvdcFgxZIPLbHpYHa/+tKguIx/CkMSvTu3hZnbEbhGnlH+yFiSsNPC+hSCqAwKoR7
         ysqEQf36KcxciajqNLqArNcR//hKEqNTg0x58cK6dIbWp4aQlALoZYxPBwA3Tjp3Itux
         xJyYLyES/dqF3gi+nrD6YfVBo+T0ACkfTjl4RW9IwRPZ2nMCNkWLsfOWlkkrOvYPLIw2
         N63RGNj+KO8jbCKVW0To7Qm8D9mcrOJl5ivDsCVLwlyqJPFbQi1NxD+DJ1kZe+gfHycT
         7soQ==
X-Gm-Message-State: ACgBeo1XnGaHIr2v9I/0FVVfLDJYDRk+D38zJqG9gjpm8Xn1OKr8TLqk
	R0XiXOJqxWj5IuKbrYwDBQ57BA==
X-Google-Smtp-Source: AA6agR5jyKhduztzqIDdkOhDPCZJoNwrA8EEV359JObFTzjtKAAYctHbcxiaZLRQPrwTe5m6Oe8cZQ==
X-Received: by 2002:a05:6000:1867:b0:21f:f2cf:74a8 with SMTP id d7-20020a056000186700b0021ff2cf74a8mr11195780wri.344.1661182144304;
        Mon, 22 Aug 2022 08:29:04 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id o14-20020adfcf0e000000b0021f1ec8776fsm12053546wrj.61.2022.08.22.08.29.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Aug 2022 08:29:03 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <44b6f601-1a11-aacf-5592-5b61550afb9f@microchip.com>
Date: Mon, 22 Aug 2022 16:29:02 +0100
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 andre.przywara@arm.com,
 devicetree <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Samuel Holland <samuel@sholland.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jernej.skrabec@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com,
 wens@csie.org,
 robh+dt@kernel.org,
 palmer@dabbelt.com,
 krzysztof.kozlowski+dt@linaro.org,
 paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <C0B4F750-1C99-408A-A2DA-B72BBF7361B4@jrtc27.com>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-7-samuel@sholland.org>
 <20220815141159.10edeba5@donnerap.cambridge.arm.com>
 <3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com>
 <932aaefd-e2ca-ef26-bf30-e315fb271ec5@sholland.org>
 <ff9e8bd3-c5f7-6319-060e-250151087a8e@microchip.com>
 <c6cba83ea9eea7fc41a9e78d0e45487b21f0f560.camel@icenowy.me>
 <c7599abd-c4cf-9ddd-1e74-e47dec9366d4@microchip.com>
 <CAMuHMdUHVpj9ikE2NxpBSBtTG8K6v92vGdbw3GLmEYUoVzatvg@mail.gmail.com>
 <538ae41e-664f-2efb-f941-9a063b727b6a@microchip.com>
 <CAMuHMdWWbR+Y=bJ7gdqV3d+ffHE1-hwQf-Owb8FAvZAaScdOgA@mail.gmail.com>
 <44b6f601-1a11-aacf-5592-5b61550afb9f@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)

On 22 Aug 2022, at 14:56, conor.dooley@microchip.com wrote:
>=20
> On 22/08/2022 13:31, Geert Uytterhoeven wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you =
know the content is safe
>>=20
>=20
>=20
>>> Do you think this is worth doing? Or are you just providing an
>>> example of what could be done?
>>=20
>> Just some brainstorming...
>>=20
>>> Where would you envisage putting these macros? I forget the order
>>> of the CPP operations that are done, can they be put in the dts?
>>=20
>> The SOC_PERIPHERAL_IRQ() macro should be defined in the
>> ARM-based SoC.dtsi file and the RISC-V-based SoC.dtsi file.
>=20
> Right, one level up but ~the same result.
>=20
>=20
>>>> Nice! But it's gonna be a very large interrupt-map.
>>>=20
>>> I quite like the idea of not duplicating files across the archs
>>> if it can be helped, but not at the expense of making them hard to
>>> understand & I feel like unfortunately the large interrupt map is
>>> in that territory.
>>=20
>> I feel the same.
>> Even listing both interrupt numbers in SOC_PERIPHERAL_IRQ(na, nr)
>> is a risk for making mistakes.
>>=20
>> So personally, I'm in favor of teaching dtc arithmetic, so we can
>> handle the offset in SOC_PERIPHERAL_IRQ().
>=20
> Yup, in the same boat here. mayb I'll get bored enough to bite..

Note that GPL=E2=80=99ed dtc isn=E2=80=99t the only implementation. =
FreeBSD uses a
BSD-licensed implementation[1] and so adding new features like this to
GPL dtc that actually get used would require us to reimplement it too.
I don=E2=80=99t know how much effort it would be but please keep this in =
mind.

Jess

[1] https://github.com/davidchisnall/dtc=

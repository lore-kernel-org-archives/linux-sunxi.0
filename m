Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F00B5229
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 18:58:32 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-97668583210so688979466b.1
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 11:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686596311; x=1689188311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mUonJgToHCgnd4NYbM2VauxjgcAH9HX59bsPeQrQF8=;
        b=BKUK/UGgH4F6ItSoTC+5ps+xppzuLOpyrcR53EjxUGgzeHXMBcF6vsGuNsjG7ZivrH
         LekCx1Km0THyBN8bIKbqbWDqyZxhiTiOdOercO6BylOYa6hpuFOEehSonUcrZcsSt4kQ
         OjKHo+W0jG1y6wc9o1xvg0NnMlkwpFFY2v1CL3/aXF9Pq/LuoKawFzAgzg5GwHG1nmn3
         TKPo9zygdYCWnn64A1xNjn8TkxybrmhOKvGnV+x1gUDxIzPYSDGMpjx3eNStBTt2qGEQ
         VeFKtYmpTEBAzrieyZVHGaTgJwjQHQ5JBDDasJH6TmES73QcPhRkEDd5pxYeIRWIpmBW
         eNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686596311; x=1689188311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mUonJgToHCgnd4NYbM2VauxjgcAH9HX59bsPeQrQF8=;
        b=WlJn6f3sfif54K5qP8KFbsO0a48YYNN/TX0U2UyRE7WvBYQl8ljzFGxHzSgPWxeYBT
         L4Qn6ejkqa+nySU7wliz6j8IMyXzvi4q3f6N7EVkGAQ56Zn4SyIEHgcinaOqZfBbSKG1
         2onzcawayNMtETFS5DZk7nmA1sj1rsc/ABNj8HIF247Ek2ssiEAESIanE3At4u2A+BPi
         7xGKuMsErGOyQf7QY8kIjDW7aPJApckf6g8fe7Cd/kzsu0lLPCPQ518itLgOfaOEJ3hV
         DLEhQ2tpdxHBcGyFZE0GzrHSzJnMZK29d0DG1fSRGniNKJM5o0Z7FKun+TB6LuIQcWX+
         6rPg==
X-Gm-Message-State: AC+VfDzYJMOMa70Y/POE517hw4u7KwE/b8qrLmWCQFTgH+bJx09Y/7pb
	VhsinW9t2hf2yUiW9luFZr0QFCY973/7u0ABg5E=
X-Google-Smtp-Source: ACHHUZ72gaCwCv6ASH5Fi/IBsI0MrQyJpEiRZoZuE7BfM5lJamwPMGfN+SlUgNamlTwETDeAHAdCKuU7RSaB2DGEdcI=
X-Received: by 2002:a17:907:3f82:b0:97a:e496:c121 with SMTP id
 hr2-20020a1709073f8200b0097ae496c121mr10409439ejc.69.1686596310880; Mon, 12
 Jun 2023 11:58:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230612063429.3343061-1-bigunclemax@gmail.com>
 <20230612063429.3343061-4-bigunclemax@gmail.com> <20230612-wriggle-remindful-89d5105c94ee@wendy>
 <CALHCpMjxboLn2eTjOJkE2JAzH3S8OB3v9fWqDOdeipAmLvLx2Q@mail.gmail.com> <20230612-manhole-awoke-599b8ff72edb@spud>
In-Reply-To: <20230612-manhole-awoke-599b8ff72edb@spud>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Mon, 12 Jun 2023 21:58:18 +0300
Message-ID: <CALHCpMjY8urNAVFhnBaK1Png1yY3UAQOG8u=W4-v=GiJ8TjZEw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] riscv: dts: allwinner: d1: Add thermal sensor and
 thermal zone
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 12 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 20:27, Con=
or Dooley <conor@kernel.org>:
>
> On Mon, Jun 12, 2023 at 11:17:20AM +0300, Maxim Kiselev wrote:
> > Hi, Conor
> >
> > =D0=BF=D0=BD, 12 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 10:55,=
 Conor Dooley <conor.dooley@microchip.com>:
> >
> > ...
> >
> > > The RISC-V patchwork automation is complaining about this patch while
> > > running dtbs_check:
> > > arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb: thermal-zone=
s: cpu-thermal: 'trips' is a required property
> > >         From schema: Documentation/devicetree/bindings/thermal/therma=
l-zones.yaml
> >
> > I didn't add 'trips' because I'm not sure if they should be the same
> > for the D1 and the T113s.
>
> I'm sorry, but I am of no help there. Perhaps some of the Allwinner devs
> can help you on that front.
>
> > Maybe it's better to drop 'thermal-zones' from this patch and add them
> > later in separate patches
> > for T113s and D1?
>
> Does it pass dtbs_check with the thermal-zones removed?

Yes, it passes.

Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC51C8E3
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 16:16:05 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-978863fb00fso500821766b.3
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 09:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686413764; x=1689005764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iykgIKjjxkQC0iF6CPvpsM3rMPFudjl8N64c3ex61jQ=;
        b=Mtf6He6s/QN8TiwNWeLCZoj5CiJRnWMFhVFukaHoOI1KbHqGnhnl/J6wDRpo8I0fd7
         DIE0pXHUYRQ3V6sInfXdt7i/M2x4DYfm9MCsS4fo7AUVLWkoRcYqtGM/fCiqkIcxYdK1
         hKPPeMAplt+2UGvUJHY8QAbGKFZ4UwoBgox+l8MKei3qg7jHMoaHi+I0K3/rFClznYid
         r+b3V7dhBx/iDlTLg8zODMYiBnvWUkpyKvEKaV9AuUUXpRs8HWqO6tamF444Wj3RH5YZ
         /8ampRyNylIpDBzksaGvcLUrcJVkdhm5AgXJ0BytOlynw9ZYbdkGDmEAb37hG1QdS7AS
         OSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686413764; x=1689005764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iykgIKjjxkQC0iF6CPvpsM3rMPFudjl8N64c3ex61jQ=;
        b=eF3PsE3v62W5TPgpo2sAe+7FGXy7Mw1FcFxkpDuO5fm1Rw+yjAmte7BO78MBjP6wwF
         HBIZ1LFIQs8NN6qhR9GcuokaQNqzBGr9um+A6GddhSDqHYwLt+i7oQUDiBeTXT4XglPt
         ut4Y6kGOR7xJCnBwaWUoWlrUbjE/eS/UqaOS33XdDKKYEp4Ifi8AS/OK4+aVVhasfakz
         mNkEWhKCgBH1MXZK1af8CtptbfO7AdxycwTe5iPHJ3iJrLJKydiXlrJpXeO5S75Z8BJA
         GBw142+OzLn5CDo0jkKg6v+Rt1N5KP7RGpbe3NJuJwz/yHTtCLxF9ltfarJK96+E6Bcm
         6KRg==
X-Gm-Message-State: AC+VfDzjzB/pMTI8B2ANDcMMR9uV3BO31Rbn1/5gSy50VPJwoH9o0N8f
	cqcenN1m10ZkvRnYxDciQ6oofMdFLuK5lyR8Yvk=
X-Google-Smtp-Source: ACHHUZ5MSGxwbWWnndDcYjuv/3cdAQTV5Zw6a33v7H1CVdOEzhJP97/iR4Mnt8zGvf9ZP03fMF0YpgAyTbQP2Lse/UM=
X-Received: by 2002:a17:907:7244:b0:97e:a9ed:16bb with SMTP id
 ds4-20020a170907724400b0097ea9ed16bbmr786437ejc.18.1686413763631; Sat, 10 Jun
 2023 09:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230610122934.953106-1-bigunclemax@gmail.com>
 <20230610122934.953106-3-bigunclemax@gmail.com> <20230610-ranged-outboard-2aaa0cc36cbd@spud>
 <CALHCpMhHxAdDMGmpD9i2Kt93XqyrW_ABzr7FZSE-0+54LwgzPw@mail.gmail.com> <20230610-enchanted-late-e545ab2d74a0@spud>
In-Reply-To: <20230610-enchanted-late-e545ab2d74a0@spud>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sat, 10 Jun 2023 19:15:52 +0300
Message-ID: <CALHCpMg=k8r4o+qhLi-e3qSUFZp_4N0F=U1vDazoDQgJwZs3tg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
To: Conor Dooley <conor@kernel.org>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Cosmin Tanislav <demonsingur@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, William Breathitt Gray <william.gray@linaro.org>, 
	ChiYuan Huang <cy_huang@richtek.com>, Ramona Bolboaca <ramona.bolboaca@analog.com>, 
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>, Caleb Connolly <caleb.connolly@linaro.org>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Haibo Chen <haibo.chen@nxp.com>, 
	=?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 10 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 18:53, Con=
or Dooley <conor@kernel.org>:
>
> On Sat, Jun 10, 2023 at 06:48:08PM +0300, Maxim Kiselev wrote:
> > Hey,
> >
> > =D1=81=D0=B1, 10 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 18:06,=
 Conor Dooley <conor@kernel.org>:
> >
> > ...
> >
> > > >+
> > > >+    required:
> > > >+      - reg
> > > >+
> > > >+    additionalProperties: false
>
> [1]
>
> > > >+
> > > >+required:
> > > >+  - "#io-channel-cells"
> > > >+  - clocks
> > > >+  - compatible
> > > >+  - interrupts
> > > >+  - reg
> > > >+  - resets
> > > >+
> > > >+unevaluatedProperties: false
> > >
> > > How come this one changed to unevaluatedProperties: false?
> > > Wasn't it for the ADC that we previously discussed whether
> > > additionalProperties: false was correct or not?
> >
> > Hmm, I changed it to `unevaluatedProperties: false` as you suggested
> > in this message
> > https://lore.kernel.org/lkml/20230604-afternoon-frighten-42222010557b@s=
pud/
>
> That was about the adc child nodes [1], not at the top level, no?

Indeed, I confused it, sorry.

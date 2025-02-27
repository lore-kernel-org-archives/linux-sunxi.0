Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664AD1EB44
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Feb 2025 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740660416; cv=none; b=XWj1rrerCmfnvE3e04H1D3CXakBRkiFhVnw1YGW9YTM1t3Dy5cqRBK106OdN2QpL2+5fBk3K2MwWodcXWl18jnh2YumQPJ63G9otH/9PuCy46YN0NxDyLs10m2fsP7q76mZwRZdPFab1qRCDBh6X8OrRHNCjVbwh8/wJpjiF5t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740660416; c=relaxed/simple;
	bh=U7PCzUZnVYRvejULBSq6O8X9s2whc0HDjN7qBWSOoYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=le8QazlxM6OO96K377N5Di9+o4F3FHKjHwFaYUboINIppPDIKKW4QSIfb5zHE7y/n4sLp9xJDr6wTYMv/ZwcyAEFq7YZYMKdjfZpKPD+4ha2tpyF5oG2BHrDvSa6Pk3+a7sM3KFFBAdhqq7WiS6UdNK4MEUrNcquKlsnRKONkxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5461dab4bfdso969572e87.3
        for <linux-sunxi@lists.linux.dev>; Thu, 27 Feb 2025 04:46:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740660411; x=1741265211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wTt5QbyADMJ+0WvsKLYId9FZQBGxvlR5X8sImHZOIM4=;
        b=KMQkxRJYbnYT+g7Nc1HEsyixi7uajOfV7rvtfVzxT2MlCdpOkLMsGnSma+zWcbcOUU
         ssQfjBij9P3MqrXiNkiUiCQo4Ml2Wggr0JuU6Jaj+g/U5vO1+avNYRy9J+UAKkgBiG6z
         0dx80MQm4tV3+eDN11xW/B54fuPAfcnte36am/TG1+9WZt0lEAshF6oqG56/EzGE2+Qv
         EwtTWzCByy6+nKaLQ5ZIP8yS5i5DgaNs8kxR4qUaha/be+3df9IOCo/bfWFHPMGmlleB
         paTwywyzDXBWPk2fyF0NFtMfMxqcx88ydoBWlviEASVTK76gvWsU3O3vo36SYgT0Dn4F
         B1zg==
X-Forwarded-Encrypted: i=1; AJvYcCVEvJf07Ora7S7l4LenpwfcfI1kd9C3EpcMzyOjlTowiXcaEFRYKJbmnEXuybcVUEKbmsOrFDE21qQbKg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXT3QuXUz0s3yU1JTjj1+KQFiWgiasuV6xQBnxZg0bcsDvYcnH
	4D36LrAWDBIFjcsbssJIss6EVjfwC9dGeA03Z5qmS3OAlhffkBpWpq5u1KYR
X-Gm-Gg: ASbGncsLVB4g7CPklX3w7jXyOqOButVLFVVSa2aQSWjPFCio+A+y0bHAwOvRCDwyluh
	Q8hbwaauEEbCFT6xZQLNS4+7X4rMZ/w2p44aZVRYHHuvEOid/QvazNA9h3ChkIQAC6km+K+SgCm
	ats17Z7FiSB6ui/cqvF6huy1ZfrPKAm6DBhsIvXNgCxJ9Yw6yOiafuUVCvSkkShhmtVH1/fqruX
	cwslyyixtn04BQhh+KRXGpY7VMN793Q+BNpZjuRqPh4fkEu9eUQLPDyQc8o07+rFthI6jbeNRFv
	eXB1fZXR4MC5jWEDrg5x76xRo1edW14aQ/d8mgnJ+r2Mpt0VoN+xtZOVw8I=
X-Google-Smtp-Source: AGHT+IHUFht/v7CZAWZJ5jE27CYJT3Nr7wleWuoh+0reN6o4uZ4kEUN/9RR/leiLh6V4MF+vBDfRIw==
X-Received: by 2002:a05:6512:3ba8:b0:545:225d:6463 with SMTP id 2adb3069b0e04-54838f4cc93mr11505113e87.42.1740660410538;
        Thu, 27 Feb 2025 04:46:50 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549441741e0sm151457e87.43.2025.02.27.04.46.49
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 04:46:50 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30b83290d39so7728581fa.0
        for <linux-sunxi@lists.linux.dev>; Thu, 27 Feb 2025 04:46:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWmn2ITJXgQpIHurynjfhrqNpGp2ugCAGRV04ilQVf5OOPT1XurBRgEgyNNkUktsBPq4SQ3NGjcv/IVuA==@lists.linux.dev
X-Received: by 2002:a2e:8743:0:b0:308:eb34:1037 with SMTP id
 38308e7fff4ca-30a599702f2mr99762991fa.23.1740660409212; Thu, 27 Feb 2025
 04:46:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250214003734.14944-1-andre.przywara@arm.com>
 <20250214003734.14944-7-andre.przywara@arm.com> <173949598874.895319.6861900349653451498.robh@kernel.org>
 <20250227114611.67a1ba00@donnerap.manchester.arm.com>
In-Reply-To: <20250227114611.67a1ba00@donnerap.manchester.arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 27 Feb 2025 20:46:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v66eOuT+0n71OEPUky_rLd37_msT4b1+QC+8Nyhwtqarng@mail.gmail.com>
X-Gm-Features: AQ5f1Jrl692zM4GeD3auZTYmCOG5P6JcCZDXCDM_tdSURnSO6l5VyT64A9SuHe4
Message-ID: <CAGb2v66eOuT+0n71OEPUky_rLd37_msT4b1+QC+8Nyhwtqarng@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] dt-bindings: pinctrl: add compatible for Allwinner A523/T527
To: Andre Przywara <andre.przywara@arm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 7:46=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Thu, 13 Feb 2025 19:19:48 -0600
> "Rob Herring (Arm)" <robh@kernel.org> wrote:
>
> Hi Rob,
>
> > On Fri, 14 Feb 2025 00:37:32 +0000, Andre Przywara wrote:
> > > The A523 contains a pin controller similar to previous SoCs, although
> > > using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> > > With this SoC we introduce a new style of binding, where the pinmux v=
alues
> > > for each pin group are stored in the new "allwinner,pinmux" property =
in
> > > the DT node, instead of requiring every driver to store a mapping bet=
ween
> > > the function names and the required pinmux.
> > >
> > > Add a new binding file, since all the different variants of the old
> > > binding are making the file a bit unwieldy to handle already, and the=
 new
> > > property would make the situation worse.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  .../allwinner,sun55i-a523-pinctrl.yaml        | 177 ++++++++++++++++=
++
> > >  1 file changed, 177 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinn=
er,sun55i-a523-pinctrl.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl=
.example.dts:24:18: fatal error: dt-bindings/clock/sun55i-a523-r-ccu.h: No =
such file or directory
> >    24 |         #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
> >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Ah yeah, of course, that's in another series. What's the best approach
> here? I could cheekily import an existing header file, the symbol names i=
n
> there are often the same (ccu-sun20i-d1-r.h defines the same symbol, even
> with the same number).
> Or I just replace it below with the number "1"?

This, or just drop in a random number.

ChenYu

> Or let git format-patch append the patch-id of the clock binding header
> patch?
>
> Cheers,
> Andre
>
> > compilation terminated.
> > make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindi=
ngs/pinctrl/allwinner,sun55i-a523-pinctrl.example.dtb] Error 1
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_b=
inding_check] Error 2
> > make: *** [Makefile:251: __sub-make] Error 2
> >
> > doc reference errors (make refcheckdocs):
> >
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/2025=
0214003734.14944-7-andre.przywara@arm.com
> >
> > The base for the series is generally the latest rc1. A different depend=
ency
> > should be noted in *this* patch.
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> >
> > pip3 install dtschema --upgrade
> >
> > Please check and re-submit after running the above command yourself. No=
te
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checkin=
g
> > your schema. However, it must be unset to test all examples with your s=
chema.
> >
>
>

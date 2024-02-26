Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF0E604BB
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Feb 2024 12:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708950513; cv=none; b=slAUlNMKezXknLUGNJ7JjVofghOx+9h0UWRXLaKsA1rch0b88Rgih4iBQ1keJhba10sBhqJ7cdgfEeZRxWwtKn8iC10TB0vZEX7DhkEPFmNVnxpaYwEEeTXgqI9FhfN1xfydrEPgKBp90qB/1gBh0H2iJrxrShP/sMG3EeiKkZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708950513; c=relaxed/simple;
	bh=/5+1JvA8PcmHAUYXDe4zLh4GBZ4EEJwzWsb0OhWS0Eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2Et/HW7PahrsaiFYwnCYdWCUgbx+6qToCJFhN8mPZ5Pw8TVdRZnJowxrcDymlH83FdPhMwCmW+u8+odJbkvprDm4M4q0Q9UMVXWkeA1XDkLKWte3iFw8z+RAjxVwof5VZgw1binXRJd3X9kgjDMafIcwjIjmB3Sq90I/XRZ/as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-607cd210962so26184077b3.2
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Feb 2024 04:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950510; x=1709555310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IA4QNksb22erWBRN6uBbo69xHUrtQuWcgavfHO0o/70=;
        b=AkyFA/NOE8IGZvt2REXwY7Oyvn0izGRhXyUyVlo0dErMLK9KpZndVQtr8Vxxea7KZW
         cYquCMdA4+M6J55p9AZaLTHag1qD9IPxjj4ZUUbWDP82pV8Js8QrxD4H2G/QDpMK6JYB
         nouuFmwr6W+wBn/uAiotPon2yOaF9Mnmz6k+zxjzLzi9CbRnT+bu4GmUJ/EPPXvidckC
         75/HK56Ik30aW//nydHwpmJzgD+wKdGaT1EfLMhxNakA3p8jpEtNTPVrpUcN1cBWw1PI
         MbFClRq4Ifrvr6DMm6k1Sc/FmDm2H4YDuT8A6qhqq7Z97vSzwNuNnRnDlfLM9Op8hJk7
         Z9ow==
X-Forwarded-Encrypted: i=1; AJvYcCV0BCLOYZm6vfNO21xDmNlSi0I6cXk05S5ztB0pCnsXuWEJIUggR5XJbRDEB53+IFhOVXvoMS3AjKoN9HTeCXVBQerwT59cZqkj6DY=
X-Gm-Message-State: AOJu0Yz0ReI9kozbxkS7x9iLGVRmOB5tNj4DVK62ZgWviihAxMgn5D+2
	sKFT29XTwHPS93WCt2OwWDWe0gphhTCt1aL1h2VVvezITCrTLqhf4CaKuWA/7kI=
X-Google-Smtp-Source: AGHT+IGkRxqqkkMBIKbs6Msx/45l6/u069UI7QcsC8pSVgGejmWA0gkPLVpjhPic3iD+2XiCHgKSvg==
X-Received: by 2002:a81:4946:0:b0:604:a9c2:2a17 with SMTP id w67-20020a814946000000b00604a9c22a17mr6109420ywa.45.1708950510543;
        Mon, 26 Feb 2024 04:28:30 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id f187-20020a0dc3c4000000b00607bc220c5esm1138789ywd.102.2024.02.26.04.28.30
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 04:28:30 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-60893d33269so29230257b3.1
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Feb 2024 04:28:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8+AnOfx/B7omu+G5I3pJNPSIeOumT1+toEpbnRGQg1Axh1sQpO0fQl88BSzA1phNmmYZk3pwy0fvPVciO0b0InAMwagFV7NA0gUU=
X-Received: by 2002:a25:ce11:0:b0:dc6:d7de:5b29 with SMTP id
 x17-20020a25ce11000000b00dc6d7de5b29mr4889354ybe.10.1708950510084; Mon, 26
 Feb 2024 04:28:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240222083946.3977135-1-peterlin@andestech.com> <20240222083946.3977135-10-peterlin@andestech.com>
In-Reply-To: <20240222083946.3977135-10-peterlin@andestech.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2024 13:28:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV7f_R-_OiP-18rQATVdnS-1yo_kT++O=e1KuUSfeiygw@mail.gmail.com>
Message-ID: <CAMuHMdV7f_R-_OiP-18rQATVdnS-1yo_kT++O=e1KuUSfeiygw@mail.gmail.com>
Subject: Re: [PATCH v9 09/10] riscv: dts: renesas: Add Andes PMU extension for r9a07g043f
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, ajones@ventanamicro.com, 
	alexander.shishkin@linux.intel.com, andre.przywara@arm.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org, 
	conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org, 
	devicetree@vger.kernel.org, evan@rivosinc.com, geert+renesas@glider.be, 
	guoren@kernel.org, heiko@sntech.de, irogers@google.com, 
	jernej.skrabec@gmail.com, jolsa@kernel.org, jszhang@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, locus84@andestech.com, magnus.damm@gmail.com, 
	mark.rutland@arm.com, mingo@redhat.com, n.shubin@yadro.com, 
	namhyung@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	peterz@infradead.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	rdunlap@infradead.org, robh+dt@kernel.org, samuel@sholland.org, 
	sunilvl@ventanamicro.com, tglx@linutronix.de, tim609@andestech.com, 
	uwu@icenowy.me, wens@csie.org, will@kernel.org, inochiama@outlook.com, 
	unicorn_wang@outlook.com, wefu@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 9:41=E2=80=AFAM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
> xandespmu stands for Andes Performance Monitor Unit extension.
> Based on the added Andes PMU ISA string, the SBI PMU driver
> will make use of the non-standard irq source.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes v1 -> v2:
>   - New patch
> Changes v2 -> v3:
>   - No change
> Changes v3 -> v4:
>   - No change
> Changes v4 -> v5:
>   - Include Geert's Reviewed-by
>   - Include Prabhakar's Reviewed/Tested-by
> Changes v5 -> v6:
>   - Include Conor's Acked-by
> Changes v6 -> v7:
>   - No change
> Changes v7 -> v8:
>   - No change
> Changes v8 -> v9:
>   - No change

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
so Palmer can pick it up with the rest of the series
(the Renesas tree merge window for v6.9 has closed)

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

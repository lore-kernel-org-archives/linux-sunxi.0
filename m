Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A45E13DBB6
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Jan 2025 12:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735992852; cv=none; b=f3osIOhz3ajf/6IZWS0Dtn4/k6dfUePz7Us727FwDQuvNRSl4VpnBc1fys4nLSgzJ/UxN3wGD1QjGpIsldabGFlNi5guKIjGCxVrHxTajgTqZCbxLxcl1adbQmgkxEF8rh4tB0vLSRfrvvI31QQbxfxLM1SxSQ+2pHzl6/Z4Msw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735992852; c=relaxed/simple;
	bh=mRbAFmp2kCDc0UVL8KQM0BUG51NQoZD7o2kENjBSrIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XEYpYhucqg+a0N/nu2fjfFF0EayvL6wsRfCzVnSwow1C9yHCIcqUysYT0HDDUJnzqKsmBGl0m2+8H5ZyrCLkX3r9wRcavEihfWXC2eRfAu8t4O2RdEz9PAR8fTY+yTiBxzZXFbhJTRoP45KuN6cAwzOa5eJZtAAiVSUVwCfRjSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30227ccf803so150132371fa.2
        for <linux-sunxi@lists.linux.dev>; Sat, 04 Jan 2025 04:14:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735992848; x=1736597648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hAfNelAexbY+CFB6MXvVBZBPJB4LR8vgcGQXD+h9DFA=;
        b=cSw8Vor1UhpMz2oxr0Ap6HMF3MRloHVZ9v1xhDhUR85quaL4Qdk8edCjeDgpaDjFhU
         FAooZ4Ieuvyxo5/oK4uV8MakNCgrzsY6Y9HQDj5qnNSoXmjbmPVpWggYAyN1BWLmPOT8
         W0G+iJCBkxFc5r9x3WJF04Xu/JTIFUg/PM9lDI6/NpIdOkMMPgVxK4uhGL67WXwdmYxY
         ehF2zTuJ4KAB7q2DxJzvuloWxCk1Z9Lgm9Y1pkLAlrNYtoOEX58I4Mh5V8JiQGa2S2mZ
         kfpHBkuKb3+OqYHUOqH++Mj8RLO4DeT+AGVhLxX7Bx+ouBxVw8+MRUL7DzTseiRQqquR
         TzUg==
X-Forwarded-Encrypted: i=1; AJvYcCX7+yWUmGiuJEPVzMSZpladNJc0SbcooxD16muOkQxQScXGavbpNwMCV7M8NPkAOC+zTwBnitP0//zIjg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEIkb8/1AVXjx/37ztUWDPLa5JM9f1XtIYBCVzICBbVvQligvr
	9THoOl25PP3yaKSwJ73s2LRTABpKf+7TMtfb2/wekuwkDbqqc9Wk+JooqU4X
X-Gm-Gg: ASbGncuJYH85vcyVHJHhd/M5xUvhppe5wuHp6Di9rruXwJPS+veU53EEAnzyft52PEv
	C9XI9jaTzUq/fsGF87vSUnOkXcmBqqDBL51e28/+d/a9FppzrP2jpSIU4q7RaeBjVokDaIME9z9
	3onbug9XL0KTvFvDJ4jfgeR0lOIl2k0iCvdSXuUL1Wxwa5Wahznvv2+lMNaQ3XWfCRlkkly+7PU
	WPqj0wjJwX1q15UZ1VFNQwHefIJavhTp/6zffP4R8rAxjbavD1fyLDqeUfQl4thsWnzhSI6+tOG
	6lKWqFaReDPbaw==
X-Google-Smtp-Source: AGHT+IFaJF9oToYA7+CDltoYY28Pmh+9z6cvy5bsX/bs4f8akp/kiMiGnMep69nYFDXMaZhJxNuqTw==
X-Received: by 2002:a2e:be1f:0:b0:300:5c57:5242 with SMTP id 38308e7fff4ca-304685175ffmr165021781fa.7.1735992847564;
        Sat, 04 Jan 2025 04:14:07 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adad4fesm50008441fa.61.2025.01.04.04.14.07
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 04:14:07 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3002c324e7eso149755671fa.3
        for <linux-sunxi@lists.linux.dev>; Sat, 04 Jan 2025 04:14:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOLIDeFJdKFYeBDPhnZ+7F82GYEf0ITvogyc2g4AOKDKbyvDJ6c2vDxPpp4myfu4fJfHZp2kvWHed16w==@lists.linux.dev
X-Received: by 2002:a05:651c:1547:b0:302:1c90:58e5 with SMTP id
 38308e7fff4ca-3046841d378mr162276581fa.0.1735992847046; Sat, 04 Jan 2025
 04:14:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250104074035.1611136-1-anarsoul@gmail.com> <20250104074035.1611136-2-anarsoul@gmail.com>
 <CAGb2v66W9q-uQkepYgrD9QKnOwmpUdDakRoKjmsT_4=Adyj09Q@mail.gmail.com>
 <ca0cad16-7c39-4635-8f09-f9f3c95c9fef@kernel.org> <20250104120256.65511a28@minigeek.lan>
In-Reply-To: <20250104120256.65511a28@minigeek.lan>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 4 Jan 2025 20:13:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v66h1k9Wm5Xr1NMYsOgV--2oaHrTfyVFmUisdKmsG1HBCw@mail.gmail.com>
Message-ID: <CAGb2v66h1k9Wm5Xr1NMYsOgV--2oaHrTfyVFmUisdKmsG1HBCw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
To: Andre Przywara <andre.przywara@arm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Dragan Simic <dsimic@manjaro.org>, Frank Oltmanns <frank@oltmanns.dev>, 
	Stuart Gathman <stuart@gathman.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 8:04=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Sat, 4 Jan 2025 11:33:23 +0100
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> > On 04/01/2025 11:23, Chen-Yu Tsai wrote:
> > > On Sat, Jan 4, 2025 at 3:40=E2=80=AFPM Vasily Khoruzhick <anarsoul@gm=
ail.com> wrote:
> > >>
> > >> Export PLL_VIDEO_2X and PLL_MIPI, these will be used to explicitly
> > >> select TCON0 clock parent in dts
> > >>
> > >> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in T=
CON0 mux")
> > >> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> > >> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > >> Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
> > >> Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
> > >> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > >> ---
> > >>  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 ++
> > >>  1 file changed, 2 insertions(+)
> > >>
> > >> diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt=
-bindings/clock/sun50i-a64-ccu.h
> > >> index 175892189e9d..4f220ea7a23c 100644
> > >> --- a/include/dt-bindings/clock/sun50i-a64-ccu.h
> > >> +++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
> > >> @@ -44,7 +44,9 @@
> > >>  #define _DT_BINDINGS_CLK_SUN50I_A64_H_
> > >>
> > >>  #define CLK_PLL_VIDEO0         7
> > >> +#define CLK_PLL_VIDEO0_2X      8
> > >>  #define CLK_PLL_PERIPH0                11
> > >> +#define CLK_PLL_MIPI           17
> > >
> > > You can't really split code movement into two patches.
> > >
> > > With this patch applied the clk driver will fail to build because
> > > the macros are now redefined in both header files.
> >
> > Are you sure? The values seem the same to me... I don't see how this
> > could fail.
>
> Yes, IIRC the C standard allows repeated definitions with the same
> value. And I definitely tested this before (and hence recommended this
> approach to Vasily) and it compiled without any warnings here.

Hmm. Didn't know that. Good to know, and I just tried it on my end.

Thanks
ChenYu

> Cheers,
> Andre
>
> >
> > >
> > > Barring recombining the patches, please add a patch before this
> > > adding #ifndef's around the two macros that are moved.
> > >
> >
> > No, not necessary, just churn,
> >
> >
> > Best regards,
> > Krzysztof
> >
>

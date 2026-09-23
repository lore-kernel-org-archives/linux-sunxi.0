Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CE757D207
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 20:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194447; cv=pass; b=J/cjOZb9IBCDslUA7GSAAjFcEwEshMQrJlxXI4bNE9FU+GOTxjuY0Y9ZpsE7dSA+dE6I7z0fAZDFRWMCnI3wsHv8zvE+OPFiTeBXPTO/BYtqTWh4so/0wWkpqDxWrd9twzIkIP07z2RD+Z3WCBRyIXw75pU5QOTBmfs0rmOL+QI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194447; c=relaxed/simple;
	bh=qOYwtCPr1PxjrvDGfh2AOArCnIzBjh0iMMKj+uLMXjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4ANRwNHVQOEUxCY9bakEo4Mdl2kONqHZ1P71BrLtMIXabMq5hzP+BuL36/Ft+UNVgmYycRSX2bmlY51geRR5SW6qMpz6PKXulSldWhI3VjjmNHGMww2MYkh5ghulcc1WovT04okoFcXJFUnS4QijmUBONeLKqA4hY2cE3+wU4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cS/ywEix; arc=pass smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cS/ywEix"
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7a0477a4a01so427177137.2
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 13:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790194440; cv=none;
        d=google.com; s=arc-20260327;
        b=O1iqaMhEZ85J21G4x+NfEMZQhHMWyMiGFAUnZAxvWwCeIZjwIGwEGAYznhvq3fjS0r
         g/2Tvh/EeETJkBEcUvTD3pzk8l384hMMDzZGOCEbzbLpvf2QGcLTYELCeC3q6x32qevR
         YoGPzpEop3zZpQLmrGhlN1xSh9ECIC9nCR8zAg7IlGBGJ+IGn0oK3TBTMmuvnCKCg786
         rokpSlKgDPqPh2D+PI69xNygf38alVz0TrVovghXv5clix4Yt6WnuscbDhE9mr1PCSGx
         kPEP5uTAaMerp/kvJ8fdP8jSIOxze/pkXIDbBFnY/x6YbTV8yiaPJFe6adzyKAhdLWrk
         +L5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yYhzfOA6SCO7uTNbvN7IrLA5gsM9sl+9GrMf5cq1964=;
        fh=HxJFCSkNRmaDVDcX1lcQpXWU547fW1E/JWmmNzio7+4=;
        b=pT7NWneRqw/KwsaxpOFBz/fDCmuTH8Pc+5HGapWLtRIkpWpCGG1fL8UCc8HxZbKhpR
         Wv2RPf4NuWKogNipVtiA9RArBiFoCW7P+qoto6O/PaRZ4Vwpr4UxARXagAPY6aGu6X8Y
         KdKUGIOhf4ZuakzOHzZSF5KL6ArnsK0D/nBA7scswsO5POJsYCrEuNTRcO3IpOGcBZus
         DP7hvdez1Dj3/Tx38f5o1SqsmIPJAqM7AguZvHjc9rYJnXFQFP+Y5dEslIzpwsHEAJot
         iKbhlH4pz6MBwyV11dV5MdUmSmVsnhb5j7w2zKsPapQK/qn1Pg2fo7P9X1u6MV3QIJ1Y
         qWuw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194440; x=1790799240; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yYhzfOA6SCO7uTNbvN7IrLA5gsM9sl+9GrMf5cq1964=;
        b=cS/ywEix2tAsD1++XhvAdZ41jWuBGFhyVCdLtcuHnLui5Qf8y2/vcMiC8UWmqA5cle
         ju5CcPX2mlPK7CVGSslStWG6VhIvwcioZt67sqf/xgSdn6IVZLkglTxS37t3kI2oEjjz
         SbDohIa+4gQiPAQD5HIXimXqDBXky3d4qqZzEvGne6EUcUMnYaG1bMDZlpEOa1pVjpkY
         9sXt+8KREqwLUJXzM7i/sGBxEGty1r5TU9EAX7uj68Re0DdeBI5DxkJLyFnXWANZOp7w
         nvyxqG+OcgB9VQgOZwLEEKa8YroS6A0Brum3kJpQFbOPQ3Xj3+Ilx7+Zf1VjMIVMaiWh
         9OKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194440; x=1790799240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yYhzfOA6SCO7uTNbvN7IrLA5gsM9sl+9GrMf5cq1964=;
        b=sudjEYFihkH//AVY3uEB70qIy/ITkcMR8arp0NvSuHJx9OSrujL7MLIeW/up+49FWe
         OhYEBz1PnDUReBI3vqQxz4h3dLel2ss6IBnOCt8oGkRUb3ktEOemjwNbvUZbEUmo7T/k
         ALK5qviX5i5Rua0VpVm8CcoryWIO0cwl+ldTCy+Trrs0pojsS7iQfCgtGhAlwzd6WVro
         9quNQnA4u01Er8EaXgdZgDjXlgB33juPYyd54XeBfDTJ7Ac6Yj5eV1vMNSufwj5YrF0A
         sM7ZBby82fGcf8VymikbIrEjBZ+enDK/KffremGzTk+p1ujCosTZMGmqduhUYK+K5WVV
         YvdA==
X-Forwarded-Encrypted: i=1; AKwUvBxkc1wGIsLEUowwWd87NGOkYSV8wnFbWdBpVLV0auYGdPBLrAEXuNIXE90+N0p8nAQ+/+u+4sqWomgNeg==@lists.linux.dev
X-Gm-Message-State: AFuF++nsUgrtmAdeeLR2lm0t1wEyf4UVUsRY7+MjnLqDCeHtJbnl/Gbi
	4U41bbcNY7r2+MhyZnNly+2c80+77h6Qj8ij39DH/2LSy6BwkemR9rT4+z/ZmQZfUGfsj5VWAe2
	mc0mh3InoCG1JQoNYlj4qGa2HYVawrhEfXcFAFUU=
X-Gm-Gg: AYBFou0XCHoHMH6pfKoAs77FfjOa+YpjEwZVP+Y6yl598GbFTwpvf0QHwjA3m1O71JX
	G9YFtzFt2GaF/ftyk40r2uPwNVUSjxGZeqIk6kAHHqhFIWir/3fMDADhoTyHlDXkvjGIHdYnDYF
	+V1yebk7uPQ45UGuF37GtcvofRJbykZtcDWkAWPzSm/UxxWtPHS1P1XrPQ2aO1RphENJJPLsIdp
	wptSGIP+yBViko9Q9hfxPeUzSVPQIyfCIDufrASkemfPGq8XI6zX/YrlhpXL39eYucQiWwAF5n0
	fGCPvxKfywYLYzkZUOzQTqVRaD1F1M8X7iHX1keSn7cDxHgGoglq8i/nMd5044LoI8TOA0SBqiU
	nyFH+hvNE0X9NgXgYKo9frclbzdzudQFfmOVhy1PFxCZ7OKr4eKyfOQToUih1IfJo9hhJfymn3M
	mCeMaDEDduHBe+45LsnBkpMRvziY5mmA59G7+F7ToZegTA
X-Received: by 2002:a05:6102:548b:b0:7a6:d11b:16ea with SMTP id
 ada2fe7eead31-7af1c7a036amr305798137.6.1790194439982; Wed, 23 Sep 2026
 13:13:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
 <20260804-h616-pwm-v8-v8-2-db37ab8624ae@gmail.com> <arFMta6PPwmzSk86@monoceros>
 <CADvTj4r1sFjPko7G5DwrPUw9x1tPzQspJhCUmHSMtrudn7SXEQ@mail.gmail.com>
 <33e760ca-2bb4-4f1d-a736-7e74a97e60c4@bootlin.com> <CADvTj4rBUNF6EaKXbsy5t1cS0iakpWVdpQ5sQF2qLS4YyHM2aQ@mail.gmail.com>
 <58145d8f-dd16-4cc2-b2ea-d475462241ab@bootlin.com> <arOif-bN6JgLeWd3@monoceros>
In-Reply-To: <arOif-bN6JgLeWd3@monoceros>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 23 Sep 2026 14:13:48 -0600
X-Gm-Features: AclHuK9uNvVaV2VJoRguaZ7pkecy04Hwe0dR9Nt2OWuOrBNW9SpmIsO_os_jzFg
Message-ID: <CADvTj4q4G5doa-br_SvvcuSF0sMA6Vb3K8ogZL7xe=auEd_s+g@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] pwm: sun8i: Add H616 PWM support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Richard GENOUD <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, John Stultz <jstultz@google.com>, 
	Joao Schim <joao@schimsalabim.eu>, bigunclemax@gmail.com, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 4:11=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> On Wed, Sep 23, 2026 at 09:16:28AM +0200, Richard GENOUD wrote:
> > Le 22/09/2026 =C3=A0 17:46, James Hilliard a =C3=A9crit :
> > > The resolution tradeoff is real, but the waveform API currently speci=
fies
> > > the ordering: choose the largest period not exceeding the request, th=
en
> > > the largest compatible duty length not exceeding the request, then th=
e
> > > offset. That's the ordering implemented in v9.
> >
> > The ordering stated by pwm_round_waveform_might_sleep() documentation i=
s
> > period_length_ns, duty_length_ns and then duty_offset_ns, but what abou=
t
> > duty steps?
> > It's not stated in there because it's not a user input, but still, it's=
 a
> > quite important value for a pulse width *modulator*.
>
> From my POV as someone who cares about many PWM lowlevel drivers, it
> would be ideal if there would be a generic function that only relies on
> conforming and ideally simple lowlevel drivers and work out a good
> period that makes the required amount of duty steps available.
>
> When I designed the requirements for the round-to-hw function I had in
> mind that it should be possible to find the next higher possible period
> for a given lower bound (and that works, only lacks implementation).
> Working out a period that has finegrained duty steps is harder but
> doable:
>
> But something like that should work:
>
>  - Pick a period P
>  - P*, D*, _ =3D round_to_hw(period=3DP, duty_cycle=3DP-1, duty_offset=3D=
0)
>  - Either take P* - D* as a measure for the finegrainedness, or continue
>    to research available steps using round_to_hw(period=3DP*,
>    duty_cycle=3DP*-1, duty_offset=3D0)
>  - If there are too little steps pick a different P and retry.

Thanks, that makes sense. A generic helper could build on the existing
rounding contract to select a period with the required duty resolution.

That looks fairly involved to get right across different controllers,
particularly defining the resolution requirement and keeping the search
bounded. I'd prefer to tackle it as a separate follow-up after the H616
series is merged, if that separation sounds reasonable to you.

For this series, I'll keep the driver following the existing period,
duty-length and offset rounding rules. Do you see any remaining issues
with v10 that need to be addressed before it can be merged?

>
> Best regards
> Uwe

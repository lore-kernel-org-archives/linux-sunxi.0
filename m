Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF6E3750A9
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Aug 2026 16:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786121856; cv=pass; b=rphpu43QBOxvTs07htMfCwCs/rc0NZqUDXoP274eimmQBI/QdQy89kMZ0GQZmirQas15x4mDe63K6RavWPVugiKQAokP0tP7eUqO1u24AgL+IUB06Z5FXefQ2FhxRXNtL3iFk6VAcDRgdQTmtYdlafOlEebsPh58QEMPazhf07Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786121856; c=relaxed/simple;
	bh=Hq8X/4Xg0Ta1JBUv3CIgDq4vQ920HdWsgV3I1NkcJTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OKu02zsR/uKf5jJlrNY8wehm0RDjys/MxhGyZKUKVkVFje0ngxFdP29Uh3vyIMhVq7xMAmBS5TEhCKBEWLff3KnF/QPHlrHCCwt6a0xLyoLNwCeF/STL76I071/bt+t+ym8hOasgnWRUi5DA+1OwI2nohIdPJ7WU6bwzF6/wDws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjF2zWjD; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjF2zWjD"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-754acc61e10so1444524137.2
        for <linux-sunxi@lists.linux.dev>; Fri, 07 Aug 2026 09:57:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786121850; cv=none;
        d=google.com; s=arc-20260327;
        b=fUKxEMv1436EZroozRg/opDxSEmXFb+xSxGdT/t5KW44BrIsShJz9ABpGe4T2Ocapa
         rJ5S3UEMTkXC4V4+EmNfv+6rCXkdMcwmqFZZOadTAG9gvz7YxI9RPoNy7QWc0RcGGrM6
         Solti2Mz4KKpjefaWDAwuFRNx2AYmEe4o4moRc3p54XgUjThjeTaGbOdZ9/HnGRazKFG
         WB82mk7BQgrMoVdz5f+rSrnlep0x+KMFqgZMGBwZoE/F7Hd2Ct7wZByngivldEMsl4gU
         /MfrelmZAD4QNeWevXSbbdM+BDnnZzYIO5Y07exlbDiQCeHx5NjqsIPoYVgdnrY/a/Wf
         jj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hq8X/4Xg0Ta1JBUv3CIgDq4vQ920HdWsgV3I1NkcJTQ=;
        fh=A+uU54P2AX2LoguqMyKWVHuc6wmDxU2CNrVH/Piyi6M=;
        b=sbHwzqxmsokA390FNYZzV6sPs97og7tWS6L3J02pZzQqHdhxd0kUW1J3ukD2fOs15b
         h4u0G436SsAptWtD0Xklhlh5OepxdZNVgGz8Or+5Bn4w4PFDv8q/6On4H+m0/tDO8/q9
         gHFY/ykYdkj1YTMzEJWQSF6GGfu2xREoNHBYEJM909tGLVhWwIL2hOLiAI2wS1TjWTlT
         VkfXZ1O2Z1AW/7cJah+i2Ofos7ad8yCdM5uDBt68goYE7WvwvQZy0Q2LwhB62pmDFSwY
         kKF2MnRXRfyBGfjnXUwqnADXn4aBmH6KkZNwHcliwglw5WiiZ0ZUmwYYpsGFhKOBhLo+
         i7Rg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786121850; x=1786726650; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hq8X/4Xg0Ta1JBUv3CIgDq4vQ920HdWsgV3I1NkcJTQ=;
        b=rjF2zWjDhcEQ2ieFSzTiE3E9TQTqUlTR8ANFxoRBfNKDGB/CngtM5sdnjDNTMXu5ow
         gcZfD+uQU2XhUVfRi46rEWr2Clv42SG05KEvBcYkJEHYUmy4aM80rSExj4amyvlOOIiA
         BNCYIvSLUEg3HxU6mVQqbkaEnJzMOm8ovdrjSPBUwH6HwyTeTUta4+Ur0fKNRTgOKbjH
         9r/hqUaBSzagsnE4hBtiZHQM/1hdDmXoV/V234a/rMEEY1fP56CTaYmecrJ9M5qEI6ZS
         75vJ0mvLcO33JL/qvA2E3UwhwkhmKC5nKkRojVtobg+DfqWlcjU/3+btsmqKJne9iRsx
         Gmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121850; x=1786726650;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hq8X/4Xg0Ta1JBUv3CIgDq4vQ920HdWsgV3I1NkcJTQ=;
        b=Sger/SsW4y2/FMF37j3ayZY56D6Rm9KOthz8za3U+CfwtLdaYg8TPS54eVztN1vxy3
         MOaSGqjsyZmmZU5d31QyD/poY4ly7/Nb0Y5oNtSnpZFDZqUS1Yhm+YvnW6WbGNc12U/V
         TfcCksaHnHzsWO9qAUih7yby7GqWUKrkjHxrOmHEG9RSqqwUEZHzskrYvxXJVOEig2A9
         45aXNf/qzOgdFw1pkDf7aPMOCGyUtJeLDeFqRtMJDPalUT/qyUszz76WyeO0sk9kdCyg
         6Ap27tHbbkN0Sx0V8zDL/+duubIrz5mlnX/10HfsywvTMQWkMf3VfEUYz5qfZjmZ5ECQ
         DvNQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTILvDMKIa2ku0QnYIBAQojvXeFQXlB9rZQYROhgdPmitjOR/Y2UuYKKA4b4q9COMwtIgxUS6Sy3igIw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDzmkqwDi7wSGpLBKlJpMr/K1vj2CXBRfSQ5Qb+1ElmEH1izN0
	NodPPKzXq54WGU0+HRB7lYr7nhYHsk4Nf17EYmvjMa+LIE2MItdXoQ6cLCDtBqWeNwziw7XBDWS
	5b/4l81Zu2JHY+2l+mCzMIpvdMLBJqmI=
X-Gm-Gg: AR+sD11CW7TIakLdTTrlhpBFGdgSEBvk7QJkxAfoFyaeXFQLeVUY15NTupp8Q1shNUX
	DDKv6SGvNCNE6Uv2CdTNlQ/tw44p29c4XOyLVROfAkMzzgkADutYVi51cUIQQgjHGAonhtdfS/H
	vYALTkvHUNYehv0gecOyJ+i3Eml7JtRxGRkb4u9YugQ2zSEMqaOGFXu9s8+GZXUZBAn0XpoD4OC
	JRHUBYCUurTzCqtK8i520F6vGUqKHkx3+FhjHXBkbZhIAYcbwN7qXBZwTnTk9OSIv0pgtuZgn72
	qK9LSyvTV974HGrSAQlXchA7s4URTYQ7S2jZRbVkK/tTveV29l7/JyK2ZHNE/Bb5V0qmprAA1iQ
	LHUmIAL1Q2QIeO4TQCgEJTyxSwxWoly1O3YyCxTEOnzQx3EsFdvm9Fc+ExRgkCl5PBLk4IIPCII
	SOQNmvHXYbw0wyyEvayDy2Jgblnfzt/FOUa8QN
X-Received: by 2002:a05:6102:390f:b0:744:d1a6:b11d with SMTP id
 ada2fe7eead31-764e4f2985dmr717652137.3.1786121850298; Fri, 07 Aug 2026
 09:57:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com>
 <87ik5mav6x.fsf@bootlin.com>
In-Reply-To: <87ik5mav6x.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Aug 2026 10:57:19 -0600
X-Gm-Features: AUfX_myfeWEyYh7Y2JNZ3tcJ-zpan6IsdJA8dIqxxvbXvmFsYYO1pP5EnmrWVAg
Message-ID: <CADvTj4pHOpKfNCoVcfDmtCuHh2F0H8e+_AhCwcSKG8xosLpbzA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mtd: rawnand: sunxi: fix H6/H616 controller timings
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Richard Genoud <richard.genoud@bootlin.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 7:58=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> Hi James,
>
> On 17/07/2026 at 11:33:56 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > The sunxi NAND timing solver currently applies the original A10 NDFC
> > timing characteristics to every supported controller. The H6/H616 NDFC
> > uses two internal cycles for several setup and hold intervals and has
> > different delay-field encodings, so the resulting clock and timing
> > register values do not match the hardware.
> >
> > Prepare for per-controller timing data in two behaviorally focused
> > patches, then add and select the H616 characteristics in the final fix.
> > Legacy controllers retain their existing setup-cycle behavior and delay
> > encodings.
> >
> > Tested on an H616 board with Toshiba TC58NVG1S3H NAND.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> There are a number of checkpatch issue. Can you please fix them? (except
> the camelcase one which is fine with timing names coming from the ONFI
> spec).

Should be fixed in my v3:
https://lore.kernel.org/all/20260807-submit-sunxi-nand-h6-h616-timings-v3-0=
-91287b543f41@gmail.com/

>
> Thanks,
> Miqu=C3=A8l

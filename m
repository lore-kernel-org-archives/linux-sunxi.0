Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2176D28EC
	for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 05:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716442245; cv=none; b=ATYAGHukPOuzy+U08LxIgEwr6gpnIHNevXoJmm/nejlydYpmSXs5jvKx16OnawkzBLy6aYoBonihO8xLyUfxUrJ4ZYIw+SXpXKjo3tWrQTr17AxOSx8cI8oLXQbdcyA+1XZs4ARkJX2FQjo2c0lqXm3F4xezBs8MYFuMNfrWZoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716442245; c=relaxed/simple;
	bh=jeP04vuCdyKqyKQziTj/qCMLaFBjvVxkxdMxPwwYkVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bl5FNZkgKACwJeQ/ZwUrNR1Qhi+21ZL5kfDZdm93BKokBDeulCma4K8EbEJsJ06oGg8RT+TneNb+ISZi3NK9TwW87EHw1FgomGhGnDpRwYQUrhAmDmvg/g3iyBYKCxGWv81HyyBW97py6HQh+gd0k/hOvWA4F17GyybeV8urM0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6Xe/WWv; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6Xe/WWv"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-df4e503983fso1482346276.2
        for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 22:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716442243; x=1717047043; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jeP04vuCdyKqyKQziTj/qCMLaFBjvVxkxdMxPwwYkVA=;
        b=A6Xe/WWvSx2a/613qEtdoiNS9UcrakPnqqHU2c2T1kQTlPlDAWtWRGbBEIYD7Z5RWe
         3/ztnkGz8H8MuWYUO80lwNpHUSHk+vd6yb7y8Qgqjc6amUJ8nhcGPe68qXv10l5ZCc6O
         TvMftNyd+pLR3ZUpDYQpaRWSE2/AuHhRsHBzOEWjEGSnGD0thSr4kL8vFz6wnWwB/+RX
         aqc+r2eOIDgUYnPU+/xINSKz8UymNxWSfRnD5/ieTomRytIou8vK4t4vxZcn1oQuhNcJ
         aXbotoRu7pEuA2p9TIhITnTXQhczEdpUtWMrzBafWX6LaTpYAT0MnTo5FzT3ue/wsPiO
         PsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716442243; x=1717047043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jeP04vuCdyKqyKQziTj/qCMLaFBjvVxkxdMxPwwYkVA=;
        b=QrB+ai0YQaaL0IP9eQksLEKbkYJ3myTtp7mWPDnPlyNzsXOfhbGbLa54FtMHyRub5C
         na2oM/PaPPV32w+FBt3uJhiK/VGY5fPIQhm7klMhhRFX6Jp0vArpt8WNoh6xUuzsx2j/
         vbA1EAEId/OoLt2bCPR4LiQTzrySDXvffGqtx/NDxYwep1zzEOOFZSmoaysRGNkWi0Lb
         BNBWDlz/+CZsEIjVrwD/XkwcCy0WEgOq3WvxDafIHRmUrNtOcIm+bgkEScBEpXK9dGiu
         9hyuJb+xhoDm5DqFzUMsSINnjc6s7Nz5Hjdp2erhSbAc22yq43QWmjspDNx/euRH4JVs
         iKDA==
X-Forwarded-Encrypted: i=1; AJvYcCVV16BRUw30nEOGO9tp4D8g1/SoQgGQ0wwRILLHB5913kdDJ6Yq7WQuCxOsLfLHPqXDN0GhI7fgQ4Ib3+xOaLE8Ajr+o1tnZf84DWA=
X-Gm-Message-State: AOJu0Yy7WDpDLM6PdUimnStQVMbuAb1aSh7zQfpwzv112A5jYjG/RNyH
	mvmus1l2Oyj3erTDJRFg3A7YuEguc5vTdVa0g9Y0wybxiT9yvMVvZ3usLHpxWPiXnmSMlbQtU5t
	h1hJ6QtmxJVi3nmaMwSX2ftyIe2o=
X-Google-Smtp-Source: AGHT+IFwNmf9mikTsRKBvOMdbJUka1g4+AANDd7/jGjpPbZNh3NDCKIMRlgEx8AomEr4C5opC2T3EcB9FDNaZkHjtF8=
X-Received: by 2002:a25:a347:0:b0:de5:5510:1d4a with SMTP id
 3f1490d57ef6-df4e0be4b93mr3401384276.34.1716442243001; Wed, 22 May 2024
 22:30:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAG40kxGMu-TSchNezkcC_A97hzPnWU3KxeL-X-hJfPhjr_COyQ@mail.gmail.com>
 <Zk6yK3U9tgxOxcBb@titan>
In-Reply-To: <Zk6yK3U9tgxOxcBb@titan>
From: =?UTF-8?B?44GN44GP44Gh44KD44KT44GV44KT?= <kikuchan98@gmail.com>
Date: Thu, 23 May 2024 14:30:32 +0900
Message-ID: <CAG40kxFxE_Oj+9aCzGku0a3KFHpuW8ai=gEkV9M8==5gwmjdEA@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
To: John Watts <contact@jookia.org>
Cc: privatesub2@gmail.com, aou@eecs.berkeley.edu, bigunclemax@gmail.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, fusibrandon13@gmail.com, 
	jernej.skrabec@gmail.com, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, mkl@pengutronix.de, p.zabel@pengutronix.de, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, 
	samuel@sholland.org, ukleinek@kernel.org, wens@csie.org
Content-Type: text/plain; charset="UTF-8"

Hello John,

Your method is quite impressive and challenging.

I think PWM is not only for LCD backlighting, but also for signal generation.
For instance, imagine an application software that sends a stream to
one PWM channel to synthesize sound by changing its period (plays a
square wave).
By your method, if the other PWM channel is used for LCD backlighting,
it may flicker repeatedly on DIV_M changes.
(Or simply both channels for streo sound synthesize, you may hear lots
of pop noise)

It means the setting of one channel can affect the other, which users
may not anticipate.

Best regards,
kikuchan.

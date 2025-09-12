Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1C7272E5E
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Sep 2025 08:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757667417; cv=none; b=bn7x+TWRexa111l02XThWWYMr703COBH+TPire+hPxWW2AsAp5rb70o7SKSMftJaKBWfPOEvGGnATsvCKmghLoEPXHYFMEjIUTzSEMjUQ1pW77s+OXAW9pbNU9K9TFy69ymc4RHOIFN1F0xKNvVtG765a293IiJ2x8zqRRYo6vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757667417; c=relaxed/simple;
	bh=y4x97uGJUM5QsqfWMCvRjzay1EV09kP3vQXEnBF3d2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acrZzTOOWOj9hO/JzwFxeCGGp1kiReLXN5AH8uILv+lfGKm5ILnQvos7DfTTvXNme1nVfkd90YlzobBYV7UIlGd+cSwW+98gXZFcT2TixTHtsoS4/NPtJcRci0BhF9vNkyZIFwan74mQXi/BI75NoHSzGf+nY02KK+V9uku0TCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f716e25d9so1689343e87.1
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Sep 2025 01:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757667410; x=1758272210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=74tRC2VlzLxPkuO20P1RbEt4g142PM6DdcNwZMtwWfs=;
        b=s5qu3i0PQrJMuh/wCY/peLgsj8QCOlakWz4VbgVZ/JgN5ZZWj0ALeawIjMnAETPBEZ
         O/JBITLVJXAvHZRCP9EltCIo75kqPW1k9SuDL74f/AzgSsNwamFuhlS5JhPoFCFmZML4
         aGcXTZaR/YCI+jAYKqOco+6iewGlYfrawSxjvV6OSMP8f7wtECx1sohgly1h5MMBRn/d
         j9soDfKSX13uPqAMxQg6v0NnQVckSv6yKjE+64GPnuvGred3jwws36L+MhH1LgCzni47
         z+N/S9bLfprezT+Fm+VVPNXMjyZTY26B8BKMptayVjBU1RyAsht8rsNM7DXBQYd1GyIT
         Ab1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOqeE8VVq1JIDvZR0JXl9bWm3VeYe8Lq82sFgzhpFo1REsySZjlJ0j+yDzGJICSjThoYbrOpMXfY6PlA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwHggHdhSmUZe29I8o3GQAPq3NXTVsne3fuHVDEm/vBGW8Ldis
	Q5inCnVvSeEyVeIbO2i4+omVS9QD4rna22DG9O9OI1OYnQjcKp0NU2XjB50QV+T6
X-Gm-Gg: ASbGncuksSq08EhaHJ6lhX5br3oohys23hb+ySA9YjuCs7YeApe2ctQnAYzbkHgSIp2
	LyeTKRvpRbQqMly57GKZT0BiWjRwMqLu1FEv/GPiheVKIenqXvcDJMfAF/JxRHNe+XdxO1oRTBT
	Y71tvBzOV2A32X9NaVXZl+Vh64uRCWSP+nEHH0aGVabcSiv3gFFiM1l79yezUoOImrYoBdJNqu3
	pILnlEWc+wRKkUIKEKgZHeDbuONxsz9ynYCIplxxei12D/4MhPd7wCKlugc/cYNuUcuij2CCK2k
	O5DXdvZSxeknP/cZDtXlF0uemh4Nidqy04qjuG1UswJYombX8RKjAJNKEBJ3PUWijPWmBPWgOoT
	unVBhAn/IXvnWfDLTETdJYCTc1bztjUEF0MVSQODcUg/Ig6AETfNOQhHIfWgc7/doag==
X-Google-Smtp-Source: AGHT+IFECVbpATTmzRLtxpxw3nZL2R0E2Kr/ke6sO/HzN7mtLFLNe+awKCjyAi7dMsLZsz9jZ9JkOQ==
X-Received: by 2002:a05:6512:258a:b0:55f:6391:a34b with SMTP id 2adb3069b0e04-5704fd7711emr607688e87.36.1757667409652;
        Fri, 12 Sep 2025 01:56:49 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b622fsm1010473e87.2.2025.09.12.01.56.48
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 01:56:49 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-352323389cdso2369511fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Sep 2025 01:56:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrQlr3UWhNDG4FB1fcubKTYJJNb+sCRB8gk+kngQv/CgrXvl+NaOA4SwpGqeOjjYEdJBq5C8v7k5xQsA==@lists.linux.dev
X-Received: by 2002:a05:651c:1118:10b0:338:d42:2a73 with SMTP id
 38308e7fff4ca-351409b51d3mr4673771fa.45.1757667408335; Fri, 12 Sep 2025
 01:56:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250912-x96q-v1-0-8471daaf39db@posteo.net> <20250912-x96q-v1-2-8471daaf39db@posteo.net>
 <aMPftsaf4x61-bGY@probook>
In-Reply-To: <aMPftsaf4x61-bGY@probook>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 12 Sep 2025 16:56:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v66khAeP5pCq6RCrPUwQr=tDqJ6O6cs0gokbMNjpTejuvw@mail.gmail.com>
X-Gm-Features: Ac12FXw60L74DnVtPN3yLU-Dvc0n827phLti7Hql_EebywNU_R9Et1E7UON_xe0
Message-ID: <CAGb2v66khAeP5pCq6RCrPUwQr=tDqJ6O6cs0gokbMNjpTejuvw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h313: Add Amediatech X96Q
To: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 4:54=E2=80=AFPM J. Neusch=C3=A4fer <j.ne@posteo.net=
> wrote:
>
> On Fri, Sep 12, 2025 at 01:52:10AM +0200, J. Neusch=C3=A4fer via B4 Relay=
 wrote:
> > From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
> >
> > The X96Q is a set-top box with an H313 SoC, AXP305 PMIC, 1 or 2 GiB RAM=
,
> > 8 or 16 GiB eMMC flash, 2x USB A, Micro-SD, HDMI, Ethernet, audio/video
> > output, and infrared input.
> >
> >   https://x96mini.com/products/x96q-tv-box-android-10-set-top-box
> [...]
> > +&gpu {
> > +     mali-supply =3D <&reg_dcdcc>;
> > +     status =3D "okay";
> > +};
>
> Note for v2: The GPU gets stuck in probe deferral, and I forgot to
> investigate why.

You are probably missing the GPU power domain driver?

ChenYu

Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FE17081A
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Jan 2025 16:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736355187; cv=none; b=agpUDcLhF0J1vW8p5fKMF9ekHQLLUwQepfkiY50Wrxb57x373i7hyD3fGat0UvF0rGCNnwKzir/kLf5cju1uSyvOX9nIQWJzWUCK/u2ZbUV0HsFg8/6tiryYCvhOeMIBvApTlTS+rbhL6JkOCsVPrgkTpIauCukeCi0hveBsptk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736355187; c=relaxed/simple;
	bh=xrHb5M/ZA4Z98nlMieaSv4x7qELzO4tPhnQnYmeSNVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uny9rcvvWymok4jjjRk8aA1BCOZ1Uv+EnlaQOLMLMV/gJlwJCblmn+J4q/ysAS5p2x04QKhiiVXMks3v8gtxs8pqGPpZdz2QJ3naWh6X3ckfqd1cJlgclsvU/P9ARoqbaB9+cRKBQdxajTGppR031OuwvH/Y0TcVvAeu1/TdfGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-305d843d925so33631711fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 08 Jan 2025 08:53:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736355182; x=1736959982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jx0eMDBUFN8OZ3Iife5XjSsJKU6lJXng+Kzs65bz5do=;
        b=sZdgyqYOgibRm38sfqA+FQq7iWgoIS7Sf+zQKxWnVBI5Kx1u16jZiJCOhl541QMZPG
         rtpCyjyQw6PLd4ap5lKaY9EnUX53nA5kkllJlM5cUwWizfmETjoo9iaru2tiOPhmrBAU
         7gg1Nn9fv3NJS5u8TCpU0hdFULNj6VCGk096pmjs2b+FqgfA2519SOOyNdmnWpWdqosH
         wP0o209/19OCaAYQJFDkkwBBDabUHX1ltVBXXdptcaSfBNStqN4TGYk2vkBMx4mHdLE2
         ddt11qBI7BiCMw1xkWXrqHGjuhTTEnXUwFNdGqId6+lJr6TNkC4IJ8AKFUTnNKvab07M
         gTSw==
X-Forwarded-Encrypted: i=1; AJvYcCXd8qMtE3QjuJKq85if28ErU4hrgBYS3clAulmefFgFBJkEfllYVruox5AjC5DUfq2CbYNkrVbnuVxSnA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyslRzZg0Z50V76O18sc4qXb5GjeJA85kd2K9RNH86qWjwtfoix
	+JFwKhP0MjzF30A7B27Ui8RvSw34Jr1xZWQ+uGUjpvX6KovuAeEWIGj6t9kI
X-Gm-Gg: ASbGncu2QG8OH1aBnQVBMPGVhh0QFvO+XcBuzKLrZvnn5qCuqWbM69GdqgMftOLuoWv
	m+XlAK2kFvuxqDn9r6kfAIps8z5Nnc9Nu/tiSokUcAKSJZOjgC6AHccwTES7uJ4KFAiutfqxL5o
	UmUH9ixweiEEljwaPhPZ66ZvhcwS88z++/v+INo6sZxg7BsvaWn6R6/hYVjnJRG+sZOqgwV2uem
	9dkbA/Q/geTgTpVIBiFGbD6JI0HoSLpiAwWGt/+L9+jBK2zhwCqQrteDGDD87d1EBqcj2pmaoxa
	kkLVSWedxmarRA==
X-Google-Smtp-Source: AGHT+IH5SKfuRRMxVk4KXO0AP7735JMUypM+eJC7RgrLpkZ/NogrQBRjMgox27k+3YRDoq6vDto/Uw==
X-Received: by 2002:a05:6512:110e:b0:542:6d01:f55c with SMTP id 2adb3069b0e04-542845af81emr1003571e87.3.1736355181537;
        Wed, 08 Jan 2025 08:53:01 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238213c5sm5485112e87.171.2025.01.08.08.53.00
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 08:53:01 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3043e84c687so145741581fa.1
        for <linux-sunxi@lists.linux.dev>; Wed, 08 Jan 2025 08:53:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVh9iwyLJGf42aMyutKky6W30MBsmag4JXhX57Bj4vkQbtgfoH5MMgaPUgs0pQxoG06ZKb7gvKmaB4UfA==@lists.linux.dev
X-Received: by 2002:a05:651c:602:b0:300:3307:389d with SMTP id
 38308e7fff4ca-305f458e846mr7855991fa.19.1736355180052; Wed, 08 Jan 2025
 08:53:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250108164359.2609078-1-andre.przywara@arm.com>
In-Reply-To: <20250108164359.2609078-1-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 9 Jan 2025 00:52:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v66jTH+aiCHQyic0hYUWQ3wiZFa3a6f9U1NickAfZPizYA@mail.gmail.com>
X-Gm-Features: AbW1kvYf6FaWmHcSx5PlJ4_54WBtFGt_VFk4l8WJnSU8vd7BgjPLUbQr4KhZAEw
Message-ID: <CAGb2v66jTH+aiCHQyic0hYUWQ3wiZFa3a6f9U1NickAfZPizYA@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "mfd: axp20x: Allow multiple regulators"
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lee Jones <lee@kernel.org>, linux-sunxi@lists.linux.dev, 
	Chris Morgan <macroalpha82@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, Andrey Skvortsov <andrej.skvortzov@gmail.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 12:44=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> As Chris and Vasily reported, the attempt to support multiple AXP PMICs
> in one system [1] breaks some of the battery and charging functionality
> on devices with AXP PMICs. The reason is that the drivers now fail to get
> the correct IIO channel for the ADC component, as the current code seems
> to rely on the zero-based enumeration of the regulator devices.
> A fix is possible, but not trivial, as it requires some rework in the AXP
> MFD driver, which cannot be fully reviewed or tested in time for the
> 6.13 release.
>
> So revert this patch for now, to avoid regressions on battery powered
> devices. This patch was really only necessary for devices with two
> PMICs, support for which is not mainline yet anyway, so we don't lose
> any functionality.
>
> This reverts commit e37ec32188701efa01455b9be42a392adab06ce4.
>
> [1] https://lore.kernel.org/linux-sunxi/20241007001408.27249-4-andre.przy=
wara@arm.com/
>
> Reported-by: Chris Morgan <macroalpha82@gmail.com>
> Closes: https://lore.kernel.org/linux-sunxi/675489c1.050a0220.8d73f.6e90@=
mx.google.com/
> Reported-by: Vasily Khoruzhick <anarsoul@gmail.com>
> Closes: https://lore.kernel.org/linux-sunxi/CA+E=3DqVf8_9gn0y=3DmcdKXvj2P=
FoHT2eF+JN=3DCmtTNdRGaSnpgKg@mail.gmail.com/
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
> Hi,
>
> just replacing the old -1 with the respective macro name, as Lee asked
> for. Also adding tags to acknowledge the reporters.
> Lee, feel free to change the subject line if you think the "Revert" in
> there is not justified anymore.
>
> Cheers,
> Andre
>
> Changes v1 .. v2:
> - use proper name for the formely used -1 value
> - add Reported-by: tags
>
>  drivers/mfd/axp20x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 251465a656d09..bce85a58944ac 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -1445,7 +1445,7 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
>                 }
>         }
>
> -       ret =3D mfd_add_devices(axp20x->dev, PLATFORM_DEVID_AUTO, axp20x-=
>cells,
> +       ret =3D mfd_add_devices(axp20x->dev, PLATFORM_DEVID_NONE, axp20x-=
>cells,
>                               axp20x->nr_cells, NULL, 0, NULL);
>
>         if (ret) {
> --
> 2.25.1
>

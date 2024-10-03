Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A782619CD0B
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Oct 2024 15:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727968777; cv=none; b=bIssPMKREmJDe8JlUHYu1fmzTnxkiJsdyya/qBf62WRJW0r5ntLiyinl8DRLWArtsQ2sST0HE2M21SdYSe93jqyyZsOg9OnqaEXPrdCZKgqAB4CnLJ3O1czc0m7np/FSUScBgxCQj0UH3K0cCaYPL0m65pF8x03UR3aio/ZH2vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727968777; c=relaxed/simple;
	bh=qOBripUtAi6zPiMt73YB1Jwrl/ECFz0MdjfoZ5SWjhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6cWtJhEfDhJPGklNwbqnmIhxe2NfPiEulApJG6BVEUPLhBGfyT2vBPNCPpWM5WttPXvV4p6hVlS+QE7bqGc2hqTiiDgif+JO8p6JqOeHhXGPJI+IKtj3zfsh6F2yZFp9V7RIWEKyKmA8yk3qKg8YgSEr+MQYF1B7GG5kc60w/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5398e58ceebso1128845e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Oct 2024 08:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727968771; x=1728573571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EUoJLCJlNOrdcCBBrdtSB2Ow6qmvTKXbEuWR7svHuGY=;
        b=XJdZNr5q+h4aXwj+EQ6OP7fSkOpwZDTkV7ngqWoSNl8SUfvDkwT972tXAZkDQA7dNf
         ydHNxfB35OXQOB5PMglkvJcJXaBwOHQxWt42TvbSzCF90Rv+hPpERBDLh6SWcHu/LCzz
         W3He77xXrUe0CqwPRIbC3PN5ZSE4mjEA1UnBx4aUXB8An7vUNolvalrqZNo7FHFQS5s6
         FSNnNNYDo1OJXM8+3ZlOaCBsuk+J9mJyx/sBstvxsY2xmzIWB7oFg0ehVUVJa2h9g+J6
         luirA8uagIjlW+iNt2DzJfsjO0OdYK9/MpOzR7Tdn+TUdz0Wxtr4srYhig7noGDo/qSk
         +PHA==
X-Forwarded-Encrypted: i=1; AJvYcCWpy/7vx+qG+rxFBhBO/Z3Vde/q7mKL46uuQI17xqPae+5erE91KF1rnHDm6B8laNin/mwPu/uxX/1P8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHMaxDzXilLc+SMqwgdDWutWSavKKnpvZD42u/MeycOtsfXyXH
	y4dxZ4Q6LPFd3LeilnxRKEzFvbNJepWgnOP8OCCA3kheNQVLKzys9scW7b6WJcE=
X-Google-Smtp-Source: AGHT+IGX7kx11xX9wZUnNM4JLY0GZGxgO/qGwiFVfqwykvfxuHo4QUvCqyseJHnS9P3LXZi+n4a3Zw==
X-Received: by 2002:a05:6512:318e:b0:52c:ccb3:71f7 with SMTP id 2adb3069b0e04-539a6267fb4mr1409302e87.9.1727968770869;
        Thu, 03 Oct 2024 08:19:30 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539a82abb79sm200724e87.303.2024.10.03.08.19.30
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 08:19:30 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2facf00b0c7so20173441fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Oct 2024 08:19:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqkn3UTF1kfv83rw2oiH/K8WqqUEJEGhq8xJKE7g+nhkUX81epai5hcT+pWnM3ITgEjIBIN7NxsxOMUw==@lists.linux.dev
X-Received: by 2002:a2e:a552:0:b0:2f7:5900:1a37 with SMTP id
 38308e7fff4ca-2faea25332amr11916321fa.17.1727968770274; Thu, 03 Oct 2024
 08:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241003111444.543964-1-andre.przywara@arm.com> <20241003111444.543964-4-andre.przywara@arm.com>
In-Reply-To: <20241003111444.543964-4-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 3 Oct 2024 23:19:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v64c-KoCwzfXpPbyLtxgZbwoQ+e4uYAk7pcHCkrTRbfr3A@mail.gmail.com>
Message-ID: <CAGb2v64c-KoCwzfXpPbyLtxgZbwoQ+e4uYAk7pcHCkrTRbfr3A@mail.gmail.com>
Subject: Re: [PATCH 3/5] mfd: axp20x: Allow multiple regulators
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Martin Botka <martin.botka@somainline.org>, Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 7:15=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> At the moment trying to register a second AXP chip makes the probe fail,
> as some sysfs registration fails due to a duplicate name:
>
> ...
> [    3.688215] axp20x-i2c 0-0035: AXP20X driver loaded
> [    3.695610] axp20x-i2c 0-0036: AXP20x variant AXP323 found
> [    3.706151] sysfs: cannot create duplicate filename '/bus/platform/dev=
ices/axp20x-regulator'
> [    3.714718] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.0-rc=
1-00026-g50bf2e2c079d-dirty #192
> [    3.724020] Hardware name: Avaota A1 (DT)
> [    3.728029] Call trace:
> [    3.730477]  dump_backtrace+0x94/0xec
> [    3.734146]  show_stack+0x18/0x24
> [    3.737462]  dump_stack_lvl+0x80/0xf4
> [    3.741128]  dump_stack+0x18/0x24
> [    3.744444]  sysfs_warn_dup+0x64/0x80
> [    3.748109]  sysfs_do_create_link_sd+0xf0/0xf8
> [    3.752553]  sysfs_create_link+0x20/0x40
> [    3.756476]  bus_add_device+0x64/0x104
> [    3.760229]  device_add+0x310/0x760
> [    3.763717]  platform_device_add+0x10c/0x238
> [    3.767990]  mfd_add_device+0x4ec/0x5c8
> [    3.771829]  mfd_add_devices+0x88/0x11c
> [    3.775666]  axp20x_device_probe+0x70/0x184
> [    3.779851]  axp20x_i2c_probe+0x9c/0xd8
> ...
>
> This is because we use PLATFORM_DEVID_NONE for the mfd_add_devices()
> call, which would number the child devices in the same 0-based way, even
> for the second (or any other) instance.
>
> Use PLATFORM_DEVID_AUTO instead, which automatically assigns
> non-conflicting device numbers.

That's weird... I don't remember running into this when working on the A80,
which had two albeit different AXP chips. That was a long time ago though.

> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/mfd/axp20x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 5ceea359289f..bc08ae433260 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -1419,7 +1419,7 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
>                 }
>         }
>
> -       ret =3D mfd_add_devices(axp20x->dev, -1, axp20x->cells,
> +       ret =3D mfd_add_devices(axp20x->dev, PLATFORM_DEVID_AUTO, axp20x-=
>cells,
>                               axp20x->nr_cells, NULL, 0, NULL);
>
>         if (ret) {
> --
> 2.25.1
>

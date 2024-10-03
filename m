Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F9E19CD0B
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Oct 2024 15:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727968388; cv=none; b=gCdievPWe8TiwbpLr1b8GLmNZsFPXs7Gtwu55kpN6NsDzowjINQuA5Gv/xgnEsIwvLX5w9qvG3IeHlNmStSFkkoSenD0qf5Z0AlQ8naAKVtO3tNGBUegOjgEu/OK4WcC+6QeaWivod77s9uF37jso3BwczE3Aoa/ojfbxLF/En8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727968388; c=relaxed/simple;
	bh=dGlsxoZu8PtWpidPasr2wBeZc49hqi7PsXHUmZkFZy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5GbH/ZNLEBLo8Uogwc86rx0ySNaUbnSkKzKHX+a71Dl0GkAyGa9JxnMPLxZ0gLtFUCE6l7lUc+9JZ9ilHcbBz26KaXZ1Ff+dsozG9Kvhfnx+I8BvR9w/fNV2RUcKRKlHX/72gcX8SgS1O7npfgOO67IRF66D+5q3Jiju/q/lUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a1a22a7fa6so3693925ab.1
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Oct 2024 08:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727968384; x=1728573184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=itCr7VtHEe0udli0L/vyJJ6/QS8R3KvPPLhdxRcMv+g=;
        b=ebjNw5YNm7obMCkFZUAAmA2FxyNu5JT8b/qDhuk7wM60pkYHUzvCeaPVH9CL6mXJwx
         43FMnT8TNo19OaMW1fp448NIUl1DMqWcQEusOCN2gcpinB34LAHUISOKq7UPwZRwgihV
         MOMNEiv9SwuirdxHkA54K0r8pdv/OeU765tOwfExpzGldFko39z4U3MbkPSLXW4UWx4H
         jO5ay8kUcaUGqgsgQObU8KwDA5v/GdMhrgr6YKQqGxmnBppdncQ61WOD+TyY7GWphnxb
         Wlq1yyWwVrT36hPAjLTMRUxlFUZzsgSOQZg+txmEnXm9UxdwvjBHmwnsjty5w2gkt1GQ
         vCng==
X-Forwarded-Encrypted: i=1; AJvYcCWu9WfV7dRGrDPfT9Jk5ol7WmfmDeYvHgyOA5XhnavorsSmuMaWBbUBjAqwOH3Y4QcRiAJZk4qLOiZeeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPuWUpx5SpGeOou3MrWLlOfT8LiFwpL1d4qFbxDOSXUys5H7oM
	2SqKEav4kkyxYVaPELlJ/xioiYt7ctLWiO6jdNNxqC4IMLefY0MWviFWhaeA
X-Google-Smtp-Source: AGHT+IGRFAQlGz49CTOh4f8w9NivozqDQm+sO0Tjz4pV1rOQRJyTYo8L4Llqdrlfdj88/M/atwbMxQ==
X-Received: by 2002:a92:ca0b:0:b0:3a2:6d54:33df with SMTP id e9e14a558f8ab-3a36e22954amr26920605ab.4.1727968383747;
        Thu, 03 Oct 2024 08:13:03 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com. [209.85.166.51])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4db573adc6fsm249590173.26.2024.10.03.08.13.02
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 08:13:02 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-82aa7c3b498so34660439f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Oct 2024 08:13:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWe5trhP14yhsKZIANHnCPcNhMwlZkZyFhfdq9hWQt/o+Q7+zpOTqvf7D67mgi/z2TiaY+DOpR2m8qk0g==@lists.linux.dev
X-Received: by 2002:a05:6602:2d8d:b0:82a:185f:5940 with SMTP id
 ca18e2360f4ac-834e76d16e0mr293099539f.7.1727968382525; Thu, 03 Oct 2024
 08:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241003111444.543964-1-andre.przywara@arm.com> <20241003111444.543964-3-andre.przywara@arm.com>
In-Reply-To: <20241003111444.543964-3-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 3 Oct 2024 23:12:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v65jcxCYC7mess=4H9dz0gXk434tTyP_ATDvbrpdj_=aOQ@mail.gmail.com>
Message-ID: <CAGb2v65jcxCYC7mess=4H9dz0gXk434tTyP_ATDvbrpdj_=aOQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] mfd: axp20x: ensure relationship between IDs and
 model names
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
> At the moment there is an implicit relationship between the AXP model
> IDs and the order of the strings in the axp20x_model_names[] array.
> This is fragile, and makes adding IDs in the middle error prone.
>
> Make this relationship official by changing the ID type to the actual
> enum used, and using indexed initialisers for the string list.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/mfd/axp20x.c                 | 30 ++++++++++++++--------------
>  drivers/regulator/axp20x-regulator.c |  2 +-
>  include/linux/mfd/axp20x.h           |  2 +-
>  3 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 4051551757f2..5ceea359289f 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -34,20 +34,20 @@
>  #define AXP806_REG_ADDR_EXT_ADDR_SLAVE_MODE    BIT(4)
>
>  static const char * const axp20x_model_names[] =3D {
> -       "AXP152",
> -       "AXP192",
> -       "AXP202",
> -       "AXP209",
> -       "AXP221",
> -       "AXP223",
> -       "AXP288",
> -       "AXP313a",
> -       "AXP717",
> -       "AXP803",
> -       "AXP806",
> -       "AXP809",
> -       "AXP813",
> -       "AXP15060",
> +       [AXP152_ID] =3D "AXP152",
> +       [AXP192_ID] =3D "AXP192",
> +       [AXP202_ID] =3D "AXP202",
> +       [AXP209_ID] =3D "AXP209",
> +       [AXP221_ID] =3D "AXP221",
> +       [AXP223_ID] =3D "AXP223",
> +       [AXP288_ID] =3D "AXP288",
> +       [AXP313A_ID] =3D "AXP313a",
> +       [AXP717_ID] =3D "AXP717",
> +       [AXP803_ID] =3D "AXP803",
> +       [AXP806_ID] =3D "AXP806",
> +       [AXP809_ID] =3D "AXP809",
> +       [AXP813_ID] =3D "AXP813",
> +       [AXP15060_ID] =3D "AXP15060",
>  };
>
>  static const struct regmap_range axp152_writeable_ranges[] =3D {
> @@ -1345,7 +1345,7 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>                 axp20x->regmap_irq_chip =3D &axp15060_regmap_irq_chip;
>                 break;
>         default:
> -               dev_err(dev, "unsupported AXP20X ID %lu\n", axp20x->varia=
nt);
> +               dev_err(dev, "unsupported AXP20X ID %u\n", axp20x->varian=
t);
>                 return -EINVAL;
>         }
>
> diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp=
20x-regulator.c
> index a8e91d9d028b..3ba76dbd0fb9 100644
> --- a/drivers/regulator/axp20x-regulator.c
> +++ b/drivers/regulator/axp20x-regulator.c
> @@ -1597,7 +1597,7 @@ static int axp20x_regulator_probe(struct platform_d=
evice *pdev)
>                 nregulators =3D AXP15060_REG_ID_MAX;
>                 break;
>         default:
> -               dev_err(&pdev->dev, "Unsupported AXP variant: %ld\n",
> +               dev_err(&pdev->dev, "Unsupported AXP variant: %d\n",
>                         axp20x->variant);
>                 return -EINVAL;
>         }
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index f4dfc1871a95..79ecaaaa2070 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h
> @@ -959,7 +959,7 @@ struct axp20x_dev {
>         unsigned long                   irq_flags;
>         struct regmap                   *regmap;
>         struct regmap_irq_chip_data     *regmap_irqc;
> -       long                            variant;
> +       enum axp20x_variants            variant;
>         int                             nr_cells;
>         const struct mfd_cell           *cells;
>         const struct regmap_config      *regmap_cfg;
> --
> 2.25.1
>

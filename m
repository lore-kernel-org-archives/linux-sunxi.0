Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3AE82899
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Oct 2024 15:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727968932; cv=none; b=toKvD0EJ+2LKLymfoMl7GibNhlvEGTt7rpsU8uPLsV2+w6aCJL/qXBLEmA/PMtcpd5tLWUlpONcKeFG2PCWyCRUOuGOHt54RHKaY+Q70aw1IEXtaYm5F79S6kcVNS6Yvq5fDYthTl6l36TuTcR8mM4/nmqp72UWDRUAaqSBVZ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727968932; c=relaxed/simple;
	bh=ykGMWjUKIDhhhzJrM9GpYwxSH8y2AXPqMcCTCatD3zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gi6gSU6AnrxdpYhh35qOX8Q0Ihn8Oonz6krU9YpBbrKN7atm8ECkROaVKNeh317Wh/lQXIyABPJiKBr7SpzZ/yq+ikam/Mj7lW9sCbACNb+XzYCmfSiZ2LKoFm0Agt+MXPZjKnVkHr+N6Ol4GduTTn+BUTfIxGEYbDUFr7uTHhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3a3525ba6aaso3481035ab.2
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Oct 2024 08:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727968926; x=1728573726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n4LKO0jgH7DyX+MQ6doJC00PWEp4e1Pim8oJtlmMS+s=;
        b=FQaYu9JP8IC5k30SxrRvmImJgpegRfyRTiyhvdPEbR5RHPpxdydtxke0JTk+oarZqU
         hsXrt4JQ7BoPSrYkw8wvSi/bS/PVe2MPs8eOQ/Czmcq7xWcPh8HyA9CblVMWbZ4BnMe/
         ehPzw1omXSXYVMhmRtmXAXmxFgz+NeF7EBlUYDRD4e2T9fcfByEw0QnMN8R0LVO6Zn0+
         2ogjtubuie+NTZ9fuklnU7bmvbnrrXuJWrCQYQtKDo1I5kpKWeOGsA/IzU6L891OXsb6
         gFv7AOAEsWD1+yHhcWfdc5qeQ8N7onqydu+QOrB5p3o1nBJveZJvSlIKIhlNH4kk7dha
         uzmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPaU8bTS+/v87teb5jpasj93XHZ0bgaUhrN+Ik5HlPfNSuVqGOQHgO5DyzoCX17C9z0Z2LF/KfbAk1wQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YygkNrVTZO4zTd4zWQ707H/Q60I3mZL8En8eh/xh8vkePvjZwNR
	3+iYQYlozafvWmMDECGcksgbSVIfQE+/bsjnK5uBOW9ZxNBKDj9uSLoFsOeVLTs=
X-Google-Smtp-Source: AGHT+IGtfmn0vns0kPY/ppL5MRYictA4Kj65qagvrUio9qdm4g1Roa5dfAqe3QlbV2pMqF9qJQr1cA==
X-Received: by 2002:a05:6e02:1e03:b0:3a0:97df:997e with SMTP id e9e14a558f8ab-3a36592c2d4mr62161905ab.14.1727968925751;
        Thu, 03 Oct 2024 08:22:05 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com. [209.85.166.53])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a37199ff17sm2468765ab.81.2024.10.03.08.22.04
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 08:22:05 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-82aac438539so46777539f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Oct 2024 08:22:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAsF2qHvLKMo+ANvc6oSD9tNjVhZy9iji8GtqaKfsAzfIItutzsaID6YP2ZVdUh0tJpX3xCNanp8FQEg==@lists.linux.dev
X-Received: by 2002:a05:6602:29c4:b0:82c:ed3d:3a59 with SMTP id
 ca18e2360f4ac-834d84ba9fcmr818278039f.10.1727968924668; Thu, 03 Oct 2024
 08:22:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241003111444.543964-1-andre.przywara@arm.com> <20241003111444.543964-6-andre.przywara@arm.com>
In-Reply-To: <20241003111444.543964-6-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 3 Oct 2024 23:21:49 +0800
X-Gmail-Original-Message-ID: <CAGb2v64OYNUsfCAUnh2QEYec-AHWyugG+sXBc3XRCz3jtUrDmg@mail.gmail.com>
Message-ID: <CAGb2v64OYNUsfCAUnh2QEYec-AHWyugG+sXBc3XRCz3jtUrDmg@mail.gmail.com>
Subject: Re: [PATCH 5/5] regulator: axp20x: add support for the AXP323
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
> The X-Powers AXP323 is a very close sibling of the AXP313A. The only
> difference seems to be the ability to dual-phase the first two DC/DC
> converters.
>
> Place the new AXP323 ID next to the existing AXP313A checks, to let
> them share most code.
> The only difference is the poly-phase detection code, which gets
> extended to check the respective bit in a newly used register.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>


> ---
>  drivers/regulator/axp20x-regulator.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp=
20x-regulator.c
> index 3ba76dbd0fb9..e3cc59b82ea6 100644
> --- a/drivers/regulator/axp20x-regulator.c
> +++ b/drivers/regulator/axp20x-regulator.c
> @@ -1341,6 +1341,7 @@ static int axp20x_set_dcdc_freq(struct platform_dev=
ice *pdev, u32 dcdcfreq)
>                 step =3D 150;
>                 break;
>         case AXP313A_ID:
> +       case AXP323_ID:
>         case AXP717_ID:
>         case AXP15060_ID:
>                 /* The DCDC PWM frequency seems to be fixed to 3 MHz. */
> @@ -1527,6 +1528,15 @@ static bool axp20x_is_polyphase_slave(struct axp20=
x_dev *axp20x, int id)
>                 }
>                 break;
>
> +       case AXP323_ID:
> +               regmap_read(axp20x->regmap, AXP323_DCDC_MODE_CTRL2, &reg)=
;
> +
> +               switch (id) {
> +               case AXP313A_DCDC2:
> +                       return !!(reg & BIT(1));
> +               }
> +               break;
> +
>         default:
>                 return false;
>         }
> @@ -1565,6 +1575,7 @@ static int axp20x_regulator_probe(struct platform_d=
evice *pdev)
>                                                   "x-powers,drive-vbus-en=
");
>                 break;
>         case AXP313A_ID:
> +       case AXP323_ID:
>                 regulators =3D axp313a_regulators;
>                 nregulators =3D AXP313A_REG_ID_MAX;
>                 break;
> --
> 2.25.1
>

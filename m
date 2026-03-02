Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ABC3E5592
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Mar 2026 16:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469145; cv=none; b=OOdfVDfZn0Stjv63bKStFPKuMflHzn9Yg9ycX4IXNdtXtm/Hd/YqLuJY892cgb8BXD+LkBfHXbmSc+HHeSai2pt+qbjQExYyRlFo8C/73LQDPtLpT3WI2Rw55uu0dAbr0YgeBUaDIf1dZm+eZjLMTJX+qsMLNy/STROGDHaUcoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469145; c=relaxed/simple;
	bh=ZN7ZYA3vRUNHHbGnPhwCvGjNZJR0JyldjOBVcI9neHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQ8on0MrDQBPsqbLpNLk8emAhEIH9lNNKLouyAcBL2tWcR5bpAORdbOV4Y/6hdcucx8oNdB78ZirlpXzcnF8mrE/tDC01MPgQfLOgTCUVEFQjTBMyB2VS6KTCWHmi2LrFPIhcIIMoXi0xLrQloYP+sy1gm01rO0NtD/7BWIPnFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56a9076813bso1841601e0c.3
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Mar 2026 08:32:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772469143; x=1773073943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32KLibA2LnxuiBPJQhexbcq4h5vz7CZtFSoqgdy1YZE=;
        b=u0mNOWEQ2jftFHeCv/H/58YcjOvT9tzjy6dKjVSvVH6W9eAcdhRsMB//C2rx/xXcMn
         BJSstxkBt2TpWxL9sEfHBQvjAP2RUXcp0SeU8sVJ/hB8cfweoDXzEUKJN+ke/8+1r6PN
         vHkiaD9t0+LiR0cqorwvKDFlVzF4zHhDzT6ZJ1Y01kqNeyPPEV5tyMeJFO+SOWnrTiZk
         SVfQ1ArkqnY9GCjYoH1JE9PJQtR/N+VoQ4zW/tU54twyRQxrWhXUcEw+pOAEGCTGtP1X
         m9SPFgP+cOYKHYNNkenNI9+Z3wj8DguI8SCEenv/s7qiUhx6hgnICtfvVIs0zb1heYKX
         pyzw==
X-Forwarded-Encrypted: i=1; AJvYcCXAeVcpbAebb723o040Mcof7acEXU3K/4hzJNdVavGeDJtltUhp2Poh6Pc9glZlvg2IvVyYAn+StBwUsg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrHMkqVXhwBm6R3NZf6qXWEZuD80gBzEldW1zXbeloh6Oqe7eH
	yBqd5Q3ur2tK2RrD5tSPQp94QykckJPfopDHsnFG6C9HLJo1faiwMz3bMMPhCiTh
X-Gm-Gg: ATEYQzyqD9XNLgqy1bkZjzI2/YP2lC5a1udlaVkRbd3G8QktfPlpFluRXkLL81dVJOM
	lotjaI+nB1VlwhvImI/MQ7s2b3ybbtXg7VRRO1Rbv4XloJKcQMJEtFPgjTSvrolLBitjhGxKlZF
	SLSJfE1aXe9SyVZy8+RjaPOtkrkrIzOwhc+E7EKL17xKxeOwReOBOPh79tXvyQ7XcItEyP3L9aR
	6TJwqrtF/TGRIwI+MWpyjL+ONjUQQ08p1WES2jO3MS/N5pUvzrk+aSItG+QN9S7Qpt1DWLw9g49
	5w466deEh26VbbWvN4/09U/n1TRRH/hj+8zS/JiX3h0+0PyVyneYn5Ze60GMFxSBu0ZaWHtCYY1
	KdA3wzylrae6Gw7LlgrfPi98RWjlnR9ppLqstSoaNi3iueE255qswAhwdiaWvhlzAzh8DqGOmru
	fW8eifyDlAwymh6fsjKKSnw7+9vdvmp1XbH9Owru8Prd8HPG5PZisyOdqeOZny
X-Received: by 2002:a05:6122:791:b0:563:4a88:6eb0 with SMTP id 71dfb90a1353d-56aa0a4fbf8mr5357520e0c.5.1772469142622;
        Mon, 02 Mar 2026 08:32:22 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a920493f9sm16055321e0c.13.2026.03.02.08.32.21
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:32:22 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94dd687e040so1055778241.3
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Mar 2026 08:32:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWIPG8zHYXganPxx+YcVPf2Izt5mfQC4THL72DDexJX40nh3XoxzgMay7Ks2fz12UbpSCsk5bO8/A58TQ==@lists.linux.dev
X-Received: by 2002:a05:6102:a4c:b0:5ee:a1e5:6504 with SMTP id
 ada2fe7eead31-5ff3257ef76mr5247593137.36.1772469141709; Mon, 02 Mar 2026
 08:32:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com> <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 17:32:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-rdzLhOFEJYBXzCYX5jH2E1=ydGWKgNkD0Nqx-tGr4Q@mail.gmail.com>
X-Gm-Features: AaiRm53oB2X0Qg0vbG2fw10FsfcqVt_uYNXkS-NKRd6s-Lft2nvlJyc42VLB5T0
Message-ID: <CAMuHMdX-rdzLhOFEJYBXzCYX5jH2E1=ydGWKgNkD0Nqx-tGr4Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] soc: renesas: don't access of_root directly
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Mon, 23 Feb 2026 at 14:38, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> to retrieve the relevant information.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c

> @@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
>         const char *soc_id;
>         int ret;
>
> -       match = of_match_node(renesas_socs, of_root);
> +       struct device_node *root __free(device_node) = of_find_node_by_path("/");
> +       if (!root)
> +               return -ENOENT;
> +
> +       match = of_match_node(renesas_socs, root);
>         if (!match)
>                 return -ENODEV;
>

I still find it silly to add a call to of_find_node_by_path().
In your reply to my comment on v1, you said you don't want to add
another helper.

Currently we have two helpers in this area:
  1. of_machine_device_match(), which returns bool, and tells if a
     match is available,
  2. of_machine_get_match_data(), which returns the match data, if a
     match is available.
But there is no helper to return the actual match?
of_machine_device_match() would be fine, if it wouldn't cast the result
to bool...

As there is no cost (binary size-wise) in having the helper that returns
the match, too, I have sent a series[1] to do that. The last patch[2]
is an alternative to this patch, avoiding the need to add a call to
of_find_node_by_path().

[1] "[PATCH 0/7] of: Add and use of_machine_get_match() helper"
    https://lore.kernel.org/cover.1772468323.git.geert+renesas@glider.be
[2] "[PATCH 7/7] soc: renesas: Convert to of_machine_get_match()"
    https://lore.kernel.org/10876b30a8bdb7d1cfcc2f23fb859f2ffea335fe.1772468323.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

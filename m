Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2006680C0C
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Dec 2024 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734361216; cv=none; b=tBhDfF+WNizJ5SdNHgNgrUg10RnhJUZCDT6F7FPn80dRQ/egzO8p58vQDUgDgu8Uu8AjujyaA5/36+emoMB1u6ikaLqYKU4unT1gXhzKkg/QJgu447pCfKemBYIpjI+GpbDLSw6hEDEiOFxVrCUU+rGxY4xfHkMHTTR3VHzQkhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734361216; c=relaxed/simple;
	bh=a41nUJa4ONYXSXXPt/ME4HJAKjA6G6bIsSRXy/ekS8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l6xopH89SwdxXJhmsEy9FBtN8nRxuZiY3WfswdKW2P0LaoLdqtD0qw2mLdbH0ERB5a/jFY6wtoLoXrUbU3VXFoQMQ/wlz9J+QGJZsqd6jrAxANX1+T89bC0zCTXJ8eV78zEVJ5WS/BXj+s0E4wTaPsl97n8ctxM/E+oA346shXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so6016749e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Dec 2024 07:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734361210; x=1734966010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zW7bZzCvEG9vXH7hmhUpYlJcI+Z/kO6+zIFWocpGb5Q=;
        b=ktmvsAukktulc8hYJoXOcwMSe9QIJmVpo6dSoMGpcKzeAOTCWyzH3dLy0JOvPwtAVL
         AJNdOT/z8kC4JqArAOisWZnGak+a/UZ0AteV3mzkVmirDFk4vT/bZtROsrTWYnW8punM
         5lN5QTQ1jNXmPhpBw8vBH46lLl9/ZI8C8dKeqcf+JE1+FlaOYCFe5r9VpM35bPLGg8Or
         3GQCX9fY+ZaFPuHBy08kIsqL0xvzWEZXymm9Kr2rmtC2cDe/e+d6DtNkogsvLmKBZd20
         rmT9Y1DsBSdQi/5lyIIICb44QsK5GVhjuYS5PJ2HBRhN062DvjPK4lnrz5qZnn6ZULhy
         qQQw==
X-Forwarded-Encrypted: i=1; AJvYcCU14Gnu87hF5I8RMqCqyq0oWVztljvZE7L8HUhe5UvGwTFtqzGhsOAlP3Xoh0iazs4Rkm6Eq7AM3WRONg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwY8AjtiiZe+51aMEO4HBY7bDKQTwwNBEaUe5/36mDiiht7S1zi
	HR2AdZa/AszD3/wTU1EDZVl4RoXpGjmNPnYUU8x32HHb8GQs+1xZbEkx8CXZ
X-Gm-Gg: ASbGnctvXCNn+OMNNF0r2bC/zQAaWEzoa2pIs5BpqG18aF1C4cLSDtnxBWPhavHd2zK
	FLT4QE5uIg5yw+kfWbb0Qx6xAw2KqIVzmLwjJNk7noka7tjGSsBY6oYWJpnKDLUXfAZmWYSG3kq
	ITi4WP2YXbNKVGzQuKx31z4BgOHaLG/9Ng70hQWzw/M/m8jPttS+eLWxH6J8uXN1bqEIw753BhK
	iIaLQ7Bz72dxsysA7V1J2IrcSnDOM1Tc5kAO4b04OokqZm+pIAUm/zAKg6y6XNQ1Si6JnCEHGC4
	BEDKKru9ZfoqVg==
X-Google-Smtp-Source: AGHT+IFZGbeLyQKuHqRrH6DNuLc0WklQeoa49gof7ockO0dgaL94TFgTZYe7q55E9JwYHwCCHVhl7Q==
X-Received: by 2002:a05:6512:b94:b0:540:358d:d9b5 with SMTP id 2adb3069b0e04-540857ff9fbmr4587495e87.0.1734361210134;
        Mon, 16 Dec 2024 07:00:10 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120b9f553sm873822e87.50.2024.12.16.07.00.09
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 07:00:09 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3043e84c687so5226371fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Dec 2024 07:00:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkMDIzF+r/pADdtzDtvKjixXLBFcttV0IlCP3O9cB9EdWqhPccH1e0FEexMi8wVE2upf0+sj2wYLYl9A==@lists.linux.dev
X-Received: by 2002:a05:651c:2108:b0:302:3de5:b039 with SMTP id
 38308e7fff4ca-30254566a55mr47627831fa.8.1734361209666; Mon, 16 Dec 2024
 07:00:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241215221331.28461-1-andre.przywara@arm.com>
In-Reply-To: <20241215221331.28461-1-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 16 Dec 2024 22:59:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Csz+cWY=oCr7fFWCJoeF5jOXBvThOJYBTWkp7qbn24A@mail.gmail.com>
Message-ID: <CAGb2v64Csz+cWY=oCr7fFWCJoeF5jOXBvThOJYBTWkp7qbn24A@mail.gmail.com>
Subject: Re: [PATCH] power: pmic: sunxi: guard DCDC5 separately
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de, 
	linux-sunxi@lists.linux.dev, Leon Anavi <leon.anavi@konsulko.com>, lhristov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 6:14=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> So far all sunxi boards programming the DCDC1 power rail on the AXP PMIC
> also set the DCDC5 rail, so we could handle both with the same DCDC1
> guard.
> Some boards using the AXP313 will need to set DCDC1 now as well, and
> since the AXP313 only has three buck converters, there will be no DCDC5,
> so this trick is not going to work anymore.
>
> Don't try to be too clever, and just protect programming the two DCDC
> rails with two separate guards.
>
> This has the interesting side effect of fixing operation on A80 boards,
> using the AXP809 PMIC. Apparently programming DCDC5 right after DCDC1,
> but before the other three rails caused some glitch, which made the board
> hang during Linux boot, during the PSCI handler in U-Boot. Just keeping
> the old setup order (DCDC1,2,3,4,5) will make those boards boot to the
> Linux prompt again.
>
> Fixes: ffb02942fab024d4a9b6a ("sunxi: board: simplify early PMIC setup co=
nditions")
> Reported-by: Leon Anavi <leon.anavi@konsulko.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  board/sunxi/board.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> index 824c322a0dc..9c340908a96 100644
> --- a/board/sunxi/board.c
> +++ b/board/sunxi/board.c
> @@ -577,7 +577,6 @@ void sunxi_board_init(void)
>
>  #ifdef CONFIG_AXP_DCDC1_VOLT
>         power_failed |=3D axp_set_dcdc1(CONFIG_AXP_DCDC1_VOLT);
> -       power_failed |=3D axp_set_dcdc5(CONFIG_AXP_DCDC5_VOLT);
>  #endif
>  #ifdef CONFIG_AXP_DCDC2_VOLT
>         power_failed |=3D axp_set_dcdc2(CONFIG_AXP_DCDC2_VOLT);
> @@ -586,6 +585,9 @@ void sunxi_board_init(void)
>  #ifdef CONFIG_AXP_DCDC4_VOLT
>         power_failed |=3D axp_set_dcdc4(CONFIG_AXP_DCDC4_VOLT);
>  #endif
> +#ifdef CONFIG_AXP_DCDC5_VOLT
> +       power_failed |=3D axp_set_dcdc5(CONFIG_AXP_DCDC5_VOLT);
> +#endif
>
>  #ifdef CONFIG_AXP_ALDO1_VOLT
>         power_failed |=3D axp_set_aldo1(CONFIG_AXP_ALDO1_VOLT);
> --
> 2.46.2
>

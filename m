Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8093D16BE20
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Sep 2024 08:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725264417; cv=none; b=XzxIW4ZKv55W0vMHS1kYHRFK7QUpqhSggVEt6daUYy0OmQNFepLdw5lw3+fcq8SqzLotMa6AiI8ZlpF4rc8rA74fphgLngBqxsMP7HXAmi8vg/ND+jj2ufnO21266nMrDPCEqwcoyMAW7Ux33zACvsJ2RkEghwFb1wM2K6cscbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725264417; c=relaxed/simple;
	bh=Fp5/zQsmrQg7TztOZKRctcf+AhTIOoBVPb+GN7ko8AY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJ8Wg+q2fv6ggGXCPJpAAKL2EMRee3boNSX7Wz9w4BKx5dQ3N0FilQJ+lv6mZyzTKPS/AFyitcJNAHOJQzXUzUn5BdJvdHBaKF1O+rCquM0ohBQrHekNu0SZYFq8CzEjhwqUffoRyPgQbZgJHc/HP9UbAYPHEV7GsN9+KrSI7I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TVLXUMkU; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TVLXUMkU"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f50ca18a13so46174091fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Sep 2024 01:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725264414; x=1725869214; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fp5/zQsmrQg7TztOZKRctcf+AhTIOoBVPb+GN7ko8AY=;
        b=TVLXUMkUHEilD+e3gEXi8z9zlNAGzFFrgMgS4/SrtKREwzEmdST/a0Tc+z6xERAM6P
         Z4LtNgmcQ4cDLEEZvjPMZJPjQGGN5AP2fnes5k12VKX9NOxZxmQo45/IyJ/gnC94aTiD
         0RUgSe++kxUY4eASB+evwkB9m3sBNTHZ7K8+nAP0/n/jXHvQqaeKBzmMJ0TGekfdGScD
         fBdFPOtMpxVJgaIif0lkzpdnQDb3S4UlDiQgODIbSO4RaX5D+UL90pPjDRDrHwa5JWPf
         BM0uKOcf2rsbAL6tMG/Gsh9uovLOKiqRKW85IIX6PF6LAMP2vptofqY3q+H3aGZSn3kI
         TZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725264414; x=1725869214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fp5/zQsmrQg7TztOZKRctcf+AhTIOoBVPb+GN7ko8AY=;
        b=Uy9LkTUt1qwQki9wloAq1PsZ1Z5l4P6YfKHEKBL5g2QnQtKZJ6NsZ5jyl1eIh2aC/4
         iVt0GA0u9vhcP+jQlDrdaM54CtC1n8Zun38nzh979S3LFf7Wo2JQo1e2uBXK7CJP9kUX
         sdIBtR5/W2OaLKty/WOnvycmLqoIlMxHLmurzSG9LVmkq6V22tS1m9dKHxFnb4MJwBwh
         qqhhqCIPmLSIL6UEwiZqyW7QRQAzUUqFwqSBZwdRg/HCvrDR3XmJz9IMMsQf1tIoR3zB
         nCE5k9R4qDomalIpnWCGS7mR/v6UN2HMq6csPFJ1K5qTy86Ucr8asGhg5nam5JVlUTB3
         BaRg==
X-Forwarded-Encrypted: i=1; AJvYcCWA0pwuhf3xKDPowgymQ73VmgLBt/3RuaPuXEdPGWsXmdTVAplK/XjRCLTlbWRMnuamSKb1xSFEnRRbnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyM/bAfsDVk2/6eYCyuzfgZpwwHcrlu4v67tcd2LXpZTwe/A4BM
	xM9AO+G0toRmcFHx/uGd/ZpGaGboaoJ5VfKWxNVYH/nToU1wJRDlW043R+2lWO8FNrVVGWN/B6X
	3cFf9cAS3akQo4hTVw0saymLpbnSUvHrz9+lQnQ==
X-Google-Smtp-Source: AGHT+IF4P8ui/j6LwDmVgLebzGM0J9kbwtfhbveDHdpWZlQv2O/gT+1IzNGgnwXiG1DtBB1NINJJMQUuzvVqS4VTZaA=
X-Received: by 2002:a2e:be8a:0:b0:2f1:599e:bdd6 with SMTP id
 38308e7fff4ca-2f6103a0b89mr93767261fa.12.1725264412924; Mon, 02 Sep 2024
 01:06:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240829064737.16169-1-wangjianzheng@vivo.com>
In-Reply-To: <20240829064737.16169-1-wangjianzheng@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Sep 2024 10:06:41 +0200
Message-ID: <CACRpkdao3pSp4H0Nrr3rBbF4NbBw=ePxrgBYwNOTecpxSqhNhA@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Use devm_clk_get_enabled() helpers
To: Wang Jianzheng <wangjianzheng@vivo.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 8:48=E2=80=AFAM Wang Jianzheng <wangjianzheng@vivo.=
com> wrote:

> sunxi sunxi_pinctrl_init_with_variant get, enable clk and
> deinit_device disable and unprepare it.
>
> This simplifes the code and avoids the calls to
> clk_disable_unprepare().
>
> Signed-off-by: Wang Jianzheng <wangjianzheng@vivo.com>

Patch applied.

Yours,
Linus Walleij

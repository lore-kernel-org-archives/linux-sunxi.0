Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3092F7ADE
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Dec 2025 12:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766318703; cv=none; b=agV4n9jocroOkazwwZiOiILbB4s6hS6WtJVkQd+Tyf1cMyKhYSuuCFDaFFZnyV31vqLy3JmZt0/iygtAK0V/yB/9D9/rkm6oWS864EBQY4gFC8X+u24LE3Cn+yNRJ4mE8CbuGE80FAQwV2jN8kHY2yFH67ax5O4vlMMeXQmoXEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766318703; c=relaxed/simple;
	bh=QX9zjOg+I9wGSrUaXshubFFf08J1rzDDMMt27c7QHc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bf1dwoVCHS7xT8w1rzRF7L2vb2Blfq6I01uLIcIrcslQwD5dyBqFdtKezzPjWeIzC38uTJAnsXxHWAIdfUj/bAz4wjbj3PLYLeYmpa/1Nfr9lhEdyyM8pcXC+KiV+VORnNoAPDMvqIK105K1LQ2P2fX9vU5s6BogVsO/xN0PMlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJAeWNH5; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJAeWNH5"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64b83949fdaso3434794a12.2
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Dec 2025 04:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766318700; x=1766923500; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jf7ROTwiax1oCNeYfMun65vgngFEmp831IXo7tBZOXk=;
        b=JJAeWNH59yJNvj15JJ7Vw5hrNurECLqOiv82glgPTU2DdwLuUnT6K+i0oQfWJmBdyQ
         vZWZNztJgtzTzU17eOEVTeTZ/8EMIr1WP4osUxUtsxUy7Oo37kN4/t5xxz0+JgH9+CWa
         B3nJRieigbmb/7K7KEHgT/WqOkAgkBeg+n4VZKhTy3FegR8mpRTA0Z2x381xaxiUB0HO
         89YCEniYpfysZNuTqa9AaNwkYI/nCRRI9kexAKoAQXW82rTVkc4h8hNOkj9Ol3BfpUlA
         hoWNbiC74Fk0BaMsDlglwj8gfpCY/0oOTPzsBu+qjXMr5SSRV2nWvJbQlPXbJdFfmAbE
         jpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766318700; x=1766923500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jf7ROTwiax1oCNeYfMun65vgngFEmp831IXo7tBZOXk=;
        b=VTf2oA4E4FZ+zZeOEGzw+xVgidg1BjfL2t8R6i3Xpi7c0RXJy1oz49w/1Vd9zm036S
         uUrJSIx8EpV5FcM1oVwTp6zJ79P04Q0jVfhs0Xfxgzxrt35WqWDfapouaohcZYPpbUHB
         IZtO8icix12dTb7UU70ux0K+5eJySBU/uyYKINgBg4vWoP1TAJ8JjXVe+XtUjZ70HBWL
         TPSB+HZzsqXml9PrNfnp2OhLztNX4iPz0Z+V+u0z0C6v6QGEQWjRWK6gDr8M0BJXGSi0
         jHyCqlVGQnj8dtLUHnlqMf9doT5xjDNAWyHCZG1cxbmAy8JDO5hayaZsa1Y8d87fKxWK
         C39A==
X-Forwarded-Encrypted: i=1; AJvYcCVnGzZJbXYUZukzeDbuP/H9l0V+RSmh3rfCaX5CF3NUDNarT2D1a5W4K5/6527NjWuWZ0oQjqNGvpbGHw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDI3MXa2IQ93DLZwXuqEfXvNdCyWe6fyFI2Fi22J37nrBQicqi
	BbJqfDKoo09b72hmE2/oJ+dfc1t/O7JvzeNRXWzDa1VVESId8JerhCVqvt+CqCkB4WL+Ks6hkHa
	fzTFuWhVKKXDM+V0dTe6Xh9ngqgj2B6HbxErl
X-Gm-Gg: AY/fxX5f7FySr+XsiQsDM83De4vR9rmGGewM/sGsp2tXqidzdt+TBHLoBESDEvANpU7
	ITFSOpAdG5JrXbloKs/IP+ilk3NpP64t2T+VXq2gKZZisxnw87NBagvV/Mqil4icV8PijWjaNHM
	uHlmWTQ81w5yLic8eEXmXImUrjJyb6we39Quln6/SRevlYF5Ey5ldMc5UkN6zNEHJtUobTHM4pI
	KGGVzjT4SaY16AFIYPYaVafbBur0o5QQ0uDccbqs4ZCczx0gqswZBZkvtN+rcx3XRhhgmw=
X-Google-Smtp-Source: AGHT+IHoJaiyK7NHuL8X9Mqi+S2jjmKKHkMhZq0PzqpQUxDAg0sj6lptadYvboJ5goRPamvE+NfdeX2YdZdUNM/cBn8=
X-Received: by 2002:a05:6402:5194:b0:640:a50b:609 with SMTP id
 4fb4d7f45d1cf-64b8ec6c59emr6953455a12.16.1766318700350; Sun, 21 Dec 2025
 04:05:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251221035715.1722584-1-wens@kernel.org>
In-Reply-To: <20251221035715.1722584-1-wens@kernel.org>
From: Code Kipper <codekipper@gmail.com>
Date: Sun, 21 Dec 2025 13:04:48 +0100
X-Gm-Features: AQt7F2rsE8tgKwxlCN8K-0sf04wdCUeFm-SzYtd7-Ga0Vv4H9rY1FkQekuM53ls
Message-ID: <CAEKpxBnaScxoCGkhwUhnnwb7sO-sw6hEasCZ_RWWydRfyPTXdQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sun4i-spdif: Add missing kerneldoc fields for sun4i_spdif_quirks
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
	linux-sound@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 21 Dec 2025 at 04:58, Chen-Yu Tsai <wens@kernel.org> wrote:
>
> When sun4i_spdif_quirks was recently expanded, the kerneldoc covering
> the structure was not expanded to match. This ends up causing a warning
> when the documents are built.
>
> Add the missing fields.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501311953.0Ox9CW5w-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202503060947.QKUUR62l-lkp@intel.com/
> Fixes: 0a2319308de8 ("ASoC: sun4i-spdif: Add clock multiplier settings")
> Fixes: 4a5ac6cd05a7 ("ASoC: sun4i-spdif: Support SPDIF output on A523 family")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
Hi Wens,
thanks for fixing this up.
Reviewed-by: Marcus Cooper <codekipper@gmail.com>
BR,
CK
> ---
>  sound/soc/sunxi/sun4i-spdif.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
> index 2e7ac8ab71bb..1e755a716c63 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -171,6 +171,8 @@
>   * @reg_dac_txdata: TX FIFO offset for DMA config.
>   * @has_reset: SoC needs reset deasserted.
>   * @val_fctl_ftx: TX FIFO flush bitmask.
> + * @mclk_multiplier: ratio of internal MCLK divider
> + * @tx_clk_name: name of TX module clock if split clock design
>   */
>  struct sun4i_spdif_quirks {
>         unsigned int reg_dac_txdata;
> --
> 2.47.3
>
>

<http://www.avg.com/email-signature?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
Virus-free.www.avg.com
<http://www.avg.com/email-signature?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
<#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>

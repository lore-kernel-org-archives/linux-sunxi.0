Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEDB26ED3D
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 19:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768851204; cv=none; b=XTazkD31b4X2S7ySlOOZ4cu9wOPs5ZxEgaxC4iBG/2NOn/S4FaBL4PoJNdrD2b+eiquUTyUKkj4v/YWqH4UYymxqBtX95sVh5eclv6P8e+xciRpeKZQ3RbFgP1AxT1DBTxtxrZamARnHv6uHa4N2BIrthLC0sZTjB5yVHF6J79w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768851204; c=relaxed/simple;
	bh=6w5YfztAxp+kt70NlhcKY/Kkm11Las2qp371F9dYbyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bq64SOBu60s6Imgd0/KBZWktJUCys3J20TGn2vhcQbtoQDt9g/sfIOqWhUdpe8P7FTuBInfmCKSKpCm2AZZg9x8+cZPHpBmhbekFMIZkBWOFTkQTUHE+cL/wgeUlTRxQqnD6a7yVNNcgwqPtKwcLwSiLVAtlR6l1B5Fh973MVEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-88a2e3bd3cdso46549476d6.0
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 11:33:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768851202; x=1769456002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y1wTxdZLJ7XhSQYYR0Ku2EXGP2C5XG02vKe6+mSL78=;
        b=IVVKKJWdPdSFLU0EgAZ9lh7lB4by8vNymq29q/f9CEmVCnhw0h4eHlYccJ50qJi4+n
         AFQtCFsSB+iyz9BUChQ70dsZT4fkr1PotfSTL4aMOP/4DEcIFpSEaJzxycg+fHTmC3dT
         MYfZVhW6OhJ1ETohmZaCJkZhc5/mZKYt6Pocce8IV0LWfHPQf44rUhhmca4DdEfVkk5/
         oleqFPTJfd4XQc16JLO/hy6hB6N3D3q1R6LvmSU/mzL6LOAHBMLKk71z0k9ww5ThlDQt
         0hIKPZc+CzPlkqnmFSD4nfPRMjc4GZRIqJbSxepK2QkVfwh9sZw2UiwD6p4aOgnPhH9I
         1KJw==
X-Forwarded-Encrypted: i=1; AJvYcCXP4UAfLcfFQLYcuey2qp5ss8oDKMCWHIUtJWlxFA1mpW0epazVM/uGfAHJ7w6XecugnObyhQIPvme9Yw==@lists.linux.dev
X-Gm-Message-State: AOJu0YybnOks/rGpUxqIBtV/hBRxlEcdC/ycUO6rDnjHnQWSbL1UjhLj
	ecd3j9qy+rOiziphj3+/k1k8rAzCq9kxmUXjk5NKLICLR1g5P7qxrcLyVpAMApl8
X-Gm-Gg: AZuq6aJ2oEmI5PE4/C1O17sI1cnY8nwJcRoow9bSz0bYu+tGWtcqxBwvNYzrJ9R+47/
	r2pIZR8UowXlXf+eAHdWYSW+pfIX+Ca078MlT6ZXWbEWTAuPhfcksKTYWh9iCiJ/aQyOkbsyXX/
	9LdN7oJk92rTsTCQX06y79zdLW4PEzk6uyO/XW9YFrDD7AOD3+jyGn6Hrtx7oaoPWMfsc7XP3o1
	uHUE1nEgHIBVekmQERx3cJylwNjFUpmTTA+7bisinM2fxWehb/UGxGFac/hM4wffLMFNeopw2De
	12OCcZZN0u38C3wCf8KO8zGNCJbPzPEPH94eR9jIt/f5E1K1ad2sK9F9yf98sEc46PAWiLGh2lO
	yIUXAP0lS73/n0f4NhDKAAOh7BzDXGfwZWX7LaJZHIPT0KtjMhPkcj6LWFpc5oCbqNwYvQRupvy
	PFRd0i1BFZbm7injmYXtnFp9MbjpyL8pjVj744+RgDkigch4mB7AcVewWkmqw=
X-Received: by 2002:a05:6214:19ca:b0:888:6227:3e77 with SMTP id 6a1803df08f44-89389f833c1mr208179386d6.4.1768851202285;
        Mon, 19 Jan 2026 11:33:22 -0800 (PST)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e5e526dsm89624676d6.12.2026.01.19.11.33.22
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:33:22 -0800 (PST)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-888bd3bd639so54272206d6.1
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 11:33:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1d47v5ez84x7mr2O0i8evWG6ljcBH6JGw9vcaAvNRc3tEdFSRbsdDEXYGFIkB12wvmRpwmNKjG07m/w==@lists.linux.dev
X-Received: by 2002:a05:6102:3e96:b0:5ef:b32c:dff8 with SMTP id
 ada2fe7eead31-5f1923fb2c1mr5826988137.5.1768850738083; Mon, 19 Jan 2026
 11:25:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-7-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-7-32a0fa9a78b4@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 20:25:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU56p9jH8OZ5bpwKq8Q31C-8X85YAjiXZm8amYdo+Xotw@mail.gmail.com>
X-Gm-Features: AZwV_QjRSaQ_qXyXNZN9OqtIjEIE6rAZwNcvdO7jDgxqMH0vtYkLnv2_hmzs9Y4
Message-ID: <CAMuHMdU56p9jH8OZ5bpwKq8Q31C-8X85YAjiXZm8amYdo+Xotw@mail.gmail.com>
Subject: Re: [PATCH 7/8] soc: renesas: don't access of_root directly
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Mon, 19 Jan 2026 at 11:40, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> to retrieve the relevant information.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c
> @@ -6,6 +6,7 @@
>   */
>
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
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

I am not so fond of these of_find_node_by_path("/") + something replacements.
What about adding an of_match_root() helper?

However, in the previous patch you used a different strategy:

-       if (!of_match_node(imx8_soc_match, of_root))
+       if (!of_machine_device_match(imx8_soc_match))

>         if (!match)
>                 return -ENODEV;
>
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

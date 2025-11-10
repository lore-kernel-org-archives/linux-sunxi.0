Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D572FE06B
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Nov 2025 09:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762765902; cv=none; b=GJ9B9q1T3iKyOOEI22E0+rZgzfGrXzqMp+csc2FfiIwi+ph7T9WPqHUIbrY2iYF2+vAtJ0OPuzIzKKfFvAhPUFROlwcpflyqUrNltYokf6pbeiechzp0JWw+xwODdMWYHXi2+d4Mu7eM+AjXhgsuf2gYyzOtgNfd2VFzSjoY0yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762765902; c=relaxed/simple;
	bh=iMmeLUV3xBgFjt2Cqbl9hMdgFQ6BlMWa/0ymtrQbpCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hIf2+Y+zRFuWhNR0GPz3ammtDVe7R0civTB+wSE9kFXKf+Mm0u82qPCcp6xtC+Vejo5g6mvrcsMJiz9BUg31osUWD8uDJkkytRAc804202Pbbyt2pASNv2/IaC2WVmGADzJX31dTGk7Ae2kcuOJ2J3n41gF8hPPBV5HH/CHlCM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-656b4881f55so1125659eaf.2
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Nov 2025 01:11:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762765898; x=1763370698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZFprYnk3afJ7bXwWWifURut5yD9UujyFxRDAYwHR2A=;
        b=NonbSDvpkw7golXC5sOA0nTxxIvrn+bjpZ4OfOcaBxv/mur2lWbSGPed7c77cThh/k
         hVfIOOHIFbs6dxSqNABWciHD8Npqvqaajl2bOI8yFtIxdeVYAFAdAECBPGUMnBx5//W0
         9M40Pda8rFVTSmkc40ipZoOBtrN+ubHhV/WwtTVqXt96Em/Mzm01s1MPfh0p1yYbbnk+
         NG4eaW12bnfXHZ4mQoh254z6mxtZuugS5oAPgBV87wc26wtwepPgZDPtZAsATpBEciOg
         eSKvB1bD87+v81gmh/KdCuJeB1QXu6lHMeJe65K9GyHraBei4U5rugtNURM+gBlejCDE
         kE5g==
X-Forwarded-Encrypted: i=1; AJvYcCVUEsZdBwOqkwPsPSdljUHBp9iEzpZWGkKybdMzyuhqATrvid9M6YVcJBzlAitaxcMehEYLKCanBDbNyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCy14XAN1uYPImm20zVEuNeU3IRhSSo3YNnbigbC1G/bwQvP0k
	fD/dNP0khUjAwcDgkaePfBMYYBogftGw8XCCQesEuOHKg4MgEHUiBi9AucBJZDgg
X-Gm-Gg: ASbGncu6/y/gcpAYDbUenPJLiphph4W0ukGzjOwnNWLr6UhMvxYAd3xaTYlkJS93/Zn
	lmFyH5NU0N5h2ys2D6UcIdJ7KCkawIYoC83YzPtz/oWdJgWrUrwaznbatmyvIR0ru4IU6imPnQ9
	+yNb2bUQoKxtbrzZC3NVI1Ft58bQuah/wxs5+MZ6VTKM+FFlIGTwT3tzlaELph0AbAZlhpwviHE
	XUxzqgGjDDWlmrRaLEzhwEYUZX+0TWm1/XfIUD0bN3YuE8SdIlV2JEdlg/Quk6ZwJFiUY19NS6l
	89DYAk3U8I6bkW0f1UzsURakum60Brkp7I/jaVaCEo2hb4xGnAuI4oN6DGSvU0S9d1h85/im9rR
	sT5Sr4B6Gxvn2ZM643PaS20sWzvphxpf0FGm62L2qQsp+tMcQHt4EuZtAKkIlSw1QVA3sYRwe00
	slMGuMku78JF0nu3EGELS0oKL+tf8YsQp1cg+63EB+CbekNea7jfN4
X-Google-Smtp-Source: AGHT+IH8E4nVObPlb1KK0tFi1Uzp496qAqYT5ZQBBsqzsdQ68X6JwJ5VcWsQNCbE5EIg/U+UO9mgtQ==
X-Received: by 2002:a05:6820:2905:b0:63e:effa:86f5 with SMTP id 006d021491bc7-656d8eb8572mr3799284eaf.7.1762765898291;
        Mon, 10 Nov 2025 01:11:38 -0800 (PST)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-656d1fef709sm4109179eaf.0.2025.11.10.01.11.37
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 01:11:37 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7c681a8aecdso1463904a34.1
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Nov 2025 01:11:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKuYLHTVia3tNx42rC9su2PpFUwyS/JeesRrIOSylFgQbFOyTJdbUliY62H13f5eupRBnkbgLNFmmWGg==@lists.linux.dev
X-Received: by 2002:a05:6102:c54:b0:5db:c9cd:673d with SMTP id
 ada2fe7eead31-5ddc4751f8bmr2299299137.26.1762765446858; Mon, 10 Nov 2025
 01:04:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1762588494.git.gaohan@iscas.ac.cn> <bc141425b71f0cfc8f3ef0a3c6d08104fde1281f.1762588494.git.gaohan@iscas.ac.cn>
In-Reply-To: <bc141425b71f0cfc8f3ef0a3c6d08104fde1281f.1762588494.git.gaohan@iscas.ac.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 10:03:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtAmM6MySzaUZZMZLY2z_99Pb-zcvyQd+q5-NS3A=c_Q@mail.gmail.com>
X-Gm-Features: AWmQ_blbgQuyL2K-QWPxMEybBZ_lWHdEHYJOPJXLh-zobJqSsJnJFWv08QlcdnY
Message-ID: <CAMuHMdVtAmM6MySzaUZZMZLY2z_99Pb-zcvyQd+q5-NS3A=c_Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: defconfig: enable SUNXI_XUANTIE and SUNXI_ANDES
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Yixun Lan <dlan@gentoo.org>, Drew Fustini <fustini@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Guodong Xu <guodong@riscstar.com>, 
	Haylen Chu <heylenay@4d2.org>, Joel Stanley <joel@jms.id.au>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Han Gao <rabenda.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Gaohan,

On Sat, 8 Nov 2025 at 09:21, <gaohan@iscas.ac.cn> wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
>
> These options need to be enabled to prepare for v821/v861/v881.
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Thanks for your patch!

> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -29,6 +29,8 @@ CONFIG_ARCH_SOPHGO=y
>  CONFIG_ARCH_SPACEMIT=y
>  CONFIG_SOC_STARFIVE=y
>  CONFIG_ARCH_SUNXI=y
> +CONFIG_ARCH_SUNXI_XUANTIE=y
> +CONFIG_ARCH_SUNXI_ANDES=y
>  CONFIG_ARCH_THEAD=y
>  CONFIG_ARCH_VIRT=y
>  CONFIG_ARCH_CANAAN=y

Other subarchs handle this with "default y" in drivers/soc/*/Kconfig.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

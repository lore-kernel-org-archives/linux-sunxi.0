Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2607910790
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Mar 2023 20:59:36 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id h8so15480476plf.10
        for <linux-sunxi@lists.linux.dev>; Tue, 07 Mar 2023 12:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678222775;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6atF6I2q0Ii8LJH3Gz8PsiaDUZKWNvxsL7EGNgfsZ8=;
        b=17PlGSKbkKuIupnjF7zLginu7kJrESk+P/cZNJX3rRw0zF5jTVklMTT4oR5QGRJVM7
         td0ySlYq+69ZpSgNbAzR6FlBEXGLj2Nis9SADR+8/t3oWYFVdd1c8s8Eyy+n25AsiJOt
         CiC+MRleb+/J3bbZRtBB3/bmGXFd/un/5H3hKP1sq+a2g1SiQrHa54iR/iizzfYy75st
         ZSCa1KDT9CGoTh5cv/Lswq88zQ3lR9cBRvLTJhT5+JJq/gsHU8khfZp8LLNGcTMCMeQl
         g0KFdVBvW8oyUCRSU+kvddY3z0TLf28jI0RrkaJcNvizuIkpYAEfriNVf7GtZNbClPEv
         WPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678222775;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6atF6I2q0Ii8LJH3Gz8PsiaDUZKWNvxsL7EGNgfsZ8=;
        b=RiDf24l73HV5P6ODHbVG4UhWtKP9WhR9KfZuVgZavAWA7+Kv7ac2sc3Lzjy52M18st
         AYU9+Wv45Uejvg6xsP8yb8mGzvdMGIVD+z/8Jdtat6iYOsAqYowrOqBC9xE1GAM/xGVp
         CQUSgAyEHUmQAau1ni8D01/+YXfgLP90pu+Ca+DxDzF6WXYSnRc2ADHO1GJlUc2/IXej
         mlUpa/stg4JsX/sxmdR66VAcfDaljxLVsVD0bTXbYI8Ndn4kXmuHNFyrXTmcG9IdowHG
         Js3lG9eaWxaGJmppXRKxAfVauIZwRnQN4OPK5RVRJS7kw/EOy9TG2oC/ex/ZHSBmBaLJ
         FYMw==
X-Gm-Message-State: AO0yUKWEB7m01a9oVj+ujh+BqN//kx927ygXJJBVOKkpyBU6LJidP4Ux
	2HJQRjwMYh99LJ3nDvxRmTBCSw==
X-Google-Smtp-Source: AK7set8gIjw0BxRnruPT5teFvlmXm/ZFQq6QpH299KEvyKIMUvG5/5R6imaZgBOnNpMXCYoLV8qPeA==
X-Received: by 2002:a17:902:c94e:b0:19a:ae30:3a42 with SMTP id i14-20020a170902c94e00b0019aae303a42mr17281637pla.21.1678222775335;
        Tue, 07 Mar 2023 12:59:35 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id ke15-20020a170903340f00b0019aaba5c90bsm8828902plb.84.2023.03.07.12.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 12:59:34 -0800 (PST)
Date: Tue, 07 Mar 2023 12:59:34 -0800 (PST)
X-Google-Original-Date: Tue, 07 Mar 2023 12:58:37 PST (-0800)
Subject:     Re: [PATCH 1/4] dts: add riscv include prefix link
In-Reply-To: <20230106010155.26868-2-andre.przywara@arm.com>
CC: samuel@sholland.org, jernej.skrabec@gmail.com, wens@csie.org, robh+dt@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, uwu@icenowy.me, szemzo.andras@gmail.com, fabien.poussin@gmail.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-arm-kernel@lists.infradead.org,
  devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, frowand.list@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andre.przywara@arm.com
Message-ID: <mhng-6efe8a4c-7234-4324-8861-b4f1ff028ec2@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 05 Jan 2023 17:01:52 PST (-0800), andre.przywara@arm.com wrote:
> The Allwinner D1/D1s SoCs (with a RISC-V core) use an (almost?) identical
> die as their R528/T113-s siblings with ARM Cortex-A7 cores.
>
> To allow sharing the basic SoC .dtsi files across those two
> architectures as well, introduce a symlink to the RISC-V DT directory.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  scripts/dtc/include-prefixes/riscv | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 120000 scripts/dtc/include-prefixes/riscv
>
> diff --git a/scripts/dtc/include-prefixes/riscv b/scripts/dtc/include-prefixes/riscv
> new file mode 120000
> index 0000000000000..2025094189380
> --- /dev/null
> +++ b/scripts/dtc/include-prefixes/riscv
> @@ -0,0 +1 @@
> +../../../arch/riscv/boot/dts
> \ No newline at end of file

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

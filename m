Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DF21FB3
	for <linux-sunxi@lists.linux.dev>; Fri,  5 May 2023 13:27:20 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-50bc5197d33so3389715a12.1
        for <linux-sunxi@lists.linux.dev>; Fri, 05 May 2023 06:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683293239; x=1685885239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pJVTeItn3/q+rs4Fp3PPs4uhLe3EOiwtZ3p5vx2OZsc=;
        b=pW1eSFQtUOf4qd5Tqc4nNA0Lxc0orupxla+piV27edUUubj0zCl0YBkqsHBTbF1tz/
         shZdBzRzJe/A/ESNBMVAqzGsJu/AzM2GR7Vme5pGfkRQ33GFyXbqkfr05hDtF3lluygb
         ob7DwNWNnLG1srjhhp2cOse/kn/5/0QBVA/eFLxiMKNFwzbiJYDT+3WpcqvXcBxuTODL
         m01ijHjxSezLk8GFHifw9arl0IJDzEWpb1C+SCMXboqI3V4VctTKfd4WAkkgPn+4ipKV
         FHoUO3GseDFID+qZdDBuoxD78K+IAzlmeAvEnGsCIzaBUyzFyLSG884H+VKhqF8UIylS
         LQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683293239; x=1685885239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJVTeItn3/q+rs4Fp3PPs4uhLe3EOiwtZ3p5vx2OZsc=;
        b=NsaPCYz7SjEPhDmWOPv4k/+b1ozDGLYiYvAC1boHoFBlmnh+sCDgxfYXKUdJxvVKPh
         zLloHEwh3mfzQCurs7UIqyGjgnCq4O7oirGCgyH8DxIbu9SdvmJla68TDFyyTJL+OxHt
         KyaFnxACo5UmZjulCSVkR5juZoQF/xQBT7yRcvDJBO+Flz0Sy8wOScZOvxJml4hS9krI
         SEnc1HTjJsJrisg5+6W2Qpdo/p+WNhvlbjkXbeqn8aK8h4ZABpez4lG6wJROgmACJ3Gq
         arOcQiYerM9YWnWIT5z+PzdAZxrFP+rUgwx2qhVIk1Mo5xNqr41uFqfqL9XNJuWp+q2M
         qsFw==
X-Gm-Message-State: AC+VfDztxfhnfPfsEkDOL+YKkZTD2tS6FA2VRvrBF1v0aKgEzfqd7UL7
	b6Lu4foJvQ7WOLIADPLfqnHpZLo2hobyJe3CkgM=
X-Google-Smtp-Source: ACHHUZ4j4o+3ks7gqO0Cc3az7qvWANuOL9pmgjp9OgEvccsoElcFtMR8UppD8ccMx0iGR4Z540YQjU8jVHujZAMcF4c=
X-Received: by 2002:a17:907:3e05:b0:94e:988d:acc5 with SMTP id
 hp5-20020a1709073e0500b0094e988dacc5mr1256436ejc.46.1683293238964; Fri, 05
 May 2023 06:27:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230505074701.1030980-1-bigunclemax@gmail.com> <20230505105805.548d1a1b@donnerap.cambridge.arm.com>
In-Reply-To: <20230505105805.548d1a1b@donnerap.cambridge.arm.com>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Fri, 5 May 2023 17:27:07 +0400
Message-ID: <CALHCpMi8=t1bMceTOfZjh7aKEQcEEpfeG4wi9pB=5o34Ca+N3w@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Add SPI0 controller node
To: Andre Przywara <andre.przywara@arm.com>
Cc: robh+dt@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andre,

> From a quick glance at the manuals, it
> looks like there are not quite the same, though: the D1/R528/T113s
> mentions a SPI_SAMP_DL register @0x28, whereas the older IP has a SPI_CCR
> register @0x24 - which is not mentioned in the newer manuals. The driver
> relies on that clock control register, so it wouldn't really work
> reliably, if that register is not there.

Thank you for pointing this out. I missed this difference.
I actually have a board with T113 SoC, and it looks like writing to
SPI_CCR@0x24 does nothing.
And it doesn't affect access to connected SPI NOR flash (read\write
operations are fine).
But I completely agree with you that this difference should be handled
by the spi driver.

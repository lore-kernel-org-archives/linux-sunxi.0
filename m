Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C48C1859
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Jan 2023 21:06:49 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id u19so15533737ejm.8
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Jan 2023 13:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqsPmxN00edrHGi0cQNfG1ZlbY68R6DFWjN9C23HMdo=;
        b=VLyhUT2siNF/GSpeQqo7AyhTHW46LJ63JExQJ9DPEjLKXoAnnbjmcx/ecVZO9VXvhX
         nmQQ82mcK28Fl39xCf6NLwKIEcdwiX75riNMwp08TbxTa1mU4VGxa1xt2+Nhyv5+MCv2
         Hc+xIurh3N1XZg0G/o47EnAp3vHlsFZDvdD+bXChWkv8KHoj4sWQWEYHft2h0AlnLm0E
         jlwvhMGiGD6YkXESMqqe0dtAN82zEKXACnXgbB0WC4w/gRLBcZHpKASu3bTlIzSZJkDX
         B+mwq+pPR345I7H3/1Oyh6lJ5YB6XiicQ5Z9Y+4vXMjVII5wq8qZQQ0Sx2jQ8BS34IVF
         PP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqsPmxN00edrHGi0cQNfG1ZlbY68R6DFWjN9C23HMdo=;
        b=aXi7p2vOFyN86W8A9rz+TkUxhIVtMDR7r6vE8o2H2ayCN2/Sa5PEpBKm9vybC/bsUf
         sPmiSHFt9jRgKK9KmFfEjIocxwO0b5QQqQWUA74P0CjvwNWQTIv/Nw4msXb0szaAqNVd
         /Qfg4fn5FxHB8e33D1TSV560ekkzMyYuQhbLw5VXuGJRkchw9+SFtPZx9PGJWsu3652Z
         8pc9GkY8mY+RGP8N3FXZ8Aal/FKw4QgZnQpgelmFdGe2HZ+oybeX8v/arJWdSDwN58jH
         N3lBbCgebv4Livv3jRrSTMUGh2kvwILfnxt+W8C/xr4gVvWk4jKls2ikKXVaUwk9fJfh
         J+FA==
X-Gm-Message-State: AFqh2koQCGECK3EkG0arE1C+O/oMBaqsCYMFb9NEwmzITDo+GmpddaJc
	e+4lzKBWrgzVXSEC5Py55/YUk2ituzZoDOmo
X-Google-Smtp-Source: AMrXdXuvFsQDJJdexEZkEdb0clbew5BO+rs+TUYwxrWPyE3UnE9MdiC0wJkhwmAFYA0l93S8SSIrrA==
X-Received: by 2002:a17:906:9d8e:b0:84d:3921:11e2 with SMTP id fq14-20020a1709069d8e00b0084d392111e2mr3481848ejc.58.1673212007713;
        Sun, 08 Jan 2023 13:06:47 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id d9-20020a1709063ec900b007c0d6b34d54sm2919231ejj.129.2023.01.08.13.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 13:06:47 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 0/6] clk: sunxi-ng: Allwinner R528/T113 clock support
Date: Sun, 08 Jan 2023 22:06:46 +0100
Message-ID: <4275771.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <20221231231429.18357-1-samuel@sholland.org>
References: <20221231231429.18357-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne nedelja, 01. januar 2023 ob 00:14:23 CET je Samuel Holland napisal(a):
> R528 and T113 are SoCs based on the same design as D1/D1s, but with ARM
> CPUs instead of RISC-V. They use the same CCU implementation, meaning
> the CCU has gates/resets for all peripherals present on any SoC in this
> family. I verified the CAN bus bits are also present on D1/D1s.
>=20
> Patches 1-2 clean up the Kconfig in preparation for patch 3, which
> allows building the driver. Patches 4-6 add the missing binding header
> and driver bits.
>=20
> Changes in v2:
>  - Expand commit message
>  - Move dt-bindings header changes to a separate patch
>=20
> Andr=C3=A1s Szemz=C5=91 (1):
>   clk: sunxi-ng: d1: Mark cpux clock as critical
>=20
> Fabien Poussin (1):
>   clk: sunxi-ng: d1: Add CAN bus gates and resets
>=20
> Samuel Holland (4):
>   clk: sunxi-ng: Remove duplicate ARCH_SUNXI dependencies
>   clk: sunxi-ng: Move SoC driver conditions to dependencies
>   clk: sunxi-ng: d1: Allow building for R528/T113
>   dt-bindings: clock: Add D1 CAN bus gates and resets
>=20
>  drivers/clk/sunxi-ng/Kconfig              | 71 ++++++++++++-----------
>  drivers/clk/sunxi-ng/ccu-sun20i-d1.c      | 13 ++++-
>  drivers/clk/sunxi-ng/ccu-sun20i-d1.h      |  2 +-
>  include/dt-bindings/clock/sun20i-d1-ccu.h |  2 +
>  include/dt-bindings/reset/sun20i-d1-ccu.h |  2 +
>  5 files changed, 53 insertions(+), 37 deletions(-)

Applied, thanks!

Best regards,
Jernej




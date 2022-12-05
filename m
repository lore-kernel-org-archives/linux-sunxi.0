Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BFD7C
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Dec 2022 20:43:18 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id fc4so1313699ejc.12
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Dec 2022 12:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnklUjZR0c0LO76Qxp3fFJe2+d2XTdjb5Unf9l7Eej4=;
        b=JisIvPJPKq8kJkC4FZ65uRGFoc8C2ST0BWcamsPcGoJVojWLeuhkcdcBu8kWzrSGxW
         FnoK/OwPhoIIaQHiIB8OBNrWD0BFgDf2uAYDl7NjhqgjRYBRPpyqwQTglWZFHlzuORab
         VTIOYZhUjAvIz604UoXuhX0vT1yApC0HEYvaKhqf0iajLQttT4p49iBarJ9a8BDa9N1F
         TZPhez1EI8nO8hJLG5G8G1SaVlyntKsYFmiNS26EM1BowF6XLqjC5NHmd6Nmpg5M9iAC
         XEixmz6/1CB2jQR7DIT5ZnyVGTMTPJhgwJIl4XHXBa7DbstdN21ktJRal/w57uzCLu3C
         qIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnklUjZR0c0LO76Qxp3fFJe2+d2XTdjb5Unf9l7Eej4=;
        b=FwDfUOXQS0J/wQoDxnzjHX5kmFjoFWHHOofAURUJgwgiYC/A5RZ+L0vlILf84oqjmK
         cvItX8SP4wUP0uwGsbAyQBy+OfHWzj2w5a3oVHw5T8yEV5VYHmmqn+zzy4gBgB3RfuKT
         SHMrbLhP1jvDyGGzvdCOdoTu7VXqvU0xSpEDNRn0ia4SpNN6ZNMmuramkdwSBZHFprtF
         lwXQcXlH3bZFY1EZlTqpS9SB0LKmttrO8UuB04r8zGdA4qQ9sD6zJGoBC/MhK+AyP7qJ
         s7Qqf++cc4xM7fZ5fpV8XTe8mhtsAhnIuyhp2s6V2m4tW/WYf2LgoJJQgUhwEeGFh+Wz
         MEFA==
X-Gm-Message-State: ANoB5plzCr2BixqVnjLEZX8dDJI1WvnkxTHGMaOic3lxXaAkBYoouABq
	tevLJ28BjpGNTMUZEnVESEc=
X-Google-Smtp-Source: AA0mqf4Rgh0vFFu8IOxnenPhjBpxMR088qnLDKQ9JbQ9ahZsFefNRzOOwPqw+kMG9BcdAGy3Tb4GJA==
X-Received: by 2002:a17:906:dfe8:b0:7c0:8711:7a4 with SMTP id lc8-20020a170906dfe800b007c0871107a4mr27160145ejc.667.1670272996604;
        Mon, 05 Dec 2022 12:43:16 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id lb14-20020a170907784e00b0077a11b79b9bsm6583034ejc.133.2022.12.05.12.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:43:16 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 09/12] riscv: dts: allwinner: Add Dongshan Nezha STU devicetree
Date: Mon, 05 Dec 2022 21:43:14 +0100
Message-ID: <1742993.VLH7GnMWUR@kista>
In-Reply-To: <20221125234656.47306-10-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-10-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 26. november 2022 ob 00:46:53 CET je Samuel Holland napisal(a):
> The 100ask Dongshan Nezha STU is a system-on-module that can be used
> standalone or with a carrier board. The SoM provides gigabit Ethernet,
> HDMI, a USB peripheral port, and WiFi/Bluetooth via an RTL8723DS chip.
> 
> The "DIY" carrier board exposes almost every pin from the D1 SoC to 0.1"
> headers, but contains no digital circuitry, so it does not have its own
> devicetree.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


